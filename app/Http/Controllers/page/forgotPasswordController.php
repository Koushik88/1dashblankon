<?php

namespace App\Http\Controllers\page;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Admin;

class forgotPasswordController extends Controller {

    public function sendChangePasswordLink(Request $request) {
        if ($request->ajax()) {
            $admin_obj = new Admin;
            if (isset($_POST["usertype"])) {

                $mailIdArray = $admin_obj->getEmailIdExits([$_POST["username"]]);

                if (!$mailIdArray) {
                    //echo 'Username or email does not exit';
                    echo '0';
                } else {

                    if (isset($_SERVER['HTTPS'])) {
                        $protocol = 'https';
                    } else {
                        $protocol = 'http';
                    }

                    $server = $_SERVER['HTTP_HOST'];
                    $currPageServer = "$protocol://" . $server;
                    $link = $currPageServer . '/forgotpasswordform?username=' . $mailIdArray[0]['email'] . '&token=' . $mailIdArray[0]['token'];
                    $username = $mailIdArray[0]['first_name'];

                    $url = $currPageServer . '/user_email';
                    $postFields = array('firstname' => $username, 'link' => $link, 'email' => $mailIdArray[0]['email'], 'forgotPasswordEmail' => "forgotPasswordEmail");
                    $ch = curl_init($url);
                    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                    curl_setopt($ch, CURLOPT_POST, 1);
                    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postFields));
                    $max_exe_time = 100; // time in milliseconds
                    curl_setopt($ch, CURLOPT_TIMEOUT_MS, $max_exe_time);
                    $result = curl_exec($ch);
                    print_r($result);
                    curl_close($ch);
                    //echo "Email sent successfully.";
                    echo "1";
                }
            }
        }
    }

    public function forgotpasswordform() {
        if (isset($_GET['username']) && isset($_GET['token'])) {
            $admin_obj = new Admin;
            $userDetail = $admin_obj->checkLinkValid($_GET["username"], $_GET['token']);
                
                    if (isset($_SERVER['HTTPS'])) {
                            $protocol = 'https';
                        } else {
                            $protocol = 'http';
                        }

                    $server = $_SERVER['HTTP_HOST'];
                    $currPageServer = "$protocol://" . $server;
            
            if ($userDetail) {
                
                $this->addTemplateVar('userId', $userDetail[0]['id']);
                $this->addTemplateVar('username', $_GET["username"]);
                $this->addTemplateVar('redirectLoc', $currPageServer);
                
            } 
            else {
                
                 $this->addTemplateVar('link_msg', $currPageServer);
            }

            $this->addTemplateVar('changePsw', "changePsw");
            $this->addTemplateVar('pageTitle', "Forgot Password");
            $this->addTemplateVar('csrf_token', csrf_token());
            $this->addTemplateVar('page', "Forgot Password");
            $this->addTemplateVar('page', "page/forgot_password");
            return view('general.index', $this->template_vars);
        }
    }
    
  
    
    public function updateNewPassword(Request $request)
    {
        if ($request->ajax()) {
            $admin_obj = new Admin;
            $password_str = $this->randString(2);    
            $enc_pwd = md5($_POST['newPsw'].$password_str);
            $result = $admin_obj->updateForgotPassword($password_str,$enc_pwd,$_POST["userId"],$_POST["username"]);       
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
    
    
    

}
