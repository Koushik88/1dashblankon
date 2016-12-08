<?php

namespace App\Http\Controllers\gmail;

use App\Admin;
use App\Http\Controllers\Controller;
use Google_Client;
use Google_Http_Batch;
use Google_Service_Gmail;
use Google_Service_Gmail_Draft;
use Google_Service_Gmail_Message;
use Google_Service_Gmail_ModifyMessageRequest;
use PHPMailer;

require app_path() . "/Http/Controllers/socialconnectons/credentials.php";

class GmailController extends Controller {
	/**
	 * [gmail_up description]
	 * @return [type] [description]
	 */
	public function gmail_up() {
		if (!isset($_GET['labelIds'])) {
			if (!isset($_GET['label'])) {
				return redirect('gmail_up?labelIds=INBOX');
			}
		}

		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();
		/**
		 * Get Refreshtoken from db
		 */
		$userid = $_SESSION['userId'];
		$usersdetails = $admin_obj->getRefreshToken([$userid]);
		$client_id = GOOGLE_CLIENTID;
		$client_secret = GOOGLE_CLIENT_SECRET;
		$redirect_uri = env('APP_URL') . 'google_oauth';

		$client = new Google_Client();
		$client->setClientId($client_id);
		$client->setClientSecret($client_secret);
		$client->setAccessType('offline');
		$client->setApprovalPrompt("force");
		$client->setRedirectUri($redirect_uri);
		// $client->setState($state);
		$client->setScopes(array(
			'https://mail.google.com/',
			'https://www.googleapis.com/auth/gmail.modify', 'https://www.googleapis.com/auth/gmail.readonly', 'https://www.googleapis.com/auth/gmail.compose', 'https://www.googleapis.com/auth/gmail.send', 'https://www.googleapis.com/auth/gmail.labels', 'https://www.googleapis.com/auth/gmail.insert', 'https://www.googleapis.com/auth/userinfo.email', 'https://www.googleapis.com/auth/plus.me', 'https://www.googleapis.com/auth/calendar', 'https://www.googleapis.com/auth/contacts.readonly', 'https://www.googleapis.com/auth/youtube', 'https://www.googleapis.com/auth/youtube.force-ssl', 'https://www.googleapis.com/auth/youtube.readonly', 'https://www.googleapis.com/auth/youtube.upload', 'https://www.googleapis.com/auth/youtubepartner', 'https://www.googleapis.com/auth/youtubepartner-channel-audit'));

		$email = $usersdetails[0]['email_id'];
		$refreshToken = $usersdetails[0]['refresh_token'];
		$msgcountlist = 15;

		$user_email = substr($email, 0, strpos($email, '@'));
		// asgin values
		$this->addTemplateVar('email', $email);
		$this->addTemplateVar('user_email', $user_email);

		/**
		 * Get mail array list
		 */
		try {
			$client->refreshToken($refreshToken);
			$token = $client->getAccessToken();
			$accesstkn = $token['access_token'];
			if ($token) {
				$service = new Google_Service_Gmail($client);
				$listlables = $this->listLabels($service, $email);
				$listlables_name = $listlables[0];
				$listlables_id = $listlables[1];
				// asgin values
				$this->addTemplateVar('listlables_name', $listlables_name);
				$this->addTemplateVar('listlables_id', $listlables_id);
				// 1 //
				/**
				 * multidelete -> delete messages
				 */
				if (isset($_GET['multidelete'])) {
					$msgid = $_POST['msgid'];
					$multiid = explode(",", $msgid);

					foreach ($multiid as $key => $value) {
						try {
							$service->users_messages->delete($email, $value);
						} catch (Exception $e) {
							// print 'An error occurred: ' . $e->getMessage();
						}
					}
					$returnUrl = "gmail_up?labelIds=" . $_GET['labelIds'] . "&delresponse";
					return redirect($returnUrl);
				}
				// 2 //
				/**
				 * Move mail to folder
				 */
				if (isset($_GET['movelable'])) {
					$lable = $_POST['label'];
					$msgid = $_POST['msgidlable'];
					$currentlable = $_POST['lable'];
					if (isset($_GET['labelIds'])) {
						$currentlable = $_GET['labelIds'];
					}

					$multiid = explode(",", $msgid);
					foreach ($multiid as $key => $value) {
						$modifyMessage = $this->modifyMessage($service, $email, $value, $lable, $currentlable);
					}
					$responsemesaage = "Message has been Moved successfully ";
					$this->addTemplateVar('responsemesaage', $responsemesaage);
				}
				// 3 //
				/**
				 * single mail delete from inside from body message
				 */
				if (isset($_GET['msgid']) && isset($_GET['delete']) && isset($_GET['label'])) {
					try {
						$service->users_messages->delete($email, $_GET['msgid']);
					} catch (Exception $e) {
						/*  print 'An error occurred: ' . $e->getMessage();*/
					}
					$returnUrl = "gmail_up?labelIds=" . $_GET['label'] . "&delresponse";
					return redirect($returnUrl);
				}
				// 4 //
				/**
				 * Modify single message
				 */
				if (isset($_GET['msgid']) && isset($_GET['modifylable']) && isset($_GET['label'])) {
					$msgid = $_GET['msgid'];
					$modifylable = $_GET['modifylable'];
					$lable = $_GET['label'];

					try {
						$mods = new Google_Service_Gmail_ModifyMessageRequest();
						if ($lable == "SPAM" && $modifylable == "SPAM") {
							$mods->setAddLabelIds(array("INBOX"));
						} else {
							$mods->setAddLabelIds(array("SPAM"));
						}
						$message = $service->users_messages->modify($email, $msgid, $mods);

					} catch (Exception $e) {
						/* print 'An error occurred: ' . $e->getMessage();*/
					}
					$returnUrl = "gmail_up?labelIds=" . $lable . "&spamresponse";
					return redirect($returnUrl);
				}
				// 5 //
				/**
				 * Compose mail
				 */
				if (isset($_GET['send'])) {
					$toaddr = $_POST['toaddr'];
					/*$toaddr = trim(preg_replace('/[<>]+/', '', $toaddr));
						$toaddr= strstr($toaddr, ' ');
					*/

					$subject = $_POST['subject'];
					$message = $_POST['message'];
					$ccaddr = $_POST['ccaddr'];

					$addr = explode(',', $toaddr);
					$ccaddr = explode(',', $ccaddr);
					$path = $_FILES['fileToUpload']['tmp_name'];
					$name = $_FILES['fileToUpload']['name'];

					$mail = new PHPMailer();
					$mail->CharSet = "UTF-8";
					$subject = $subject;
					$msg = $message;
					$fromadd = $email;
					$fname = $email;
					$mail->From = $fromadd;
					$mail->FromName = $fname;
					/*$mail->AddAddress($toaddr);*/
					foreach ($addr as $ad) {
						$mail->AddAddress(trim($ad));
					}
					foreach ($ccaddr as $add) {
						$mail->AddCC(trim($add));
					}
					$mail->AddReplyTo($fromadd, $fname);
					$mail->Subject = $subject;
					$mail->Body = $msg;
					foreach ($path as $key => $value) {
						$mail->AddAttachment($path[$key], $name[$key]);

					}

					$mail->IsHTML(true);
					$mail->preSend();
					$mime = $mail->getSentMIMEMessage();
					$m = new Google_Service_Gmail_Message();
					$data = base64_encode($mime);
					$data = str_replace(array('+', '/', '='), array('-', '_', ''), $data); // url safe
					$m->setRaw($data);

					if (isset($_POST['send'])) {
						$service->users_messages->send('me', $m);
						/*if (isset($_GET['drafid'])) {
							$draftId = $_GET['drafid'];
							$service->users_drafts->delete($email, $draftId);
							$returnUrl = "gmail_up?labelIds=" . $_GET['label'] . "&draftresponse";
							return redirect($returnUrl);
							header('Location: ' . CURRENTLOCATION . '?mid=' . $_GET['mid'] . '&nav=' . $_GET['nav'] . '&draft=' . $_GET['label'] . '&draftresponse');
						}*/
						$responsemesaage = "Message has been Sent successfully ";
						$this->addTemplateVar('responsemesaage', $responsemesaage);
					} else {
						$draft = new Google_Service_Gmail_Draft();
						$draft->setMessage($m);
						try {
							$draft = $service->users_drafts->create($email, $draft);
							/*print 'Draft ID: ' . $draft->getId(); */
						} catch (Exception $e) {
							/* print 'An error occurred: ' . $e->getMessage();*/
						}
						$responsemesaage = "Message has been Saved successfully ";
						$this->addTemplateVar('responsemesaage', $responsemesaage);
					}

				}
				// 6 //
				/**
				 * Reply to mail
				 */
				if (isset($_GET['reply'])) {
					$toaddr = $_POST['toaddr'];
					/*    $toaddr = trim(preg_replace('/[<>]+/', '', $toaddr));
          				$toaddr= strstr($toaddr, ' ');*/

					$parsed = $this->get_string_between($toaddr, '<', '>');

					$subject = $_POST['subject'];
					$message = $_POST['message'];
					$ccaddr = $_POST['ccaddr'];

					$addr = explode(',', $toaddr);
					$ccaddr = explode(',', $ccaddr);
					$path = $_FILES['fileToUpload']['tmp_name'];
					$name = $_FILES['fileToUpload']['name'];

					$mail = new PHPMailer();
					$mail->CharSet = "UTF-8";
					$subject = $subject;
					$msg = $message;
					$fromadd = $email;
					$fname = $email;
					$mail->From = $fromadd;
					$mail->FromName = $fname;
					/*$mail->AddAddress($toaddr);*/

					$mail->AddAddress(trim($parsed));

					foreach ($ccaddr as $add) {
						$mail->AddCC(trim($add));
					}
					$mail->AddReplyTo($fromadd, $fname);
					$mail->Subject = $subject;
					$mail->Body = $msg;
					foreach ($path as $key => $value) {
						$mail->AddAttachment($path[$key], $name[$key]);
					}

					$mail->IsHTML(true);
					$mail->preSend();
					$mime = $mail->getSentMIMEMessage();
					$m = new Google_Service_Gmail_Message();
					$data = base64_encode($mime);
					$data = str_replace(array('+', '/', '='), array('-', '_', ''), $data); // url safe
					$m->setRaw($data);

					if (isset($_POST['send'])) {
						$service->users_messages->send('me', $m);

						$str = substr($_SERVER['QUERY_STRING'], 0, -6);
						$returnUrl = "gmail_up?" . $str . "&sucessmsg";
						return redirect($returnUrl);

						/*if (isset($_GET['drafid'])) {
							$draftId = $_GET['drafid'];
							$service->users_drafts->delete($email, $draftId);
							header('Location: ' . CURRENTLOCATION . '?mid=' . $_GET['mid'] . '&nav=' . $_GET['nav'] . '&draft=' . $_GET['label'] . '&draftresponse');
						}*/

						$responsemesaage = "Message has been sent successfully ";
						$this->addTemplateVar('responsemesaage', $responsemesaage);
					} else {
						$draft = new Google_Service_Gmail_Draft();
						$draft->setMessage($m);

						try {
							$draft = $service->users_drafts->create($email, $draft);
						} catch (Exception $e) {
							/* print 'An error occurred: ' . $e->getMessage();*/
						}
						$responsemesaage = "Message has been Saved successfully ";
						$this->addTemplateVar('responsemesaage', $responsemesaage);
					}
				}
				// 7 //
				/**
				 * Display mails for the LabelIds -> with pagination
				 */
				if (isset($_GET['labelIds']) || isset($_GET['pageToken'])) {
					if ($_GET['labelIds'] != "DRAFTS") {
						$contentof = "of";
						$lable = $service->users_labels->get($email, $_GET['labelIds']);
						$totalcount = $lable->messagesTotal;
						// asgin values
						$this->addTemplateVar('totalcount', $totalcount);
						$this->addTemplateVar('contentof', $contentof);
					}

					if (isset($_GET['pageToken'])) {
						if (in_array($_GET['pageToken'], $_SESSION['pageToken'])) {
							/*echo"Matched....";*/
							array_pop($_SESSION['pageToken']);
							end($_SESSION['pageToken']);
							$prevtoken = prev($_SESSION['pageToken']);

							$_SESSION['msgcount'] = $_SESSION['msgcount'] - $msgcountlist;
							$_SESSION['msg'] = $_SESSION['msg'] - $msgcountlist;
						} else {
							array_push($_SESSION['pageToken'], $_GET['pageToken']);
							end($_SESSION['pageToken']);
							$prevtoken = prev($_SESSION['pageToken']);

							$_SESSION['msg'] = $_SESSION['msgcount'] + 1;
							$_SESSION['msgcount'] = $_SESSION['msgcount'] + $msgcountlist;
							/* print_r($_SESSION['pageToken']);*/
						}
					} else {
						unset($_SESSION['pageToken']);
						unset($_SESSION['msg']);
						unset($_SESSION['msgcount']);

						$_SESSION['pageToken'] = array(isset($_GET['pageToken']), "23");
						$_SESSION['msg'] = "1";
						$_SESSION['msgcount'] = $msgcountlist;
					}
					$msgcount = $_SESSION['msgcount'];
					$msg = $_SESSION['msg'];
					// asgin values
					$this->addTemplateVar('msg', $msg);
					$this->addTemplateVar('msgcount', $msgcount);
					if (isset($prevtoken)) {
						$this->addTemplateVar('pageTokenprev', $prevtoken);
					}

					if (isset($_GET['pageToken'])) {
						$pageToken = $_GET['pageToken'];
					} else {
						$pageToken = "";
					}

					$labelIds = $_GET['labelIds'];
					if (isset($_POST['mes'])) {
						$mes = $_POST['mes'];
						// asgin values
						$this->addTemplateVar('search', $_POST['mes']);
					} else {
						$mes = null;
					}
					/**
					 * [$listmessageid description]
					 * @var [type]
					 */
					$listmessageid = $this->listMessages($service, $email, $msgcountlist, $labelIds, $pageToken, $mes);

					if (!array_filter($listmessageid)) {
						$nosearch = "You don't have any mails.";
						$this->addTemplateVar('nosearch', $nosearch);
					}
					// asgin values
					$this->addTemplateVar('pageTokennext', $listmessageid[1]);

					$client->setUseBatch(true);
					$batch = new Google_Http_Batch($client);
					$messageId = array();

					foreach ($listmessageid[0] as $key => $value) {
						$optParams = array('format' => 'full');
						$request = $service->users_messages->get($email, $value, $optParams);
						$batch->add($request, $value);
						$messageId[] = $value;
					}

					$results = $batch->execute();

					$from = array();
					$Subject = array();
					$time = array();
					$to = array();
					$snippet = array();
					$unreadmsg = array();
					if ($results) {
						foreach ($results as $key1 => $value1) {
							$snippet[] = $value1['snippet'];
							$unreadmsg[] = $value1['labelIds'][0];
							$messagedetails = $value1->getpayload();
							$modelData = $messagedetails['modelData'];
							foreach ($modelData['headers'] as $key2 => $value2) {
								if ($value2['name'] == "From") {
									$from[] = $value2['value'];
								} elseif ($value2['name'] == "Subject") {
									$Subject[] = $value2['value'];
								} elseif ($value2['name'] == "Date") {
									$time[] = $value2['value'];
								} elseif ($value2['name'] == "To") {
									$to[] = $value2['value'];
								}
							}
						}
					}
					// asgin values
					$this->addTemplateVar('labelIds', $labelIds);
					$mergeArrays = $this->mergeArrays($from, $Subject, $time, $messageId, $draftId = null, $unreadmsg, $to, $snippet);
					$this->addTemplateVar('mergeArrays', $mergeArrays);
				}
				// 8 //
				/**
				 * Display the body message by mesid
				 */
				if (isset($_GET['msgid']) || isset($_GET['draftId']) || isset($_GET['label'])) {
					$msgid = $_GET['msgid'];
					$draftid = $_GET['drafid'];
					$labelIds = $_GET['label'];

					$bodymessage = $this->getbodymessage($service, $email, $msgid, $draftid);

					if (isset($bodymessage['attachmentid'])) {
						$attachment = file_get_contents('http://ec2-52-43-28-11.us-west-2.compute.amazonaws.com:8080/EmailAttachmentDownload/REST/WebService/AttachmentFileName/userId=' . $email . '&messageId=' . $msgid . '&accessToken=' . $accesstkn);
						$attachment = json_decode($attachment, TRUE);
						//echo 'http://ec2-52-43-28-11.us-west-2.compute.amazonaws.com:8080/EmailAttachmentDownload/REST/WebService/AttachmentFileName/userId='.$email.'&messageId='.$msgid.'&accessToken='.$accesstkn['access_token'];
						//die();
					}
					try {

						$mods = new Google_Service_Gmail_ModifyMessageRequest();
						$mods->setRemoveLabelIds(array("UNREAD"));
						$message = $service->users_messages->modify($email, $msgid, $mods);

					} catch (Exception $e) {
						/*print 'An error occurred: ' . $e->getMessage();*/
					}
					// asign values
					$this->addTemplateVar('attachment', $attachment);
					$this->addTemplateVar('bodymessage', $bodymessage);
					$this->addTemplateVar('labelIds', $labelIds);
				}
				/**
				 * response messages
				 */
				// 9 //
				if (isset($_GET['delresponse'])) {
					$responsemesaage = "Message has been Deleted successfully ";
					$this->addTemplateVar('responsemesaage', $responsemesaage);
				}
				// 10 //
				if (isset($_GET['draftresponse'])) {
					$responsemesaage = "Message has been Sent successfully ";
					$this->addTemplateVar('responsemesaage', $responsemesaage);
				}
				// 11 //
				if (isset($_GET['spamresponse'])) {
					$responsemesaage = "Message has been Moved successfully ";
					$this->addTemplateVar('responsemesaage', $responsemesaage);
				}
				// 12 //
				if (isset($_GET['sucessmsg'])) {
					$responsemesaage = "Message has been sent successfully ";
					$this->addTemplateVar('responsemesaage', $responsemesaage);
				}
			}
		} catch (Exception $ex) {

		}

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Gmail');
		$this->addTemplateVar('page', 'module/gmail_up');
		return view('general.index', $this->template_vars);
	}
	/**
	 * [gmailAjax description]
	 * @return [type] [description]
	 */
	public function gmailAjax() {
		$admin_obj = new Admin;
		/**
		 * Get Refreshtoken from db
		 */
		$userid = $_SESSION['userId'];
		$usersdetails = $admin_obj->getRefreshToken([$userid]);
		$client_id = GOOGLE_CLIENTID;
		$client_secret = GOOGLE_CLIENT_SECRET;
		$redirect_uri = env('APP_URL') . 'google_oauth';

		$client = new Google_Client();
		$client->setClientId($client_id);
		$client->setClientSecret($client_secret);
		$client->setAccessType('offline');
		$client->setApprovalPrompt("force");
		$client->setRedirectUri($redirect_uri);
		// $client->setState($state);
		$client->setScopes(array(
			'https://mail.google.com/',
			'https://www.googleapis.com/auth/gmail.modify', 'https://www.googleapis.com/auth/gmail.readonly', 'https://www.googleapis.com/auth/gmail.compose', 'https://www.googleapis.com/auth/gmail.send', 'https://www.googleapis.com/auth/gmail.labels', 'https://www.googleapis.com/auth/gmail.insert', 'https://www.googleapis.com/auth/userinfo.email', 'https://www.googleapis.com/auth/plus.me', 'https://www.googleapis.com/auth/calendar', 'https://www.googleapis.com/auth/contacts.readonly', 'https://www.googleapis.com/auth/youtube', 'https://www.googleapis.com/auth/youtube.force-ssl', 'https://www.googleapis.com/auth/youtube.readonly', 'https://www.googleapis.com/auth/youtube.upload', 'https://www.googleapis.com/auth/youtubepartner', 'https://www.googleapis.com/auth/youtubepartner-channel-audit'));

		$email = $usersdetails[0]['email_id'];
		$refreshToken = $usersdetails[0]['refresh_token'];
		if ($refreshToken) {
			try {
				$client->refreshToken($refreshToken);
				$token = $client->getAccessToken();

				if ($token) {
					$service = new Google_Service_Gmail($client);

					$inbox = $service->users_labels->get($email, 'INBOX');
					$sent = $service->users_labels->get($email, 'SENT');
					$important = $service->users_labels->get($email, 'IMPORTANT');
					$starred = $service->users_labels->get($email, 'STARRED');
					$spam = $service->users_labels->get($email, 'SPAM');
					$draft = $service->users_labels->get($email, 'DRAFT');

					$inboxunreadCount = $inbox->messagesUnread;
					$sentunreadCount = $sent->messagesUnread;
					$importantunreadCount = $important->messagesUnread;
					$starredunreadCount = $starred->messagesUnread;
					$spamunreadCount = $spam->messagesUnread;
					$draftunreadCount = $draft->messagesTotal;

					$count = array('inboxunreadCount' => $inboxunreadCount, 'sentunreadCount' => $sentunreadCount, 'importantunreadCount' => $importantunreadCount, 'starredunreadCount' => $starredunreadCount, 'spamunreadCount' => $spamunreadCount, 'draftunreadCount' => $draftunreadCount);
					return json_encode($count);
				} else {
					return "error";
				}

			} catch (Exception $ex) {
				echo "<pre>";
				print_r($ex);
				die();
				//return "error";
			}
		} else {
			return "error";
		}
	}
	/**
	 * [listLabels description]
	 * @param  [type] $service [description]
	 * @param  [type] $userId  [description]
	 * @return [type]          [description]
	 */
	function listLabels($service, $userId) {
		$labels = array();
		try {
			$labelsResponse = $service->users_labels->listUsersLabels($userId);

			$lables = $labelsResponse->getLabels();
			for ($i = 0; $i < count($lables); $i++) {
				if ($lables[$i]['type'] == "user") {
					$lables_name[] = $lables[$i]['name'];
					$lables_id[] = $lables[$i]['id'];
				}
			}
			$lables = array($lables_name, $lables_id);

		} catch (Excetion $e) {
			/*  print 'An error occurred: ' . $e->getMessage();*/
		}
		return $lables;
	}
	/**
	 * Get list of Messages in user's mailbox.
	 *
	 * @param  Google_Service_Gmail $service Authorized Gmail API instance.
	 * @param  string $userId User's email address. The special value 'me'
	 * can be used to indicate the authenticated user.
	 * @return array Array of Messages.
	 */

