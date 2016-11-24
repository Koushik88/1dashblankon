<?php

namespace App\Http\Controllers\socialconnectons;

use App\Admin;
use App\Http\Controllers\Controller;
use DirkGroenen\Pinterest\Pinterest;

require dirname(__FILE__) . "/credentials.php";

class PinterestController extends Controller {
	/**
	 * [index description]
	 * @return [type] [description]
	 */
	public function index() {
		// Pinterest Class
		$pinterest = new Pinterest(PINTEREST_CLIENT_ID, PINTEREST_CLIENT_SECRET);
		if (isset($_GET["code"])) {
			$token = $pinterest->auth->getOAuthToken($_GET["code"]);
			// get access token
			$access_token = $token->access_token;
			// set access token
			$pinterest->auth->setOAuthToken($access_token);
			// get user data
			$user_fields = array(
				'fields' => 'username,first_name,last_name,bio,image[small,large],created_at,counts,url,account_type',
			);
			$user_info = $pinterest->users->me($user_fields);
			$user_info = json_decode($user_info, true);

			$data = array();
			$data['PINTEREST_CLIENT_ID'] = PINTEREST_CLIENT_ID;
			$data['PINTEREST_CLIENT_SECRET'] = PINTEREST_CLIENT_SECRET;
			$data['access_token'] = $access_token;
			foreach ($user_info as $key => $value) {
				$data[$key] = $value;
			}

			$admin_obj = new Admin;
			$admin_obj->savePluginCredentials('Pinterest', json_encode($data));

			if ($_GET['source'] == "widget") {
				$_SESSION['isSocialSuccess'] = "yes_display";
				$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your pinterest account.";
				return redirect("widget");
			} else if ($_GET['source'] == "profile") {
				$_SESSION['isSocialSuccess'] = "yes_display";
				$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your pinterest account.";
				return redirect("profile");
			}
		}
	}
}
