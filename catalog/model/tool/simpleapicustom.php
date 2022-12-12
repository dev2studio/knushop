<?php
/*
@author Dmitriy Kubarev
@link   http://www.simpleopencart.com
*/

class ModelToolSimpleApiCustom extends Model {
    public function example($filterFieldValue) {
        $values = array();

        $values[] = array(
            'id'   => 'my_id',
            'text' => 'my_text'
        );

        return $values;
    }

    public function checkCaptcha($value, $filter) {
        if (isset($this->session->data['captcha']) && $this->session->data['captcha'] != $value) {
            return false;
        }

        return true;
    }
    public function getCountries($filter = '') {
        $values = array(
            array(
                'id'   => '',
                'text' => $this->language->get('text_select')
            )
        );

        $this->load->model('localisation/country');

        $results = $this->model_localisation_country->getCountries();

        foreach ($results as $result) {
            $values[] =  array(
                'id'   => $result['country_id'],
                'text' => $result['name']
            );
        }

        if (!$results) {
            $values[] = array(
                'id'   => 0,
                'text' => $this->language->get('text_none')
            );
        }

        return $values;
    }

    public function getZones($countryId) {
        $values = array(
            array(
                'id'   => '',
                'text' => $this->language->get('text_select')
            )
        );

        $this->load->model('localisation/zone');

        $results = $this->model_localisation_zone->getZonesByCountryId($countryId);

        foreach ($results as $result) {
            $values[] = array(
                'id'   => $result['zone_id'],
                'text' => $result['name']
            );
        }

        if (!$results) {
            $values[] = array(
                'id'   => 0,
                'text' => $this->language->get('text_none')
            );
        }

        return $values;
    }

    public function getCities($zoneId) {
        $values = array(
            array(
                'id'   => '',
                'text' => $this->language->get('text_select')
            )
        );

        $this->load->model('localisation/city');

        $results = $this->model_localisation_city->getCitiesByZoneId($zoneId);

        foreach ($results as $result) {
            $values[] = array(
                'id'   => $result['name'],
                'text' => $result['name']
            );
        }

        if (!$results) {
            $values[] = array(
                'id'   => 0,
                'text' => $this->language->get('text_none')
            );
        }

        return $values;
    }
    public function getYesNo($filter = '') {
        return array(
            array(
                'id'   => '1',
                'text' => $this->language->get('text_yes')
            ),
            array(
                'id'   => '0',
                'text' => $this->language->get('text_no')
            )
        );
    }
}