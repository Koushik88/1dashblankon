<?php

namespace App\Http\Controllers\socialconnectons;

use App\Admin;
use App\Http\Controllers\Controller;
use TwitterOAuth;

require dirname(__FILE__) . "/credentials.php";

class TwitterController extends Controller {
	/**
	 * [index description]
	 * @return [type] [description]
	 */
	public function index() {
		if (isset($_GET['oauth_token'])) {
			$connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, $_SESSION['request_token'], $_SESSION['request_token_secret']);
			$access_token = $connection->getAccessToken($_REQUEST['oauth_verifier']);
			if ($access_token) {
				// save oauth_token & oauth_token_secret in database
				$data = array();
				$data['CONSUMER_KEY'] = CONSUMER_KEY;
				$data['CONSUMER_SECRET'] = CONSUMER_SECRET;
				$data['ACCESS_TOKEN'] = $access_token['oauth_token'];
				$data['SECRET_KEY'] = $access_token['oauth_token_secret'];
				$data['screen_name'] = $access_token['screen_name'];
				$data['user_id'] = $access_token['user_id'];

				$admin_obj = new Admin;
				$admin_obj->savePluginCredentials('Twitter', json_encode($data));

				if ($_GET['source'] == "widget") {
					$_SESSION['isSocialSuccess'] = "yes_display";
					$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your twitter account.";
					return redirect("widget");
				} else {
					$_SESSION['isSocialSuccess'] = "yes_display";
					$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your twitter account.";
					return redirect("profile");
				}
			} else {
				// echo "<h4> Login Error / Can't verify auth token</h4>";
				$_SESSION['isSocialSuccess'] = "yes_display";
				$_SESSION['SocialMsg'] = "Oops! Something went wrong. Please connect again.";
				return redirect("profile");
			}
		} else {
			// Error. redirect to Login Page.
			$_SESSION['isSocialSuccess'] = "yes_display";
			$_SESSION['SocialMsg'] = "Oops! Something went wrong. Please connect again.";
			return redirect("profile");
		}
	}
}
