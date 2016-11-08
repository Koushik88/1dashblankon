<?php
/*
 *******************************************************************
 * COMPANY    - Global Basics Inc
 *******************************************************************

Page Description        : INDEX(LOGIN PAGE)
Defined parameters      : Load Constant page,db connection page, model page.
Created on              : 24-06-2016
Created by              : Rubanraj S,Ponnar.
Last modified on        : 25-09-2016
Last modified by        : Ponnar V

 */

// example_initialExpriment

namespace App\Http\Controllers\Page;

use App\Http\Controllers\Controller;
// Project dependency
// REQUIRE_ONCE('../init.php');
define("CONS_MANI", "Golang+MongoDB+AngularJS+MAC");
class Index extends Controller
{
    /**
     * Show the profile for the given user.
     *
     * @param  int  $id
     * @return Response
     */
    public function index()
    {
        if (isset($_GET["lg"])) // Doing a logout process & if logged out to redirect to homepage
        {
            $user_login_detail = $page->updateUserLogin();
            $func->doLogout();
        }

        unset($_SESSION);

        // return view('welcome');
        // return view('general.index')->with('msg', 'smarty works')->with('i', 5)->with('title', 'From foo uri')->with("pageTitle", "Home");
    }

    /**
     * Show the profile for the given user.
     *
     * @param  int  $id
     * @return Response
     */
    public function showHelloWorld()
    {
        $this->addTemplateVar('name', 'ponnar');
        $this->addTemplateVar('name1', 'Manigandan');
        session_start();

        $_SESSION["Manigandan"] = "1Dash-1View Session";
        return view('helloworld', $this->template_vars);
    }
}
