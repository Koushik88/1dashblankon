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

namespace App\Http\Controllers\Page;
use App\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

require_once app_path() . '/Http/Controllers/page/example.php';

class HomeController extends Controller {
	/*
		    |--------------------------------------------------------------------------
		    | Home Controller
		    |--------------------------------------------------------------------------
		    |
		    | Show Login screen
		    |
	*/

	/**
	 * Handle the main request
	 *
	 * @return void
	 */
	public function index() {
		// $token = csrf_token();
		/**
		 * Redirect if alreday authenticated
		 */
		if (isset($_SESSION["token"])) {
			return redirect('/home');
		}
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', '1View');
		$this->addTemplateVar('page', 'page/index');
		return view('general.index', $this->template_vars);
	}
	/**
	 * [home description]
	 * @return [type] [description]
	 */
	public function home() {
		/**
		 * [$admin_obj description]
		 * @var Admin model
		 */
		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Home');
		$this->addTemplateVar('page', 'plugin/widget');
		return view('general.index', $this->template_vars);
	}
	
	/**
	 * [socialstream description]
	 * @param  string $value [description]
	 * @return [type]        [description]
	 */
	public function socialstream() {
		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Social Stream');
		$this->addTemplateVar('page', 'module/socialstream');
		return view('general.index', $this->template_vars);
	}
	/**
	 * [calendar description]
	 * @return [type] [description]
	 */
	public function calendar() {
		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Calendar');
		$this->addTemplateVar('page', 'module/calendar');
		return view('general.index', $this->template_vars);
	}
	/**
	 * [gmail_up description]
	 * @return [type] [description]
	 */
	public function gmail_up() {
		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Gmail');
		$this->addTemplateVar('page', 'module/gmail_up');
		return view('general.index', $this->template_vars);
	}

	/**
	 * [demodb dummy functions]
	 * @return [type] [description]
	 */
	public function demodb() {
		echo MANI . "<br><br>";
		echo app_path();
		// die();
		$email_id = ["2", "ponnar.v@tvsnext.io"];
		// $email_id  = ["ponnar.v@tvsi.com"];
		$admin_obj = new Admin;
		$users = $admin_obj->getName($email_id);
		// $users = DB::select('select * from 1dash_app_userlist where active = ?', [1]);
		$plugins = $admin_obj->getPlugins();
		echo "<pre>";
		// print_r($DB);
		print_r($users);
		print_r($plugins);
		// echo "Local Connections: <br>";
		// print_r($plugins);
		// echo "Agin after instance: <br>";
		// print_r($users1);
		die();
	}
	public function demodb1() {
		// echo MANI . "<br><br>";
		// echo app_path();
		// $email_id = ["2", "ponnar.v@tvsnext.io"];
		$admin_obj = new Admin;
		// $users = $admin_obj->getName($email_id);
		// $plugins = $admin_obj->getPlugins();
		echo "<pre>";
		// print_r($users);
		// print_r($plugins);

		$users = $admin_obj->getUsers();
		print_r($users);
		die();
	}
	public function checkdb() {
		$email_id = ["2", "ponnar.v@tvsnext.io"];
		$admin_obj = new Admin;
		$users = $admin_obj->getName1($email_id);
		echo "<pre>";
		print_r($users);
	}
}
