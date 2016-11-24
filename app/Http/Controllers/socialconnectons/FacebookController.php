<?php

namespace App\Http\Controllers\socialconnectons;

use App\Admin;
use App\Http\Controllers\Controller;
use Facebook\Authentication\getLongLivedAccessToken;
use Facebook\Exceptions\FacebookResponseException;
use Facebook\Exceptions\FacebookSDKException;
use Facebook\Facebook;
use Facebook\getOAuth2Client;
use Facebook\getRedirectLoginHelper;

require dirname(__FILE__) . "/credentials.php";

class FacebookController extends Controller {
	/**
	 * [index description]
	 * @return [type] [description]
	 */
	public function index() {
		$fb = new \Facebook\Facebook([
			'app_id' => FB_APP_ID,
			'app_secret' => FB_APP_SECRET,
			'default_graph_version' => 'v2.7',
		]);
		//--------------------

		$helper = $fb->getRedirectLoginHelper();
		try {
			$accessToken = $helper->getAccessToken();
		} catch (Facebook\Exceptions\FacebookResponseException $e) {
			// When Graph returns an error
			echo 'Graph returned an error: ' . $e->getMessage();
			exit;
		} catch (Facebook\Exceptions\FacebookSDKException $e) {
			// When validation fails or other local issues
			echo 'Facebook SDK returned an error: ' . $e->getMessage();
			exit;
		}

		// validate error
		if (!isset($accessToken)) {
			if ($helper->getError()) {
				header('HTTP/1.0 401 Unauthorized');
				echo "Error: " . $helper->getError() . "\n";
				echo "Error Code: " . $helper->getErrorCode() . "\n";
				echo "Error Reason: " . $helper->getErrorReason() . "\n";
				echo "Error Description: " . $helper->getErrorDescription() . "\n";
			} else {
				header('HTTP/1.0 400 Bad Request');
				echo 'Bad request';
			}
			exit;
		}

		if (!$accessToken->isLongLived()) {
			// Exchanges a short-lived access token for a long-lived one
			try {
				$oAuth2Client = $fb->getOAuth2Client();
				$accessToken = $oAuth2Client->getLongLivedAccessToken($accessToken);
			} catch (Facebook\Exceptions\FacebookSDKException $e) {
				echo "<p>Error getting long-lived access token: " . $helper->getMessage() . "</p>\n\n";
				exit;
			}
		}

		if ($accessToken) {
			// save oauth_token & oauth_token_secret in database
			$fb->setDefaultAccessToken($accessToken);
			// get user details
			try {
				$q = "me?fields=id,name,email,link,picture,friends.limit(0).summary(true),accounts{picture,name,fan_count}";
				$us_rsp = $fb->get($q);
			} catch (\Facebook\Exceptions\FacebookResponseException $e) {
				// When Graph returns an error
				echo 'Graph returned an error: ' . $e->getMessage();
				exit;
			} catch (\Facebook\Exceptions\FacebookSDKException $e) {
				// When validation fails or other local issues
				echo 'Facebook SDK returned an error: ' . $e->getMessage();
				exit;
			}
			$user_details = $us_rsp->getDecodedBody();
			// prepare data to store
			$data = array();
			$data['FB_APP_ID'] = FB_APP_ID;
			$data['FB_APP_SECRET'] = FB_APP_SECRET;
			$data['FB_ACCESS_TOKEN'] = (string) $accessToken->getValue();
			$data['FB_USER_ID'] = $user_details['id'];
			$data['FB_USER_NAME'] = $user_details['name'];
			$data['FB_USER_EMAIL'] = $user_details['email'];
			$data['FB_PROFILE_PIC'] = $user_details['picture']['data']['url'];
			$pageInfo = array();
			foreach ($user_details['accounts']['data'] as $key => $val) {
				$pageInfo[$key]['PAGE_ID'] = $val['id'];
				$pageInfo[$key]['PAGE_NAME'] = $val['name'];
				$pageInfo[$key]['PAGE_PROFILE_PIC'] = $val['picture']['data']['url'];
			}
			$data['FB_USER_PAGE_INFO'] = $pageInfo;

			$admin_obj = new Admin;
			$admin_obj->savePluginCredentials('Facebook', json_encode($data));

			if ($_GET['source'] == "widget") {
				$_SESSION['isSocialSuccess'] = "yes_display";
				$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your facebook account.";
				return redirect("widget");
			} else {
				$_SESSION['isSocialSuccess'] = "yes_display";
				$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your facebook account.";
				return redirect("profile");
			}
		}
	}
	/**
	 * [savePageId description]
	 * Save session of page id
	 * @return [type] [description]
	 */
	public function savePageId() {
		if (($_POST['pageselected'] == "saveSessionPageId") && ($_POST['pageid'])) {
			$_SESSION['DefaultFbPageID'] = $_POST['pageid'];
			echo '"' . $_POST['pagename'] . '"' . ' is chosen as default to show posts on social page.';
			exit();
		}
	}

}
