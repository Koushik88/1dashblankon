<?php

namespace App\Http\Controllers\plugin;

use Illuminate\Http\Request;
use App\Admin;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class rssfeedController extends Controller
{
    public function loadRssFeeds(Request $request) {
        if($request->ajax())
          {  
            
                $admin_obj = new Admin;
                $res = $admin_obj->getRssFeedTab(); 
                if ($res) {
                     $arr=json_decode($res[0]['data'],TRUE);
                     $this->addTemplateVar('arr', $arr);
                }
                else {
                     $arr2="No feeds found";
                     $this->addTemplateVar('arr2', $arr2);  
                }
                
                 return view('module.rssTab', $this->template_vars);
        }
    }
    
    
    public function rssbasic(Request $request)
    {
         if($request->ajax())
          {  
            $url = $_POST['url'];
            $xml = ($url);
            require_once app_path().'/Http/Controllers/plugin/rssFeedData.php'; 
          }
    }
    
    public function rssmodal(Request $request)
    {
         if($request->ajax())
          {  
             $admin_obj = new Admin;
                    if(isset($_POST['rssmodal'])){
                    $res = $admin_obj->getRssFeedTab();
                    if ($res) {
                    $arr1=json_decode($res[0]['data'],TRUE);
                    $this->addTemplateVar('arr1', $arr1);
                    
                    }
                    else{
                        $arr1="";
                        $this->addTemplateVar('arr1', $arr1);                     
                    }
                     return view('module.rssTab', $this->template_vars);
                }
          }
    }
    
    
    public function updateRssFeedsUrl(Request $request)
    {
        if($request->ajax())
          { 
             $admin_obj = new Admin;
             $arr= array(array('url' => $_POST['insert_url1'],'name'=>$_POST['name1'] ),array('url' => $_POST['insert_url2'],'name'=>$_POST['name2'] ),array('url' => $_POST['insert_url3'],'name'=>$_POST['name3'] ),array('url' => $_POST['insert_url4'],'name'=>$_POST['name4'] ),array('url' => $_POST['insert_url5'],'name'=>$_POST['name5'] ));
             $arr_value=json_encode($arr);           
             $result=$admin_obj->saveRssFeed($arr_value);
          }
    }
    
    
    
    
    
    
}
