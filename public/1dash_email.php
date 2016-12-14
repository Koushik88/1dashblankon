<?php



if(isset($_REQUEST['adduser'])){

                                 $username = $_REQUEST['add_username'];
				 $link = $_REQUEST['link'];
				 $location=$_REQUEST['location'];
				 $email = $_REQUEST['email'];
                                 $password = $_REQUEST["password"];
				 $affliate_code = $_REQUEST["affliate_code"]; 	
				if($affliate_code)
				{
					$affliate_code = "Coupon : QBPROREFERRAL";		
				}	

              REQUIRE_ONCE("smtp/PHPMailerAutoload.php");
              $mail = new PHPMailer();
	      $mail->IsSMTP();  // set mailer to use SMTP
              header("Content-Type: text/html; charset=utf-8");
				$mail->Host = 'email-smtp.us-west-2.amazonaws.com';
				$mail->Port = 25;
				$mail->SMTPAuth = true;
				$mail->Username = "AKIAJQQVUEKLUTDGE63A";
				$mail->Password = "AlO1ihy6isrdyw7xO1RI31lxhcOX6dCErnyOPiLehBYD";
				$mail->setFrom("noreply@1dash.com", '1Dash');


	              $mail->AddAddress($email,"");
	              $mail->IsHTML(true);     
                      $mail->Subject = "1Dash : Welcome Email";
	              $mail->Body = "<html>
					<body>

					<div>
					<div>
					<table width='600' align='left' border='0' cellspacing='0' cellpadding='0' style='width:600px;'>
					<tbody><tr>
					<td colspan='2' style='margin:0;'>
					<div><h3>Welcome to 1Dash<sup><small>TM</small></sup>!</h3></div><div>Thanks for confirming your email ID. <br></div><div><br></div><div>Do store the below credentials to login to your 1Dash<sup><small>TM</small></sup> dashboards in future.</div><div><br></div><div>URL: <a href='https://app.1dash.com/' target='_blank' style='font-size:15px'>https://app.1dash.com/</a></div><div>Username: $email </div><div>Password:$password </div><div>$affliate_code</div><div><br></div><br style='font-size:12.8px'><span style='font-size:12.8px'>Thank you,</span><br style='font-size:12.8px'><span style='font-size:12.8px'>1Dash&trade; Team</span><br></div><div><br></div><div><br></div><div>

					<br>
					</body>
					</html>";
                    if(!$mail->Send())
                            {
                               echo "Message could not be sent. <p>";
                               echo "Mailer Error: " . $mail->ErrorInfo;
                               exit;
                            } 

                            echo "Message has been sent";
}
