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
	 * @param  [type] $pluginName  [description]
	 * @param  [type] $data        [description]
	 * @param  [type] $update_plag [description]
	 * @param  [type] $pid         [description]
	 * @return [type]              [description]
	 */
	public function savePluginCredentials($pluginName, $data, $update_plag = null, $pid = null) {
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

	/*public function getRssFeedTab()
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

}
