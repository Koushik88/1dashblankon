<?php

// load from db
//private app credentials shopify
// define('API_KEY', 'd90122367b80cc4287a4c679005b240f');
// define('API_PASSWORD', '736057299e7a05a50d59e6999f435d19');
// define('HOSTNAME', '1dash.myshopify.com');

//API apps credentials WooCommerce
// define("CONSUMER_KEY", "ck_7996d526b43c81b38034cf112cf146f7901b25fb");
// define("CONSUMER_SECRET", "cs_62e1336680e14d051e1e550579aab990165d450d");
// define("STORE_URL", "http://dev.techmarbles.com/wordpress/");

//private app credentials BigCommerce
// define('USERNAME', 'techmarbles');
// define('API_PATH', 'https://store-adr4joaidk.mybigcommerce.com/api/v2/');
// define('API_TOKEN', '3b291a238d0ebbd723bb09381079469daab77820');

/*
 * Get credentials from db
 */
use App\Admin;
use Config;
$userId = $_SESSION["userId"];
$shopify_config = "no";
$shopify_msg = "You have not linked your shopify account with us, kindly add a connection.";
$woocomm_config = "no";
$woocomm_msg = "You have not linked your woocommerce account with us, kindly add a connection.";
$bigcomm_config = "no";
$bigcomm_msg = "You have not linked your bigcommerce account with us, kindly add a connection.";
$amazon_config = "no";
$amazon_msg = "You have not linked your amazon account with us,kindly add a connection.";
$ebay_config = "no";
$ebay_msg = "You have not linked your ebay account with us, kindly add a connection.";

$userId = $_SESSION["userId"];
Config::set('database.connections.dynamic_mysql.database', $_SESSION["dynamic_db_name"]);
$admin_obj = new Admin;
$dbres = $admin_obj->getAllPluginData([$userId]);
foreach ($dbres as $val) {
	if ($val['name'] == "Shopify") {
		$shopify_config = "yes";
		// CREDENTIALS
		$pluginsData = json_decode($val['data'], true);
		define('API_KEY', $pluginsData['shopify_api_key']);
		define('API_PASSWORD', $pluginsData['shopify_api_secret']);
		define('HOSTNAME', $pluginsData['shopify_hostname']);
	}
	if ($val['name'] == "WooCommerce") {
		$woocomm_config = "yes";
		// CREDENTIALS
		$pluginsData = json_decode($val['data'], true);
		define('CONSUMER_KEY', $pluginsData['woocom_consumer_key']);
		define('CONSUMER_SECRET', $pluginsData['woocom_consumer_secret']);
		define('STORE_URL', $pluginsData['woocom_store_url']);
	}
	if ($val['name'] == "BigCommerce") {
		$bigcomm_config = "yes";
		// CREDENTIALS
		$pluginsData = json_decode($val['data'], true);
		define('USERNAME', $pluginsData['bigcom_username']);
		define('API_PATH', $pluginsData['bigcom_api_path']);
		define('API_TOKEN', $pluginsData['bigcom_api_token']);
	}
}

/*
 * curl function
 * make call to shopify api
 */
function httpGet($url) {
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	// curl_setopt($ch,CURLOPT_HEADER, false);
	$output = curl_exec($ch);

	curl_close($ch);
	return $output;
}

/*
 * curl function
 * make call to bigcommerce api
 */
function httpGetBigCommerce($api_url) {
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $api_url);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Length: 0'));
	curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET');
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
	curl_setopt($ch, CURLOPT_USERPWD, USERNAME . ":" . API_TOKEN);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	$response = curl_exec($ch);

	curl_close($ch);

	return $response;
}
/**
 * All Currency symbol code array
 */
