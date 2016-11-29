<?php

namespace App\Http\Controllers\page;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Mail;
class MailController extends Controller
{
    public function basic_email(){
        $data=['name'=>'Ponnar V'];
        Mail::send(['User Mail'=>'page.user_mail'], $data, function($message){
            $message->to('ponnar.v@tvsnext.io','Ponnar V')->subject('Send Mail from Laravel with Basics Email');
            $message->from('noreply@1dash.com','1Dash');
        });
        
    }
}