	function listMessages($service, $userId, $maxResults, $labelIds, $pageToken, $mes) {
		$messages = array();
		$opt_param = array();
		if (isset($mes)) {
			$opt_param['maxResults'] = $maxResults;
			$opt_param['q'] = $mes;
		} else {
			$opt_param['labelIds'] = $labelIds;
			$opt_param['maxResults'] = $maxResults;
		}

		try {
			if ($pageToken) {
				$opt_param['pageToken'] = $pageToken;
			}
			$messagesResponse = $service->users_messages->listUsersMessages($userId, $opt_param);

			if ($messagesResponse->getMessages()) {
				$messages = array_merge($messages, $messagesResponse->getMessages());
				$pageToken = $messagesResponse->getNextPageToken();
			}
		} catch (Exception $e) {
			print 'An error occurred: ' . $e->getMessage();
		}
		$msgid = array();
		if ($messages) {
			foreach ($messages as $message) {
				/*print 'Message with ID: ' . $message->getId() . '<br/>';*/
				$msgid[] = $message->getId();
				/*print getMessage($service, 'rubanraj.sureshbabu@gmail.com', $message->getId()); */
			}
		}

		return array($msgid, $pageToken);
	}
	/**
	 * [mergeArrays description]
	 * @param  [type] $from      [description]
	 * @param  [type] $Subject   [description]
	 * @param  [type] $time      [description]
	 * @param  [type] $messageId [description]
	 * @param  [type] $draftId   [description]
	 * @param  [type] $unreadmsg [description]
	 * @param  [type] $to        [description]
	 * @param  [type] $snippet   [description]
	 * @return [type]            [description]
	 */
	function mergeArrays($from, $Subject, $time, $messageId, $draftId = null, $unreadmsg, $to, $snippet) {
		$result = array();

		foreach ($from as $key => $name) {
			$result[] = array('from' => $name, 'date' => $time[$key], 'subject' => $Subject[$key], 'messageId' => $messageId[$key], 'draftId' => $draftId[$key], 'unreadmsg' => $unreadmsg[$key], 'to' => $to[$key], 'snippet' => $snippet[$key]);
		}
		return $result;
	}
	/**
	 * [getbodymessage description]
	 * @param  [type] $service [description]
	 * @param  [type] $userId  [description]
	 * @param  [type] $msgid   [description]
	 * @param  [type] $draftid [description]
	 * @return [type]          [description]
	 */
	function getbodymessage($service, $userId, $msgid, $draftid) {
		$optParamsGet = [];
		$optParamsGet['format'] = 'full';
		try {
			if ($msgid) {
				$message = $service->users_messages->get($userId, $msgid, $optParamsGet);
			}
			if ($draftid) {
				$draft = $service->users_drafts->get($userId, $draftid);
				$message = $draft->getMessage();
			}
			$messagedetails = $message->getpayload();
			$modelData = $messagedetails['modelData'];

			$parts = $message->getPayload()->getParts();

			if (isset($modelData['parts'])) {
				$count = count($modelData['parts']);
			}

			if (empty($parts)) {
				$rawData = $modelData['body']['data'];
				$attachmentid = "sdfdsf";
			} else {
				$contenttype = substr($parts[0]['headers'][0]['value'], 0, 9);
				if ($contenttype == "multipart") {
					$body = $parts[0]['parts'][1]['body'];
					$rawData = $body->data;

					for ($i = 1; $i <= $count; $i++) {
						$attachmentid[] = $parts[$i]['body']['attachmentId'];
					}
				} else {
					if ($parts[0]['mimeType'] == 'text/html') {
						$rawData = $parts[0]['modelData']['body']['data'];
						$attachmentid = "sdfdsf";
					} else {
						$body = $parts[1]['body'];
						$rawData = $body->data;
						$attachmentid = "sdfdsf";
					}
				}
			}
			/*
				foreach ($attachmentid as $key => $value) {

				$attachmentData= $service->users_messages_attachments->get($userId, $msgid, $value);
				$decodedData = strtr($decodedData, array('-' => '+', '_' => '/'));
				/* $data = strtr($attachmentData, array('-' => '+', '_' => '/'));
				echo '<pre>';
				print_r($attachmentData);echo '</pre>';
				}*/

			$sanitizedData = strtr($rawData, '-_', '+/');
			$decodedMessage = base64_decode($sanitizedData);
			//$decodedMessage = preg_replace('#(<[a-z ]*)(style=("|\')(.*?)("|\'))([a-z ]*>)#', '\\1\\6', $decodedMessage);
			$decodedMessage = preg_replace("/<style\\b[^>]*>(.*?)<\\/style>/s", "", $decodedMessage);
			$messageData = array('modelData' => $modelData['headers'], 'decodedMessage' => $decodedMessage, 'attachmentid' => $attachmentid);

			return $messageData;
		} catch (Exception $e) {
			/* print 'An error occurred: ' . $e->getMessage();*/
		}
	}
	/**
	 * [modifyMessage description]
	 * @param  [type] $service        [description]
	 * @param  [type] $userId         [description]
	 * @param  [type] $messageId      [description]
	 * @param  [type] $labelsToAdd    [description]
	 * @param  [type] $labelsToRemove [description]
	 * @return [type]                 [description]
	 */
	function modifyMessage($service, $userId, $messageId, $labelsToAdd, $labelsToRemove) {
		$mods = new Google_Service_Gmail_ModifyMessageRequest();

		$mods->setAddLabelIds(array($labelsToAdd));
		$mods->setRemoveLabelIds(array($labelsToRemove));
		try {
			$message = $service->users_messages->modify($userId, $messageId, $mods);
			return $message;
		} catch (Exception $e) {
			// print 'An error occurred: ' . $e->getMessage();
		}
	}
	/**
	 * [get_string_between description]
	 * @param  [type] $string [description]
	 * @param  [type] $start  [description]
	 * @param  [type] $end    [description]
	 * @return [type]         [description]
	 */
	function get_string_between($string, $start, $end) {
		$string = ' ' . $string;
		$ini = strpos($string, $start);
		if ($ini == 0) {
			return '';
		}

		$ini += strlen($start);
		$len = strpos($string, $end, $ini) - $ini;
		return substr($string, $ini, $len);
	}
}
