<?php
class ControllerCommonFooter extends Controller {
	public function index() {
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');

		$data['text_security'] = $this->language->get('text_security');
        $data['text_sitysecurity'] = $this->language->get('text_sitysecurity');
		$data['text_opla'] = $this->language->get('text_opla');
		$data['text_onlinesecurity'] = $this->language->get('text_onlinesecurity');
		$data['text_privacy'] = $this->language->get('text_privacy');
		$data['text_privacyall'] = $this->language->get('text_privacyall');
		$data['text_purchase_returns'] = $this->language->get('text_purchase_returns');
			
		
		
		
		
		
		$data['text_custom_modal__title'] = $this->language->get('text_custom_modal__title');		

		
				$data['text_custom_modal__disc'] = $this->language->get('text_custom_modal__disc');		
		$data['text_callback_form__phone'] = $this->language->get('text_callback_form__phone');		
		$data['text_callback_time__btn'] = $this->language->get('text_callback_time__btn');		
		$data['text_callback_time__btn_tooltip'] = $this->language->get('text_callback_time__btn_tooltip');		
		$data['text_callback_time__worktime'] = $this->language->get('text_callback_time__worktime');		
		$data['text_callback_form__agreement'] = $this->language->get('text_callback_form__agreement');		
		$data['text_callback_form__agreement_link'] = $this->language->get('text_callback_form__agreement_link');		
		$data['text_callback_form__submit'] = $this->language->get('text_callback_form__submit');		
		$data['text_succes_custom_modal__title'] = $this->language->get('text_succes_custom_modal__title');		
		$data['text_succes_custom_modal__disc'] = $this->language->get('text_succes_custom_modal__disc');		
		$data['text_succes_custom_modal__ok'] = $this->language->get('text_succes_custom_modal__ok');		
		$data['callback_form__phone_valid'] = $this->language->get('callback_form__phone_valid');		
		$data['text_message_succes_custom_modal__title'] = $this->language->get('text_message_succes_custom_modal__title');		
		$data['text_message_succes_custom_modal__disc'] = $this->language->get('text_message_succes_custom_modal__disc');		

		 
		
		
		
		
		
		
		
		
		
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');

		$data['text_questions'] = $this->language->get('text_questions');
        $data['text_deliverys'] = $this->language->get('text_deliverys');
		$data['text_exchange'] = $this->language->get('text_exchange');

		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');



		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);

		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}