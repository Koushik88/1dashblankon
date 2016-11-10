<?php

namespace App\Http\Controllers\ecommerce;

use App\Admin;
use App\Http\Controllers\Controller;

class EcommerceController extends Controller {
	/**
	 * [ecommerce description]
	 * @return [type] [description]
	 */
	public function ecommerce() {
		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();

		$html = $this->allEcommerceConfigCheck($_SESSION["userId"]);
		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('html', $html);
		$this->addTemplateVar('pageTitle', 'Ecommerce');
		$this->addTemplateVar('page', 'module/ecommerce');
		return view('general.index', $this->template_vars);
	}
	protected function allEcommerceConfigCheck($userId) {
		if ($userId) {
			$admin_obj = new Admin;
			$dbres = $admin_obj->getAllPluginData([$userId]);

			$shopify_config = "no";
			$shopify_msg = "You have not linked your shopify account with us, please click to add";
			$woocomm_config = "no";
			$woocomm_msg = "You have not linked your woocommerce account with us, please click to add";
			$bigcomm_config = "no";
			$bigcomm_msg = "You have not linked your bigcommerce account with us, please click to add";
			$amazon_config = "no";
			$amazon_msg = "You have not linked your amazon account with us, please click to add";
			$ebay_config = "no";
			$ebay_msg = "You have not linked your ebay account with us, please click to add";

			foreach ($dbres as $val) {
				if ($val['name'] == "Shopify") {
					$shopify_config = "yes";
				}
				if ($val['name'] == "WooCommerce") {
					$woocomm_config = "yes";
				}
				if ($val['name'] == "BigCommerce") {
					$bigcomm_config = "yes";
				}
				if ($val['name'] == "Amazon") {
					$amazon_config = "yes";
				}
				if ($val['name'] == "Ebay") {
					$ebay_config = "yes";
				}
			}
			$html = "";

			// shopify html
			if ($shopify_config == "yes") {
				$html .= '<a class="shortcut tile ecomactive" href="javascript:void(0);" id="shopify" onclick=changeEcommerce(id)>'
					. '<img src="img/social/shopify.png" width="53px" height="43px">'
					. '<small class="t-overflow">Shopify</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" id="shopify" href="profile" title="' . $shopify_msg . '">'
					. '<i class="not-logged animated"><img src="img/social/not-logged.svg" alt=""></i>'
					. '<img src="img/social/shopify.png" width="53px" height="43px">'
					. '<small class="t-overflow">Shopify</small></img></a>';
			}
			// woocommerce
			if ($woocomm_config == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="woocommerce" onclick=changeEcommerce(id)>'
					. '<img src="img/social/Woocommerce.png" width="53px" height="43px">'
					. '<small class="t-overflow">WooCommerce</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" href="profile" title="' . $woocomm_msg . '">'
					. '<i class="not-logged animated"><img src="img/social/not-logged.svg" alt=""></i>'
					. '<img src="img/social/Woocommerce.png" width="53px" height="43px">'
					. '<small class="t-overflow">WooCommerce</small></img></a>';
			}
			//bigcommerce
			if ($bigcomm_config == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="bigcommerce" onclick=changeEcommerce(id)>'
					. '<img src="img/social/bigcommerce.png" width="53px" height="43px">'
					. '<small class="t-overflow">BigCommerce</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" href="profile" title="' . $bigcomm_msg . '">'
					. '<i class="not-logged animated"><img src="img/social/not-logged.svg" alt=""></i>'
					. '<img src="img/social/bigcommerce.png" width="53px" height="43px">'
					. '<small class="t-overflow">BigCommerce</small></img></a>';
			}
			//amazon
			if ($amazon_config == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="amazon" onclick=changeEcommerce(id)>'
					. '<img src="img/social/amazon.png" width="53px" height="43px">'
					. '<small class="t-overflow">Amazon</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" href="profile" title="' . $amazon_msg . '">'
					. '<i class="not-logged animated"><img src="img/social/not-logged.svg" alt=""></i>'
					. '<img src="img/social/amazon.png" width="53px" height="43px">'
					. '<small class="t-overflow">Amazon</small></img></a>';
			}
			//ebay
			if ($ebay_config == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="ebay" onclick=changeEcommerce(id)>'
					. '<img src="img/social/ebay.png" width="53px" height="43px">'
					. '<small class="t-overflow">eBay</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" href="profile" title="' . $ebay_msg . '">'
					. '<i class="not-logged animated"><img src="img/social/not-logged.svg" alt=""></i>'
					. '<img src="img/social/ebay.png" width="53px" height="43px">'
					. '<small class="t-overflow">eBay</small></img></a>';
			}

			return $html;
		}
	}
}
