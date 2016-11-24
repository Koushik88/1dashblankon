<?php

namespace App;

use Config;
use DB;
use Illuminate\Database\Eloquent\Model;

class Admin extends Model {
	/**
	 * [returnJson description]
	 * @param  [array object] $arr [get db result -> array object ]
	 * @return [json]      [return json_decode result]
	 */
	public function returnJson($arr) {
		return json_decode(json_encode($arr), true);
	}
	/**
	 * [getUserDatabase description]
	 * @param  [string] $email_id [user email id]
	 * @return [json]      [return user database name as json_decode]
	 */
	public function getUserDatabase($email_id) {
		$users = DB::select('select comany_name from 1dash_app_userlist where email_id = ?', $email_id);
		$result = $this->returnJson($users);
		return $result;
	}
	/**
	 * [loginUser description]
	 * @param  [type] $credentials [description]
	 * @return [type]              [description]
	 */
	public function loginUser($credentials) {
		$DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) {
			$result = $DB->select("select * from users where email = ? AND password = md5(CONCAT(?,password_string))", $credentials);
		}
		return $this->returnJson($result);
	}
	/**
	 * [getMenus get all the menus assoctiated with the user]
	 * @return [type] [description]
	 */
	public function getMenus() {
		// Menu array
		$_menus = array();
		$DB = DB::connection('dynamic_mysql');
		if (isset($_SESSION['userId']) && $_SESSION['userId'] > 0) {
			$result = $DB->select("SELECT m.section section_id,m.id,s.name as section_name,s.rank as rank,menu_image as menu_image FROM menu_users mu LEFT JOIN menus m ON m.id=mu.menu_id LEFT JOIN section_master s ON s.id=m.section WHERE mu.user_id='" . $_SESSION['userId'] . "' AND m.procedure_id >= 0 AND s.active = 1 AND type='web' GROUP BY m.section ORDER BY rank ASC");
			$output = $this->returnJson($result);
			$count = 0;
			if ($output > 0) {
				foreach ($output as $mi => $mv) {
					$_menus[$count][$mi]["sid"] = $mv["section_id"];
					$_menus[$count][$mi]["name"] = $mv["section_name"];
					$_menus[$count][$mi]["menu_image"] = $mv["menu_image"];
					$_children = $this->getChildren($mv["section_id"], $_SESSION['userId']);
					$_menus[$count][$mi]["children"] = $_children;
					$count++;
				}
			}
			return $_menus;
		} else {
			return "0";
		}
	}
	public function getChildren($section_id, $userId) {
		$DB = DB::connection('dynamic_mysql');
		$_children = array();
		$sql = "SELECT m.*,t.controller,t.php_name,t.tpl_name FROM menus m LEFT JOIN menu_users mu ON mu.menu_id=m.id LEFT JOIN templates t ON t.id=m.template_id WHERE m.section = '" . intval($section_id) . "' AND mu.user_id='$userId' AND m.procedure_id !='-1' ";
		$sql .= " ORDER BY m.sort ASC";
		$result = $DB->select($sql);
		$output = $this->returnJson($result);

		$i = 0;
		if ($output > 0) {
			foreach ($output as $mi => $mv) {
				$_children[$i]["mid"] = $mv["id"];
				$_children[$i]["name"] = $mv["menu_name"];
				$_children[$i]["report_icon"] = $mv["report_icon"];
				$_children[$i]["href"] = $mv["php_name"];
				$i++;
			}
		}
		return $_children;
	}
        
        /**
	 * [get Active Plugins get all the assoctiated with the user]
	 * @return [type] [description]
	 */
        public function getPluginCredentials($pluginName)
        {
            $DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) 
                {
                    $plugin = $DB->select("SELECT data,p_id FROM plugin_details WHERE name = '$pluginName' AND userID = '".$_SESSION["userId"]."' AND active = '1' ");
                    return $this->returnJson($plugin);
                    
                }
        }
        
        
        /**
	 * [get Active Plugins get all the assoctiated with the user]
	 * @return [type] [description]
	 */
        public function getAllPluginCredentials($pluginName)
        {
            $DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) 
                {
                    $plugin = $DB->select("SELECT data,p_id FROM plugin_details WHERE name = '$pluginName' AND userID = '".$_SESSION["userId"]."' ");
                    return $this->returnJson($plugin);
                    
                }
        }
        
        
        public function updateActiveQBOCompany($cmp_id)
        {
             $DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) 
                {
                    $sql = $DB->update("UPDATE plugin_details SET active = '0'  WHERE name = 'Quickbook' AND userID = '".$_SESSION["userId"]."' ");
                    $sql1 = $DB->update("UPDATE plugin_details SET active = '1'  WHERE name = 'Quickbook'AND userID = '".$_SESSION["userId"]."' AND p_id = '$cmp_id'  ");
                }    
        }        
        /*
         * [get Active ToDo List get all the assoctiated with the user]
	 * @return [type] [description]
         */
        public function getTodo($action,$limit=10)
        {
            $DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) 
                {
                    $todo = $DB->select("SELECT `id`, `todo`, DATE_FORMAT(`created`,'%b %d %Y %h:%i %p') as created,DATE_FORMAT(`completed`,'%b %d %Y %h:%i %p') as completed, action  FROM `todo` WHERE `userid`='".$_SESSION['userId']."' AND `action`='$action' ORDER BY created LIMIT 0,$limit");
                    return $this->returnJson($todo);
                }
        }
        
        public function createTodo($todo,$datetime){
        
            $DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) 
                {
                   $DB->update("INSERT INTO `todo`( `userid`, `todo`,`eventdate`) VALUES ('".$_SESSION['userId']."','$todo','$datetime')" );
                }
        }
        
        public function updateToDoList($data)
        {
            $DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) 
                {
                   $DB->update("update todo SET action = '".$data["updateToDo"]."' WHERE id = '".$data["id"]."' " );
                }
        }
        
        public function clearTodoList()
        {
            $DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) 
                {
                     $DB->update("update todo SET action = 'D' WHERE userid= '".$_SESSION["userId"]."' AND action = 'C'"); 
                }
        }

        /*public function getRssFeedTab()
        {
             $DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) 
                {
                    $datalist = $DB->select("SELECT * FROM rss_feed WHERE  uid = '" . $_SESSION["userId"] ."' "); 
                    return $this->returnJson($datalist);
                }
        }*/

        public function saveRssFeed($arr_value)
        {
            $DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) 
                {
                    $datalist = $DB->select("SELECT uid FROM rss_feed WHERE  uid = '" . $_SESSION["userId"] . "' ");
                    $result = $this->returnJson($datalist);
                        if(!$result){
                            
                            $DB->update("INSERT INTO rss_feed(id,uid,data,created_on)values('','".$_SESSION["userId"]."','$arr_value',CURDATE())"); 
                         }
                         else{                             
                              $DB->update("UPDATE rss_feed SET data='$arr_value' WHERE uid= '".$_SESSION["userId"]."'  ");
                         }
                    
                }
        }
        
	/**
	 * [getAllPluginData description]
	 * @param  [type] $userId [description]
	 * @return [json]         [all plugin details]
	 */
	public function getAllPluginData($userId) {
		$DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) {
			$result = $DB->select("select name,data from plugin_details where userID = ?", $userId);
		}
		return $this->returnJson($result);
	}
	/**
	 * [getRefreshToken description]
	 * @param  [type] $userId [description]
	 * @return [type]         [description]
	 */
	public function getRefreshToken($userId) {
		$DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) {
			$result = $DB->select("select * from gmail_api_users where user_id = ?", $userId);
		}
		return $this->returnJson($result);
	}
	/**
	 * [getRssFeedTab description]
	 * @return [type] [description]
	 */
	public function getRssFeedTab() {
		$DB = DB::connection('dynamic_mysql');
		$uid = [$_SESSION["userId"]];
		if ($DB->getPdo()) {
			$result = $DB->select("select * from rss_feed where uid = ?", $uid);
		}
		return $this->returnJson($result);
	}

        /*
		    *
		    *  Experimental db calls, it may remove or move to some other place
	*/
	public function getName($email_id) {
		// echo $email_id;
		$users = DB::select('select email_id from 1dash_app_userlist where id= ? AND email_id = ?', $email_id);
		return $users;
	}
	public function getName1($email_id) {
		$dynamic_db_name = "global_basics2_admin";
		Config::set('database.connections.dynamic_mysql.database', $dynamic_db_name);
		// $DB = DB::connection('dynamic_mysql');
		$DB = DB::connection('dynamic_mysql')->getPdo();

		// $users = DB::select('select email_id from 1dash_app_userlist where id= ? AND email_id = ?', $email_id);
		return $DB;
	}
	public function getPlugins() {
		$dynamic_db_name = "global_basics2_admin";
		Config::set('database.connections.dynamic_mysql.database', $dynamic_db_name);
		$DB = DB::connection('dynamic_mysql');
		// print_r($DB->getPdo());
		if ($DB->getPdo()) {
			// $DB = DB::connection('dynamic_mysql');
			echo "<pre>";
			// print_r($DB);
			if (DB::connection()->getDatabaseName()) {
				echo "conncted sucessfully to database " . DB::connection()->getDatabaseName();
			} else {
				echo "Main DB not connected";
			}
			if ($DB->getDatabaseName()) {
				echo "<br/>conncted sucessfully to database " . $DB->getDatabaseName();
			}
			// die();

			$plugins = $DB->select('select * from plugin_details');
			// $users1  = DB::select('select email_id from 1dash_app_userlist where id= ? AND email_id = ?', $email_id);
			return $plugins;
		}
	}
	public function getUsers() {
		// $DB = DB::connection('dynamic_mysql')->getPdo();
		$DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) {
			$users = $DB->select('select * from users;');
			// $users1  = DB::select('select email_id from 1dash_app_userlist where id= ? AND email_id = ?', $email_id);
			return $users;
		}
	}
        public function getUserInfo()
        {
            $DB = DB::connection('dynamic_mysql');
		if ($DB->getPdo()) {
                    
                    $userinfo = $DB->select("SELECT us.last_login as last_login,us.ip as ip,us.allow_mobile as allow_mobile,us.ldap as ldap,ur.role as user_role,us.browser_type as browser_type FROM users us,users_role ur WHERE ur.id = us.user_role AND us.id='".$_SESSION['userId']."' ");
                    return $this->returnJson($userinfo);
                }
        }
        public function updateProfilePic($profilepic)
        {
                $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) {                
                             $DB->update("UPDATE users SET profilepic = '$profilepic' WHERE id = '".$_SESSION["userId"]."' ");             
                }
        }
        public function passwordCheck($passwd)
        {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) {  
                    $userinfo = $DB->select("SELECT id FROM users where password = md5(CONCAT('".$passwd."',password_string)) AND id = '".$_SESSION['userId']."' ");
                   return $this->returnJson($userinfo);                    
                }
        }
       
        public function updatePassword($password_str,$enc_pwd)
        {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) {  
                    $DB->update("UPDATE users SET password = '$enc_pwd',password_string = '$password_str' WHERE id = '".$_SESSION["userId"]."' ");
                }
        }
        public function getUpdateAllPluginData($pluginName) {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) {  
                     $QBCredentials = $DB->select("SELECT data,p_id FROM plugin_details WHERE name = '$pluginName' AND userID = '".$_SESSION["userId"]."' ");
                      return $this->returnJson($QBCredentials); 
                     }
        }
        
        public function savePluginCredentials($pluginName,$data,$update_plag,$pid)
        {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) { 
                   if($pluginName = 'Quickbook')
                     {
                       $dataencode = json_encode($data,TRUE);
                       if($update_plag == '1')
                        {
                           $DB->update("UPDATE plugin_details SET `releam_id` = '".$data["realmId"]."' ,`data` = '$dataencode' WHERE p_id = '$pid' AND  userID = '".$_SESSION["userId"]."' "); 
                        } 
                        else {
                            $DB->update("UPDATE plugin_details SET active = '0'  WHERE name = 'Quickbook' AND userID = '".$_SESSION["userId"]."'");
                            $DB->update(" INSERT INTO plugin_details(`name`,`company_id`,`releam_id`,`data`,`userID`,`active`) values('$pluginName','".$_SESSION["company_id"]."','".$data["realmId"]."','$dataencode','".$_SESSION["userId"]."','1')  ");
                        }
                    
                     }
                }
        }
        
        public function deleteQBOPluginData($pluginName,$pid)
        {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) { 
                     $QBCredentials = $DB->select("SELECT data,p_id FROM plugin_details WHERE name = '$pluginName' AND userID = '".$_SESSION["userId"]."' AND p_id = '$pid' ");
                      return $this->returnJson($QBCredentials); 
                     
                }
            
        }
        
        public function deleteQBPluginInfo($infoId,$pid)
        {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) { 
                    $DB->update("DELETE FROM plugin_details WHERE name = '$infoId' AND userID = '".$_SESSION["userId"]."' AND p_id = '$pid' ");
                }
            
        }
        public function deletePluginInfo($infoId)
        {
             $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) { 
                    $DB->update("DELETE FROM plugin_details WHERE name = '$infoId' AND userID = '".$_SESSION["userId"]."' ");
                }
        }
        
        public function getCurrentUserList()
        {
             $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) { 
                    $userlist = $DB->select("SELECT * FROM (SELECT id,CONCAT(first_name,' ',last_name) as full_name,profilepic FROM users WHERE id != '".$_SESSION["userId"]."') A1 LEFT JOIN (SELECT c_id,user_one,user_two FROM conversation WHERE user_one = '".$_SESSION["userId"]."') A2 ON id = user_two GROUP BY id order by c_id DESC");
                    return $this->returnJson($userlist); 
                }
        }
        public function getLatestChartUser()
        {
             $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) { 
                   $userlist = $DB->select("SELECT `c_id` , `user_two` FROM `conversation` WHERE `user_one` = '".$_SESSION["userId"]."'  ORDER BY c_id DESC");
                   return $this->returnJson($userlist);                    
                }
        }
        public function getRandomIdInfo($userData)
        {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) { 
                    $userInfo = $DB->select(" SELECT max(c_id) as c_id FROM conversation WHERE user_one = '".$_SESSION["userId"]."' AND user_two = ".$userData["chartUserId"]." AND chat_user_randomId = '".$userData["chartUserRandomId"]."' ");
                    return $this->returnJson($userInfo);                     
                }
        }
        public function insertChatUserInfo($userData)
        {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) { 
                    $DB->update(" INSERT INTO conversation(user_one,user_two,chat_user_randomId) values('".$_SESSION["userId"]."','".$userData["chartUserId"]."','".$userData["chartUserRandomId"]."') ");
                }
            
        }
        public function insertChatMessage($result,$userData)
        {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) { 
                    $DB->update("INSERT INTO conversation_reply(reply,user_id_fk,c_id_fk) values('".nl2br(htmlentities($userData["chatContent"] , ENT_QUOTES, 'UTF-8'))."','".$_SESSION["userId"]."',$result)" );
                }
        }
        public function selectChatMessage($chartuserId)
        {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) { 
                   $chatInfo =  $DB->select(" SELECT ms.user_one,ms.user_two,ms.time,ms.reply,us.first_name,(SELECT first_name FROM users WHERE id=ms.user_two ) as first_name1,profilepic FROM (SELECT user_one,user_two,a2.time,reply FROM (SELECT * FROM `conversation` WHERE (`user_one` = '".$_SESSION["userId"]."' AND `user_two` ='$chartuserId') OR (`user_one` = '$chartuserId' AND `user_two` ='".$_SESSION["userId"]."')) a1
                                     LEFT JOIN (SELECT * FROM conversation_reply) a2 ON a1.c_id = a2.c_id_fk ) ms LEFT JOIN (SELECT id,first_name,profilepic FROM users) us ON us.id = ms.user_one ORDER BY  ms.time ");
                
                   return $this->returnJson($chatInfo); 
                }
        }
        public function getMsgNotification()
        {
            $DB = DB::connection('dynamic_mysql');
                if ($DB->getPdo()) {
                    $date = date('Y-m-d H:i:s');
                    $notification =  $DB->select(" SELECT * FROM(SELECT * FROM(SELECT 'Message' as category,cs.user_one as 'userid',DATE_FORMAT(cr.time, '%b %d %Y %r') as 'msgtime',cr.reply as 'msg' FROM `conversation` cs,conversation_reply cr WHERE `c_id` = c_id_fk AND `user_two` = '".$_SESSION["userId"]."' ORDER BY cr.`time` DESC LIMIT 0 , 5) A
                        UNION ALL SELECT * FROM(SELECT 'Notification' as categoryc, `senderid` as 'userid', DATE_FORMAT(`annotime`, '%b %d %Y %r') as 'msgtime', `message` as 'msg' FROM `widget_annotation` WHERE `senderid` != '".$_SESSION["userId"]."' ORDER BY `annotime` DESC LIMIT 0 , 5) B) msg
                        LEFT JOIN (SELECT id,	profilepic,CONCAT(first_name,' ',last_name) as `first_name` FROM users) us  ON us.id = msg.userid
                         UNION ALL 
                         SELECT 'Todo' as category ,`userid`,DATE_FORMAT(`eventdate`,'%b %d %Y %r') as msgtime,`todo` as msg,`userid` as id,(SELECT profilepic FROM `users` WHERE id ='".$_SESSION['userId']."') as  profilepic , 'Reminder' as first_name FROM `todo` WHERE `eventdate` >= '$date' AND `eventdate` <= '$date' + INTERVAL 1 HOUR AND `userid`='".$_SESSION['userId']."' AND `action`='U' 
                         UNION ALL
                         SELECT 'Calendar' as category ,`user_id`,DATE_FORMAT(`startdate`,'%b %d %Y %r') as msgtime,`description` as msg,`user_id` as id,(SELECT profilepic FROM `users` WHERE id ='".$_SESSION["userId"]."') as  profilepic , 'Reminder' as first_name FROM `notification_events` WHERE `startdate` >= '$date' AND `startdate` <= '$date' + INTERVAL 1 HOUR AND `user_id`= '".$_SESSION["userId"]."' ");
                    return $this->returnJson($notification); 
                }
        }
        public function getNotifyCount()
        {
            $DB = DB::connection('dynamic_mysql');
            if ($DB->getPdo()) {
                $date = date('Y-m-d H:i:s');
                  $notification_count =  $DB->select("SELECT COUNT(*) as `Count` FROM `conversation` cs,conversation_reply cr WHERE `c_id` = c_id_fk AND `user_two` = '".$_SESSION["userId"]."' AND (cr.time > '".$_SESSION["previous_login"]."') 
                                 UNION ALL
                             SELECT COUNT(*) as `Count` FROM `todo` WHERE `eventdate` >= '$date' AND `eventdate` <= '$date' + INTERVAL 1 HOUR AND `userid`='".$_SESSION['userId']."' AND `action`='U' 
                                 UNION ALL 
                                SELECT COUNT(*) as `Count` FROM `notification_events` WHERE `startdate` >= '$date' AND `startdate` <= '$date' + INTERVAL 1 HOUR AND `user_id`= '".$_SESSION["userId"]."' ");
                   return $this->returnJson($notification_count); 
                  }
            
        }
        
}
