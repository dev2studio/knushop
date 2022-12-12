<?php
class ControllerExtensionModuleDexel extends Controller {
	private $error = array();

	public function index() {
		$this->load->model('catalog/product');

		error_reporting(0);

		global $registry;

		$registry = $this->registry;
		set_error_handler('error_handler_for_export_import',E_ALL);
		register_shutdown_function('fatal_error_shutdown_handler_for_exel');
		include  $_SERVER['DOCUMENT_ROOT'].'/system/library/export_import/Classes/PHPExcel.php';

		$this->load->language('extension/module/dexel');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		$data['logs'] = array();

		if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
			/*if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('dexel', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}*/

			$uploaddir = $_SERVER['DOCUMENT_ROOT'].'/system/storage/cache/import/';
			$uploadfile = $uploaddir . 'imposrt.xlsx';

			if (move_uploaded_file($_FILES['userfile']['tmp_name'], $uploadfile)) {
				$this->session->data['success'] = $this->language->get('text_success');

				$filename = $_SERVER['DOCUMENT_ROOT'].'/system/storage/cache/import/imposrt.xlsx';
				$inputFileType = PHPExcel_IOFactory::identify($filename);
				$objReader = PHPExcel_IOFactory::createReader($inputFileType);
				$reader = $objReader->load($filename);
				$reader->setActiveSheetIndex(0);
				$sheet = $reader->getActiveSheet(0);
				$rowIterator = $sheet->getRowIterator();

				$is=0;

				foreach ($rowIterator as $kel=>$row) {
					$is2=0;
					$cellIterator = $row->getCellIterator();
					foreach ($cellIterator as $le => $cell) {
						$data[$kel][$is2]=$cell->getCalculatedValue();
						$is2++;
					}
				}	

 
				 foreach ($data as $key => $value) {
				 	if($key!=1){

				 		if($value['1']!=''){
				 			$filter_data = array(
				 				'filter_model'=>$value['1']
				 			);

				 			$product_info = $this->model_catalog_product->getProducts($filter_data);
				 		}else{
				 			$product_info = array();
				 		}

				 		//print_r($product_info);

				 		if(isset($product_info[0])){
				 			//поиск атрибутов
				 			$optionsList = $this->model_catalog_product->getProductOptions($product_info[0]['product_id']);

				 			if(count($optionsList)>=1){

				 				foreach ($optionsList[0]['product_option_value'] as $key2 => $value2) {

				 					$optionsListNAME = $this->model_catalog_product->getProductOptionValue($product_info[0]['product_id'],$value2['product_option_value_id']);

				 					foreach ($data[1] as $key22222 => $value22222) {
				 						if($value22222==$optionsListNAME['name']){


				 							$this->model_catalog_product->updateOptionQun($product_info[0]['product_id'],$value[$key22222],$value2['product_option_value_id'],$value2['option_value_id']);

				 							$data['logs'][] = 'ProductID ='. $product_info[0]['product_id'].' Название:'.$product_info[0]['name'].' ОПЦИИ:'.$optionsListNAME['name'].' - NEW Q '.$value[$key22222].' - OLD Q = '.$optionsListNAME['quantity'].'<br>';

				 							 
				 							//МАГИЯ ОБНОВЛЕНИЕ КОЛИЧЕСТВА ПО ОПЦИИ
				 							break;
				 						}
				 					}
				 				}
				 			}else{
				 				//ТОВАР БЕЗ ОПЦИИ

				 			$this->model_catalog_product->updateOptionQun($product_info[0]['product_id'],$value[3]);
				 			   $data['logs'][] = 'ProductID ='.$product_info[0]['product_id'].' Название: '.$product_info[0]['name'].' - NEW Q '.$value[3].' - OLD Q = '. $product_info[0]['quantity'].'<br>';
				 			}
				 		}

				 		 




				 	}
				 }




				 	 
			} else {
				$this->session->data['error'] = $this->language->get('text_error');
			}

 
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_description'] = $this->language->get('entry_description');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true)
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/dexel', 'token=' . $this->session->data['token'], true)
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('extension/module/dexel', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true)
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('extension/module/dexel', 'token=' . $this->session->data['token'], true);
		} else {
			$data['action'] = $this->url->link('extension/module/dexel', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], true);
		}

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=module', true);

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}

		if (isset($this->request->post['module_description'])) {
			$data['module_description'] = $this->request->post['module_description'];
		} elseif (!empty($module_info)) {
			$data['module_description'] = $module_info['module_description'];
		} else {
			$data['module_description'] = array();
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/module/dexel', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/module/dexel')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		return !$this->error;
	}
}