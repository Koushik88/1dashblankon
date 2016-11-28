<?php

namespace App\Http\Controllers\socialconnectons;

use App\Admin;
use App\Http\Controllers\Controller;
use Google_Client;
use Google_Service_YouTube;

require dirname(__FILE__) . "/credentials.php";

class GoogleController extends Controller {
	/**
	 * [index description]
	 * @return [type] [description]
	 */
	public function index() {
		if (isset($_GET['code'])) {
			$client_id = GOOGLE_CLIENTID;
			$client_secret = GOOGLE_CLIENT_SECRET;
			$redirect_uri = env('APP_URL') . 'google_oauth';

			$client = new Google_Client();
			$client->setClientId($client_id);
			$client->setClientSecret($client_secret);
			$client->setAccessType('offline');
			$client->setApprovalPrompt("force");
			$client->setRedirectUri($redirect_uri);

			$client->authenticate($_GET['code']);
			$tokens = $client->getAccessToken();

			$id_token = $tokens['id_token'];
			$refreshToken = $tokens['refresh_token'];

			$ticket = $client->verifyIdToken($id_token);
			if ($ticket) {
				$ResponseClientId = $ticket['aud'];
				$ResponseUserEmail = $ticket['email'];
				$googlePlusUserId = $ticket['sub'];

				// get youtube chanel id and save it in db
				$youtres = $this->getYoutubeChanelId($refreshToken);
				$youtubeChannelId = "";
				if ($youtres != "error") {
					$youtubeChannelId = $youtres;
				}
				if ($client_id == $ResponseClientId) {
					$admin_obj = new Admin;
					$result = $admin_obj->setGoogleSigninQuery($refreshToken, $ResponseUserEmail, $googlePlusUserId, $youtubeChannelId, $_SESSION["userId"]);
				}
			}

			if ($_GET['state'] == "widget") {
				$_SESSION['isSocialSuccess'] = "yes_display";
				$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your google account.";
				return redirect('widget');
			} else {
				$_SESSION['isSocialSuccess'] = "yes_display";
				$_SESSION['SocialMsg'] = "Thanks! You have successfully configured your google account.";
				return redirect('profile');
			}
		}
	}
	/**
	 * [getYoutubeChanelId description]
	 * @param  [type] $refreshToken [description]
	 * @return [type]               [description]
	 */
	public function getYoutubeChanelId($refreshToken) {
		if ($refreshToken) {
			$client = new Google_Client();
			$client->setClientId(GOOGLE_CLIENTID);
			$client->setClientSecret(GOOGLE_CLIENT_SECRET);
			$client->setAccessType('offline');
			$client->setApprovalPrompt("force");
			// $client->setRedirectUri($redirect_uri);
			// $client->setState($state);
			$client->setScopes(array('https://www.googleapis.com/auth/youtube', 'https://www.googleapis.com/auth/youtube.force-ssl', 'https://www.googleapis.com/auth/youtube.readonly', 'https://www.googleapis.com/auth/youtube.upload', 'https://www.googleapis.com/auth/youtubepartner', 'https://www.googleapis.com/auth/youtubepartner-channel-audit'));
			try {
				$client->refreshToken($refreshToken);
				$token = $client->getAccessToken();

				if ($token) {
					$youtube = new Google_Service_YouTube($client);

					$channelsResponse = $youtube->channels->listChannels('contentDetails', array(
						'mine' => 'true',
					));
					if ($channelsResponse) {
						$uploadsListId = $channelsResponse['items'][0]['contentDetails']['relatedPlaylists']['uploads'];

						// get all videos in the playlist
						// $playlistItemsResponse = $youtube->playlistItems->listPlaylistItems('snippet', array(
						//     'playlistId' => $uploadsListId,
						//     'maxResults' => 1,
						// ));
						// $youtubechannel = "";
						// foreach ($playlistItemsResponse['items'] as $playlistItem) {
						//     $youtubechannel = $playlistItem['snippet']['channelId'];
						// }
					}
					// return $youtubechannel;
					return $uploadsListId;
				} else {
					return "error";
				}
			} catch (Exception $ex) {
				return "error";
			}
		}
	}
}
