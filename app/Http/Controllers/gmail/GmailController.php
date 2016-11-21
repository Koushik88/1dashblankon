<?php

namespace App\Http\Controllers\gmail;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Admin;

class GmailController extends Controller
{
   /**
	 * [gmail_up description]
	 * @return [type] [description]
	 */
	public function gmail_up() {
		
		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Gmail');
		$this->addTemplateVar('page', 'module/gmail_up');
		return view('general.index', $this->template_vars);
	}
}
