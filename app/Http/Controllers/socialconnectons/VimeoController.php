<?php

namespace App\Http\Controllers\socialconnectons;

use App\Admin;
use App\Http\Controllers\Controller;
use Vimeo\Vimeo;

require dirname(__FILE__) . "/credentials.php";

class VimeoController extends Controller {
	/**
	 * [index description]
	 * @return [type] [description]
	 */
	public function index() {
		if ($_SESSION['viemoState'] != $_GET['state']) {
			echo 'Something is wrong. Vimeo sent back a different state than this script was expecting.';
			return redirect("socialconnection/Vimeo?source=profile");
		}

		if ($_GET['code']) {
			$lib = new Vimeo(VIMEO_CLIENT_ID, VIMEO_CLIENT_SECRET);
			if ($_GET['source'] == "widget") {
				$tokens = $lib->accessToken($_GET['code'], VIMEO_OAUTH_CALLBACK . "?source=widget");
			} else {
				$tokens = $lib->accessToken($_GET['code'], VIMEO_OAUTH_CALLBACK . "?source=profile");
			}
			if ($tokens['status'] == 200) {
				$tokens = json_encode($tokens);
				$tokens = json_decode($tokens, true);

				$data = array();
				$data['VIMEO_CLIENT_ID'] = VIMEO_CLIENT_ID;
				$data['VIMEO_CLIENT_SECRET'] = VIMEO_CLIENT_SECRET;
				$data['access_token'] = $tokens['body']['access_token'];

				$explode = explode("https://vimeo.com/", $tokens['body']['user']['link']);
				$user_name = $explode[1];

				$data['user_name'] = $user_name;
				$data['name'] = $tokens['body']['user']['name'];
				$data['profile_link'] = $tokens['body']['user']['link'];
				$data['api_uri'] = $tokens['body']['user']['uri'];
				$data['token_type'] = $tokens['body']['token_type'];
				$data['api_endpoints'] = $tokens['body']['user']['metadata']['connections'];

				$admin_obj = new Admin;
				$admin_obj->savePluginCredentials('Vimeo', json_encode($data));

				if ($_GET['source'] == "widget") {
					$_SESSION['isSocialSuccess'] = "yes_display";
					$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your vimeo account.";
					return redirect("widget");
				} else if ($_GET['source'] == "profile") {
					$_SESSION['isSocialSuccess'] = "yes_display";
					$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your vimeo account.";
					return redirect("profile");
				}
			}
		}
	}
}
