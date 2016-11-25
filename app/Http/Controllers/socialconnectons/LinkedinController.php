<?php

namespace App\Http\Controllers\socialconnectons;

use App\Admin;
use App\Http\Controllers\Controller;

require dirname(__FILE__) . "/credentials.php";
class LinkedinController extends Controller {
	/**
	 * [index description]
	 * @return [type] [description]
	 */
	public function index() {
		$linkedinApiKey = linkedinApiKey;
		$linkedinApiSecret = linkedinApiSecret;
		$linkedinScope = linkedinScope;
		$callbackURL = linkedin_callback;

		$code = $_GET['code'];
		if (isset($code)) {
			$accessTokenUrl = 'https://www.linkedin.com/oauth/v2/accessToken?grant_type=authorization_code&code=' . $code . '&redirect_uri=' . $callbackURL . '&client_id=' . $linkedinApiKey . '&client_secret=' . $linkedinApiSecret;
			$accesstoken = file_get_contents($accessTokenUrl);
			$accesstoken = json_decode($accesstoken, true);
			$cmpyid = 'https://api.linkedin.com/v1/companies?oauth2_access_token=' . $accesstoken['access_token'] . '&format=json&is-company-admin=true ';
			$company_id = file_get_contents($cmpyid);
			$company_id = json_decode($company_id, true);
			if ($company_id['_total'] == 0 && !isset($company_id['values'])) {
				if ($_GET['state'] == "widget") {
					$_SESSION['isSocialSuccess'] = "yes_display";
					$_SESSION['SocialMsg'] = "You are not an admin of any company page.";
					return redirect("widget");
				} else {
					$_SESSION['isSocialSuccess'] = "yes_display";
					$_SESSION['SocialMsg'] = "You are not an admin of any company page.";
					return redirect("profile");
				}
			}

			// print_r($company_id['values']);
			$company_id1 = $company_id['values'][0]['id'];
			//die();
			$data = array();
			$data['LKDIN_CMPNY_ID'] = $company_id1;
			$data['LKDIN_CMPNY_ID_MUL'] = $company_id['values'];
			$data['LKDIN_ACCESS_TOKEN'] = $accesstoken['access_token'];
			$data['LKDIN_APP_ID'] = $linkedinApiKey;
			$data['LKDIN_APP_SECRET'] = $linkedinApiSecret;
			$data['LKDIN_CALL_BACK'] = $callbackURL;
			$data['code'] = $code;
			$admin_obj = new Admin;
			$admin_obj->savePluginCredentials('LinkedIn', json_encode($data));

			if ($_GET['state'] == "widget") {
				$_SESSION['isSocialSuccess'] = "yes_display";
				$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your linkedin account.";
				return redirect("widget");
			} else {
				$_SESSION['isSocialSuccess'] = "yes_display";
				$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your linkedin account.";
				return redirect("profile");
			}

		} else {
			$_SESSION['isSocialSuccess'] = "yes_display";
			$_SESSION['SocialMsg'] = "Oops! Something went wrong, please reconnect your linkedin account again.";
			return redirect("profile");
		}
		/*$client = new oauth_client_class;
			$client->debug = false;
			$client->debug_http = true;
			$client->redirect_uri = $callbackURL;
			$client->client_id = $linkedinApiKey;
			$application_line = __LINE__;
			$client->client_secret = $linkedinApiSecret;
		*/
		/**
		 * API permissions
		 */
		/*$client->scope = $linkedinScope;
			if (strlen($client->client_id) == 0 || strlen($client->client_secret) == 0) {
				die('Please go to LinkedIn Apps page https://www.linkedin.com/secure/developer?newapp= , ' .
					'create an application, and in the line ' . $application_line .
					' set the client_id to Consumer key and client_secret with Consumer secret. ' .
					'The Callback URL must be ' . $client->redirect_uri) . ' Make sure you enable the ' .
					'necessary permissions to execute the API calls your application needs.';
			}
			if ($client->exit) {
				exit;
		*/
	}
}
