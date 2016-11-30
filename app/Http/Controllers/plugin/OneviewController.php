<?php

namespace App\Http\Controllers\plugin;
use App\Admin;
use App\Http\Controllers\Controller;
use Log;

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
		$makeCall = false;
		if (!isset($_SESSION["Last_Counter_Call"])) {
			$makeCall = true;
		} else {
			Log::info("Last_Counter_Call: " . $_SESSION["Last_Counter_Call"] . "<br/>");
			Log::info(date("Y/m/d H:i:s", $_SESSION["Last_Counter_Call"]) . "<br/>");
			$interval = abs($_SESSION["Last_Counter_Call"] - time());
			$minutes = round($interval / 60);
			Log::info('Diff. in minutes is: ' . $minutes . "<br/>");
			if ($minutes > 5) {
				$makeCall = true;
			} else {
				$makeCall = false;
			}
		}
		if ($makeCall) {
			$_SESSION["Last_Counter_Call"] = time();
			$url = env("APP_URL") . 'allPluginsPostCounter';
			$postFields = array("user_id" => $_SESSION["userId"], "username" => $_SESSION["email"], "last_login" => $_SESSION["previous_login"], "dynamic_db_name" => $_SESSION["dynamic_db_name"]);
			$ch = curl_init($url);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postFields));
			$max_exe_time = 250; // time in milliseconds
			curl_setopt($ch, CURLOPT_TIMEOUT_MS, $max_exe_time);
			$result = curl_exec($ch);
			curl_close($ch);
		}

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
