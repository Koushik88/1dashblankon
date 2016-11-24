<?php

namespace App\Http\Controllers\page;

use Illuminate\Http\Request;
use App\Admin;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class settingsController extends Controller
{
    //
    public function randString($length, $charset='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789')
    {
        $str = '';
        $count = strlen($charset);
        while ($length--) 
        {
            $str .= $charset[mt_rand(0, $count-1)];
        }
        return $str;
    }
    
    public function currentPasswordValidation(Request $request)
    {
        if($request->ajax())
          {  
            $admin_obj = new Admin;
             //Validtate Current Password using Ajax Module
                 $pwdCheck = $admin_obj->passwordCheck($_POST["currentPasssword"]);
                 if($pwdCheck)
                 {
                   echo "1";  
                 }
                 else
                 {
                     echo "0";  
                 }
                
          }
    }
    
    public function currentPasswordChange(Request $request)
    {
        if($request->ajax())
          {  
                $admin_obj = new Admin;
                $password_str = $this->randString(2);  
                $enc_pwd = md5($_POST['newPsw'].$password_str);
                $result = $admin_obj->updatePassword($password_str,$enc_pwd);
                echo "1";
          }
        
    }
    
    public function chatCurrentUserList(Request $request)
    {
        if($request->ajax())
          {
             $admin_obj = new Admin;
             $chartUserList = $admin_obj->getCurrentUserList();
             $this->addTemplateVar('chartUserList', $chartUserList);
             $latestChatUser =  $admin_obj->getLatestChartUser(); 
             $this->addTemplateVar('latestChatUser', $latestChatUser[0]["user_two"]);            
             return view('page.chat_ajax', $this->template_vars);
          } 
        
    }
    
    public function insertChatMessage(Request $request)
    {
        if($request->ajax())
          {
            $admin_obj = new Admin;
            $result = $admin_obj->getRandomIdInfo($_POST);
                if($result[0]['c_id'])
                {
                    $cid = $result[0]['c_id'];
                }
                else
                {
                    $cid = $admin_obj-> insertChatUserInfo($_POST);
                }    
                $result1 = $admin_obj->insertChatMessage($cid,$_POST);
          }
    }
    
    public function loadChatMessage(Request $request)
    {
         if($request->ajax())
          {
                $admin_obj = new Admin;
                $result = $admin_obj->selectChatMessage($_POST["latchartUserId"]);                
                $this->addTemplateVar('loadmsg', $result);          
                return view('page.chat_ajax', $this->template_vars);
         }
    }
    public function loadNotifications(Request $request)
    {
        if($request->ajax())
          {
             $admin_obj = new Admin;
             $notification = $admin_obj->getMsgNotification();           
             $this->addTemplateVar('notification', $notification);
             return view('page.notification_ajax', $this->template_vars);
           }
    }
    public function getNotificationsCount(Request $request)
    {
         if($request->ajax())
          {
               $admin_obj = new Admin;
               $notifyCount = $admin_obj->getNotifyCount();
               print_r($notifyCount[0]["Count"]+$notifyCount[1]["Count"]+$notifyCount[2]["Count"]); 
          }
    }
    
   

    
}