$currency_symbols = array(
	'AED' => '&#1583;.&#1573;', // ?
	'AFN' => '&#65;&#102;',
	'ALL' => '&#76;&#101;&#107;',
	'AMD' => '',
	'ANG' => '&#402;',
	'AOA' => '&#75;&#122;', // ?
	'ARS' => '&#36;',
	'AUD' => '&#36;',
	'AWG' => '&#402;',
	'AZN' => '&#1084;&#1072;&#1085;',
	'BAM' => '&#75;&#77;',
	'BBD' => '&#36;',
	'BDT' => '&#2547;', // ?
	'BGN' => '&#1083;&#1074;',
	'BHD' => '.&#1583;.&#1576;', // ?
	'BIF' => '&#70;&#66;&#117;', // ?
	'BMD' => '&#36;',
	'BND' => '&#36;',
	'BOB' => '&#36;&#98;',
	'BRL' => '&#82;&#36;',
	'BSD' => '&#36;',
	'BTN' => '&#78;&#117;&#46;', // ?
	'BWP' => '&#80;',
	'BYR' => '&#112;&#46;',
	'BZD' => '&#66;&#90;&#36;',
	'CAD' => '&#36;',
	'CDF' => '&#70;&#67;',
	'CHF' => '&#67;&#72;&#70;',
	'CLF' => '', // ?
	'CLP' => '&#36;',
	'CNY' => '&#165;',
	'COP' => '&#36;',
	'CRC' => '&#8353;',
	'CUP' => '&#8396;',
	'CVE' => '&#36;', // ?
	'CZK' => '&#75;&#269;',
	'DJF' => '&#70;&#100;&#106;', // ?
	'DKK' => '&#107;&#114;',
	'DOP' => '&#82;&#68;&#36;',
	'DZD' => '&#1583;&#1580;', // ?
	'EGP' => '&#163;',
	'ETB' => '&#66;&#114;',
	'EUR' => '&#8364;',
	'FJD' => '&#36;',
	'FKP' => '&#163;',
	'GBP' => '&#163;',
	'GEL' => '&#4314;', // ?
	'GHS' => '&#162;',
	'GIP' => '&#163;',
	'GMD' => '&#68;', // ?
	'GNF' => '&#70;&#71;', // ?
	'GTQ' => '&#81;',
	'GYD' => '&#36;',
	'HKD' => '&#36;',
	'HNL' => '&#76;',
	'HRK' => '&#107;&#110;',
	'HTG' => '&#71;', // ?
	'HUF' => '&#70;&#116;',
	'IDR' => '&#82;&#112;',
	'ILS' => '&#8362;',
	'INR' => '&#8377;',
	'IQD' => '&#1593;.&#1583;', // ?
	'IRR' => '&#65020;',
	'ISK' => '&#107;&#114;',
	'JEP' => '&#163;',
	'JMD' => '&#74;&#36;',
	'JOD' => '&#74;&#68;', // ?
	'JPY' => '&#165;',
	'KES' => '&#75;&#83;&#104;', // ?
	'KGS' => '&#1083;&#1074;',
	'KHR' => '&#6107;',
	'KMF' => '&#67;&#70;', // ?
	'KPW' => '&#8361;',
	'KRW' => '&#8361;',
	'KWD' => '&#1583;.&#1603;', // ?
	'KYD' => '&#36;',
	'KZT' => '&#1083;&#1074;',
	'LAK' => '&#8365;',
	'LBP' => '&#163;',
	'LKR' => '&#8360;',
	'LRD' => '&#36;',
	'LSL' => '&#76;', // ?
	'LTL' => '&#76;&#116;',
	'LVL' => '&#76;&#115;',
	'LYD' => '&#1604;.&#1583;', // ?
	'MAD' => '&#1583;.&#1605;.', //?
	'MDL' => '&#76;',
	'MGA' => '&#65;&#114;', // ?
	'MKD' => '&#1076;&#1077;&#1085;',
	'MMK' => '&#75;',
	'MNT' => '&#8366;',
	'MOP' => '&#77;&#79;&#80;&#36;', // ?
	'MRO' => '&#85;&#77;', // ?
	'MUR' => '&#8360;', // ?
	'MVR' => '.&#1923;', // ?
	'MWK' => '&#77;&#75;',
	'MXN' => '&#36;',
	'MYR' => '&#82;&#77;',
	'MZN' => '&#77;&#84;',
	'NAD' => '&#36;',
	'NGN' => '&#8358;',
	'NIO' => '&#67;&#36;',
	'NOK' => '&#107;&#114;',
	'NPR' => '&#8360;',
	'NZD' => '&#36;',
	'OMR' => '&#65020;',
	'PAB' => '&#66;&#47;&#46;',
	'PEN' => '&#83;&#47;&#46;',
	'PGK' => '&#75;', // ?
	'PHP' => '&#8369;',
	'PKR' => '&#8360;',
	'PLN' => '&#122;&#322;',
	'PYG' => '&#71;&#115;',
	'QAR' => '&#65020;',
	'RON' => '&#108;&#101;&#105;',
	'RSD' => '&#1044;&#1080;&#1085;&#46;',
	'RUB' => '&#1088;&#1091;&#1073;',
	'RWF' => '&#1585;.&#1587;',
	'SAR' => '&#65020;',
	'SBD' => '&#36;',
	'SCR' => '&#8360;',
	'SDG' => '&#163;', // ?
	'SEK' => '&#107;&#114;',
	'SGD' => '&#36;',
	'SHP' => '&#163;',
	'SLL' => '&#76;&#101;', // ?
	'SOS' => '&#83;',
	'SRD' => '&#36;',
	'STD' => '&#68;&#98;', // ?
	'SVC' => '&#36;',
	'SYP' => '&#163;',
	'SZL' => '&#76;', // ?
	'THB' => '&#3647;',
	'TJS' => '&#84;&#74;&#83;', // ? TJS (guess)
	'TMT' => '&#109;',
	'TND' => '&#1583;.&#1578;',
	'TOP' => '&#84;&#36;',
	'TRY' => '&#8356;', // New Turkey Lira (old symbol used)
	'TTD' => '&#36;',
	'TWD' => '&#78;&#84;&#36;',
	'TZS' => '',
	'UAH' => '&#8372;',
	'UGX' => '&#85;&#83;&#104;',
	'USD' => '&#36;',
	'UYU' => '&#36;&#85;',
	'UZS' => '&#1083;&#1074;',
	'VEF' => '&#66;&#115;',
	'VND' => '&#8363;',
	'VUV' => '&#86;&#84;',
	'WST' => '&#87;&#83;&#36;',
	'XAF' => '&#70;&#67;&#70;&#65;',
	'XCD' => '&#36;',
	'XDR' => '',
	'XOF' => '',
	'XPF' => '&#70;',
	'YER' => '&#65020;',
	'ZAR' => '&#82;',
	'ZMK' => '&#90;&#75;', // ?
	'ZWL' => '&#90;&#36;',
);