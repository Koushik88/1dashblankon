<?php

namespace App\Http\Controllers\socialconnectons;

use App\Http\Controllers\Controller;
use TwitterOAuth;

require dirname(__FILE__) . "/credentials.php";

class SocialConnectionController extends Controller {
	/**
	 * [addConnection description]
	 * @param [type] $plugin [description]
	 */
	public function addConnection($plugin) {
		if ($plugin == "Twitter") {
			$connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET);
			//get Request Token
			if ($_GET['source'] == "widget") {
				$request_token = $connection->getRequestToken(OAUTH_CALLBACK . "?source=widget");
			} else if ($_GET['source'] == "profile") {
				$request_token = $connection->getRequestToken(OAUTH_CALLBACK . "?source=profile");
			}

			if ($request_token) {
				$token = $request_token['oauth_token'];
				$_SESSION['request_token'] = $token;
				$_SESSION['request_token_secret'] = $request_token['oauth_token_secret'];

				switch ($connection->http_code) {
				case 200:
					$url = $connection->getAuthorizeURL($token);
					//redirect to Twitter .
					return redirect($url);
					break;
				default:
					echo "Coonection with twitter Failed";
					break;
				}

			} else {
				// error receiving request token
				echo "Error Receiving Request Token";
			}
		} else if ($plugin == "Facebook") {

		} else if ($plugin == "Instagram") {

		} else if ($plugin == "Pinterest") {

		} else if ($plugin == "Vimeo") {

		} else if ($plugin == "LinkedIn") {

		} else if ($plugin == "Google") {

		} else {
			return redirect("profile");
		}
	}
}
