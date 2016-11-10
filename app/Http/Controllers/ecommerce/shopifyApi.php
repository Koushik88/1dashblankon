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