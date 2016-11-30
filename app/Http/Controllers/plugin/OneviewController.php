<?php

namespace App\Http\Controllers\plugin;
use App\Admin;
use App\Http\Controllers\Controller;

class OneviewController extends Controller {
	/**
	 * [widget description]
	 * @return [type] [description]
	 */
	public function widget() {

		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();

		$plugin = $admin_obj->getPluginCredentials('Quickbook');

		if (!$plugin) {
			$this->addTemplateVar("quickbook_error_msg", "quickbook_error_msg");
		}

		/**
		 * Get Plugins Post counter
		 */
		echo $_SESSION["dynamic_db_name"];
		// $url = env("APP_URL") . 'allPluginsPostCounter';
		$url = 'http://localhost:8080/allPluginsPostCounter';
		// $postFields = array("user_id" => $_SESSION["userId"], "username" => $_SESSION["email"], "last_login" => $_SESSION["previous_login"], "dynamic_db_name" => $_SESSION["dynamic_db_name"]);
		// echo "<br/> Start:";
		// Log::info("Start");
		// $ch = curl_init($url);
		// curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		// curl_setopt($ch, CURLOPT_POST, 1);
		// curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postFields));
		// $max_exe_time = 2500; // time in milliseconds
		// curl_setopt($ch, CURLOPT_TIMEOUT_MS, $max_exe_time);
		// $result = curl_exec($ch);
		// if (curl_error($ch)) {
		// 	echo 'error:' . curl_error($ch);
		// }
		// curl_close($ch);

		echo "<br/> End:";
		die();

		$query = "date_macro=thisyear&column=quarterly";
		$this->addTemplateVar('query', $query);
		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', '1View');
		$this->addTemplateVar('page', 'plugin/widget');
		$this->addTemplateVar("bc1", "1View");
		return view('general.index', $this->template_vars);

	}
}
