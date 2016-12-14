<?php

ini_set("display_errors", "1");
error_reporting(E_ALL);

if (isset($_GET["username"])) {
	$email_id = $_GET["username"];
	$servername = "onedashproductiondb.c5neuhfqwfi1.us-west-2.rds.amazonaws.com";
	$username = "awsmasteruser";
	$password = "1dashlisa#123$";
	$dbname = "1dash_common";

	$conn = new mysqli($servername, $username, $password);

	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}

	$sql = "SELECT * FROM " . $dbname . ".user_details WHERE email_id ='$email_id' AND email_confirmation = '0' ";
	$result = $conn->query($sql);
	$result_array = $result->fetch_assoc();

	if ($result_array) {
		function randString($length, $charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789') {
			$str = '';
			$count = strlen($charset);
			while ($length--) {
				$str .= $charset[mt_rand(0, $count - 1)];
			}
			return $str;
		}

		$pwkey = randString(2);
		$psswd = md5($result_array["password"] . $pwkey);
		$cmpy = str_replace(' ', '', $result_array["company"]);
		$cmpy = substr($cmpy, 0, 10) . rand(10, 10000);
		$cmpy = preg_replace('/[^A-Za-z0-9\-]/', '', $cmpy);
		$email = $result_array["email_id"];
		$firsname = $result_array["first_name"];
		$lastname = $result_array["last_name"];
		$affliate_code = $result_array["affliate_code"];

		$sql1 = "CREATE DATABASE " . $cmpy . "_admin";
		$sql2 = "CREATE DATABASE " . $cmpy . "_analytics";
		$conn->query($sql1);
		$conn->query($sql2);

		$db1 = $cmpy . "_admin";
		$db3 = $cmpy . "_analytics";
		system("mysql --user=awsmasteruser --host=onedashproductiondb.c5neuhfqwfi1.us-west-2.rds.amazonaws.com --port=3306 --password=1dashlisa#123$ $db1</var/www/html/public/databases/1dash_admin_db.sql");

		$sql3 = "INSERT INTO " . $cmpy . "_admin.users(email,first_name,last_name,password,password_string,user_role,user_type_id) values('$email','$firsname','$lastname','$psswd','$pwkey','11','1')";
		$conn->query($sql3);
		$user_id = mysqli_insert_id($conn);

		$sql5 = "INSERT INTO " . $cmpy . "_admin.menu_users(menu_id,user_id) values('1332','$user_id'),('1333','$user_id'),('1334','$user_id'),('1336','$user_id'),('1337','$user_id'),('1338','$user_id')";
		$conn->query($sql5);

		$sql6 = "INSERT INTO $dbname.1dash_app_userlist(email_id,comany_name) values('$email','$cmpy')";
		$conn->query($sql6);

		$sql7 = "UPDATE " . $dbname . ".user_details SET email_confirmation = '1' WHERE email_id ='$email_id' ";
		$conn->query($sql7);

		$conn->close();

		$username = $firsname;
		$password = $result_array["password"];
		$url = 'http://app.1dash.com/1dash_email.php';
		$postFields = array('adduser' => 'adduser', 'add_username' => $username, 'password' => $password, 'email' => $email, 'affliate_code' => $affliate_code);
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postFields));
		$max_exe_time = 350; // time in milliseconds
		curl_setopt($ch, CURLOPT_TIMEOUT_MS, $max_exe_time);
		$result = curl_exec($ch);
		curl_close($ch);

		$url = "location:https://app.1dash.com/";
		header($url);

	} else {
		echo "Email Id Already Exist in 1Dash App!";
	}
}

?>
