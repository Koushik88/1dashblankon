<?php
include_once 'shopify_config.php';

/*---------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
------------------------------******Shopify API Calls******------------------------------
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------*/
/*
 * Shopify->Customers
 */
function get_customers() {
	$api_resource = '/admin/customers.json';
	$api_url = 'https://' . API_KEY . ':' . API_PASSWORD . '@' . HOSTNAME . $api_resource;
	$result = httpGet($api_url);
	return $result;
}
/*
 * Shopify->Orders
 */
function get_orders() {
	$api_resource = '/admin/orders.json';
	$api_url = 'https://' . API_KEY . ':' . API_PASSWORD . '@' . HOSTNAME . $api_resource;
	$result = httpGet($api_url);
	return $result;
}
/*
 * Shopify->Fulfillments
 */
function get_fulfillments($order_id) {
	$api_resource = '/admin/orders/' . $order_id . '/fulfillments.json';
	$api_url = 'https://' . API_KEY . ':' . API_PASSWORD . '@' . HOSTNAME . $api_resource;
	$result = httpGet($api_url);
	return $result;
}
/*
 * Shopify->Refunds
 */
function get_refunds($order_id) {
	$api_resource = '/admin/orders/' . $order_id . '/refunds.json';
	$api_url = 'https://' . API_KEY . ':' . API_PASSWORD . '@' . HOSTNAME . $api_resource;
	$result = httpGet($api_url);
	return $result;
}
/*
 * Shopify->Transactions
 */
function get_transactions($order_id) {
	$api_resource = '/admin/orders/' . $order_id . '/transactions.json';
	$api_url = 'https://' . API_KEY . ':' . API_PASSWORD . '@' . HOSTNAME . $api_resource;
	$result = httpGet($api_url);
	return $result;
}
/*---------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
--------------------------******WooCommerce API Calls******------------------------------
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------*/
// require_once 'lib/woocommerce-api.php';
use WC_API_Client;
use WC_API_Client_Exception;
/*
 * WooCommerce->Customers
 */
function getWooComm_Customers() {
	try {
		//setup API connection
		$client = new WC_API_Client(STORE_URL, CONSUMER_KEY, CONSUMER_SECRET);
	} catch (WC_API_Client_Exception $e) {

		echo $e->getMessage() . PHP_EOL;
		echo $e->getCode() . PHP_EOL;

		if ($e instanceof WC_API_Client_HTTP_Exception) {

			pr($e->get_request());
			pr($e->get_response());
		}
	}
	//get_customers
	$customers = $client->customers->get();
	return $customers;
}
/*
 * WooCommerce->Orders
 */
function getWooComm_Orders() {
	try {
		//setup API connection
		$client = new WC_API_Client(STORE_URL, CONSUMER_KEY, CONSUMER_SECRET);
	} catch (WC_API_Client_Exception $e) {

		echo $e->getMessage() . PHP_EOL;
		echo $e->getCode() . PHP_EOL;

		if ($e instanceof WC_API_Client_HTTP_Exception) {

			pr($e->get_request());
			pr($e->get_response());
		}
	}

	//get orders
	$orders = $client->orders->get();
	return $orders;
}
/*
 * WooCommerce->Refunds
 */
function getWooComm_Refunds($order_id) {
	try {
		//setup API connection
		$client = new WC_API_Client(STORE_URL, CONSUMER_KEY, CONSUMER_SECRET);
	} catch (WC_API_Client_Exception $e) {

		echo $e->getMessage() . PHP_EOL;
		echo $e->getCode() . PHP_EOL;

		if ($e instanceof WC_API_Client_HTTP_Exception) {

			pr($e->get_request());
			pr($e->get_response());
		}
	}

	//Order's ID to get details about refund
	//get refund related to an order
	$refund = $client->order_refunds->get($order_id);
	return $refund;
}

/*---------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
--------------------------******BigCommerce API Calls******------------------------------
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------*/
/*
 * BigCommerce->Customers
 */
function getbigcomm_customers() {
	$api_url = API_PATH . 'customers.json';
	$result = httpGetBigCommerce($api_url);
	return $result;
}
/*
 * BigCommerce->Orders
 */
function getbigcomm_orders() {
	$api_url = API_PATH . 'orders.json';
	$result = httpGetBigCommerce($api_url);
	return $result;
}
/*
 * BigCommerce->Others
 */
function getbigcomm_others($api_url) {
	$result = httpGetBigCommerce($api_url);
	return $result;
}

/*---------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
--------------------------******Ebay API Calls******------------------------------
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------*/
/*
 * Ebay->Orders
 */
function get_ebay_orders() {
	$compatability_level = compatability_level;
	$devID = devID;
	$appID = appID;
	$certID = certID;
	$server_url = server_url;
	$user_token = user_token;
	// 	SiteID must also be set in the Request's XML
	// SiteID = 0  (US) - UK = 3, Canada = 2, Australia = 15,...
	// SiteID Indicates the eBay site to associate the call with
	$siteID = 0;

	// the call being made:
	$call = 'GetOrders';
	// Time with respect to GMT
	// by default retreive orders in last 30 minutes
	$create_time_from = gmdate("Y-m-d\TH:i:s", time() - 1800000000); //current time minus time in seconds
	$create_time_to = gmdate("Y-m-d\TH:i:s");
	//If you want to hard code From and To timings, Follow the below format in "GMT".
	//$create_time_from = YYYY-MM-DDTHH:MM:SS; //GMT
	//$create_time_to = YYYY-MM-DDTHH:MM:SS; //GMT
	//Build the request Xml string
	$request_body = '<?xml version="1.0" encoding="utf-8" ?>';
	$request_body .= '<GetOrdersRequest xmlns="urn:ebay:apis:eBLBaseComponents">';
	$request_body .= '<DetailLevel>ReturnAll</DetailLevel>';
	$request_body .= "<CreateTimeFrom>$create_time_from</CreateTimeFrom><CreateTimeTo>$create_time_to</CreateTimeTo>";
	$request_body .= '<OrderRole>Seller</OrderRole><OrderStatus>All</OrderStatus>';
	$request_body .= "<RequesterCredentials><eBayAuthToken>$user_token</eBayAuthToken></RequesterCredentials>";
	$request_body .= '</GetOrdersRequest>';

	// creating the headers for request
	$headers = build_ebay_headers($devID, $appID, $certID, $compatability_level, $siteID, $call);
	//send the request and get response
	$data = ebayOrdersAPI($request_body, $headers, $server_url);
	// SimpleXML seems to have problems with the colon ":" in the <xxx:yyy> response tags, so take them out
	$xml_data = preg_replace("/(<\/?)(\w+):([^>]*>)/", "$1$2$3", $data);
	$xml = simplexml_load_string($xml_data);
	$json = json_encode($xml);
	$responseArray = json_decode($json, true);

	// echo "<pre>";
	// print_r($responseArray);
	return $responseArray;
}
/** 	buildEbayHeaders
Generates an array of string to be used as the headers for the HTTP request to eBay
Output:	String Array of Headers applicable for this call
 */
function build_ebay_headers($devID, $appID, $certID, $compatability_evel, $siteID, $call) {
	$headers = array(
		'X-EBAY-API-COMPATIBILITY-LEVEL: ' . $compatability_evel,
		'X-EBAY-API-DEV-NAME: ' . $devID,
		'X-EBAY-API-APP-NAME: ' . $appID,
		'X-EBAY-API-CERT-NAME: ' . $certID,
		'X-EBAY-API-CALL-NAME: ' . $call,
		'X-EBAY-API-SITEID: ' . $siteID,
	);

	return $headers;
}
