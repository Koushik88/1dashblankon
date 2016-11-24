<?php

namespace App\Http\Controllers\plugin;

use App\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class OneviewControllerAjax extends Controller {
	/**
	 * [Widget Ajax description]
	 * @return [type] [description]
	 */
	public function widget_ajax(Request $request) 
        {
          if($request->ajax())
          {   
              
           $admin_obj = new Admin;
           $plugin = $admin_obj->getPluginCredentials('Quickbook');  
           $_SESSION["active_company_pid"] = $plugin[0]["p_id"];
           $aciveQB_list = json_decode($plugin[0]["data"],true);              
           
                try{

                    require_once app_path().'/Http/Controllers/plugin/QBCheck/QucikbooksData.php'; 
                   
                    if($_POST["widgetType"] == 'balancesheet')
                    {
                       $_SESSION["chartValue"] = $chartValue;         
                       $_SESSION["chartHeader"] = $totalValue[0]["value"];  

                    //Balance Sheet Details
                       $this->addTemplateVar('balance_sheet_coll_title', $balance_sheet_coll_title);
                       $this->addTemplateVar('balance_sheet_array', $balanceSheet["Rows"]["Row"]);
                       return view('plugin.widget_ajax', $this->template_vars);

                    }
                    
                    if($_POST["widgetType"] == 'proandloss')
                    {
                        $_SESSION["report_value"]["income"] = $net_income[count($net_income)-1];
                        $_SESSION["report_value"]["expenses"] = $expenses[count($expenses)-1];


                        $_SESSION["chartValue"] = $chartValue; 
                        $_SESSION["chartHeader"] = $totalValue[0]["value"];  
                        
                       
                        
                        $this->addTemplateVar('col_tile', $col_tile);
                        $this->addTemplateVar('total_income', $total_income);
                        $this->addTemplateVar('net_income', $net_income);
                        $this->addTemplateVar('expenses', $expenses);
                        $this->addTemplateVar('data_array', $resonseArray["Rows"]["Row"]);
                        $this->addTemplateVar('plTable', "plTable");
                        return view('plugin.widget_ajax', $this->template_vars);
                   }
                   
                   if($_POST["widgetType"] == 'Income')
                    {
                        $this->addTemplateVar('income_data', $income["Rows"]["Row"]);
                        $this->addTemplateVar('income_col_tile', $income_col_tile);
                        return view('plugin.widget_ajax', $this->template_vars);
                    }
                   
                   if($_POST["widgetType"] == 'expensess')
                    {
                        
                        $this->addTemplateVar('net_total_expensess', $net_total_expensess);
                        $this->addTemplateVar('QZReporttile', $QZReporttile);
                        $this->addTemplateVar('QZReport', $QZReport["Rows"]["Row"]);
                        return view('plugin.widget_ajax', $this->template_vars);
                        
                    }
                    
                    if($_POST["widgetType"] == 'ardetails')
                    {
                        $_SESSION["chartValue"] = $chartValue; 
                        $_SESSION["chartHeader"] = $totalValue[0]["value"];          

                        $this->addTemplateVar('arb_col_tile', $arb_col_tile);
                        $this->addTemplateVar('arReceivable', $arReceivable["Rows"]["Row"]);
                        return view('plugin.widget_ajax', $this->template_vars);                       
                    }
                    
                    if($_POST["widgetType"] == 'apdetails')
                    {
                            $_SESSION["chartValue"] = $chartValue; 
                            $_SESSION["chartHeader"] = $totalValue[0]["value"];      
        
                            $this->addTemplateVar('ar_col_tile', $ar_col_tile);
                            $this->addTemplateVar('arPayable', $arPayable["Rows"]["Row"]);
                            return view('plugin.widget_ajax', $this->template_vars);         
        
                            
  
                    }
                    if($_POST["widgetType"] == 'caseflow')
                    {
                          $_SESSION["chartValue"] = $chartValue; 
                          $_SESSION["chartHeader"] = $totalValue[0]["value"];  
          
                          $this->addTemplateVar('caseflow_tile', $caseflow_tile);
                          $this->addTemplateVar('caseflow', $caseflow["Rows"]["Row"]);
                          return view('plugin.widget_ajax', $this->template_vars);         
                    
                    }
                    if($_POST["widgetType"] == 'salesbycustomer')        
                    {
                        
                        $_SESSION["chartValue"] = $chartValue; 
                        $_SESSION["chartHeader"] = $totalValue[0]["value"];       

                        $this->addTemplateVar('sales_customer_tile', $sales_customer_tile);
                        $this->addTemplateVar('sales_customer', $sales_customer["Rows"]["Row"]);
                        return view('plugin.widget_ajax', $this->template_vars); 
                           
    
                    }
                    
                  
                } catch (Exception $ex) {

                     print_r($ex);
                }
                  
           }    
                
	}
        
    public function chart_ajax(Request $request)
    {

           if($request->ajax())
            {
                  $this->addTemplateVar('chartValue', json_encode($_SESSION["chartValue"]));
                  $this->addTemplateVar('chartType', "line");
                  $this->addTemplateVar('chartHeader', $_SESSION["chartHeader"]);
                  return view('plugin.widget_ajax', $this->template_vars);
            }

    }
    
    public function change_chartType(Request $request)
    {
        if($request->ajax())
            {
                $this->addTemplateVar('chartValue', json_encode($_SESSION["chartValue"]));
                $this->addTemplateVar('chartType', $_POST["chartType"]);
                $this->addTemplateVar('chartHeader', $_SESSION["chartHeader"]);
                return view('plugin.widget_ajax', $this->template_vars);
                
            }
        
    }
    
    public function loadValue_lable(Request $request)
    {
       
         if($request->ajax())
            {
                $admin_obj = new Admin;
                $plugin = $admin_obj->getPluginCredentials('Quickbook');              
                $aciveQB_list = json_decode($plugin[0]["data"],true);        
                
               
                require_once app_path().'/Http/Controllers/plugin/QBCheck/QucikbooksData.php';
                
                
                 $_SESSION["report_value"]["arreceivable"] = $totalValue[count($totalValue)-1]["value"];
                 $_SESSION["report_value"]["arpayable"] = $totalValue1[count($totalValue1)-1]["value"];
        
                 echo json_encode($_SESSION["report_value"]);
                
            }
    }
    
    public function QBCompanyInfo(Request $request)
    {
       
         if($request->ajax())
            { 
                $admin_obj = new Admin;
                $plugin = $admin_obj->getPluginCredentials('Quickbook');              
                $aciveQB_list = json_decode($plugin[0]["data"],true); 
                
                require_once app_path().'/Http/Controllers/plugin/QBCheck/QucikbooksData.php';
                
                if($cmpanyInfo["CompanyInfo"]["CompanyName"])
                {
                    echo $cmpanyInfo["CompanyInfo"]["CompanyName"]." - ";
                }
            }
    }
    
    
    public function switchQB_company(Request $request)
    {
        if($request->ajax())
        {
            $admin_obj = new Admin;
            $QBCredential1 = $admin_obj->getAllPluginCredentials('Quickbook'); 
            require_once app_path().'/Http/Controllers/plugin/QBCheck/switch_qbo_companies.php';
                
           
            $_SESSION["qbcompanyInfo"] = $qbcompanyInfo; 
            $this->addTemplateVar('realemId_Array', $realemId_Array);
            $this->addTemplateVar('pid_Array', $pid_Array);
            return view('plugin.widget_ajax', $this->template_vars);
                
        }
    }
    
    public function ChangeQBOList(Request $request)
    {
        $admin_obj = new Admin;
        $qbActive =  $admin_obj->UpdateActiveQBOCompany($_POST["changeCompanyId"]);
    }
    
    public function loadToDoList(Request $request)
    {
        
        if($request->ajax())
        {
            $admin_obj = new Admin;
            $unCompleteToDo = $admin_obj->getTodo("U");            
            $completeToDo = $admin_obj->getTodo("C");
            $this->addTemplateVar('unCompleteToDo', $unCompleteToDo);
            $this->addTemplateVar('completeToDo', $completeToDo);
            return view('page.settings', $this->template_vars);
        }
    }
    
    public function createToDoList(Request $request)
    {
        if($request->ajax())
        {
             $admin_obj = new Admin;
             $combined_date_and_time = $_POST["datepicker"] . ' ' . $_POST["timepicker"];
             $dt = strtotime($combined_date_and_time);
             $datetime=date("Y-m-d H:i:s", $dt);
             $result = $admin_obj->createTodo(htmlspecialchars($_POST["newtodo"]),$datetime); 
        }
        
    }
    public function updateToDo(Request $request)
    {
        if($request->ajax())
        {
           $admin_obj = new Admin;
           $result = $admin_obj->updateToDoList($_POST);
        }
    }
    public function cleartodo(Request $request)
    {
         if($request->ajax())
         {  
             $admin_obj = new Admin;
             $result = $admin_obj->clearTodoList();
         }
    }
    
    public function loadQBOCompanyList()
    {  
        $this->addTemplateVar('qbcompanyInfo', $_SESSION["qbcompanyInfo"]);
        return view('plugin.plugin_ajax', $this->template_vars);
    }
    public function deleteQBOCompanyList(Request $request)
    {
        if($request->ajax())
        { 
            $admin_obj = new Admin;
            if($_POST["deletePluginInfo"] == 'Quickbook')
            {
                $cmp_info_list = explode("##$$##",$_POST["cmp_list_info"]);
                $cmp_info = $cmp_info_list[0];
                $pid = $cmp_info_list[1];
                if($pid == $_SESSION["active_company_pid"])
                {
                  echo "1"; 
                  exit;
                }
                
                
                $QBCredential = $admin_obj->deleteQBOPluginData('Quickbook',$pid);
                $QBCredential = json_decode($QBCredential[0]["data"],true);
                require_once app_path().'/Http/Controllers/plugin/QBCheck/switch_qbo_companies.php';
                $result = $admin_obj->deleteQBPluginInfo($_POST["deletePluginInfo"],$pid);
                
            }
            else {
                $result = $admin_obj->deletePluginInfo($_POST["deletePluginInfo"]); 
            }
            
        }
    }
    
    
    
        
        
}