<?php
class ControllerCatalogInformation extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/information');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/information');

		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/information');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/information');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_information->addInformation($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}



			if (isset($this->request->get['route'])) {
				$get = explode("/", $this->request->get['route']);
				$folder = $get[0];
				$file = $get[1];
				
				if ($file == 'user_permission') $table = 'user_group';
				else $table = $file;

				$this->load->model('setting/setting');
				$last_id = $this->model_setting_setting->getLastId($table);

				if ($file == 'setting') {
					$route = 'setting/store';
					$editroute = 'setting/setting';
				} else {
					$route = $folder.'/'.$file;
					$editroute = $folder.'/'.$file.'/edit';
				}
				
				if (!isset($url)) $url = "";

				if (($file != 'setting') && (isset($this->request->get[$table.'_id']) || isset($last_id))) {
					$url .= '&'.$table.'_id='.(isset($this->request->get[$table.'_id']) ? $this->request->get[$table.'_id'] : $last_id);
				}

				if (isset($this->request->post['apply']) && $this->request->post['apply'] == "1") {
					$this->response->redirect($this->url->link($editroute, 'token='.$this->session->data['token'].$url, 'SSL'));
				} else {
					$this->response->redirect($this->url->link($route, 'token='.$this->session->data['token'].$url, 'SSL'));
				}
			}
			
			
			$this->response->redirect($this->url->link('catalog/information', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/information');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/information');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_information->editInformation($this->request->get['information_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}



			if (isset($this->request->get['route'])) {
				$get = explode("/", $this->request->get['route']);
				$folder = $get[0];
				$file = $get[1];
				
				if ($file == 'user_permission') $table = 'user_group';
				else $table = $file;

				$this->load->model('setting/setting');
				$last_id = $this->model_setting_setting->getLastId($table);

				if ($file == 'setting') {
					$route = 'setting/store';
					$editroute = 'setting/setting';
				} else {
					$route = $folder.'/'.$file;
					$editroute = $folder.'/'.$file.'/edit';
				}
				
				if (!isset($url)) $url = "";

				if (($file != 'setting') && (isset($this->request->get[$table.'_id']) || isset($last_id))) {
					$url .= '&'.$table.'_id='.(isset($this->request->get[$table.'_id']) ? $this->request->get[$table.'_id'] : $last_id);
				}

				if (isset($this->request->post['apply']) && $this->request->post['apply'] == "1") {
					$this->response->redirect($this->url->link($editroute, 'token='.$this->session->data['token'].$url, 'SSL'));
				} else {
					$this->response->redirect($this->url->link($route, 'token='.$this->session->data['token'].$url, 'SSL'));
				}
			}
			
			
			$this->response->redirect($this->url->link('catalog/information', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/information');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/information');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $information_id) {
				$this->model_catalog_information->deleteInformation($information_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}



			if (isset($this->request->get['route'])) {
				$get = explode("/", $this->request->get['route']);
				$folder = $get[0];
				$file = $get[1];
				
				if ($file == 'user_permission') $table = 'user_group';
				else $table = $file;

				$this->load->model('setting/setting');
				$last_id = $this->model_setting_setting->getLastId($table);

				if ($file == 'setting') {
					$route = 'setting/store';
					$editroute = 'setting/setting';
				} else {
					$route = $folder.'/'.$file;
					$editroute = $folder.'/'.$file.'/edit';
				}
				
				if (!isset($url)) $url = "";

				if (($file != 'setting') && (isset($this->request->get[$table.'_id']) || isset($last_id))) {
					$url .= '&'.$table.'_id='.(isset($this->request->get[$table.'_id']) ? $this->request->get[$table.'_id'] : $last_id);
				}

				if (isset($this->request->post['apply']) && $this->request->post['apply'] == "1") {
					$this->response->redirect($this->url->link($editroute, 'token='.$this->session->data['token'].$url, 'SSL'));
				} else {
					$this->response->redirect($this->url->link($route, 'token='.$this->session->data['token'].$url, 'SSL'));
				}
			}
			
			
			$this->response->redirect($this->url->link('catalog/information', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'id.title';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/information', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['add'] = $this->url->link('catalog/information/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('catalog/information/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['informations'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$information_total = $this->model_catalog_information->getTotalInformations();

		$results = $this->model_catalog_information->getInformations($filter_data);

		foreach ($results as $result) {
			$data['informations'][] = array(
				'information_id' => $result['information_id'],
				'title'          => $result['title'],
				'sort_order'     => $result['sort_order'],
				'edit'           => $this->url->link('catalog/information/edit', 'token=' . $this->session->data['token'] . '&information_id=' . $result['information_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

			$data['button_apply'] = $this->language->get('button_apply');	
			

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_title'] = $this->language->get('column_title');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_title'] = $this->url->link('catalog/information', 'token=' . $this->session->data['token'] . '&sort=id.title' . $url, true);
		$data['sort_sort_order'] = $this->url->link('catalog/information', 'token=' . $this->session->data['token'] . '&sort=i.sort_order' . $url, true);

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $information_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/information', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($information_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($information_total - $this->config->get('config_limit_admin'))) ? $information_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $information_total, ceil($information_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/information_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

			$data['button_apply'] = $this->language->get('button_apply');	
			

		$data['text_form'] = !isset($this->request->get['information_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_keyword'] = $this->language->get('entry_keyword');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_bottom'] = $this->language->get('entry_bottom');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_layout'] = $this->language->get('entry_layout');

		$data['help_keyword'] = $this->language->get('help_keyword');
		$data['help_bottom'] = $this->language->get('help_bottom');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_data'] = $this->language->get('tab_data');
		$data['tab_design'] = $this->language->get('tab_design');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = array();
		}

		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = array();
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = array();
		}

    // SEO URL Generator FREE . begin
		if (isset($this->error['seo_url_generator_redirects'])) {
			$data['error_seo_url_generator_redirects'] = $this->error['seo_url_generator_redirects'];
		} else {
			$data['error_seo_url_generator_redirects'] = '';
		}
		// SEO URL Generator FREE . end

		if (isset($this->error['keyword'])) {
			$data['error_keyword'] = $this->error['keyword'];
		} else {
			$data['error_keyword'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/information', 'token=' . $this->session->data['token'] . $url, true)
		);

		if (!isset($this->request->get['information_id'])) {
			$data['action'] = $this->url->link('catalog/information/add', 'token=' . $this->session->data['token'] . $url, true);
		} else {
			$data['action'] = $this->url->link('catalog/information/edit', 'token=' . $this->session->data['token'] . '&information_id=' . $this->request->get['information_id'] . $url, true);
		}

		$data['cancel'] = $this->url->link('catalog/information', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['information_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$information_info = $this->model_catalog_information->getInformation($this->request->get['information_id']);
		}

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['seo_url_generator_language'] = $this->config->get('seo_url_generator_language'); // SEO URL Generator FREE

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['information_description'])) {
			$data['information_description'] = $this->request->post['information_description'];
		} elseif (isset($this->request->get['information_id'])) {
			$data['information_description'] = $this->model_catalog_information->getInformationDescriptions($this->request->get['information_id']);
		} else {
			$data['information_description'] = array();
		}

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['information_store'])) {
			$data['information_store'] = $this->request->post['information_store'];
		} elseif (isset($this->request->get['information_id'])) {
			$data['information_store'] = $this->model_catalog_information->getInformationStores($this->request->get['information_id']);
		} else {
			$data['information_store'] = array(0);
		}

    // SEO URL Generator FREE . begin
    $data['seo_url_generator_status'] = $this->config->get('seo_url_generator_status');

		$this->load->language('extension/module/seo_url_generator'); // SEO URL Generator FREE - require after breadcrumbps!
		
		$this->load->model('extension/module/seo_url_generator');
		
		$data['sug_button_generate'] = $this->language->get('sug_button_generate');
		$data['sug_text_redirects'] = $this->language->get('sug_text_redirects');
		$data['sug_help_redirects'] = $this->language->get('sug_help_redirects');
		$data['sug_button_add_redirect'] = $this->language->get('sug_button_add_redirect');
		$data['sug_button_delete_redirect'] = $this->language->get('sug_button_delete_redirect');		
		$data['sug_confirm_title'] = $this->language->get('sug_confirm_title');
		$data['sug_confirm_body'] = $this->language->get('sug_confirm_body');
		$data['sug_confirm_btn_yes'] = $this->language->get('sug_confirm_btn_yes');
		$data['sug_confirm_btn_no'] = $this->language->get('sug_confirm_btn_no');
		$data['sug_redirects_error_title'] = $this->language->get('sug_redirects_error_title');
		$data['sug_redirects_error_empty'] = $this->language->get('sug_redirects_error_empty');
		$data['sug_redirects_error_slash'] = $this->language->get('sug_redirects_error_slash');
		$data['sug_redirects_error_protocol'] = $this->language->get('sug_redirects_error_protocol');
		$data['sug_redirects_error_html'] = $this->language->get('sug_redirects_error_html');
		$data['sug_redirects_error_common'] = $this->language->get('sug_redirects_error_common');
		
		if (isset($this->request->get['information_id'])) {
			if (isset($this->request->post['seo_url_generator_redirects'])) {
				$data['redirects'] = $this->request->post['seo_url_generator_redirects'];
			} else {
				$data['redirects'] = $this->model_extension_module_seo_url_generator->getRedirects('information_id', $this->request->get['information_id']);
			}
		} else {
			$data['redirects'] = array();
		}
		// SEO URL Generator FREE . end

		if (isset($this->request->post['keyword'])) {
			$data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($information_info)) {
			$data['keyword'] = $information_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (isset($this->request->post['bottom'])) {
			$data['bottom'] = $this->request->post['bottom'];
		} elseif (!empty($information_info)) {
			$data['bottom'] = $information_info['bottom'];
		} else {
			$data['bottom'] = 0;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($information_info)) {
			$data['status'] = $information_info['status'];
		} else {
			$data['status'] = true;
		}

		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($information_info)) {
			$data['sort_order'] = $information_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		if (isset($this->request->post['information_layout'])) {
			$data['information_layout'] = $this->request->post['information_layout'];
		} elseif (isset($this->request->get['information_id'])) {
			$data['information_layout'] = $this->model_catalog_information->getInformationLayouts($this->request->get['information_id']);
		} else {
			$data['information_layout'] = array();
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/information_form', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/information')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['information_description'] as $language_id => $value) {
			if ((utf8_strlen($value['title']) < 3) || (utf8_strlen($value['title']) > 64)) {
				$this->error['title'][$language_id] = $this->language->get('error_title');
			}

			if (utf8_strlen($value['description']) < 3) {
				$this->error['description'][$language_id] = $this->language->get('error_description');
			}

			if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
				$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
			}
		}

    // SEO URL Generator FREE . begin
		if (isset($this->request->post['seo_url_generator_redirects'])) {
			foreach ($this->request->post['seo_url_generator_redirects'] as $index => $redirect) {
				if (false !== strpos($redirect, '/') || false !== strpos($redirect, 'http') || false !== strpos($redirect, '.html') || empty(trim($redirect))) {
					$this->error['seo_url_generator_redirects'][$index] = $this->language->get('sug_redirects_error_validate');
				}
			}
		}    
		// SEO URL Generator FREE . end

		if (utf8_strlen($this->request->post['keyword']) > 0) {
			$this->load->model('catalog/url_alias');

			$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);

			if ($url_alias_info && isset($this->request->get['information_id']) && $url_alias_info['query'] != 'information_id=' . $this->request->get['information_id']) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}

			if ($url_alias_info && !isset($this->request->get['information_id'])) {
				$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/information')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('setting/store');

		foreach ($this->request->post['selected'] as $information_id) {
			if ($this->config->get('config_account_id') == $information_id) {
				$this->error['warning'] = $this->language->get('error_account');
			}

			if ($this->config->get('config_checkout_id') == $information_id) {
				$this->error['warning'] = $this->language->get('error_checkout');
			}

			if ($this->config->get('config_affiliate_id') == $information_id) {
				$this->error['warning'] = $this->language->get('error_affiliate');
			}

			if ($this->config->get('config_return_id') == $information_id) {
				$this->error['warning'] = $this->language->get('error_return');
			}

			$store_total = $this->model_setting_store->getTotalStoresByInformationId($information_id);

			if ($store_total) {
				$this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
			}
		}

		return !$this->error;
	}
}