<?php

namespace App\Http\Controllers;

use App\Admin;
use App\Http\Controllers\Controller;
use Config;
use Input;

class LoginController extends Controller {
	/*
		    |--------------------------------------------------------------------------
		    | Login Controller
		    |--------------------------------------------------------------------------
		    |
		    | Perform Login Operation
		    |
	*/
	public function doLogin() {
		$admin_obj = new Admin;
		$username = trim(Input::get('username'));
		$passwd = trim(Input::get('passwd'));
		$errors = array();

		if (!isset($username) || strlen($username) == 0) {
			$errors["error_email"] = "Please Enter the Valid Email";
		} elseif (!isset($passwd) || strlen($passwd) == 0) {
			$errors["error_passwd"] = "Please Enter the Password";
		}
		// get user data from db for the user
		if (empty($errors)) {
			$login = true;
			$email_id = [$username];
			$values = $admin_obj->getUserDatabase($email_id);
			if (empty($values)) {
				$errors["error_login"] = "Email does not exist.";
				$login = false;
			} else {
				// set dynamic db in config
				$dynamic_db_name = $values[0]['comany_name'] . "_admin";
				$_SESSION["dynamic_db_name"] = $dynamic_db_name;
				Config::set('database.connections.dynamic_mysql.database', $dynamic_db_name);
				// validate user name and password from dyanamic db
				$credentials = [$username, $passwd];
				$user_data = $admin_obj->loginUser($credentials);
				//check user valid or not
				if (!isset($user_data[0]["id"])) {
					$errors["error_login"] = "Password is incorrect.";
					$login = false;
				} else {
					$userData = $user_data[0];
				}
			}
		}

		if ($errors) {
			return redirect()->route('login')->with('errors', $errors);
		} else {
			$_SESSION["last_login"] = $userData["last_login"];
			/*
				Update user last login in DB
			 */
			// $lastlogin = $page->updateLastLogin($userData["id"]);
			$_SESSION["token"] = md5(date('h:i:s') . $userData["email"]);
			// $_SESSION["username"] = $userData["username"];
			$_SESSION["userId"] = $userData['id'];
			$_SESSION["email"] = $userData['email'];
			$_SESSION["name"] = $userData['first_name'] . " " . $userData['last_name'];
			$_SESSION["user_type"] = $userData["user_type_id"];
			$_SESSION["user_role_id"] = $userData["user_role"];
			// $_SESSION["user_access_right_id"] = $userData["access_right_id"];
			$_SESSION["previous_login"] = $userData["previous_login"];
			$_SESSION["company_id"] = $userData["company_id"];
			$_SESSION['custom_upload'] = $userData["custom_upload"];
			$_SESSION['img_logo'] = $userData["logo_image"];
			$_SESSION['export_level'] = $userData["export_level"];
			$_SESSION['export_type'] = $userData["export_type"];
			$_SESSION['admin_privilege_module'] = $userData['admin_privilege_module'];
			$_SESSION['validate_admin_module_token'] = explode(',', $userData['admin_privilege_module']);
			$_SESSION['custom_role_one_id'] = $userData['custom_role_one_id'];
			$_SESSION['custom_role_two_id'] = $userData['custom_role_two_id'];
			// $_SESSION['email_notific'] = $userData['email_notific'];
			$_SESSION['last_logout'] = $userData['last_logout'];
			$_SESSION['temeId'] = $userData["temeId"];

			//get menu list
			// $menus = (sizeof($page->_menus) == 0) ? $page->getMenus() : $page->_menus;
			// $_SESSION['menu_count'] = count($menus);
			//redirect for user levels menus
			// if (isset($menus['0']['0']['children']['0']['href'])) {
			// 	$mid = $menus['0']['0']['sid'];
			// 	$value_name = $menus['0']['0']['children']['0']['name'];
			// 	$value_href = $menus['0']['0']['children']['0']['href'];
			// 	$_SESSION['home_name'] = $value_name;
			// 	$_SESSION['home_href'] = $value_href;
			// 	$mids = $value_href;
			// 	$length = strlen($mids);
			// 	$pos = strrpos($mids, "?");
			// 	$sub = substr($mids, $pos + 1, $length);
			// 	header('Location:' . $value_href);
			// } else {
			// 	header('Location:' . PORTALLOCATION . 'page/directive.php');
			// }

			// echo "<pre>";
			// print_r($errors);
			// print_r($userData);
			// die();
			return redirect()->route('widget');
		}
	}
	/**
	 * [logout description]
	 * @return [type] [description]
	 */
	public function logout() {
		session_destroy(); //session_unset();
		// setcookie("_loggedIn", time(), time() - 1800, path); //cookie expired;
		return redirect()->route('login');
	}

	/**
	 * [wel9 dummy function]
	 * @return [type] [description]
	 */
	public function wel9() {
		$token = csrf_token();
		echo "mani: " . $token;
		// return view('welcome');
		return view('helloworld');
	}
}
