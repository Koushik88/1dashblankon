<?php

namespace App\Http\Controllers\plugin;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Admin;


class OneviewController extends Controller
{
         /**
	 * [widget description]
	 * @return [type] [description]
	 */
    public function widget() {
        
            $admin_obj = new Admin;
            $menus = $admin_obj->getMenus();
        
           $plugin = $admin_obj->getPluginCredentials('Quickbook');              
           
            if(!$plugin)
            {
                 $this->addTemplateVar("quickbook_error_msg","quickbook_error_msg");
            }
    
        $query = "date_macro=thisyear&column=quarterly";
        $this->addTemplateVar('query', $query);
        $this->addTemplateVar('menus', $menus);
        $this->addTemplateVar('csrf_token', csrf_token());
        $this->addTemplateVar('pageTitle', '1View');
        $this->addTemplateVar('page', 'plugin/widget');
        $this->addTemplateVar("bc1", "1View");
        return view('general.index', $this->template_vars);
    
            
    }
}
