<?php
class ControllerExtensionPaymentCheque extends Controller {
	public function index() {
		$this->load->language('extension/payment/cheque');

		$data['text_instruction'] = $this->language->get('text_instruction');
		$data['text_payable'] = $this->language->get('text_payable');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_payment'] = $this->language->get('text_payment');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['button_confirm'] = $this->language->get('button_confirm');

		$data['payable'] = $this->config->get('cheque_payable');
		$data['address'] = nl2br($this->config->get('config_address'));

		$data['continue'] = $this->url->link('checkout/success');

		return $this->load->view('extension/payment/cheque', $data);
	}

	public function confirm() {
		if ($this->session->data['payment_method']['code'] == 'cheque') {
			$this->load->language('extension/payment/cheque');

			$this->load->model('checkout/order');

		}
	}
}