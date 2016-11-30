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
            $message->to($_POST["email"],'')->subject('1Dash: Reset Password');
            $message->from('noreply@1dash.com','1Dash');
        });
        
    }
}
