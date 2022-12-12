<?php
class ControllerExtensionBaselQuickview extends Controller {
	public function index() {

		if (isset($this->request->get['product_id'])) {
			$product_id = (int)$this->request->get['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->language('product/product');

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);
		if ($product_info) {
			$data['lang_id'] = $this->config->get('config_language_id');
			$data['config_text_open_form_send_order'] = $this->config->get('config_text_open_form_send_order');
			$data['config_text_open_form_send_order1'] = $this->config->get('config_text_open_form_send_order1');
			$data['color_button_open_form_send_order'] = $this->config->get('config_color_button_open_form_send_order');
			$data['icon_open_form_send_order'] = $this->config->get('config_icon_open_form_send_order');
			$data['config_on_off_qo_product_page'] = $this->config->get('config_on_off_qo_product_page');
			$data['heading_title'] = $product_info['name'];

			$data['product_href'] = htmlspecialchars_decode($this->url->link('product/product', '&product_id=' . $product_id));

			$this->load->language('basel/basel_theme');
			$data['basel_text_view_details'] = $this->language->get('basel_text_view_details');
			$data['basel_text_select_option'] = $this->language->get('basel_text_select_option');
			

			$data['text_select'] = $this->language->get('text_select');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_reward'] = $this->language->get('text_reward');
			$data['text_share'] = $this->language->get('text_share');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_stock'] = $this->language->get('text_stock');
			$data['text_discount'] = $this->language->get('text_discount');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_minimum'] = sprintf($this->language->get('text_minimum'), $product_info['minimum']);

			$data['img_w'] = $this->config->get('quickview_popup_image_width');
			$data['img_h'] = $this->config->get('quickview_popup_image_height');
			$data['meta_description_status'] = $this->config->get('meta_description_status');
			$data['meta_description'] = $product_info['meta_description'];
			$data['basel_share_btn'] = $this->config->get('basel_share_btn');

			$data['qty'] = $product_info['quantity'];
			$data['stock_badge_status'] = $this->config->get('stock_badge_status');
			$data['basel_text_out_of_stock'] = $this->language->get('basel_text_out_of_stock');

			$data['review_qty'] = $product_info['reviews'];
			$data['review_status'] = $this->config->get('config_review_status');
			$data['reviews'] = sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']);
			$data['rating'] = (int)$product_info['rating'];

			$data['button_cart'] = $this->language->get('button_cart');

			$this->load->model('catalog/review');

			$data['product_id'] = (int)$this->request->get['product_id'];
			$data['manufacturer'] = $product_info['manufacturer'];
			$data['manufacturers'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $product_info['manufacturer_id']);
			$data['model'] = $product_info['model'];
			$data['reward'] = $product_info['reward'];
			$data['points'] = $product_info['points'];

			if ($product_info['quantity'] <= 0) {
				$data['stock'] = $product_info['stock_status'];
			} elseif ($this->config->get('config_stock_display')) {
				$data['stock'] = $product_info['quantity'];
			} else {
				$data['stock'] = $this->language->get('text_instock');
			}

			$this->load->model('tool/image');

			if ($product_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($product_info['image'], $this->config->get('quickview_popup_image_width'), $this->config->get('quickview_popup_image_height'));
			} else {
				$data['thumb'] = '';
			}

			$data['images'] = array();

			$results = $this->model_catalog_product->getProductImages($this->request->get['product_id']);

			foreach ($results as $result) {
				$data['images'][] = array(
					'thumb' => $this->model_tool_image->resize($result['image'], $this->config->get('quickview_popup_image_width'), $this->config->get('quickview_popup_image_height'))
				);
			}

			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$data['price'] = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['price'] = false;
			}

			if ((float)$product_info['special']) {
				$data['special'] = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$data['special'] = false;
			}

			if ($this->config->get('config_tax')) {
				$data['tax'] = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price'], $this->session->data['currency']);
			} else {
				$data['tax'] = false;
			}


			$discounts = $this->model_catalog_product->getProductDiscounts($this->request->get['product_id']);

			$data['discounts'] = array();

			foreach ($discounts as $discount) {
				$data['discounts'][] = array(
					'quantity' => $discount['quantity'],
					'price'    => $this->currency->format($this->tax->calculate($discount['price'], $product_info['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency'])
				);
			}


			if ($this->model_catalog_product->getProfiles($this->request->get['product_id'])) {
			$data['recurrings'] = true;
			} else {
			$data['recurrings'] = false;
			}

			if ($this->model_catalog_product->getProductOptions($this->request->get['product_id'])) {
			$data['options'] = true;
			} else {
			$data['options'] = false;
			}


			if ($product_info['minimum']) {
				$data['minimum'] = $product_info['minimum'];
			} else {
				$data['minimum'] = 1;
			}

		}

	$this->response->setOutput($this->load->view('product/quickview', $data));
	}
}