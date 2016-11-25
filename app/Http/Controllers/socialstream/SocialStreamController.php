<?php

namespace App\Http\Controllers\socialstream;

use App\Admin;
use App\Http\Controllers\Controller;

class SocialStreamController extends Controller {
	/**
	 * [socialstream description]
	 * @param  string $value [description]
	 * @return [type]        [description]
	 */
	public function socialstream() {
		/**
		 * delete all the cache files in the sd/social-stream/cache/*
		 */
		array_map('unlink', glob(app_path() . "/Http/Controllers/socialstream/sd/social-stream/cache/*"));

		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();
		$dbres = $admin_obj->getAllPluginData([$_SESSION['userId']]);
		/**
		 * Prepare All social media access token array
		 */
		$facebook_crd = array();
		$twitter_crd = array();
		$vimeo_crd = array();
		$instagram_crd = array();
		$linkedin_crd = array();
		/**
		 * Prepare All social media user info array
		 */
		$facebook = array();
		$twitter = array();
		$pinterest = array();
		$vimeo = array();
		$instagram = array();
		$rss = array();
		$linkedin = array();
		// all social media credentials
		foreach ($dbres as $val) {
			if ($val['name'] == "Facebook") {
				$pluginsData = json_decode($val['data'], true);
				// access token
				$facebook_crd = array('facebook_access_token' => $pluginsData['FB_ACCESS_TOKEN']);
				$FacebookID = array($pluginsData['FB_USER_ID']);
				// add facebook user id
				$facebook['facebook_id_1'] = $FacebookID;

				$FacebookPageID = array();
				if (isset($_SESSION['DefaultFbPageID'])) {
					array_push($FacebookPageID, $_SESSION['DefaultFbPageID']);
					$facebook['facebook_id_3'] = $FacebookPageID;
				} else {
					// select default first page
					if ($pluginsData['FB_USER_PAGE_INFO'] != null) {
						$i = 0;
						foreach ($pluginsData['FB_USER_PAGE_INFO'] as $page) {
							if ($i < 1) {
								array_push($FacebookPageID, $page['PAGE_ID']);
							}
							$i++;
						}
						// add fb pages id
						$facebook['facebook_id_3'] = $FacebookPageID;
					}
				}
				//
				// print_r($facebook);
			}
			if ($val['name'] == "Twitter") {
				$pluginsData = json_decode($val['data'], true);
				// access token info
				$tw_key = $pluginsData['CONSUMER_KEY'];
				$tw_sec = $pluginsData['CONSUMER_SECRET'];
				$tw_usr_acc = $pluginsData['ACCESS_TOKEN'];
				$tw_usr_sec = $pluginsData['SECRET_KEY'];

				$twitter_crd = array('twitter_api_key' => $tw_key,
					'twitter_api_secret' => $tw_sec,
					'twitter_access_token' => $tw_usr_acc,
					'twitter_access_token_secret' => $tw_usr_sec);
				// user info
				$TwitterID = array($pluginsData['screen_name']);
				// add facebook user id
				$twitter['twitter_id_1'] = $TwitterID;
				$twitter['twitter_images'] = 'small';
				$twitter['twitter_feeds'] = 'retweets,replies';
			}
			if ($val['name'] == "Vimeo") {
				$pluginsData = json_decode($val['data'], true);
				// access token info
				$vimeoAccTkn = $pluginsData['access_token'];
				$vimeo_crd = array('vimeo_access_token' => $vimeoAccTkn);
				// user info
				$vimeoID = array($pluginsData['user_name']);
				$vimeo['vimeo_id_1'] = $vimeoID;
			}
			if ($val['name'] == "Pinterest") {
				$pluginsData = json_decode($val['data'], true);
				$pinterestID = array($pluginsData['username']);
				$pinterest['pinterest_id_1'] = $pinterestID;
			}
			if ($val['name'] == "Instagram") {
				$pluginsData = json_decode($val['data'], true);
				// access token info
				$instagramAcsTkn = $pluginsData['access_token'];
				$instagram_crd = array('instagram_access_token' => $instagramAcsTkn);
				// user info
				$instagramID = array($pluginsData['id']);
				$instagram['instagram_id_1'] = $instagramID;
			}
			/**
			 * LinkedIn linkedin_id_1
			 */
			if ($val['name'] == "LinkedIn") {
				$pluginsData = json_decode($val['data'], true);
				// access token info
				$linkedin_crd = array('linkedin_access_token' => $pluginsData['LKDIN_ACCESS_TOKEN']);
				// company id info
				$linkedin_company_id = array($pluginsData['LKDIN_CMPNY_ID']);
				$linkedin['linkedin_id_1'] = $linkedin_company_id;
			}
		}
		/**
		 * google product credentials
		 */
		$googleProducts = $admin_obj->getRefreshToken([$_SESSION['userId']]);

		$all_social_plugins = array();
		if ($facebook) {
			$all_social_plugins['facebook'] = $facebook;
		}
		if ($twitter) {
			$all_social_plugins['twitter'] = $twitter;
		}
		if ($pinterest) {
			$all_social_plugins['pinterest'] = $pinterest;
		}
		if ($instagram) {
			$all_social_plugins['instagram'] = $instagram;
		}
		if ($vimeo) {
			$all_social_plugins['vimeo'] = $vimeo;
		}
		if ($linkedin) {
			$all_social_plugins['linkedin'] = $linkedin;
		}
		// google products
		if ($googleProducts) {
			$all_social_plugins['google']['google_id_1'] = array($googleProducts[0]['googleplus_id']);
			$all_social_plugins['youtube']['youtube_id_2'] = array($googleProducts[0]['youtubechannel_id']);
		}
		/**
		 * RSS Feed URLs
		 */
		$rssRes = $admin_obj->getRssFeedTab();
		$rssFeedUrls = array();
		$rssAllUrls = json_decode($rssRes[0]['data'], true);
		foreach ($rssAllUrls as $value) {
			if ($value['url'] != null) {
				array_push($rssFeedUrls, $value['url']);
			}
		}
		if ($rssFeedUrls) {
			$rss['rss_id_1'] = $rssFeedUrls;
			$rss['rss_text'] = 0;
		}
		if ($rss) {
			$all_social_plugins['rss'] = $rss;
		}
		/**
		 * all social media credential of the user
		 */
		$allAccessCredentials = array();
		$allAccessCredentials['google'] = array('google_api_key' => 'AIzaSyDMRAcDBYDVBBKMle3DhO4Gk-qwfnyMhE0');
		if ($facebook_crd) {
			$allAccessCredentials['facebook'] = $facebook_crd;
		}
		if ($twitter_crd) {
			$allAccessCredentials['twitter'] = $twitter_crd;
		}
		if ($instagram_crd) {
			$allAccessCredentials['instagram'] = $instagram_crd;
		}
		if ($vimeo_crd) {
			$allAccessCredentials['vimeo'] = $vimeo_crd;
		}
		if ($linkedin_crd) {
			$allAccessCredentials['linkedin'] = $linkedin_crd;
		}
		/**
		 * make social stream call
		 */
		include app_path() . '/Http/Controllers/socialstream/sd/social-stream/social-stream.php';
		$sd = social_stream(
			array(
				'id' => '1',
				'type' => 'wall',
				'network' => $all_social_plugins,
				'theme' => 'sb-metro-dark',
				'itemwidth' => 250,
				'results' => 45,
				'iframe' => 'media',
				'filters_order' => 'twitter,facebook,google,pinterest,instagram,youtube,vimeo,rss,linkedin',
				'breakpoints' => array('4', '4', '3', '3', '2', '1', '1'),
				'add_files' => true,
			), $allAccessCredentials
		);

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Social Stream');
		$this->addTemplateVar('sd', $sd);
		$this->addTemplateVar('page', 'module/socialstream');
		return view('general.index', $this->template_vars);
	}
	/**
	 * [socialstreamAjax description]
	 * @return [type] [description]
	 */
	public function socialstreamAjax() {
		include app_path() . '/Http/Controllers/socialstream/sd/social-stream/social-stream.php';
		$sb = returnObject();

		// create the ajax callback for load more
		if ($_POST['action'] == 'sb_loadmore') {
			if (!ss_nonce_verify($_REQUEST['nonce'], "loadmore", $_REQUEST['label'])) {
				exit("No naughty business please!");
			}

			if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
				// $sb = new SocialStream();
				$sb->init($_REQUEST['attr'], $_REQUEST['allAccessCredentials'], true, null, 'all', @$_SESSION[$_REQUEST['label']]['loadmore']);
			} else {
				header("Location: " . $_SERVER["HTTP_REFERER"]);
			}
		}
		// return $sd;
	}
}
