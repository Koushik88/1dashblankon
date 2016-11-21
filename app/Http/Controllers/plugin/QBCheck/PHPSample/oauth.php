<?php 
session_start();
require_once("./config.php");

 
define('OAUTH_REQUEST_URL', 'https://oauth.intuit.com/oauth/v1/get_request_token');
define('OAUTH_ACCESS_URL', 'https://oauth.intuit.com/oauth/v1/get_access_token');
define('OAUTH_AUTHORISE_URL', 'https://appcenter.intuit.com/Connect/Begin');

// The url to this page. it needs to be dynamic to handle runnable's dynamic urls

define('CALLBACK_URL',$_SESSION["PORTALLOCATION"].'plugin/PHPSample/oauth.php');
// cleans out the token variable if comming from
// connect to QuickBooks button
if ( isset($_GET['start'] ) ) {
  unset($_SESSION['oauth_token']);
}
 
try {
  $oauth = new OAuth( OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET, OAUTH_SIG_METHOD_HMACSHA1, OAUTH_AUTH_TYPE_URI);
  $oauth->enableDebug();
  $oauth->disableSSLChecks(); //To avoid the error: (Peer certificate cannot be authenticated with given CA certificates)
  if (!isset( $_GET['oauth_token'] ) && !isset($_SESSION['oauth_token']) ){
	// step 1: get request token from Intuit
    $request_token = $oauth->getRequestToken( OAUTH_REQUEST_URL, CALLBACK_URL );
		$_SESSION['secret'] = $request_token['oauth_token_secret'];
		// step 2: send user to intuit to authorize 
		header('Location: '. OAUTH_AUTHORISE_URL .'?oauth_token='.$request_token['oauth_token']);
	}
	
	if ( isset($_GET['oauth_token']) && isset($_GET['oauth_verifier']) ){
		// step 3: request a access token from Intuit
                $oauth->setToken($_GET['oauth_token'], $_SESSION['secret']);
		$access_token = $oauth->getAccessToken( OAUTH_ACCESS_URL );
	    
                
                
              
        function encrypt_string($string = '', $salt = '8638FD63E6CC16872ACDED6CE49E5A270ECDE1B3B938B590E547138BB7F120VG') {
    	$key = pack('H*', $salt);    
    	$iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
    	$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
    	$ciphertext = mcrypt_encrypt(MCRYPT_RIJNDAEL_128, $key, $string, MCRYPT_MODE_CBC, $iv);
    	return base64_encode($iv . $ciphertext);
	}

	/** Encoded Decoded with 256 bits * */        
        $_SESSION["QBouth"] = array('oauth_token'=>encrypt_string($access_token["oauth_token"]),'oauth_token_secret'=>encrypt_string($access_token["oauth_token_secret"]),'realmId'=>encrypt_string($_REQUEST['realmId']),'OAUTH_CONSUMER_KEY'=>encrypt_string(OAUTH_CONSUMER_KEY),'OAUTH_CONSUMER_SECRET'=>encrypt_string(OAUTH_CONSUMER_SECRET));
          
    // write JS to pup up to refresh parent and close popup
    echo '<script type="text/javascript">
            window.opener.location.href = window.opener.location.href;
            window.close();
          </script>';
  }
 
} catch(OAuthException $e) {
	echo "Got auth exception";
	echo '<pre>';
	print_r($e);
}

?>
