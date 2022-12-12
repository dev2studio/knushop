<?php
class ControllerExtensionModuleLCSwitchIPBased extends Controller {
	private $error = array();
	private $version = '1.8.1';
	
	public function index() {   
		$this->load->language('extension/module/lc_switch_ip_based');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		$this->load->model('localisation/country');
		$this->load->model('localisation/language');
		$this->load->model('localisation/currency');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('lc_switch_ip_based', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true));
		}
				
		$data['heading_title'] = $this->language->get('heading_title') . ' ' . $this->version;
		
		$data['text_edit'] = $this->language->get('text_edit');
		
		$data['tab_setting'] = $this->language->get('tab_setting');
		$data['tab_help'] = $this->language->get('tab_help');
		
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_language'] = $this->language->get('entry_language');
		$data['entry_currency'] = $this->language->get('entry_currency');
		
		$data['help_add_relation'] = $this->language->get('help_add_relation');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add_relation'] = $this->language->get('button_add_relation');
		$data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], true)
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_extension'),
			'href'      => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('extension/module/lc_switch_ip_based', 'token=' . $this->session->data['token'], true)
   		);
		
		$data['action'] = $this->url->link('extension/module/lc_switch_ip_based', 'token=' . $this->session->data['token'], true);
		
		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);
		
		if (isset($this->error['update'])) {
			$data['update'] = $this->error['update'];
		} else {
			$data['update'] = '';
		}		
		
		$data['clc_relations'] = array();
		
		if (isset($this->request->post['lc_switch_ip_based'])) {
			$data['clc_relations'] = $this->request->post['lc_switch_ip_based'];
		} elseif ($this->config->get('lc_switch_ip_based')) { 
			$data['clc_relations'] = $this->config->get('lc_switch_ip_based');
		}	
		
		$data['clc_relations_total'] = count($data['clc_relations']);
		
		$data['countries']  = $this->model_localisation_country->getCountries();
		$data['languages']  = $this->model_localisation_language->getLanguages();
		$data['currencies'] = $this->model_localisation_currency->getCurrencies();
						
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/lc_switch_ip_based', $data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/lc_switch_ip_based')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		return !$this->error;	
	}		
}
?>