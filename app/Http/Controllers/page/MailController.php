<?php

namespace App\Http\Controllers\page;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Mail;
class MailController extends Controller
{
    public function user_email(){ 
        
        $data["post_data"]=$_POST;
        
        
        Mail::send(['html'=>'page.user_mail'], $data, function($message){
            if(isset($_POST["resetPassword"]))
            {
                $subject = "1Dash: Reset Password";
            }
            elseif(isset($_POST["forgotPasswordEmail"]))
            {
                $subject = "1Dash: Forgot your password?";
            }
            elseif (isset($_POST["adduser"])) {
                 $subject = "1Dash : Welcome to 1Dash";
            }
            elseif(isset($_POST["deleteuser"]))
            {
                $subject = "1Dash: Delete User";
            }
            
            $message->to($_POST["email"],'')->subject($subject);
            $message->from('noreply@1dash.com','1Dash');
        });
        
    }
    
}
