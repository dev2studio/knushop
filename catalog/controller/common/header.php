<?php
class ControllerCommonHeader extends Controller {
	public function index() {
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');
		 


 
		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');
		$data['text_about_shop'] = $this->language->get('text_about_shop');
		$data['text_size_chart'] = $this->language->get('text_size_chart');
		$data['text_contact'] = $this->language->get('text_contact');
	    $data['text_deliverys'] = $this->language->get('text_deliverys');
        $data['text_zvon'] = $this->language->get('text_zvon');
		$data['text_univer'] = $this->language->get('text_univer');
		$data['text_cart'] = $this->language->get('text_cart');
		
		
		
		$data['text_size_chart'] = $this->language->get('text_size_chart');
		$data['text_about_shop'] = $this->language->get('text_about_shop');
		$data['text_univer'] = $this->language->get('text_univer');
		$data['text_zvon'] = $this->language->get('text_zvon');
		$data['text_makecall'] = $this->language->get('text_makecall');
		$data['text_ourmail'] = $this->language->get('text_ourmail');
		$data['text_messengers'] = $this->language->get('text_messengers');
		$data['text_titl1'] = $this->language->get('text_titl1');
		$data['text_titl2'] = $this->language->get('text_titl2');
		$data['text_otpr'] = $this->language->get('text_otpr');
 
		
		
		
		
		$data['text_pop_name'] = $this->language->get('text_pop_name');
		$data['text_pop_tel'] = $this->language->get('text_pop_tel');
		$data['text_pop_zv'] = $this->language->get('text_pop_zv');
		$data['text_pop_titl1'] = $this->language->get('text_pop_titl1');
		$data['text_pop_titl2'] = $this->language->get('text_pop_titl2');

		$data['text_questions'] = $this->language->get('text_questions');
		$data['text_titl1'] = $this->language->get('text_titl1');
		$data['text_titl2'] = $this->language->get('text_titl2');

		$data['text_otpr'] = $this->language->get('text_otpr');

		$data['text_lang_title'] = $this->language->get('text_lang_title');


		$data['textw_home'] = $this->language->get('textw_home');

		
		$data['text_custom-modal__title'] = $this->language->get('text_custom-modal__title');
		$data['text_custom-modal__disc'] = $this->language->get('text_custom-modal__disc');
		$data['text_callback-form__phone'] = $this->language->get('text_callback-form__phone');
		$data['text_callback-time__btn'] = $this->language->get('text_callback-time__btn');
		$data['text_callback-time__btn_tooltip'] = $this->language->get('text_callback-time__btn_tooltip');
		$data['text_callback-time__worktime'] = $this->language->get('text_callback-time__worktime');
		$data['text_callback-form__agreement'] = $this->language->get('text_callback-form__agreement');
		$data['text_callback-form__agreement_link'] = $this->language->get('text_callback-form__agreement_link');
		$data['text_callback-form__submit'] = $this->language->get('text_callback-form__submit');
		$data['text_succes_custom-modal__title'] = $this->language->get('text_succes_custom-modal__title');
		$data['text_succes_custom-modal__disc'] = $this->language->get('text_succes_custom-modal__disc');
		$data['text_succes_custom-modal__ok'] = $this->language->get('text_succes_custom-modal__ok');








		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');


		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		return $this->load->view('common/header', $data);
	}
}