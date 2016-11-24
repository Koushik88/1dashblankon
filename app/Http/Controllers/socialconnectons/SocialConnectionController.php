<?php

namespace App\Http\Controllers\socialconnectons;

use App\Http\Controllers\Controller;
use App\Http\Controllers\socialconnectons\instagram\Instagram;
use DirkGroenen\Pinterest\Pinterest;
use Facebook\Facebook;
use Facebook\getRedirectLoginHelper;
use TwitterOAuth;
use Vimeo\Vimeo;

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
			$fb = new \Facebook\Facebook([
				'app_id' => FB_APP_ID,
				'app_secret' => FB_APP_SECRET,
				'default_graph_version' => 'v2.7',
			]);

			// get fb login url
			$helper = $fb->getRedirectLoginHelper();
			$permissions = get_fbPermissions();
			if ($_GET['source'] == "widget") {
				$loginUrl = $helper->getLoginUrl(FB_OAUTH_CALLBACK . "?source=widget", $permissions);
			} else if ($_GET['source'] == "profile") {
				$loginUrl = $helper->getLoginUrl(FB_OAUTH_CALLBACK . "?source=profile", $permissions);
			}
			// redirect to Facebook login .
			return redirect($loginUrl);
		} else if ($plugin == "Instagram") {
			$instagram = new Instagram(array(
				'apiKey' => INSTAGRAM_CLIENT_ID,
				'apiSecret' => INSTAGRAM_CLIENT_SECRET,
				'apiCallback' => INSTAGRAM_OAUTH_CALLBACK,
			));
			if ($_GET['source'] == "widget") {
				$loginUrl = $instagram->getLoginUrl();
				$_SESSION['InstagramConfigSource'] = "widget";
			} else if ($_GET['source'] == "profile") {
				$loginUrl = $instagram->getLoginUrl();
				$_SESSION['InstagramConfigSource'] = "profile";
			}
			return redirect($loginUrl);
		} else if ($plugin == "Pinterest") {
			$SCOPE = get_PinterestScope();
			// Pinterest Class
			$pinterest = new Pinterest(PINTEREST_CLIENT_ID, PINTEREST_CLIENT_SECRET);
			if ($_GET['source'] == "widget") {
				$loginurl = $pinterest->auth->getLoginUrl(PINTEREST_OAUTH_CALLBACK . "?source=widget", $SCOPE);
			} else if ($_GET['source'] == "profile") {
				$loginurl = $pinterest->auth->getLoginUrl(PINTEREST_OAUTH_CALLBACK . "?source=profile", $SCOPE);
			}
			return redirect($loginurl);
		} else if ($plugin == "Vimeo") {
			$lib = new Vimeo(VIMEO_CLIENT_ID, VIMEO_CLIENT_SECRET);
			$_SESSION['viemoState'] = base64_encode(openssl_random_pseudo_bytes(30));
			if ($_GET['source'] == "widget") {
				$loginUrl = $lib->buildAuthorizationEndpoint(VIMEO_OAUTH_CALLBACK . "?source=widget", 'public private', $_SESSION['viemoState']);
			} else if ($_GET['source'] == "profile") {
				$loginUrl = $lib->buildAuthorizationEndpoint(VIMEO_OAUTH_CALLBACK . "?source=profile", 'public private', $_SESSION['viemoState']);
			}
			return redirect($loginUrl);
		} else if ($plugin == "LinkedIn") {

		} else if ($plugin == "Google") {

		} else {
			return redirect("profile");
		}
	}
}
