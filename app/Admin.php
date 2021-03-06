<?php

namespace App;

use DB;
use Illuminate\Database\Eloquent\Model;
use Config;

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
    public function getPluginCredentials($pluginName) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $plugin = $DB->select("SELECT data,p_id FROM plugin_details WHERE name = '$pluginName' AND userID = '" . $_SESSION["userId"] . "' AND active = '1' ");
            return $this->returnJson($plugin);
        }
    }

    /**
     * [get Active Plugins get all the assoctiated with the user]
     * @return [type] [description]
     */
    public function getAllPluginCredentials($pluginName) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $plugin = $DB->select("SELECT data,p_id FROM plugin_details WHERE name = '$pluginName' AND userID = '" . $_SESSION["userId"] . "' ");
            return $this->returnJson($plugin);
        }
    }

    /**
     * [savePluginCredentials description]
     * @param  [type] $pluginName [description]
     * @param  [type] $data       [description]
     * @return [type]             [description]
     */
    public function savePluginCredentials($pluginName, $data) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $res = $DB->select("SELECT p_id FROM plugin_details WHERE name = '$pluginName' AND userID = '" . $_SESSION["userId"] . "' ");
            $result = $this->returnJson($res);
            if (!$result) {
                $sql1 = "INSERT INTO plugin_details(`name`,`company_id`,`data`,`userID`) values('$pluginName','" . $_SESSION["company_id"] . "','$data','" . $_SESSION["userId"] . "') ";
                $DB->insert($sql1);
            } else {
                $p_id = $result[0]['p_id'];
                $sql2 = "UPDATE plugin_details SET data='$data' WHERE p_id= '$p_id'";
                $DB->update($sql2);
            }
        }
    }

    /**
     * [deletePluginInfo description]
     * @param  [type] $pluginName [description]
     * @return [type]             [description]
     */
    public function deletePluginInfo($pluginName) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $sql = "DELETE FROM plugin_details WHERE name = '$pluginName' AND userID = '" . $_SESSION["userId"] . "' ";
            $DB->delete($sql);
        }
    }

    /**
     * [saveSocialmediaCounts description]
     * @param  [type] $data   [description]
     * @param  [type] $userId [description]
     * @return [type]         [description]
     */
    public function saveSocialmediaCounts($data, $userId) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $res = $DB->select("SELECT id FROM socialmedia_counts WHERE userID = '$userId ' ");
            $result = $this->returnJson($res);
            if (!$result) {
                $sql1 = "INSERT INTO socialmedia_counts(`userID`,`data`) values('$userId','$data') ";
                $DB->insert($sql1);
            } else {
                $id = $result[0]['id'];
                $sql2 = "UPDATE socialmedia_counts SET data='$data' WHERE id= '$id'  ";
                $DB->update($sql2);
            }
        }
    }

    /**
     * [getSocailMediaCounts description]
     * @return [type] [description]
     */
    public function getSocailMediaCounts() {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $res = $DB->select("SELECT data FROM socialmedia_counts WHERE userID = '" . $_SESSION["userId"] . "' ");
            return $this->returnJson($res);
        }
    }

    /**
     * [updateActiveQBOCompany description]
     * @param  [type] $cmp_id [description]
     * @return [type]         [description]
     */
    public function updateActiveQBOCompany($cmp_id) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $sql = $DB->update("UPDATE plugin_details SET active = '0'  WHERE name = 'Quickbook' AND userID = '" . $_SESSION["userId"] . "' ");
            $sql1 = $DB->update("UPDATE plugin_details SET active = '1'  WHERE name = 'Quickbook'AND userID = '" . $_SESSION["userId"] . "' AND p_id = '$cmp_id'  ");
        }
    }

    public function updateFinicityActiveAcount($cmp_id) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $sql = $DB->update("UPDATE plugin_details SET active = '0'  WHERE name = 'Finicity' AND userID = '" . $_SESSION["userId"] . "' ");
            $sql1 = $DB->update("UPDATE plugin_details SET active = '1'  WHERE name = 'Finicity'AND userID = '" . $_SESSION["userId"] . "' AND p_id = '$cmp_id'  ");
        }
    }

    /*
     * [get Active ToDo List get all the assoctiated with the user]
     * @return [type] [description]
     */

    public function getTodo($action, $limit = 10) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $todo = $DB->select("SELECT `id`, `todo`, DATE_FORMAT(`created`,'%b %d %Y %h:%i %p') as created,DATE_FORMAT(`completed`,'%b %d %Y %h:%i %p') as completed, action  FROM `todo` WHERE `userid`='" . $_SESSION['userId'] . "' AND `action`='$action' ORDER BY created LIMIT 0,$limit");
            return $this->returnJson($todo);
        }
    }

    public function createTodo($todo, $datetime) {

        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("INSERT INTO `todo`( `userid`, `todo`,`eventdate`) VALUES ('" . $_SESSION['userId'] . "','$todo','$datetime')");
        }
    }

    public function updateToDoList($data) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("update todo SET action = '" . $data["updateToDo"] . "' WHERE id = '" . $data["id"] . "' ");
        }
    }

    public function clearTodoList() {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("update todo SET action = 'D' WHERE userid= '" . $_SESSION["userId"] . "' AND action = 'C'");
        }
    }

    /* public function getRssFeedTab()
      {
      $DB = DB::connection('dynamic_mysql');
      if ($DB->getPdo())
      {
      $datalist = $DB->select("SELECT * FROM rss_feed WHERE  uid = '" . $_SESSION["userId"] ."' ");
      return $this->returnJson($datalist);
      }
     */

    public function saveRssFeed($arr_value) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $datalist = $DB->select("SELECT uid FROM rss_feed WHERE  uid = '" . $_SESSION["userId"] . "' ");
            $result = $this->returnJson($datalist);
            if (!$result) {

                $DB->update("INSERT INTO rss_feed(id,uid,data,created_on)values('','" . $_SESSION["userId"] . "','$arr_value',CURDATE())");
            } else {
                $DB->update("UPDATE rss_feed SET data='$arr_value' WHERE uid= '" . $_SESSION["userId"] . "'  ");
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
     * [setGoogleSigninQuery, save google refresh token]
     * @param [type] $refreshToken      [description]
     * @param [type] $ResponseUserEmail [description]
     * @param [type] $googlePlusUserId  [description]
     * @param [type] $youtubeChannelId  [description]
     * @param [type] $userid            [description]
     */
    public function setGoogleSigninQuery($refreshToken, $ResponseUserEmail, $googlePlusUserId, $youtubeChannelId, $userid) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $getSql = "SELECT id FROM gmail_api_users WHERE user_id = '$userid'";
            $res = $DB->select($getSql);
            $isResult = $this->returnJson($res);
            if (!$isResult) {
                $sql = "INSERT INTO gmail_api_users(id,user_id,email_id,googleplus_id,youtubechannel_id,refresh_token,created_on)values('','$userid','$ResponseUserEmail','$googlePlusUserId','$youtubeChannelId','$refreshToken',CURDATE())";
                $DB->insert($sql);
            } else {
                $id = $isResult[0]['id'];
                $sql1 = "UPDATE gmail_api_users SET email_id='$ResponseUserEmail',googleplus_id='$googlePlusUserId',youtubechannel_id='$youtubeChannelId',refresh_token='$refreshToken',created_on=CURDATE() WHERE id='$id' AND user_id='$userid'";
                $DB->update($sql1);
            }
        }
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

    /**
     * [getUserInfo description]
     * @return [type] [description]
     */
    public function getUserInfo() {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {

            $userinfo = $DB->select("SELECT us.last_login as last_login,us.ip as ip,us.allow_mobile as allow_mobile,us.ldap as ldap,ur.role as user_role,us.browser_type as browser_type FROM users us,users_role ur WHERE ur.id = us.user_role AND us.id='" . $_SESSION['userId'] . "' ");
            return $this->returnJson($userinfo);
        }
    }

    public function updateProfilePic($profilepic) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("UPDATE users SET profilepic = '$profilepic' WHERE id = '" . $_SESSION["userId"] . "' ");
        }
    }

    public function passwordCheck($passwd) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $userinfo = $DB->select("SELECT id FROM users where password = md5(CONCAT('" . $passwd . "',password_string)) AND id = '" . $_SESSION['userId'] . "' ");
            return $this->returnJson($userinfo);
        }
    }

    public function updatePassword($password_str, $enc_pwd) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("UPDATE users SET password = '$enc_pwd',password_string = '$password_str' WHERE id = '" . $_SESSION["userId"] . "' ");
        }
    }

    public function getUpdateAllPluginData($pluginName) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $QBCredentials = $DB->select("SELECT data,p_id FROM plugin_details WHERE name = '$pluginName' AND userID = '" . $_SESSION["userId"] . "' ");
            return $this->returnJson($QBCredentials);
        }
    }

    public function saveQBPluginCredentials($pluginName, $data, $update_plag, $pid) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            if ($pluginName == 'Quickbook') {
                $dataencode = json_encode($data, TRUE);
                if ($update_plag == '1') {
                    $DB->update("UPDATE plugin_details SET `releam_id` = '" . $data["realmId"] . "' ,`data` = '$dataencode' WHERE p_id = '$pid' AND  userID = '" . $_SESSION["userId"] . "' ");
                } else {
                    $DB->update("UPDATE plugin_details SET active = '0'  WHERE name = 'Quickbook' AND userID = '" . $_SESSION["userId"] . "'");
                    $DB->update("INSERT INTO plugin_details(`name`,`company_id`,`releam_id`,`data`,`userID`,`active`) values('$pluginName','" . $_SESSION["company_id"] . "','" . $data["realmId"] . "','$dataencode','" . $_SESSION["userId"] . "','1')  ");
                }
            }
        }
    }

    public function saveFinicityPluginCredentials($pluginName, $data) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            if ($pluginName == 'Finicity') {
                $DB->update("UPDATE plugin_details SET active = '0'  WHERE name = 'Finicity' AND userID = '" . $_SESSION["userId"] . "'");
                $DB->update(" INSERT INTO plugin_details(`name`,`company_id`,`data`,`userID`,`active`) values('$pluginName','" . $_SESSION["company_id"] . "','$data','" . $_SESSION["userId"] . "','1')  ");
            }
        }
    }

    public function deleteQBOPluginData($pluginName, $pid) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $QBCredentials = $DB->select("SELECT data,p_id FROM plugin_details WHERE name = '$pluginName' AND userID = '" . $_SESSION["userId"] . "' AND p_id = '$pid' ");
            return $this->returnJson($QBCredentials);
        }
    }

    public function deleteQBPluginInfo($infoId, $pid) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("DELETE FROM plugin_details WHERE name = '$infoId' AND userID = '" . $_SESSION["userId"] . "' AND p_id = '$pid' ");
        }
    }

    public function getCurrentUserList() {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $userlist = $DB->select("SELECT * FROM (SELECT id,CONCAT(first_name,' ',last_name) as full_name,profilepic FROM users WHERE id != '" . $_SESSION["userId"] . "') A1 LEFT JOIN (SELECT c_id,user_one,user_two FROM conversation WHERE user_one = '" . $_SESSION["userId"] . "') A2 ON id = user_two GROUP BY id order by c_id DESC");
            return $this->returnJson($userlist);
        }
    }

    public function getLatestChartUser() {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $userlist = $DB->select("SELECT `c_id` , `user_two` FROM `conversation` WHERE `user_one` = '" . $_SESSION["userId"] . "'  ORDER BY c_id DESC");
            return $this->returnJson($userlist);
        }
    }

    public function getRandomIdInfo($userData) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $userInfo = $DB->select(" SELECT max(c_id) as c_id FROM conversation WHERE user_one = '" . $_SESSION["userId"] . "' AND user_two = " . $userData["chartUserId"] . " AND chat_user_randomId = '" . $userData["chartUserRandomId"] . "' ");
            return $this->returnJson($userInfo);
        }
    }

    public function insertChatUserInfo($userData) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update(" INSERT INTO conversation(user_one,user_two,chat_user_randomId) values('" . $_SESSION["userId"] . "','" . $userData["chartUserId"] . "','" . $userData["chartUserRandomId"] . "') ");
        }
    }

    public function insertChatMessage($result, $userData) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("INSERT INTO conversation_reply(reply,user_id_fk,c_id_fk) values('" . nl2br(htmlentities($userData["chatContent"], ENT_QUOTES, 'UTF-8')) . "','" . $_SESSION["userId"] . "',$result)");
        }
    }

    public function selectChatMessage($chartuserId) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $chatInfo = $DB->select(" SELECT ms.user_one,ms.user_two,ms.time,ms.reply,us.first_name,(SELECT first_name FROM users WHERE id=ms.user_two ) as first_name1,profilepic FROM (SELECT user_one,user_two,a2.time,reply FROM (SELECT * FROM `conversation` WHERE (`user_one` = '" . $_SESSION["userId"] . "' AND `user_two` ='$chartuserId') OR (`user_one` = '$chartuserId' AND `user_two` ='" . $_SESSION["userId"] . "')) a1
                                     LEFT JOIN (SELECT * FROM conversation_reply) a2 ON a1.c_id = a2.c_id_fk ) ms LEFT JOIN (SELECT id,first_name,profilepic FROM users) us ON us.id = ms.user_one ORDER BY  ms.time ");

            return $this->returnJson($chatInfo);
        }
    }

    public function getMsgNotification() {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $date = date('Y-m-d H:i:s');
            $notification = $DB->select(" SELECT * FROM(SELECT * FROM(SELECT 'Message' as category,cs.user_one as 'userid',DATE_FORMAT(cr.time, '%b %d %Y %r') as 'msgtime',cr.reply as 'msg' FROM `conversation` cs,conversation_reply cr WHERE `c_id` = c_id_fk AND `user_two` = '" . $_SESSION["userId"] . "' ORDER BY cr.`time` DESC LIMIT 0 , 5) A
                        UNION ALL SELECT * FROM(SELECT 'Notification' as categoryc, `senderid` as 'userid', DATE_FORMAT(`annotime`, '%b %d %Y %r') as 'msgtime', `message` as 'msg' FROM `widget_annotation` WHERE `senderid` != '" . $_SESSION["userId"] . "' ORDER BY `annotime` DESC LIMIT 0 , 5) B) msg
                        LEFT JOIN (SELECT id,	profilepic,CONCAT(first_name,' ',last_name) as `first_name` FROM users) us  ON us.id = msg.userid
                         UNION ALL
                         SELECT 'Todo' as category ,`userid`,DATE_FORMAT(`eventdate`,'%b %d %Y %r') as msgtime,`todo` as msg,`userid` as id,(SELECT profilepic FROM `users` WHERE id ='" . $_SESSION['userId'] . "') as  profilepic , 'Reminder' as first_name FROM `todo` WHERE `eventdate` >= '$date' AND `eventdate` <= '$date' + INTERVAL 1 HOUR AND `userid`='" . $_SESSION['userId'] . "' AND `action`='U'
                         UNION ALL
                         SELECT 'Calendar' as category ,`user_id`,DATE_FORMAT(`startdate`,'%b %d %Y %r') as msgtime,`description` as msg,`user_id` as id,(SELECT profilepic FROM `users` WHERE id ='" . $_SESSION["userId"] . "') as  profilepic , 'Reminder' as first_name FROM `notification_events` WHERE `startdate` >= '$date' AND `startdate` <= '$date' + INTERVAL 1 HOUR AND `user_id`= '" . $_SESSION["userId"] . "' ");
            return $this->returnJson($notification);
        }
    }

    public function getNotifyCount() {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $date = date('Y-m-d H:i:s');
            $notification_count = $DB->select("SELECT COUNT(*) as `Count` FROM `conversation` cs,conversation_reply cr WHERE `c_id` = c_id_fk AND `user_two` = '" . $_SESSION["userId"] . "' AND (cr.time > '" . $_SESSION["previous_login"] . "')
                                 UNION ALL
                             SELECT COUNT(*) as `Count` FROM `todo` WHERE `eventdate` >= '$date' AND `eventdate` <= '$date' + INTERVAL 1 HOUR AND `userid`='" . $_SESSION['userId'] . "' AND `action`='U'
                                 UNION ALL
                                SELECT COUNT(*) as `Count` FROM `notification_events` WHERE `startdate` >= '$date' AND `startdate` <= '$date' + INTERVAL 1 HOUR AND `user_id`= '" . $_SESSION["userId"] . "' ");
            return $this->returnJson($notification_count);
        }
    }

    public function getAllUserList() {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $user_list = $DB->select("SELECT U.id, CONCAT(first_name,' ',last_name) AS `Username` , email AS email,UR.role AS role,user_type_id,DATE_FORMAT(last_login,'%d-%b-%Y %r') AS last_login , ip,active FROM users U,users_role UR WHERE U.user_role = UR.id  ORDER BY U.last_login DESC");
            return $this->returnJson($user_list);
        }
    }

    public function getExistingRole() {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $role_list = $DB->select("SELECT * FROM users_role ");
            return $this->returnJson($role_list);
        }
    }

    public function getUserInfoDetails($data) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $user_info = $DB->select("SELECT * FROM users WHERE id= '$data' ");
            return $this->returnJson($user_info);
        }
    }

    public function updateUserInfo($data) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("UPDATE users SET `first_name` = '" . $data["frstname"] . "' ,`last_name` = '" . $data["lstname"] . "' ,`user_role` = '" . $data["role"] . "'  WHERE id = '" . $data["user_id"] . "'");
        }
    }

    public function resetPassword($data) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("UPDATE users SET `password` = '" . $data["password"] . "', `password_string`= '" . $data["pswstr"] . "' WHERE id = '" . $data["resetId"] . "' ");
        }
    }

    public function changeUserStatus($data) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("UPDATE users SET  active = '" . $data["status"] . "' WHERE id = '" . $data["id"] . "' ");
        }
    }

    public function insertUser($data) {

        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("INSERT INTO users(`password`,`password_string`,`first_name`,`last_name`,`email`,`user_role`,`user_type_id`)
                          VALUES('" . $data["password"] . "','" . $data["pswstr"] . "','" . $data["frstname"] . "','" . $data["lstname"] . "','" . $data["email"] . "','" . $data["role"] . "','3') ");

            $id = $DB->select(" SELECT id FROM users WHERE email = '" . $data["email"] . "' ");
            $result = $this->returnJson($id);
            $result = $result[0]["id"];

            $DB->update("INSERT INTO menu_users(`menu_id`,`user_id`) values('1332',$result),('1333',$result),('1334',$result),('1335',$result),('1336',$result),('1338',$result)");

            $database = str_replace('_admin', '', $_SESSION["dynamic_db_name"]);
            DB::update("INSERT INTO 1dash_app_userlist(`email_id`,`comany_name`) values('" . $data["email"] . "','$database') ");
        }
    }

    public function deleteUser($data) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $DB->update("DELETE FROM users WHERE id = '" . $data["userId"] . "' ");
            DB::update("DELETE FROM 1dash_app_userlist WHERE email_id = '" . $data["email"] . "' ");
        }
    }

    public function emailCheck($data) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $emailid = $DB->select("SELECT email FROM users WHERE email = '" . $data . "' ");
            return $this->returnJson($emailid);
        }
    }

    public function emailCheck_commoDB($data) {
        $emailid = DB::select(" SELECT email_id FROM 1dash_app_userlist WHERE email_id = '" . $data . "' ");
        return $this->returnJson($emailid);
    }

    public function getRoleExist($role) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {

            $role = $DB->select("SELECT role FROM users_role WHERE role='$role' ");
            return $this->returnJson($role);
        }
    }

    public function insertRole($data) {
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {

            $DB->update(" INSERT INTO users_role(`role`) Values('" . TRIM($data["newrole"]) . "') ");
        }
    }

    public function getBrowserInfo() {
        $ua = strtolower($_SERVER['HTTP_USER_AGENT']);
        $os = "";

        if (preg_match('/(iphone)[ \/]([\w.]+)/', $ua)) {
            $os = 'Iphone';
        } elseif (preg_match('/(ipad)[ \/]([\w.]+)/', $ua)) {
            $os = 'Ipad';
        } elseif (preg_match('/(ipod)[ \/]([\w.]+)/', $ua)) {
            $os = 'Ipod';
        } elseif (preg_match('/(android)[ \/]([\w.]+)/', $ua)) {
            $os = 'Android';
        } elseif (preg_match('/(windows ce.*(ppc|smartphone|mobile|[0-9]{3}x[0-9]{3})|window mobile|windows phone [0-9.]+|wce;)[ \/]([\w.]+)/', $ua)) {
            $os = 'Windows Mobile';
        } elseif (preg_match('/(windows phone os|xblwp7|zunewp7)[ \/]([\w.]+)/', $ua)) {
            $os = 'Windows Phone OS';
        } elseif (preg_match('/(windows)[ \/]([\w.]+)/', $ua)) {
            $os = 'WindowsOS';
        } elseif (preg_match('/(linux)[ \/]([\w.]+)/', $ua)) {
            $os = 'Linux';
        } elseif (preg_match('/(macintosh|mac)[ \/]([\w.]+)/', $ua)) {
            $os = 'MacOS';
        } elseif (preg_match('/(blackberry|rim tablet os)[ \/]([\w.]+)/', $ua)) {
            $os = 'Blackberry';
        } elseif (preg_match('/(palmos|avantgo|blazer|elaine|hiptop|palm|plucker|xiino)[ \/]([\w.]+)/', $ua)) {
            $os = 'Palm OS';
        } elseif (preg_match('/(symbian|symbos|series60|series40|syb-[0-9]+|\bs60\b)[ \/]([\w.]+)/', $ua)) {
            $os = 'Symbian OS';
        } elseif (preg_match('/(j2me/midp|java/)[ \/]([\w.]+)/', $ua)) {
            $os = 'JavaOS';
        } elseif (preg_match('/(\bbada\b)[ \/]([\w.]+)/', $ua)) {
            $os = 'BadaOS';
        } elseif (preg_match('/(webos|hpwos)[ \/]([\w.]+)/', $ua)) {
            $os = 'WebOS';
        }

        // you can add different browsers with the same way ..
        if (preg_match('/(chromium)[ \/]([\w.]+)/', $ua)) {
            $browser = 'chromium';
        } elseif (preg_match('/(chrome)[ \/]([\w.]+)/', $ua)) {
            $browser = 'chrome';
        } elseif (preg_match('/(safari)[ \/]([\w.]+)/', $ua)) {
            $browser = 'safari';
        } elseif (preg_match('/(opera)[ \/]([\w.]+)/', $ua)) {
            $browser = 'opera';
        } elseif (preg_match('/(msie)[ \/]([\w.]+)/', $ua)) {
            $browser = 'msie';
        } elseif (preg_match('/(mozilla)[ \/]([\w.]+)/', $ua)) {
            $browser = 'mozilla';
        }

        preg_match('/(' . $browser . ')[ \/]([\w]+)/', $ua, $version);

        return array($browser, $version[2], 'OS' => $os, 'name' => $browser, 'version' => $version[2]);
    }

    public function updateLastLogin($id = 0) /* UPDATE LOGIN DATETIME index.php */ {
        $browserinfo = $this->getBrowserInfo();
        $browserinfo = $browserinfo["OS"] . " , " . ucfirst($browserinfo["name"]) . " v." . $browserinfo["version"];
        $DB = DB::connection('dynamic_mysql');
        if ($DB->getPdo()) {
            $date = date('Y-m-d H:i:s');
            $sql = "UPDATE `users` SET browser_type='" . $browserinfo . "',previous_login = last_login,";
            $sql .= "last_login='$date',ip='" . $_SERVER["REMOTE_ADDR"] . "',session='" . session_id() . "'";
            $sql .= " ,login_attempt_faild_time = NULL,login_attempt_faild_count = '' WHERE id='" . $id . "'";
            $DB->update($sql);
        }
    }

    public function getEmailIdExits($credentials) {
        $users = DB::select('select comany_name from 1dash_app_userlist where email_id = ?', $credentials);
        $result = $this->returnJson($users);
        if ($result) {
            $dynamic_db_name = $result[0]['comany_name'] . "_admin";
            Config::set('database.connections.dynamic_mysql.database', $dynamic_db_name);
            $DB = DB::connection('dynamic_mysql');
            if ($DB->getPdo()) {
                $sql = $DB->select("SELECT id,email,password as token,first_name FROM users  WHERE email = ?", $credentials);
                $DB->update("UPDATE users SET  Link_update_time = NOW() where email = ? ", $credentials);
                return $this->returnJson($sql);
            }
        }
    }

    public function checkLinkValid($username, $token) {
        $credntials = [$username, $token];
        $users = DB::select('select comany_name from 1dash_app_userlist where email_id = ?', $credntials);
        $result = $this->returnJson($users);
        if ($result) {
            $dynamic_db_name = $result[0]['comany_name'] . "_admin";
            Config::set('database.connections.dynamic_mysql.database', $dynamic_db_name);
            $DB = DB::connection('dynamic_mysql');
            if ($DB->getPdo()) {
                $sql = $DB->select("SELECT `id` FROM users WHERE `email` = ? AND `password` = ?  AND TIMESTAMPDIFF(HOUR, `Link_update_time`, NOW()) <= 24 ", $credntials);
                return $this->returnJson($sql);
            }
        }
    }

    public function updateForgotPassword($password_str, $enc_pwd, $userId,$username) {
        $credntials = [$username];
        $credntials1 = [$enc_pwd,$password_str,$userId];
        
        $users = DB::select('select comany_name from 1dash_app_userlist where email_id = ?', $credntials);
        $result = $this->returnJson($users);
        if ($result) {
            $dynamic_db_name = $result[0]['comany_name'] . "_admin";
            Config::set('database.connections.dynamic_mysql.database', $dynamic_db_name);
            $DB = DB::connection('dynamic_mysql');
            if ($DB->getPdo()) {
                 $DB->update("UPDATE users SET password = ?,password_string = ? WHERE id = ?",$credntials1);
            }
        }
    }

}

/**
 * Experimental db calls, it may remove or move to some other place
 */
/*public function zzzzzgetName($email_id) {
$users = DB::select('select email_id from 1dash_app_userlist where id= ? AND email_id = ?', $email_id);
return $users;
}
public function zzzzzzzzzzzzzgetPlugins() {
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
public function zzzzzzzzzzzzgetUsers() {
// $DB = DB::connection('dynamic_mysql')->getPdo();
$DB = DB::connection('dynamic_mysql');
if ($DB->getPdo()) {
$users = $DB->select('select * from users;');
// $users1  = DB::select('select email_id from 1dash_app_userlist where id= ? AND email_id = ?', $email_id);
return $users;
}
}
//==================================================================================================
 */