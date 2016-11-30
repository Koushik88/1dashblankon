<?php

namespace App\Http\Controllers\socialconnectons;

use App\Admin;
use App\Http\Controllers\Controller;
use App\Http\Controllers\socialconnectons\instagram\Instagram;
use App\Http\Controllers\socialconnectons\twitter\TwitterAPIExchange;
use Config;
use DateTime;
use DateTimeZone;
use DirkGroenen\Pinterest\Pinterest;
use Google_Client;
use Google_Service_Gmail;
use Google_Service_Plus;
use Google_Service_YouTube;
use Illuminate\Http\Request;
use TwitterOAuth;
use Vimeo\Vimeo;

require dirname(__FILE__) . "/credentials.php";
class SocialCountController extends Controller {
	/**
	 * [FunctionName description]
	 * @param string $value [description]
	 */
	public function getSocialCount(Request $request) {
		if ($request->ajax()) {
			if ($request->input('socailMediaCount') == "socailMediaCount") {
				$admin_obj = new Admin;
				$result = $admin_obj->getSocailMediaCounts();
				if ($result) {
					$res = $result[0]["data"];
				} else {
					$res = $result;
				}
				return $res;
			}
		}
	}
	/**
	 * [index description]
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function index(Request $request) {
		$userId = $request->input("user_id");
		$username = $request->input("username");
		Config::set('database.connections.dynamic_mysql.database', $request->input("dynamic_db_name"));
		$admin_obj = new Admin;
		$dbres = $admin_obj->getAllPluginData([$userId]);
		// count variables
		$twitterPosts = 0;
		$fbPosts = 0;
		$googleplusPosts = 0;
		$gmailPosts = 0;
		$instagramPosts = 0;
		$pinterestPosts = 0;
		$youtubePosts = 0;
		$vimeoPosts = 0;
		$calendarEvents = 0;
		$linkedinPosts = 0;

		$FacebookUrl = "";
		$TwitterUrl = "";
		$PinterestUrl = "";
		$instagramUrl = "";
		$vimeoUrl = "";
		$linkedinUrl = "";

		$lastLogin = strtotime($request->input("last_login"));
		$currentLogin = time();

		foreach ($dbres as $val) {
			/* Vimeo */
			if ($val['name'] == "Vimeo") {
				$pluginsData = json_decode($val['data'], true);
				$vimeoUrl = $pluginsData['profile_link'];
				// vimeo class
				$lib = new Vimeo(VIMEO_CLIENT_ID, VIMEO_CLIENT_SECRET);
				$lib->setToken($pluginsData['access_token']);
				$per_page = 50;
				$allVideos = array();
				$query = $pluginsData['api_uri'] . "/videos?per_page=" . $per_page;
				$video_res = $lib->request($query);

				//time format
				$last_index = count($video_res['body']['data']) - 1;
				$last_index_video_date = $video_res['body']['data'][$last_index]['created_time'];
				$tz = new DateTimeZone(ANALYTICAL_TIMEZONE);
				$newdate = new DateTime($last_index_video_date);
				$newdate->setTimezone($tz);
				$data_dates = (array) $newdate;
				$last_index_video_unix = strtotime($data_dates['date']);

				if ($video_res['status'] == 200) {
					foreach ($video_res['body']['data'] as $val) {
						array_push($allVideos, $val);
					}
					if ($last_index_video_unix >= $lastLogin) {
						if ($video_res['body']['paging']['next'] != null) {
							$next_page = $video_res['body']['paging']['next'];
							// fetch next set of results
							do {
								$video_res = $lib->request($next_page);
								$last_index = count($video_res['body']['data']) - 1;
								$last_index_video_date = $video_res['body']['data'][$last_index]['created_time'];
								$tz = new DateTimeZone(ANALYTICAL_TIMEZONE);
								$newdate = new DateTime($last_index_video_date);
								$newdate->setTimezone($tz);
								$data_dates = (array) $newdate;
								$last_index_video_unix = strtotime($data_dates['date']);
								if ($video_res['status'] == 200) {
									foreach ($video_res['body']['data'] as $val) {
										array_push($allVideos, $val);
									}
								}
								if ($video_res['body']['paging']['next'] != null) {
									$next_page = $video_res['body']['paging']['next'];
								}
							} while (($last_index_video_unix >= $lastLogin) && ($video_res['body']['paging']['next'] != null));
						}
					}
				}

				$newVideos = 0;
				foreach ($allVideos as $value) {
					$video_date = $value['created_time'];
					$tz = new DateTimeZone(ANALYTICAL_TIMEZONE);
					$newdate = new DateTime($video_date);
					$newdate->setTimezone($tz);
					$data_dates = (array) $newdate;
					$video_unix = strtotime($data_dates['date']);

					if (($video_unix >= $lastLogin) && ($video_unix <= $currentLogin)) {
						$newVideos++;
					}
				}
				$vimeoPosts = $newVideos;
			}
			/* Pinterest */
			if ($val['name'] == "Pinterest") {
				$pluginsData = json_decode($val['data'], true);
				$PinterestUrl = $pluginsData['url'];
				$access_token = $pluginsData['access_token'];
				// Pinterest Class
				$pinterest = new Pinterest(PINTEREST_CLIENT_ID, PINTEREST_CLIENT_SECRET);
				$pinterest->auth->setOAuthToken($access_token);
				// user pins
				// $pin_fields = array('limit'=>100,'fields' => 'id,link,url,creator,board,created_at,note,color,counts,media,attribution,image,metadata,original_link');
				$pin_fields = array('limit' => 100, 'fields' => 'id,link,url,creator,board,created_at');

				$user_pins = $pinterest->users->getMePins($pin_fields);
				$user_pins = json_decode($user_pins, true);

				foreach ($user_pins['data'] as $value) {
					//time format
					$post_date = $value['created_at'] . "+00:00";
					$tz = new DateTimeZone(ANALYTICAL_TIMEZONE);
					$newdate = new DateTime($post_date);
					$newdate->setTimezone($tz);
					$data_dates = (array) $newdate;
					$created_at = strtotime($data_dates['date']);
					if ($created_at >= $lastLogin && $created_at <= $currentLogin) {
						$pinterestPosts++;
					}
				}
			}
			/* Twitter */
			if ($val['name'] == "Twitter") {
				$pluginsData = json_decode($val['data'], true);
				$postCount = $this->getTwitterPosts($pluginsData['ACCESS_TOKEN'], $pluginsData['SECRET_KEY'], $lastLogin, $currentLogin);
				$TwitterUrl = "https://twitter.com/" . $_SESSION['twitusrname'];
				if ($postCount != "error") {
					$twitterPosts = $postCount;
				}
			}
			/* Facebook */
			if ($val['name'] == "Facebook") {
				$fb = new \Facebook\Facebook([
					'app_id' => FB_APP_ID,
					'app_secret' => FB_APP_SECRET,
					'default_graph_version' => 'v2.7',
				]);
				$pluginsData = json_decode($val['data'], true);
				$FacebookUrl = "https://www.facebook.com/" . $pluginsData['FB_USER_ID'];
				$oAuth2Client = $fb->getOAuth2Client();
				$tokenMetadata = $oAuth2Client->debugToken($pluginsData['FB_ACCESS_TOKEN']);
				if ($tokenMetadata->getIsValid()) {
					$_SESSION['facebook_access_token'] = (string) $pluginsData['FB_ACCESS_TOKEN'];
					// get user feeds
					$usrPosts = $this->getFeed($lastLogin, $currentLogin);
					$fbPosts += count($usrPosts);
					// get post feeds
					if ($pluginsData['FB_USER_PAGE_INFO'] != null) {
						foreach ($pluginsData['FB_USER_PAGE_INFO'] as $page) {
							$pgePosts = $this->getFeed($lastLogin, $currentLogin, $page['PAGE_ID']);
							$fbPosts += count($pgePosts);
						}
					}
				}
			}
			/* LinkedIn */
			if ($val['name'] == "LinkedIn") {
				$pluginsData = json_decode($val['data'], true);
				$linkedinUrl = "https://www.linkedin.com/company/" . $pluginsData['LKDIN_CMPNY_ID'];
			}
			/* Instagram */
			if ($val['name'] == "Instagram") {
				$instagram = new Instagram(array(
					'apiKey' => INSTAGRAM_CLIENT_ID,
					'apiSecret' => INSTAGRAM_CLIENT_SECRET,
					'apiCallback' => INSTAGRAM_OAUTH_CALLBACK,
				));
				$pluginsData = json_decode($val['data'], true);
				$instagramUrl = "https://www.instagram.com/" . $pluginsData['username'];
				// store user access token
				$instagram->setAccessToken($pluginsData['access_token']);
				// now you have access to all authenticated user methods
				$result = $instagram->getUserMedia();
				foreach ($result->data as $val) {
					if (($val->created_time >= $lastLogin) && ($val->created_time <= $currentLogin)) {
						$instagramPosts++;
					}
				}
			}
		}
		/**
		 * Google Products
		 * getRefreshToken from db
		 */
		$usersdetails = $admin_obj->getRefreshToken([$userId]);

		if ($usersdetails) {
			$goo_email = $usersdetails[0]['email_id'];
			$goo_refreshToken = $usersdetails[0]['refresh_token'];
			$goo_plus_id = $usersdetails[0]['googleplus_id'];
			$yout_channel_id = $usersdetails[0]['youtubechannel_id'];
			/**
			 * gmail count
			 */
			$gmailres = $this->gmail_count($goo_email, $goo_refreshToken);
			if ($gmailres != "error") {
				$gmailPosts = $gmailres;
			}
			// ~~~~~~~~~~~~~gmail end~~~~~~~~~~~~~~~~~
			/**
			 * google+ posts count
			 */
			$googleres = $this->getGoogleplusPosts($goo_email, $goo_refreshToken, $lastLogin, $currentLogin);
			if ($googleres != "error") {
				$googleplusPosts = $googleres;
			}
			// ~~~~~~~~~~~~~google+ posts end~~~~~~~~~~~~~~~~~
			/**
			 * youtube count
			 */
			$youtberes = $this->getYoutubePosts($userId, $yout_channel_id, $goo_refreshToken, $lastLogin, $currentLogin);
			if ($youtberes != "error") {
				$youtubePosts = $youtberes;
			}
			// ~~~~~~~~~~~~~youtube end~~~~~~~~~~~~~~~~~
			/**
			 * calendar count
			 */
			/*$cal_url = PORTALLOCATION . 'module/calendar.php';
				$cal_postfields = array('EventCount' => "EventCount", 'result' => $usersdetails['result'], 'userId' => $userId, "username" => $username);
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, $cal_url);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
				curl_setopt($ch, CURLOPT_POST, 1);
				curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($cal_postfields));
				// $max_exe_time = 2500000; // time in milliseconds
				// curl_setopt($ch, CURLOPT_TIMEOUT_MS, $max_exe_time);
				$cal_res = curl_exec($ch);
				curl_close($ch);
			*/
			// ~~~~~~~~~~~~~calendar end~~~~~~~~~~~~~~~~~
		}
		/**
		 * SVAE ALL THE POST COUNTS INTO DB
		 */
		$data = array();
		$data['Facebook']['Count'] = $fbPosts;
		$data['Facebook']['ProfileUrl'] = $FacebookUrl;
		$data['Twitter']['Count'] = $twitterPosts;
		$data['Twitter']['ProfileUrl'] = $TwitterUrl;
		$data['Pinterest']['Count'] = $pinterestPosts;
		$data['Pinterest']['ProfileUrl'] = $PinterestUrl;
		$data['Instagram']['Count'] = $instagramPosts;
		$data['Instagram']['ProfileUrl'] = $instagramUrl;
		$data['Gmail']['Count'] = $gmailPosts;
		$data['Gmail']['ProfileUrl'] = 'gmail_up';
		$data['GooglePlus']['Count'] = $googleplusPosts;
		$data['GooglePlus']['ProfileUrl'] = "https://plus.google.com/" . $goo_plus_id;
		$data['YouTube']['Count'] = $youtubePosts;
		$data['YouTube']['ProfileUrl'] = "https://www.youtube.com/channel/" . $_SESSION['youtubechannel'];
		$data['Vimeo']['Count'] = $vimeoPosts;
		$data['Vimeo']['ProfileUrl'] = $vimeoUrl;
		$data['Calendar']['Count'] = $calendarEvents;
		$data['Calendar']['ProfileUrl'] = 'calendar';
		$data['LinkedIn']['Count'] = $linkedinPosts;
		$data['LinkedIn']['ProfileUrl'] = $linkedinUrl;

		$admin_obj->saveSocialmediaCounts(json_encode($data), $userId);
		return "success";
	}
	/**
	 * [gmail_count description]
	 * @param  [type] $goo_email        [description]
	 * @param  [type] $goo_refreshToken [description]
	 * @return [type]                   [description]
	 */
	function gmail_count($goo_email, $goo_refreshToken) {
		// echo getGmailPosts($_POST['goo_email'],$_POST['goo_refreshToken']);
		$email = $goo_email;
		$refreshToken = $goo_refreshToken;
		if ($refreshToken) {
			$client = new Google_Client();

			$client->setClientId(GOOGLE_CLIENTID);
			$client->setClientSecret(GOOGLE_CLIENT_SECRET);
			$client->setAccessType('offline');
			$client->setApprovalPrompt("force");
			// $client->setRedirectUri($redirect_uri);
			// $client->setState($state);
			$client->setScopes(array('https://mail.google.com/',
				'https://www.googleapis.com/auth/gmail.modify', 'https://www.googleapis.com/auth/gmail.readonly', 'https://www.googleapis.com/auth/gmail.compose', 'https://www.googleapis.com/auth/gmail.send', 'https://www.googleapis.com/auth/gmail.labels', 'https://www.googleapis.com/auth/gmail.insert', 'https://www.googleapis.com/auth/userinfo.email', 'https://www.googleapis.com/auth/plus.me', 'https://www.googleapis.com/auth/calendar', 'https://www.googleapis.com/auth/contacts.readonly', 'https://www.googleapis.com/auth/youtube', 'https://www.googleapis.com/auth/youtube.force-ssl', 'https://www.googleapis.com/auth/youtube.readonly', 'https://www.googleapis.com/auth/youtube.upload', 'https://www.googleapis.com/auth/youtubepartner', 'https://www.googleapis.com/auth/youtubepartner-channel-audit'));
			try {
				$client->refreshToken($refreshToken);
				$token = $client->getAccessToken();
				if ($token) {
					$service = new Google_Service_Gmail($client);
					$inbox = $service->users_labels->get($email, 'INBOX');
					$inboxunreadCount = $inbox->messagesUnread;

					return $inboxunreadCount;
				} else {
					return "error";
				}
			} catch (Exception $ex) {
				return "error";
			}
		}
	}
	/**
	 * [getGoogleplusPosts => get google+ posts]
	 * @param  [type] $goo_email        [description]
	 * @param  [type] $goo_refreshToken [description]
	 * @param  [type] $lastLogin        [description]
	 * @param  [type] $currentLogin     [description]
	 * @return [type]                   [description]
	 */
	function getGoogleplusPosts($goo_email, $goo_refreshToken, $lastLogin, $currentLogin) {
		$email = $goo_email;
		$refreshToken = $goo_refreshToken;
		$gpcount = 0;
		if ($refreshToken) {
			$client = new Google_Client();
			$client->setClientId(GOOGLE_CLIENTID);
			$client->setClientSecret(GOOGLE_CLIENT_SECRET);
			$client->setAccessType('offline');
			$client->setApprovalPrompt("force");
			// $client->setRedirectUri($redirect_uri);
			// $client->setState($state);
			$client->setScopes(array('https://www.googleapis.com/auth/plus.me', 'https://www.googleapis.com/auth/plus.login',
			));
			try {
				$client->refreshToken($refreshToken);
				$token = $client->getAccessToken();

				if ($token) {
					$plus = new Google_Service_Plus($client);
					// when comes analytics always checks for nextPageToken == null,
					// if not iterate to the next call
					$optParams = array('maxResults' => 100);

					$activities = $plus->activities->listActivities('me', 'public', $optParams);

					foreach ($activities['items'] as $key => $activity) {
						$la_time = new DateTimeZone(ANALYTICAL_TIMEZONE);
						$date = new DateTime($activity['published']);
						$date->setTimezone($la_time);
						$data_date = (array) $date;
						$created_at = strtotime($data_date['date']);

						if ($created_at >= $lastLogin && $created_at <= $currentLogin) {
							$gpcount++;
						}
					}
					return $gpcount;
				} else {
					return "error";
				}
			} catch (Exception $ex) {
				return "error";
			}
		}
	}
	/**
	 * [getYoutubePosts description]
	 * @param  [type] $userId           [description]
	 * @param  [type] $yout_channel_id  [description]
	 * @param  [type] $goo_refreshToken [description]
	 * @param  [type] $lastLogin        [description]
	 * @param  [type] $currentLogin     [description]
	 * @return [type]                   [description]
	 */
	function getYoutubePosts($userId, $yout_channel_id, $goo_refreshToken, $lastLogin, $currentLogin) {
		$refreshToken = $goo_refreshToken;
		$youtcount = 0;
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

					if ($yout_channel_id != null) {
						// we got already channel id
						$playlistItemsResponse = $youtube->playlistItems->listPlaylistItems('snippet', array(
							'playlistId' => $yout_channel_id,
							'maxResults' => 50,
						));
					} else {
						$channelsResponse = $youtube->channels->listChannels('contentDetails', array(
							'mine' => 'true',
						));
						if ($channelsResponse) {
							$uploadsListId = $channelsResponse['items'][0]['contentDetails']['relatedPlaylists']['uploads'];
							// get all videos in the playlist
							$playlistItemsResponse = $youtube->playlistItems->listPlaylistItems('snippet', array(
								'playlistId' => $uploadsListId,
								'maxResults' => 50,
							));
						}
					}

					if ($playlistItemsResponse) {
						foreach ($playlistItemsResponse['items'] as $playlistItem) {
							if ($youtcount == 0) {
								$_SESSION['youtubechannel'] = $playlistItem['snippet']['channelId'];
							}
							// $playlistItem['snippet']['resourceId']['videoId'];
							$la_time = new DateTimeZone(ANALYTICAL_TIMEZONE);
							$date = new DateTime($playlistItem['snippet']['publishedAt']);
							$date->setTimezone($la_time);
							$data_date = (array) $date;
							$created_at = strtotime($data_date['date']);
							if ($created_at >= $lastLogin && $created_at <= $currentLogin) {
								$youtcount++;
							}
						}
					}
					// return count
					return $youtcount;
				} else {
					return "error";
				}

			} catch (Exception $ex) {
				return "error";
			}
		}
	}
	/**
	 * [getTwitterPosts description]
	 * @param  [type] $access_token [description]
	 * @param  [type] $scecret      [description]
	 * @param  [type] $lastLogin    [description]
	 * @param  [type] $currentLogin [description]
	 * @return [type]               [description]
	 */
	function getTwitterPosts($access_token, $scecret, $lastLogin, $currentLogin) {
		if ($access_token && $scecret) {
			// get user deatils
			$connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, $access_token, $scecret);
			$params = array();
			$params['include_entities'] = 'false';
			$content = $connection->get('account/verify_credentials', $params);

			// check for no errors
			if (isset($content->errors)) {
				foreach ($content->errors as $value) {
					if ($value->code == 89) {
						// delete all the access token and scecret for twitter from DB
						// since the tokens expired and
						// force redirect to the twitter sign in page

						// header('Location: PATH');
						return "error";
					}
				}
			} else {
				if ($content && isset($content->screen_name) && isset($content->name)) {
					$user = $content->screen_name;
					$_SESSION['twitusrname'] = $content->screen_name;
					$count = $content->statuses_count;

					/**
					 * get all the user tweets
					 * @var array
					 */
					$settings = array(
						'oauth_access_token' => $access_token,
						'oauth_access_token_secret' => $scecret,
						'consumer_key' => CONSUMER_KEY,
						'consumer_secret' => CONSUMER_SECRET,
					);
					$url = "https://api.twitter.com/1.1/statuses/user_timeline.json";
					$requestMethod = "GET";
					if ($count > 3200) {
						$count = 3200;
					}
					$getfield = "?screen_name=$user&count=$count&include_rts=1";
					$twitter = new TwitterAPIExchange($settings);
					$result = json_decode($twitter->setGetfield($getfield)
							->buildOauth($url, $requestMethod)
							->performRequest(), $assoc = true);

					$postCount = 0;
					foreach ($result as $value) {
						$date = DateTime::createFromFormat('D M j H:i:s O Y', $value['created_at']);
						$date->setTimeZone(new DateTimeZone(ANALYTICAL_TIMEZONE));
						$created_at = strtotime($date->format('Y-M-d H:i:s'));
						if (($created_at >= $lastLogin) && ($created_at <= $currentLogin)) {
							$postCount++;
						}
					}
					// return success
					return $postCount;
				}
			}
		}
	}
	/**
	 * [getFeed description]
	 * @param  [type] $since  [description]
	 * @param  [type] $until  [description]
	 * @param  [type] $pageid [description]
	 * @return [type]         [description]
	 */
	function getFeed($since, $until, $pageid = null) {
		if ($pageid != null) {
			// page high limit 100
			$limit = 100;
		} else {
			$limit = 250;
		}

		$feeds_array = array();

		$fb = new \Facebook\Facebook([
			'app_id' => FB_APP_ID,
			'app_secret' => FB_APP_SECRET,
			'default_graph_version' => 'v2.7',
		]);
		// set DefaultAccessToken
		$fb->setDefaultAccessToken((string) $_SESSION['facebook_access_token']);

		try {
			if ($pageid == null) {
				// user data
				$q = "me/feed?fields=created_time,likes.limit(0).summary(true)&limit=$limit&since=$since&until=$until";
			}
			if ($pageid != null) {
				// page data
				$q = "$pageid/feed?fields=created_time,likes.limit(0).summary(true)&limit=$limit&since=$since&until=$until";
			}

			$feed = $fb->get($q);
		} catch (\Facebook\Exceptions\FacebookResponseException $e) {
			echo 'Graph returned an error: ' . $e->getMessage();
			exit;
		} catch (\Facebook\Exceptions\FacebookSDKException $e) {
			echo 'Facebook SDK returned an error: ' . $e->getMessage();
			exit;
		}
		$f = $feed->getDecodedBody();
		$count = count($f['data']);

		foreach ($f['data'] as $val) {
			array_push($feeds_array, $val);
		}

		if ($count == $limit) {
			// Data may left to retreive
			$n = $f['paging']['next'];
			$url = parse_url($n);

			$ul = $url['query'];
			$q = "me/feed?$ul";
			do {
				try {
					$nextResult = $fb->get($q);
				} catch (\Facebook\Exceptions\FacebookResponseException $e) {
					echo 'Graph returned an error: ' . $e->getMessage();
					exit;
				} catch (\Facebook\Exceptions\FacebookSDKException $e) {
					echo 'Facebook SDK returned an error: ' . $e->getMessage();
					exit;
				}

				$nextResult = $nextResult->getDecodedBody();
				$count = count($nextResult['data']);
				if ($count != 0) {
					foreach ($nextResult['data'] as $val) {
						array_push($feeds_array, $val);
					}
				}

				$n = $nextResult['paging']['next'];
				$url = parse_url($n);
				$ul = $url['query'];
				$q = "me/feed?$ul";

			} while ($count == $limit);
		}

		$feeds_array = json_encode($feeds_array);
		$feeds_array = json_decode($feeds_array, true);
		return $feeds_array;
	}

}
