<?php

class ModelExtensionBaselBaselInstagram extends Model {

    private $error;

    public function getInstagramImages($username = '') {
        $cache_prefix = 'basel_instagram';

        $username_data = $this->cache->get($cache_prefix . '.' . $username);

        if (empty($username_data)) {
            $data = $this->curlInstagram($username);

            if (!empty($data['items'])) {
                $username_data = $data['items'];

                $this->cache->set($cache_prefix . '.' . $username, $username_data);
            } else if (!empty($this->error)) {
                $username_data = array(
                    'error' => $this->error
                );
            }
        }

        return $username_data;
    }

    private function curlInstagram($username = '') {
        $data = array();

        if (!empty($username)) {
            $url = 'https://www.instagram.com/' . $username . '/media/';

            $options = array(
                CURLOPT_HEADER => 0,
                CURLOPT_SSL_VERIFYPEER => 0,
                CURLOPT_SSL_VERIFYHOST => 0,
                CURLOPT_RETURNTRANSFER => 1,
                CURLOPT_URL => $url,
            );

            $ch = curl_init($url);

            curl_setopt_array($ch, $options);

            $result = curl_exec($ch);

            $this->error = curl_error($ch);

            curl_close($ch);

            $data = json_decode($result, true);
        }

        return $data;
    }

}
