<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Admin;

class AdminController extends Controller
{
        public function admin() {
		
                 if(isset($_SERVER['HTTPS'])) $protocol = 'https'; else $protocol = 'http';
                        $server = $_SERVER['HTTP_HOST'];
                        $serverUrl  = "$protocol://".$server;
                       
                    $_SESSION["serverUrl"] = $serverUrl;
                   
		$admin_obj = new Admin;
                $menus = $admin_obj->getMenus();
                
                $role = $admin_obj->getExistingRole();
		$this->addTemplateVar('csrf_token', csrf_token());
                $this->addTemplateVar('menus', $menus);
                $this->addTemplateVar('role', $role);
		$this->addTemplateVar('pageTitle', 'Admin Page');
                $this->addTemplateVar("bc1", "Admin Page");
		$this->addTemplateVar('page', 'page/admin');
		return view('general.index', $this->template_vars);
	}
}
