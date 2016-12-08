<?php

namespace App\Http\Controllers\socialconnectons;

use App\Admin;
use App\Http\Controllers\Controller;
use App\Http\Controllers\socialconnectons\instagram\Instagram;
use DirkGroenen\Pinterest\Pinterest;
use Facebook\Facebook;
use Facebook\getRedirectLoginHelper;
use Google_Client;
use Illuminate\Http\Request;
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
			$linkedinApiKey = linkedinApiKey;
			$linkedinApiSecret = linkedinApiSecret;
			$linkedinScope = linkedinScope;
			$callbackURL = linkedin_callback;
			if ($_GET['source'] == "widget") {
				$login_url = "https://www.linkedin.com/oauth/v2/authorization?response_type=code&client_id=$linkedinApiKey&redirect_uri=$callbackURL&state=widget&scope=$linkedinScope";
			} else if ($_GET['source'] == "profile") {
				$login_url = "https://www.linkedin.com/oauth/v2/authorization?response_type=code&client_id=$linkedinApiKey&redirect_uri=$callbackURL&state=profile&scope=$linkedinScope";
			}
			return redirect($login_url);
		} else if ($plugin == "Google") {
			$client_id = GOOGLE_CLIENTID;
			$client_secret = GOOGLE_CLIENT_SECRET;
			$redirect_uri = env('APP_URL') . 'google_oauth';

			$client = new Google_Client();

			$client->setClientId($client_id);
			$client->setClientSecret($client_secret);
			$client->setAccessType('offline');
			$client->setApprovalPrompt("force");
			$client->setRedirectUri($redirect_uri);
			if ($_GET['source'] == "widget") {
				$client->setState("widget");
			} else if ($_GET['source'] == "profile") {
				$client->setState("profile");
			} else if ($_GET['source'] == "gmail_up") {
				$client->setState("gmail_up");
			}
			$client->setScopes(array(
				'https://mail.google.com/',
				'https://www.googleapis.com/auth/gmail.modify', 'https://www.googleapis.com/auth/gmail.readonly', 'https://www.googleapis.com/auth/gmail.compose', 'https://www.googleapis.com/auth/gmail.send', 'https://www.googleapis.com/auth/gmail.labels', 'https://www.googleapis.com/auth/gmail.insert', 'https://www.googleapis.com/auth/userinfo.email', 'https://www.googleapis.com/auth/plus.me', 'https://www.googleapis.com/auth/calendar', 'https://www.googleapis.com/auth/contacts.readonly', 'https://www.googleapis.com/auth/youtube', 'https://www.googleapis.com/auth/youtube.force-ssl', 'https://www.googleapis.com/auth/youtube.readonly', 'https://www.googleapis.com/auth/youtube.upload', 'https://www.googleapis.com/auth/youtubepartner', 'https://www.googleapis.com/auth/youtubepartner-channel-audit'));

			$loginUrl = $client->createAuthUrl();
			return redirect($loginUrl);
		} else {
			return redirect("profile");
		}
	}
	/**
	 * [deleteConnectio description]
	 * @return [type] [description]
	 */
	public function deleteConnection(Request $request) {
		if ($request->ajax()) {
			$plugin = $request->input('deletePluginInfo');
			$admin_obj = new Admin;
			$admin_obj->deletePluginInfo($plugin);
			return "success";
		}
	}
	/**
	 * [allPluginsConfigCheck description]
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function allPluginsConfigCheck(Request $request) {
		if ($request->ajax()) {
			$model_html = "";
			$admin_obj = new Admin;
			$dbres = $admin_obj->getAllPluginData([$_SESSION['userId']]);
			/**
			 * Default flags
			 */
			$facebook_config = "no";
			$facebook_msg = "You have not linked your facebook account with us, please click to configure";
			$twitter_config = "no";
			$twitter_msg = "You have not linked your twitter account with us, please click to configure";
			$instagram_config = "no";
			$instagram_msg = "You have not linked your instagram account with us, please click to configure";
			$pinterest_config = "no";
			$pinterest_msg = "You have not linked your pinterest account with us, please click to configure";
			$vimeo_config = "no";
			$vimeo_msg = "You have not linked your vimeo account with us, please click to configure";
			$google_config = "no";
			$google_msg = "You have not linked your google account with us, please click to configure";
			$linkedin_config = "no";
			$linkedin_msg = "You have not linked your linkedin account with us, please click to configure";
			foreach ($dbres as $val) {
				if ($val['name'] == "Vimeo") {
					$pluginsData = json_decode($val['data'], true);
					$vimeoUrl = $pluginsData['profile_link'];
					$curl_url = "https://api.vimeo.com/oauth/verify?access_token=" . $pluginsData['access_token'];
					$ch = curl_init();
					curl_setopt($ch, CURLOPT_URL, $curl_url);
					curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
					$output = curl_exec($ch);
					curl_close($ch);
					$output = json_decode($output, true);

					if ($output['access_token']) {
						$vimeo_config = "yes";
						$vimeo_msg = "Vimeo";
					}
					if (isset($output['error'])) {
						$vimeo_config = "yes";
						$vimeo_msg = "Your vimeo access token expired, please click to reconfigure your vimeo account again.";
					}
				}
				if ($val['name'] == "Pinterest") {
					$pluginsData = json_decode($val['data'], true);
					if ($pluginsData) {
						$pinterest_config = "yes";
						$pinterest_msg = "Pinterest";
					}
				}
				if ($val['name'] == "Twitter") {
					$pluginsData = json_decode($val['data'], true);
					// getuserdeatils
					$connection = new TwitterOAuth(CONSUMER_KEY, CONSUMER_SECRET, $pluginsData['ACCESS_TOKEN'], $pluginsData['SECRET_KEY']);
					$params = array();
					$params['include_entities'] = 'false';
					$content = $connection->get('account/verify_credentials', $params);

					if ($content && isset($content->screen_name) && isset($content->name)) {
						$twitter_config = "yes";
						$twitter_msg = "Twitter";
					}
					if (isset($content->errors)) {
						if ($content->errors != null) {
							foreach ($content->errors as $value) {
								if ($value->code == 89) {
									$twitter_config = "no";
									$twitter_msg = "Your twitter access token expired, please click to reconfigure your twitter account again.";
								}
								if ($value->code == 88) {
									// [message] => Rate limit exceeded [code] => 88
									$twitter_config = "yes";
									$twitter_msg = "Twitter";
								}
							}
						}
					}
				}
				if ($val['name'] == "Facebook") {
					$pluginsData = json_decode($val['data'], true);
					$FacebookUrl = "https://www.facebook.com/" . $pluginsData['FB_USER_ID'];
					if ($pluginsData['FB_USER_NAME'] == "u0baeu0ba3u0bbfu0b95u0ba3u0bcdu0b9fu0ba9u0bcd u0baau0b9au0bcdu0b9a u0ba4u0baeu0bbfu0bb4u0ba9u0bcd") {
						$FB_USER_NAME = "மணிகண்டன் பச்ச தமிழன்";
					} else {
						$FB_USER_NAME = $pluginsData['FB_USER_NAME'];
					}

					$model_html = '<!-- Manage FB Pages -->
	    				<div class="modal fade" id="manageFBPages" tabindex="-1" role="dialog" aria-hidden="true">
	           				<div class="modal-dialog">
	                			<div class="modal-content" style="background-color:rgba(0, 0, 0, 0.99) !important;">
	                    			<div class="modal-header">
				                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				                        <h4 class="modal-title">Manage Facebook Pages</h4>
				                    </div>
	                   	 			<div class="modal-body">
				                    	<h5>User Profile:</h5>
				                    	<div>
					                    	<input type="radio" readonly="true" checked>
					                    	<img src="' . $pluginsData['FB_PROFILE_PIC'] . '" class="img-circle" width="50" height="50"></img>
					                    	<span style="font-size: 15px;margin-left: 2%;">' . $FB_USER_NAME . '</span>
					                    </div>
					                    <hr style="margin: 10px 0px;border-top: 1px solid rgba(238,238,238,0.8);">
	                    				<h5>Pages of yours:</h5>';
					if ($pluginsData['FB_USER_PAGE_INFO'] != null) {
						foreach ($pluginsData['FB_USER_PAGE_INFO'] as $page_info) {
							$pagename = nl2br($page_info['PAGE_NAME']);
							$ocl = 'onclick=fbpagesession(' . $page_info['PAGE_ID'] . ');';
							$model_html .= '<div class="pagediv" ' . $ocl . ' title="select this page as default to show posts on social page.">
	                    	<i class="iradio_minimal" aria-hidden="true"></i>
	                   		<img src="' . $page_info['PAGE_PROFILE_PIC'] . '" class="img-circle" width="50" height="50"></img>
	                    	<span style="font-size: 15px;margin-left: 2%;">' . $pagename . '</span>
	                    </div>
	                    <input type="text" id="' . $page_info['PAGE_ID'] . '" value="' . $pagename . '" hidden>';
						}
					} else {
						$model_html .= '<h5 style="text-align: center;margin-top: 20px;">You are not administrator of any Facebook pages</h5>';
					}
					$model_html .= '</div>
			                    <div class="modal-footer">
			                        <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
			                    </div>
			                </div>
			            </div>
			        </div>';

					try {
						$fb = new \Facebook\Facebook([
							'app_id' => FB_APP_ID,
							'app_secret' => FB_APP_SECRET,
							'default_graph_version' => 'v2.7',
						]);
						//--------------------
						$oAuth2Client = $fb->getOAuth2Client();
						$tokenMetadata = $oAuth2Client->debugToken($pluginsData['FB_ACCESS_TOKEN']);
						if (!$tokenMetadata->getIsValid()) {
							$facebook_msg = "Your facebook access token expired, please click to reconfigure your facebook account again.";
						} else {
							$facebook_config = "yes";
							$facebook_msg = "Facebook";
						}
					} catch (\Facebook\Exceptions\FacebookResponseException $e) {
						$facebook_config = "yes";
						$facebook_msg = "Facebook";
					} catch (\Facebook\Exceptions\FacebookSDKException $e) {
						$facebook_config = "yes";
						$facebook_msg = "Facebook";
					}
				}
				if ($val['name'] == "Instagram") {
					$pluginsData = json_decode($val['data'], true);
					if ($pluginsData) {
						$instagram_config = "yes";
						$instagram_msg = "Instagram";
					}
				}
				if ($val['name'] == "LinkedIn") {
					$pluginsData = json_decode($val['data'], true);
					if ($pluginsData) {
						$linkedin_config = "yes";
						$linkedin_msg = "Linkedin";
					}
				}
			}
			/**
			 * google products
			 * @var [type]
			 */
			$gores = $admin_obj->getRefreshToken([$_SESSION['userId']]);

			if ($gores) {
				$refreshToken = $gores[0]['refresh_token'];
				if ($refreshToken) {
					$client = new Google_Client();
					$client->setClientId(GOOGLE_CLIENTID);
					$client->setClientSecret(GOOGLE_CLIENT_SECRET);
					$client->setAccessType('offline');
					$client->setApprovalPrompt("force");
					try {
						$client->refreshToken($refreshToken);
						$token = $client->getAccessToken();

						if ($token) {
							$google_config = "yes";
							$google_msg = "Google";
						} else {
							$google_config = "no";
							$google_msg = "Your google access token expired, please click to reconfigure your google account again.";
						}

					} catch (Exception $ex) {
						$google_config = "no";
						$google_msg = "Your google access token expired, please click to reconfigure your google account again.";
					}
				}
			}
			$allPluginInfo = array();
			$allPluginInfo['facebook']['isconfig'] = $facebook_config;
			$allPluginInfo['facebook']['title'] = $facebook_msg;
			$allPluginInfo['twitter']['isconfig'] = $twitter_config;
			$allPluginInfo['twitter']['title'] = $twitter_msg;
			$allPluginInfo['instagram']['isconfig'] = $instagram_config;
			$allPluginInfo['instagram']['title'] = $instagram_msg;
			$allPluginInfo['pinterest']['isconfig'] = $pinterest_config;
			$allPluginInfo['pinterest']['title'] = $pinterest_msg;
			$allPluginInfo['vimeo']['isconfig'] = $vimeo_config;
			$allPluginInfo['vimeo']['title'] = $vimeo_msg;
			$allPluginInfo['google']['isconfig'] = $google_config;
			$allPluginInfo['google']['title'] = $google_msg;
			$allPluginInfo['linkedin']['isconfig'] = $linkedin_config;
			$allPluginInfo['linkedin']['title'] = $linkedin_msg;

			$allPluginInfo = json_encode($allPluginInfo);
			$allPluginInfo = json_decode($allPluginInfo, true);
			$html = "";

			// facebook html
			if ($allPluginInfo['facebook']['isconfig'] == "yes") {
				$html .= '<span>
					<a href="#manageFBPages" data-toggle="modal">
						<i class="fa fa-caret-down fb_manage_page_caret animated" title="Manage facebook pages"></i>
					</a>
				</span>';
				$html .= '<a class="shortcut tile" id="fb_anchr" href="javascript:void(0);" id="fb_anchr" target="blank">'
					. '<span id="fb_count"></span>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/facebook.svg">'
					. '<small class="t-overflow">Facebook</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" id="fb_anchr" href="javascript:void(0);" onclick=doConfigureSocialPlugin("Facebook") title="' . $allPluginInfo['facebook']['title'] . '">'
					. '<span id="fb_count"></span>'
					. '<i class="not-logged animated"><img src="' . IMAGESLOCATION . 'social/not-logged.svg" alt=""></i>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/facebook.svg">'
					. '<small class="t-overflow">Facebook</small></img></a>';
			}
			// twitter html
			if ($allPluginInfo['twitter']['isconfig'] == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="tw_anchr" target="blank">'
					. '<span id="tw_count"></span>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/twitter.svg">'
					. '<small class="t-overflow">Twitter</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" onclick=doConfigureSocialPlugin("Twitter") title="' . $allPluginInfo['twitter']['title'] . '">'
					. '<span id="tw_count"></span>'
					. '<i class="not-logged animated"><img src="' . IMAGESLOCATION . 'social/not-logged.svg" alt=""></i>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/twitter.svg">'
					. '<small class="t-overflow">Twitter</small></img></a>';
			}
			// google+ html
			if ($allPluginInfo['google']['isconfig'] == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="gp_anchr" target="blank">'
					. '<span id="gp_count"></span>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/googleplus.svg">'
					. '<small class="t-overflow">Google+</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" onclick=doConfigureSocialPlugin("Google") title="' . $allPluginInfo['google']['title'] . '">'
					. '<span id="gp_count"></span>'
					. '<i class="not-logged animated"><img src="' . IMAGESLOCATION . 'social/not-logged.svg" alt=""></i>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/googleplus.svg">'
					. '<small class="t-overflow">Google+</small></img></a>';
			}
			// pinterest html
			if ($allPluginInfo['pinterest']['isconfig'] == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="pin_anchr" target="blank">'
					. '<span id="pin_count"></span>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/pinterest.svg">'
					. '<small class="t-overflow">Pinterest</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" onclick=doConfigureSocialPlugin("Pinterest") title="' . $allPluginInfo['pinterest']['title'] . '">'
					. '<span id="pin_count"></span>'
					. '<i class="not-logged animated"><img src="' . IMAGESLOCATION . 'social/not-logged.svg" alt=""></i>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/pinterest.svg">'
					. '<small class="t-overflow">Pinterest</small></img></a>';
			}
			// instagram html
			if ($allPluginInfo['instagram']['isconfig'] == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="inst_anchr" target="blank">'
					. '<span id="instagram_count"></span>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/instagram.svg">'
					. '<small class="t-overflow">Instagram</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" onclick=doConfigureSocialPlugin("Instagram") title="' . $allPluginInfo['instagram']['title'] . '">'
					. '<span id="instagram_count"></span>'
					. '<i class="not-logged animated"><img src="' . IMAGESLOCATION . 'social/not-logged.svg" alt=""></i>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/instagram.svg">'
					. '<small class="t-overflow">Instagram</small></img></a>';
			}
			// vimeo html
			if ($allPluginInfo['vimeo']['isconfig'] == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="vmo_anchr" target="blank">'
					. '<span id="vimeo_count"></span>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/vimeo.svg">'
					. '<small class="t-overflow">Vimeo</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" onclick=doConfigureSocialPlugin("Vimeo") title="' . $allPluginInfo['vimeo']['title'] . '">'
					. '<span id="vimeo_count"></span>'
					. '<i class="not-logged animated"><img src="' . IMAGESLOCATION . 'social/not-logged.svg" alt=""></i>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/vimeo.svg">'
					. '<small class="t-overflow">Vimeo</small></img></a>';
			}
			// youtube, gmail, calander html
			if ($allPluginInfo['google']['isconfig'] == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="you_anchr" target="blank">'
					. '<span id="youtube_count"></span>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/youtube.svg">'
					. '<small class="t-overflow">YouTube</small></img></a>';

				$html .= '<a class="shortcut tile" href="gmail_up">'
					. '<span id="gmail_count"></span>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/email.svg">'
					. '<small class="t-overflow">Mail</small></img></a>';

				$html .= '<a class="shortcut tile" href="calendar">'
					. '<span id="calendar_count"></span>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/calendar.svg">'
					. '<small class="t-overflow">Calendar</small></img></a>';

			} else {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" onclick=doConfigureSocialPlugin("Google") title="' . $allPluginInfo['google']['title'] . '">'
					. '<span id="youtube_count"></span>'
					. '<i class="not-logged animated"><img src="' . IMAGESLOCATION . 'social/not-logged.svg" alt=""></i>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/youtube.svg">'
					. '<small class="t-overflow">YouTube</small></img></a>';

				$html .= '<a class="shortcut tile" href="javascript:void(0);" onclick=doConfigureSocialPlugin("Google") title="' . $allPluginInfo['google']['title'] . '">'
					. '<span id="gmail_count"></span>'
					. '<i class="not-logged animated"><img src="' . IMAGESLOCATION . 'social/not-logged.svg" alt=""></i>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/email.svg">'
					. '<small class="t-overflow">Mail</small></img></a>';

				$html .= '<a class="shortcut tile" href="javascript:void(0);" onclick=doConfigureSocialPlugin("Google") title="' . $allPluginInfo['google']['title'] . '">'
					. '<span id="calendar_count"></span>'
					. '<i class="not-logged animated"><img src="' . IMAGESLOCATION . 'social/not-logged.svg" alt=""></i>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/calendar.svg">'
					. '<small class="t-overflow">Calendar</small></img></a>';
			}
			// Linkedin html
			if ($allPluginInfo['linkedin']['isconfig'] == "yes") {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" id="linkedin_anchr" target="blank">'
					. '<span id="linkedin_count"></span>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/linkedin.svg">'
					. '<small class="t-overflow">Linkedin</small></img></a>';
			} else {
				$html .= '<a class="shortcut tile" href="javascript:void(0);" onclick=doConfigureSocialPlugin("LinkedIn") title="' . $allPluginInfo['linkedin']['title'] . '">'
					. '<span id="linkedin_count"></span>'
					. '<i class="not-logged animated"><img src="' . IMAGESLOCATION . 'social/not-logged.svg" alt=""></i>'
					. '<img alt="" src="' . IMAGESLOCATION . 'social/linkedin.svg">'
					. '<small class="t-overflow">Linkedin</small></img></a>';
			}

			$html .= $model_html;
			return $html;
		}
	}
}
