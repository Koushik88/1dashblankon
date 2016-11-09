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

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Ecommerce');
		$this->addTemplateVar('page', 'module/ecommerce');
		return view('general.index', $this->template_vars);
	}
}
