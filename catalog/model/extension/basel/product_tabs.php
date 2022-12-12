<?php
class ModelExtensionBaselProductTabs extends Model {
	
	public function getExtraTabsProduct($product_id){
		$product_tab = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_tabs pt 
		LEFT JOIN " . DB_PREFIX . "product_tabs_description ptd ON (pt.tab_id = ptd.tab_id) 
		LEFT JOIN " . DB_PREFIX . "product_tabs_to_product pt2p ON (pt.tab_id = pt2p.tab_id) 
		WHERE pt.status = '1' 
		AND (pt2p.product_id = '" . (int)$product_id . "' OR pt2p.product_id = '0') 
		AND ptd.language_id = '" . $this->config->get('config_language_id') . "' 
		AND pt.status = '1' 
		
		ORDER BY pt.sort_order, pt.tab_id ASC");
		
		foreach ($query->rows as $tab) {
			$product_tab[] = array(
				'tab_id' 			=> $tab['tab_id'],
				'name'				=> $tab['name'],
				'description'		=> html_entity_decode($tab['description'], ENT_QUOTES, 'UTF-8')
			);
		}
		
		return $product_tab;
	}
}