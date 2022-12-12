<?php

class ControllerExtensionModuleBaselInstagram extends Controller {

    public function index($setting) {

        // Block title
        $data['block_title'] = $setting['use_title'];
        $data['title_preline'] = false;
        $data['title'] = false;
        $data['title_subline'] = false;

        if (!empty($setting['title_pl'][$this->config->get('config_language_id')])) {
            $data['title_preline'] = html_entity_decode($setting['title_pl'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        }
        if (!empty($setting['title_m'][$this->config->get('config_language_id')])) {
            $data['title'] = html_entity_decode($setting['title_m'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        }
        if (!empty($setting['title_b'][$this->config->get('config_language_id')])) {
            $data['title_subline'] = html_entity_decode($setting['title_b'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
        }

        $data['limit'] = $setting['limit'];
        $data['columns'] = $setting['columns'];
        $data['columns_md'] = $setting['columns_md'];
        $data['columns_sm'] = $setting['columns_sm'];
        $data['use_margin'] = $setting['use_margin'];
        $data['margin'] = $setting['margin'];
        $data['padding'] = $setting['padding'];
        $data['full_width'] = $setting['full_width'];
        $data['title_inline'] = $setting['title_inline'];
        $data['resolution'] = $setting['resolution'];

        $username = $setting['username'];

        if ($username) {
            $this->load->model('extension/basel/basel_instagram');

            $data['instafeed'] = $this->model_extension_basel_basel_instagram->getInstagramImages($username);

            if (empty($data['instafeed']['error']) && !empty($data['instafeed'])) {
                if ($this->config->get('theme_default_directory') == 'basel')
				return $this->load->view('extension/module/basel_instagram', $data);
            } else if (!empty($data['instafeed']['error'])) {
                return $data['instafeed']['error'];
            }
        }

        return '';
    }

}
