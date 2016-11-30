<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Admin;
class AdminAjaxController extends Controller
{
    //
    public function loadUserInfo(Request $request)
    {
            if($request->ajax())
            {   
                $admin_obj = new Admin;
                $adminResult = $admin_obj->getAllUserList();
                    $this->addTemplateVar('adminResult', $adminResult);
                    $this->addTemplateVar('loadUserInfo', "loadUserInfo");
                    return view('page.admin_ajax', $this->template_vars);
            }
    }
    
    public function loadEditUserInfo(Request $request)
    {
        if($request->ajax())
            {
                $admin_obj = new Admin;
                $role = $admin_obj->getExistingRole();                
                $this->addTemplateVar('role', $role);
                $getUserInfo = $admin_obj->getUserInfoDetails($_POST["userId"]);
                $this->addTemplateVar('getUserInfo', $getUserInfo);              
                $this->addTemplateVar('edituser', "edituser");  
                return view('page.admin_ajax', $this->template_vars);
                
            }
    }
    
    public function updateUserDetails(Request $request)
    {
        if($request->ajax())
        {
             $admin_obj = new Admin;
             $postdata = $_POST;       
             $result = $admin_obj->updateUserInfo($postdata);
            
        }
    }
    
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
    
    public function resetPasswordInfo(Request $request)
    {
        if($request->ajax())
        {
             $admin_obj = new Admin;
              if(isset($_POST["resetPswd"]))
                {
                     $postdata = $_POST;  
                     $password_str = $this->randString(2); 
                     $postdata["password"] = md5($postdata["password"].$password_str);
                     $postdata["pswstr"] = $password_str;
                     $result = $admin_obj->resetPassword($postdata);
                     
                       
                
                       $link = $_SESSION["serverUrl"];                       
                       $url = $_SESSION["serverUrl"].'/user_email';
                       $postFields = array('resetPassword'=>'resetPassword','reset_pswd'=>$_POST["password"],'email'=>$_POST['restUser_email']);
                       $ch = curl_init($url);
                       curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                       curl_setopt($ch, CURLOPT_POST, 1);
                       curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postFields));
                       $max_exe_time = 100; // time in milliseconds
                       curl_setopt($ch, CURLOPT_TIMEOUT_MS, $max_exe_time);         
                       $result= curl_exec($ch);
                       print_r($result);
                       curl_close($ch); 


                }
             
        }
    }
    public function userStatusChange(Request $request)
    {
        if($request->ajax())
        {
            $admin_obj = new Admin;
            $result = $admin_obj->changeUserStatus($_POST);
        }
    }
    
    public function userCreation(Request $request)
    {
        if($request->ajax())
        {
            $admin_obj = new Admin;
            
            $postdata = $_POST;       
            $password_str = $this->randString(2); 
            $postdata["password"] = md5($postdata["password"].$password_str);
            $postdata["pswstr"] = $password_str;
            $result = $admin_obj->insertUser($postdata);
      
         /*
          $link = PORTALLOCATION.'page/index.php';
          $username = $_POST["frstname"];
          $password = $_POST["password"];
          $url = PORTALLOCATION.'page/usermail.php';
          $postFields = array('adduser'=>'adduser','add_username'=>$username, 'link'=>$link,'email'=>$_POST['email'],'location'=>ABSLIBLOCATION,'password'=>$password);
          $ch = curl_init($url);
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
          curl_setopt($ch, CURLOPT_POST, 1);
          curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postFields));
          $max_exe_time = 250; // time in milliseconds
          curl_setopt($ch, CURLOPT_TIMEOUT_MS, $max_exe_time);         
          $result= curl_exec($ch);
          curl_close($ch); */
            
            
        }
    }
    public function deleteUserInfo(Request $request)
    {
        if($request->ajax())
        {
            $admin_obj = new Admin;
            $result = $admin_obj->deleteUser($_POST);
          
          
            /*$link = PORTALLOCATION.'page/index.php';
            $username = $_POST["frstname"];
            $url = PORTALLOCATION.'page/usermail.php';
            $postFields = array('deleteuser'=>'deleteuser','del_username'=>$_POST["del_username"], 'link'=>$link,'email'=>$_POST['email'],'location'=>ABSLIBLOCATION);
            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postFields));
            $max_exe_time = 250; // time in milliseconds
            curl_setopt($ch, CURLOPT_TIMEOUT_MS, $max_exe_time);         
            $result= curl_exec($ch);
            curl_close($ch);*/
        }
    }
    public function emailValidation(Request $request)
    {
        $admin_obj = new Admin;
            if($request->ajax())
            {
                    $result = $admin_obj->emailCheck($_POST["email"]);
                    $result1 = $admin_obj->emailCheck_commoDB($_POST["email"]);
                    if($result || $result1)
                    {
                        echo "1";
                    }else
                    {
                        echo "0";
                    }
            }
    }
    
    public function roleValidation(Request $request)
    {
        $admin_obj = new Admin;
            if($request->ajax())
            {
                $role = $admin_obj->getRoleExist(trim($_POST["roleValidation"]));
                if($role)
                {
                     echo "1";
                }  
                else {
                     echo "0";
                }
            }
    }
    public function addNewRole(Request $request)
    {
        $admin_obj = new Admin;
            if($request->ajax())
            {
                 $result = $admin_obj->insertRole($_POST);
            }
    }
    
    
}
