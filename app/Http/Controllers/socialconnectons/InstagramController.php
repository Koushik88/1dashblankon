<?php

namespace App\Http\Controllers\socialconnectons;

use App\Admin;
use App\Http\Controllers\Controller;
use App\Http\Controllers\socialconnectons\instagram\Instagram;

require dirname(__FILE__) . "/credentials.php";
class InstagramController extends Controller {
	/**
	 * [index description]
	 * @return [type] [description]
	 */
	public function index() {
		// Receive OAuth code parameter
		if ($_GET['code']) {
			$code = $_GET['code'];
			$instagram = new Instagram(array(
				'apiKey' => INSTAGRAM_CLIENT_ID,
				'apiSecret' => INSTAGRAM_CLIENT_SECRET,
				'apiCallback' => INSTAGRAM_OAUTH_CALLBACK,
			));
			// Receive OAuth token object
			$res = $instagram->getOAuthToken($code);
			if (empty($res->user->username)) {
				// error occoured, handle this exception
			} else {
				$data = array();
				$data['INSTAGRAM_CLIENT_ID'] = INSTAGRAM_CLIENT_ID;
				$data['INSTAGRAM_CLIENT_SECRET'] = INSTAGRAM_CLIENT_SECRET;
				$data['access_token'] = $res->access_token;
				$data['username'] = $res->user->username;
				$data['bio'] = $res->user->bio;
				$data['website'] = $res->user->website;
				$data['profile_picture'] = $res->user->full_name;
				$data['full_name'] = $res->user->full_name;
				$data['id'] = $res->user->id;

				$admin_obj = new Admin;
				$admin_obj->savePluginCredentials('Instagram', json_encode($data));

				if ($_SESSION['InstagramConfigSource'] == "widget") {
					unset($_SESSION['InstagramConfigSource']);
					$_SESSION['isSocialSuccess'] = "yes_display";
					$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your instagram account.";
					return redirect("widget");
				} else {
					unset($_SESSION['InstagramConfigSource']);
					$_SESSION['isSocialSuccess'] = "yes_display";
					$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your instagram account.";
					return redirect("profile");
				}
			}
		} else {
			// Check whether an error occurred
			if (true === isset($_GET['error'])) {
				echo 'An error occurred: ' . $_GET['error_description'];
			}
		}
	}
}
