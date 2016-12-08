<?php

namespace App\Http\Controllers\ecommerce;

use App\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class EcommerceAjaxController extends Controller {
	public function ecommerce_ajax(Request $request) {
		if ($request->ajax()) {
			include_once 'shopify_config.php';
			include_once 'shopifyApi.php';

			$plugin_type = $request->input('plugin');
			$report_type = $request->input('report_type');
			$period = $request->input('period');
			$today = date("Y-m-d", time());
			// if ($request->input('oder_details')) {
			// 	return $request->input('oder_details');
			// } else {
			// 	return "no order details";
			// }

			if ($period == "thisweek") {
				// Last 7 days
				$periodindays = 7;
				$ago = strtotime(($periodindays - 1) . " day ago");
				$Since = date("Y-m-d", $ago);
			} else if ($period == "thismonth") {
				// Last 30 days
				$periodindays = 30;
				$ago = strtotime("$periodindays day ago");
				$Since = date("Y-m-d", $ago);
			} else if ($period == "last60days") {
				// Last 60 days
				$periodindays = 60;
				$ago = strtotime("$periodindays day ago");
				$Since = date("Y-m-d", $ago);
			} else if ($period == "last90days") {
				// Last 90 days
				$periodindays = 90;
				$ago = strtotime("$periodindays day ago");
				$Since = date("Y-m-d", $ago);
			}

			/*
				 * Shopify API Ajax calls
			*/
			if ($plugin_type == "shopify") {
				if ($shopify_config == "no") {
					echo "<div style='text-align: center;margin: 10% 0px;font-size: 14px;'>$shopify_msg</div>";
					exit();
				}
				if ($report_type == "customers") {
					$customers = get_customers();
					$result = json_decode($customers, true);
					$noresults = true;
					if ($result['errors']) {
						echo "<div style='text-align: center;margin: 10% 0px;font-size: 14px;'>
								<p>" . $result['errors'] . "</p>
								<p>Oops! Something went wrong. Please check your shopify credentials. </p>
								</div>";
						exit();
					}
					$html = '<table class="table table-bordered tile pltable" style="min-width:600px;/*max-width:1000px;*/">';
					$html .= '<thead><tr>
                	<th>Name</th>
                	<th>Location</th>
                	<th>Email Id</th>
                	<th>Total Orders</th>
                	<th>Last Order</th>
                	<th>Total Spent</th>
                	<th>Customer Since</th>
            	</thead></tr><tbody>';
					foreach ($result['customers'] as $value) {
						$date = strtotime($value['created_at']);
						$customer_since = date("Y-m-d", $date);
						if (($customer_since >= $Since) && ($customer_since <= $today)) {
							$noresults = false;
							$html .= '<tr>';
							$html .= '<td>' . '<a href="https://' . HOSTNAME . '/admin/customers/' . $value['id'] . '" target="_blank">' . $value['first_name'] . ' ' . $value['last_name'] . '</a></td>';
							$html .= '<td>' . $value['default_address']['province'] . ', ' . $value['default_address']['country_code'] . '</td>';
							$html .= '<td>' . '<a href="mailto:' . $value['email'] . '" target="_top">' . $value['email'] . '</a></td>';
							$html .= '<td>' . $value['orders_count'] . '</td>';
							$html .= '<td>' . '<a href="https://' . HOSTNAME . '/admin/orders/' . $value['last_order_id'] . '" target="_blank">' . $value['last_order_name'] . '</a></td>';
							$html .= '<td>' . $value['total_spent'] . '</td>';
							$html .= '<td>' . $customer_since . '</td>';
							$html .= '</tr>';
						}
					}
					if ($noresults) {
						$html .= '<tr><td colspan="7" style="text-align: center;">No customer data found for last ' . $periodindays . ' days</td></tr>';
					}
					$html .= '</tbody></table>';
					echo $html;
					exit();
				}
				if ($report_type == "orders") {
					$orders = get_orders();
					$result = json_decode($orders, true);
					$noresults = true;
					if ($result['errors']) {
						echo "<div style='text-align: center;margin: 10% 0px;font-size: 14px;'>
								<p>" . $result['errors'] . "</p>
								<p>Oops! Something went wrong. Please check your shopify credentials. </p>
								</div>";
						exit();
					}

					$html = '<table class="table table-bordered tile pltable" style="min-width:600px;/*max-width:1000px;*/">';
					$html .= '<thead><tr>
					<th>ORDER ID</th>
                	<th>Order Details</th>
                	<th>Product Details</th>
                	<th>Tracking Info</th>
                	<th>Payment Status</th>

                	<th>Transaction</th>
                	<th>Fulfillments</th>
                	<th>Refunds</th>
            		</thead></tr><tbody>';

					foreach ($result['orders'] as $value) {
						$date = strtotime($value['created_at']);
						$order_date = date("Y-m-d", $date);
						if (($order_date >= $Since) && ($order_date <= $today)) {
							$noresults = false;
							$currency = $value['currency'];
							$html .= '<tr>';
							$html .= '<td><a href="https://' . HOSTNAME . '/admin/orders/' . $value['id'] . '" target="_blank" title="ORDER ID">' . $value['name'] . '</a></td>';
							$html .= '<td>
							<a href="https://' . HOSTNAME . '/admin/orders/' . $value['id'] . '" target="_blank" title="ORDER ID">' . $value['name'] . '</a>
							, <span title="ORDER DATE: ' . date("Y-m-d H:i:s", $date) . '">' . $order_date . '</span><br/>
							<span title="TOTAL PRICE">' . $currency_symbols["$currency"] . $value['total_price'] . '</span>
							, <span title="TOTAL DISCOUNT">' . $currency_symbols["$currency"] . $value['total_discounts'] . ' discount</span><br/>
							<span title="TOTAL TAX">Tax: ' . $currency_symbols["$currency"] . $value['total_tax'] . '</span><br/>
							<a href="https://' . HOSTNAME . '/admin/customers/' . $value['customer']['id'] . '" target="_blank" title="CUSTOMER ID">' . $value['customer']['id'] . '</a>
							, <span title=" CUSTOMER NAME">' . $value['customer']['default_address']['name'] . '</span><br/>
							<span title=" CUSTOMER ADDRESS">' . $value['customer']['default_address']['address1'] . '<br />' . $value['customer']['default_address']['address2'] . '</span><br />
							<a href="mailto:' . $value['email'] . '" target="_top" title=" CUSTOMER EMAIL">' . $value['email'] . '</a> <br />
							<span title=" CUSTOMER PHONE">' . $value['customer']['default_address']['phone'] . '</span>
							</td>';
							$html .= '<td><div style="overflow: hidden;max-height: 130px !important;overflow-y: auto;" id="style-3">';
							foreach ($value['line_items'] as $itemdetail) {
								$html .= '<a href="https://' . HOSTNAME . '/admin/products/' . $itemdetail['product_id'] . '" target="_blank" title="PRODUCT ID">#' . $itemdetail['product_id'] . '</a> <br />
							  <span title="PRODUCT NAME">' . $itemdetail['name'] . '</span><br/>
							  <span title="QUANTITY">Quantity: ' . $itemdetail['quantity'] . '</span>,
							  <span title="PRICE">' . $currency_symbols["$currency"] . $itemdetail['price'] . '</span><br/>
							  <span title="TOTAL DISCOUNT">' . $itemdetail['total_discount'] . '% discount</span>
							  ';
								if (count($value['line_items']) != 1) {
									$html .= '<hr>';
								}

							}
							$html .= '</div></td>';
							$html .= '<td>';
							foreach ($value['fulfillments'] as $trackdetail) {
								$html .= '
						<span title="TRACKING COMPANY">' . $trackdetail['tracking_company'] . '</span> -
						<span title="TRACKING NUMBER">#' . $trackdetail['tracking_number'] . '</span> <br/>
						<a href="' . $trackdetail['tracking_url'] . '" title="TRACK ORDER">Track <i class="fa fa-external-link"></i></a><br/>';
								if (count($value['fulfillments']) != 1) {
									$html .= '<hr>';
								}

							}
							$html .= '</td>';
							$html .= '<td>' . $value['financial_status'] . '</td>';

							$html .= '<td><a href="#oder_details_model" data-toggle="modal" onclick=getOrderdetails("transactions",' . $value['id'] . ')>View <i class="fa fa-external-link" aria-hidden="true"></i></a></td>';
							$html .= '<td><a href="#oder_details_model" data-toggle="modal" onclick=getOrderdetails("fulfillments",' . $value['id'] . ')>View <i class="fa fa-external-link" aria-hidden="true"></i></a></td>';
							$html .= '<td><a href="#oder_details_model" data-toggle="modal" onclick=getOrderdetails("refunds",' . $value['id'] . ')>View <i class="fa fa-external-link" aria-hidden="true"></i></a></td>';
							$html .= '</tr>';
						}
						$i++;
					}
					if ($noresults) {
						$html .= '<tr><td colspan="8" style="text-align: center;">No orders data found for last ' . $periodindays . ' days</td></tr>';
					}
					$html .= '</tbody></table>';
					echo $html;
					exit();
				}
				if ($request->input('oder_details') == "oder_details") {
					$order_id = $request->input('order_id');
					if ($report_type == "fulfillments") {
						$fulfillments = get_fulfillments($order_id);
						$result = json_decode($fulfillments, true);
						$html = '<table class="table table-bordered tile pltable">';
						$html .= '<thead><tr><td colspan="6" style="text-align: center;text-transform: uppercase;">Fulfillments report for order ' . '<a href="https://' . HOSTNAME . '/admin/orders/' . $order_id . '" target="_blank" style="text-decoration: underline;cursor: pointer;
				">#' . $order_id . '</a></td></tr>';
						$html .= '<tr>
					<th>Order Id</th>
					<th>Status</th>
					<th>Date</th>
					<th>Tracking Company</th>
					<th>Tracking Url</th>
					<th>Shipment Status</th>
					</tr></thead><tbody>';

						foreach ($result['fulfillments'] as $res) {
							$html .= '<tr>
					  <td><a href="https://' . HOSTNAME . '/admin/orders/' . $res['order_id'] . '" target="_blank" style="cursor: pointer;">#' . $res['order_id'] . '</a></td>
					  ';
							$html .= '<td>' . $res['status'] . '</td>';
							$date = strtotime($res['created_at']);
							$html .= '<td>' . date("Y-m-d", $date) . '</td>';
							$html .= '<td>' . $res['tracking_company'] . '</td>';
							$html .= '<td>' . '<a href="' . $res['tracking_url'] . '" target="_blank" style="text-decoration: underline;cursor: pointer;
							">Track <i class="fa fa-external-link" aria-hidden="true"></i></a></td>';
							$html .= '<td>' . $res['shipment_status'] . '</td>
						  </tr>';
						}
						$html .= '</tbody></table>';
						echo $html;
						exit();
					}
					if ($report_type == "refunds") {
						$refunds = get_refunds($order_id);
						$result = json_decode($refunds, true);
						$html = '<table class="table table-bordered tile pltable">';
						$html .= '<thead><tr><td colspan="6" style="text-align: center;text-transform: uppercase;">Refunds report for order ' . '<a href="https://' . HOSTNAME . '/admin/orders/' . $order_id . '" target="_blank" style="text-decoration: underline;cursor: pointer;
				">#' . $order_id . '</a></td></tr>';
						$html .= '<tr>
					<th>Order Id</th>
					<th>Kind</th>
					<th>Amount</th>
					<th>Status</th>
					<th>Message</th>
					<th>Date</th>
					</tr></thead><tbody>';

						foreach ($result['refunds'] as $res) {
							$html .= '<tr>
						  <td>
						  <a href="https://' . HOSTNAME . '/admin/orders/' . $res['order_id'] . '" target="_blank" style="cursor: pointer;">#' . $res['order_id'] . '</a></td>
						  ';
							$html .= '<td>' . $res['transactions'][0]['kind'] . '</td>';
							$currency = $res['transactions'][0]['currency'];
							$html .= '<td>' . $currency_symbols["$currency"] . $res['transactions'][0]['amount'] . '</td>';
							$html .= '<td>' . $res['transactions'][0]['status'] . '</td>';
							$html .= '<td>' . $res['transactions'][0]['message'] . '</td>';
							$date = strtotime($res['created_at']);
							$html .= '<td title="DATE: ' . date("Y-m-d H:i:s", $date) . '">' . date("Y-m-d", $date) . '</td></tr>';
						}
						$html .= '</tbody></table>';
						echo $html;
						exit();
					}
					if ($report_type == "transactions") {
						$transactions = get_transactions($order_id);
						$result = json_decode($transactions, true);
						$html = '<table class="table table-bordered tile pltable">';
						$html .= '<thead><tr><td colspan="6" style="text-align: center;text-transform: uppercase;">Transactions report for order ' . '<a href="https://' . HOSTNAME . '/admin/orders/' . $order_id . '" target="_blank" style="text-decoration: underline;cursor: pointer;
				">#' . $order_id . '</a></td></tr>';
						$html .= '<tr>
					<th>Order Id</th>
					<th>Kind</th>
					<th>Amount</th>
					<th>Status</th>
					<th>Message</th>
					<th>Date</th>
					</tr></thead><tbody>';
						foreach ($result['transactions'] as $res) {
							$html .= '<tr>
						  <td><a href="https://' . HOSTNAME . '/admin/orders/' . $res['order_id'] . '" target="_blank" style="cursor: pointer;">#' . $res['order_id'] . '</a></td>';

							$html .= '<td>' . $res['kind'] . '</td>';
							$currency = $res['currency'];
							$html .= '<td>' . $currency_symbols["$currency"] . $res['amount'] . '</td>';
							$html .= '<td>' . $res['status'] . '</td>';
							$html .= '<td>' . $res['message'] . '</td>';
							$date = strtotime($res['created_at']);
							$html .= '<td title="DATE: ' . date("Y-m-d H:i:s", $date) . '">' . date("Y-m-d", $date) . '</td></tr>';
						}
						$html .= '</tbody></table>';
						echo $html;
						exit();
					}
				}
			}
			/*
				 * WooCommerce API Ajax calls
			*/
			if ($plugin_type == "woocommerce") {
				if ($woocomm_config == "no") {
					echo "<div style='text-align: center;margin: 10% 0px;font-size: 14px;'>$woocomm_msg</div>";
					exit();
				}
				if ($report_type == "customers") {
					$customers = getWooComm_Customers();
					$customers = json_encode($customers);
					$result = json_decode($customers, true);
					$noresults = true;
					$html = '<table class="table table-bordered tile pltable" style="min-width:600px;/*max-width:1000px;*/">';
					$html .= '<thead><tr>
                	<th>Name</th>
                	<th>Location</th>
                	<th>Email Id</th>
                	<th>Total Orders</th>
                	<th>Last Order</th>
                	<th>Total Spent</th>
                	<th>Customer Since</th>
            	</thead></tr><tbody>';
					foreach ($result['customers'] as $value) {
						$date = strtotime($value['created_at']);
						$customer_since = date("Y-m-d", $date);
						if (($customer_since >= $Since) && ($customer_since <= $today)) {
							$noresults = false;
							$html .= '<tr>';
							$html .= '<td>' . '<a href="' . STORE_URL . 'wp-admin/user-edit.php?user_id=' . $value['id'] . '" target="_blank">' . $value['first_name'] . ' ' . $value['last_name'] . '</a></td>';
							$html .= '<td>' . $value['billing_address']['city'] . ', ' . $value['billing_address']['state'] . ', ' . $value['billing_address']['country'] . '</td>';
							$html .= '<td>' . '<a href="mailto:' . $value['email'] . '" target="_top">' . $value['email'] . '</a></td>';
							$html .= '<td>' . $value['orders_count'] . '</td>';
							$html .= '<td>' . '<a href="' . STORE_URL . 'wp-admin/post.php?post=' . $value['last_order_id'] . '&action=edit" target="_blank" title="ORDER ID">' . $value['last_order_id'] . '</a></td>';
							$html .= '<td>' . $value['total_spent'] . '</td>';
							$html .= '<td>' . $customer_since . '</td>';
							$html .= '</tr>';
						}
					}
					if ($noresults) {
						$html .= '<tr><td colspan="7" style="text-align: center;">No customer data found for last ' . $periodindays . ' days</td></tr>';
					}
					$html .= '</tbody></table>';
					echo $html;
					exit();
				}
				if ($report_type == "orders") {
					$orders = getWooComm_Orders();
					$orders = json_encode($orders);
					$result = json_decode($orders, true);
					$noresults = true;

					$html = '<table class="table table-bordered tile pltable" style="min-width:600px;/*max-width:1000px;*/">';
					$html .= '<thead><tr>
					<th>ORDER ID</th>
                	<th>Order Details</th>
                	<th>billing address</th>
                	<th>Product Details</th>
                	<th>Payment Type</th>
                	<th>Refunds</th>
            	</thead></tr><tbody>';

					foreach ($result['orders'] as $value) {
						$date = strtotime($value['created_at']);
						$order_date = date("Y-m-d", $date);
						if (($order_date >= $Since) && ($order_date <= $today)) {
							// echo "<pre>";
							// print_r($value['billing_address']['address_1']);
							// exit();
							$noresults = false;
							$currency = $value['currency'];
							$html .= '<tr>';
							$html .= '<td>' . '<a href="' . STORE_URL . 'wp-admin/post.php?post=' . $value['order_number'] . '&action=edit" target="_blank" title="ORDER ID">#' . $value['order_number'] . '</a></td>';
							$html .= '<td>
							<a href="' . STORE_URL . 'wp-admin/post.php?post=' . $value['order_number'] . '&action=edit" target="_blank" title="ORDER ID">#' . $value['order_number'] . '</a>
							, <span title="ORDER DATE: ' . date("Y-m-d H:i:s", $date) . '">' . $order_date . '</span><br/>
							<span title="TOTAL PRICE">' . $currency_symbols["$currency"] . $value['total'] . '</span>
							, <span title="TOTAL ITEMS">Items: ' . $value['total_line_items_quantity'] . '</span><br/>
							<span title="TOTAL DISCOUNT">' . $currency_symbols["$currency"] . $value['total_discount'] . ' discount</span><br/>
							<span title="TOTAL TAX">Tax: ' . $currency_symbols["$currency"] . $value['total_tax'] . '</span><br/>
							</td>';
							$html .= '<td>
							<a href="' . STORE_URL . 'wp-admin/user-edit.php?user_id=' . $value['customer_id'] . '" target="_blank" title="CUSTOMER ID">#' . $value['customer_id'] . '</a>
							, <span title="CUSTOMER NAME">' . $value['billing_address']['first_name'] . ' ' . $value['billing_address']['last_name'] . '</span><br/>
							<span title=" CUSTOMER ADDRESS">' . $value['billing_address']['address_1'] . '<br />' . $value['billing_address']['address_2'] . '</span><br />
							<a href="mailto:' . $value['billing_address']['email'] . '" target="_top" title=" CUSTOMER EMAIL">' . $value['billing_address']['email'] . '</a> <br />
							<span title=" CUSTOMER PHONE">' . $value['billing_address']['phone'] . '</span>
							</td>';

							$html .= '<td><div style="overflow: hidden;max-height: 130px !important;overflow-y: auto;" id="style-3">';
							foreach ($value['line_items'] as $itemdetail) {
								$html .= '<a href="' . STORE_URL . 'wp-admin/post.php?post=' . $itemdetail['product_id'] . '&action=edit" target="_blank" title="PRODUCT ID">#' . $itemdetail['product_id'] . '</a> <br />
							  <span title="PRODUCT NAME">' . $itemdetail['name'] . '</span><br/>
							  <span title="QUANTITY">Quantity: ' . $itemdetail['quantity'] . '</span>,
							  <span title="PRICE">' . $currency_symbols["$currency"] . $itemdetail['price'] . '</span><br/>
							  <span title="TOTAL TAX">Tax: ' . $currency_symbols["$currency"] . $itemdetail['total_tax'] . '</span><br/>
							  ';
								if (count($value['line_items']) != 1) {
									$html .= '<hr>';
								}
							}
							$html .= '</div></td>';
							$html .= '<td>' . $value['payment_details']['method_title'] . '</td>';
							$html .= '<td><a href="#oder_details_model" data-toggle="modal" onclick=getOrderdetails("refunds",' . $value['order_number'] . ')>View <i class="fa fa-external-link" aria-hidden="true"></i></a></td>';

							$html .= '</tr>';
						}
					}
					if ($noresults) {
						$html .= '<tr><td colspan="6" style="text-align: center;">No orders data found for last ' . $periodindays . ' days</td></tr>';
					}
					$html .= '</tbody></table>';
					echo $html;
					exit();
				}
				if ($request->input('oder_details') == "oder_details") {
					$order_id = $request->input('order_id');
					if ($report_type == "refunds") {
						$refunds = getWooComm_Refunds($order_id);
						$refunds = json_encode($refunds);
						$result = json_decode($refunds, true);

						$html = '<table class="table table-bordered tile pltable">';
						$html .= '<thead><tr><td colspan="6" style="text-align: center;text-transform: uppercase;">Refunds report for order ' . '<a href="' . STORE_URL . 'wp-admin/post.php?post=' . $order_id . '&action=edit" target="_blank" style="text-decoration: underline;cursor: pointer;
				">#' . $order_id . '</a></td></tr>';
						$html .= '<tr>
					<th>Order Id</th>
					<th>Amount</th>
					<th>Reason</th>
					<th>Date</th>
					</tr></thead><tbody>';
						$noresults = true;
						foreach ($result['order_refunds'] as $res) {
							$noresults = false;
							$html .= '<tr>
						  <td>
						  <a href="' . STORE_URL . 'wp-admin/post.php?post=' . $order_id . '&action=edit" target="_blank" style="cursor: pointer;">#' . $order_id . '</a></td>
						  ';
							$html .= '<td>' . $res['amount'] . '</td>';
							$html .= '<td>' . $res['reason'] . '</td>';
							$date = strtotime($res['created_at']);
							$html .= '<td title="DATE: ' . date("Y-m-d H:i:s", $date) . '">' . date("Y-m-d", $date) . '</td>';

							$html .= '</tr>';
						}
						if ($noresults) {
							$html .= '<tr><td colspan="4" style="text-align: center;">No refund data found for the order id #' . $order_id . '</td></tr>';
						}
						$html .= '</tbody></table>';
						echo $html;
						exit();
					}
				}
				exit();
			}
			/**
			 * BigCommerce API Ajax calls
			 */
			if ($plugin_type == "bigcommerce") {
				if ($bigcomm_config == "no") {
					echo "<div style='text-align: center;margin: 10% 0px;font-size: 14px;'>$woocomm_msg</div>";
					exit();
				}

				$bigcomm_path = explode("/api/v2/", API_PATH);
				$bigcommerce_path = $bigcomm_path[0];

				if ($report_type == "customers") {
					$customers = getbigcomm_customers();
					$result = json_decode($customers, true);
					if ($result[0]['status']) {
						if ($result[0]['status'] == 403) {
							echo "<div style='text-align: center;margin: 10% 0px;font-size: 14px;'>
								<p>Oops! Something went wrong.</p>
								<p>" . $result[0]['message'] . "</p>
								</div>";
							exit();
						}
					}
					$noresults = true;
					$html = '<table class="table table-bordered tile pltable" style="min-width:600px;/*max-width:1000px;*/">';
					$html .= '<thead><tr>
                	<th>Name</th>
                	<th>Location</th>
                	<th>Email Id</th>
                	<th>Total Orders</th>
                	<th>store credit</th>
                	<th>phone</th>
                	<th>ip address</th>
                	<th>Customer Since</th>
            	</thead></tr><tbody>';
					foreach ($result as $value) {
						$date = strtotime($value['date_created']);
						$customer_since = date("Y-m-d", $date);
						if (($customer_since >= $Since) && ($customer_since <= $today)) {
							$noresults = false;
							$html .= '<tr>';
							$html .= '<td>' . '<a href="' . $bigcommerce_path . '/manage/customers/' . $value['id'] . '/edit" target="_blank">' . $value['first_name'] . ' ' . $value['last_name'] . '</a></td>';
							$customer_address_url = $value['addresses']['url'];
							$customer_address = getbigcomm_others($customer_address_url);
							$customer_address = json_decode($customer_address, true);
							$html .= '<td>' . $customer_address[0]['city'] . ', ' . $customer_address[0]['state'] . ', ' . $customer_address[0]['country'] . '</td>';
							$html .= '<td>' . '<a href="mailto:' . $value['email'] . '" target="_top">' . $value['email'] . '</a></td>';
							$orderbycustomer = API_PATH . "orders.json?customer_id=" . $value['id'];
							$total_orders = getbigcomm_others($orderbycustomer);
							$html .= '<td>' . count($total_orders) . '</td>';
							$html .= '<td>' . $value['store_credit'] . '</td>';
							$html .= '<td>' . $value['phone'] . '</td>';
							$html .= '<td>' . $value['registration_ip_address'] . '</td>';
							$html .= '<td>' . $customer_since . '</td>';
							$html .= '</tr>';
						}
					}
					if ($noresults) {
						$html .= '<tr><td colspan="7" style="text-align: center;">No customer data found for last ' . $periodindays . ' days</td></tr>';
					}
					$html .= '</tbody></table>';
					echo $html;
					exit();
				}
				if ($report_type == "orders") {
					$orders = getbigcomm_orders();
					$result = json_decode($orders, true);
					if ($result[0]['status']) {
						if ($result[0]['status'] == 403) {
							echo "<div style='text-align: center;margin: 10% 0px;font-size: 14px;'>
								<p>Oops! Something went wrong.</p>
								<p>" . $result[0]['message'] . "</p>
								</div>";
							exit();
						}
					}
					$noresults = true;

					$html = '<table class="table table-bordered tile pltable" style="min-width:600px;/*max-width:1000px;*/">';
					$html .= '<thead><tr>
					<th>ORDER ID</th>
                	<th>Order Details</th>
                	<th>billing address</th>
                	<th>Product Details</th>
                	<th>status</th>
                	<th>ip address</th>
                	<th>order source</th>
            	</thead></tr><tbody>';

					foreach ($result as $value) {
						$date = strtotime($value['date_created']);
						$order_date = date("Y-m-d", $date);
						if (($order_date >= $Since) && ($order_date <= $today)) {
							$noresults = false;
							$currency = $value['currency_code'];
							$html .= '<tr>';
							$html .= '<td>' . '<a href="' . $bigcommerce_path . '/manage/orders/' . $value['id'] . '" target="_blank" title="ORDER ID">#' . $value['id'] . '</a></td>';
							$html .= '<td>
							<a href="' . $bigcommerce_path . '/manage/orders/' . $value['id'] . '" target="_blank" title="ORDER ID">#' . $value['id'] . '</a>
							, <span title="ORDER DATE: ' . date("Y-m-d H:i:s", $date) . '">' . $order_date . '</span><br/>
							<span title="GRAND TOTAL">' . $currency_symbols["$currency"] . $value['total_ex_tax'] . '</span>
							, <span title="TOTAL ITEMS">Items: ' . $value['items_total'] . '</span><br/>
							<span title="TOTAL DISCOUNT">' . $currency_symbols["$currency"] . $value['discount_amount'] . ' discount</span><br/>
							<span title="TOTAL TAX">Tax: ' . $currency_symbols["$currency"] . $value['total_tax'] . '</span><br/>
							</td>';
							$html .= '<td>
							<a href="' . $bigcommerce_path . '/manage/customers/' . $value['customer_id'] . '/edit" target="_blank" title="CUSTOMER ID">#' . $value['customer_id'] . '</a>
							, <span title="CUSTOMER NAME">' . $value['billing_address']['first_name'] . ' ' . $value['billing_address']['last_name'] . '</span><br/>
							<span title="CUSTOMER COMPANY">' . $value['billing_address']['company'] . '</span><br/>
							<span title=" CUSTOMER ADDRESS">' . $value['billing_address']['street_1'] . '<br />' . $value['billing_address']['street_2'] . ' - ' . $value['billing_address']['zip'] . '</span><br />
							<a href="mailto:' . $value['billing_address']['email'] . '" target="_top" title=" CUSTOMER EMAIL">' . $value['billing_address']['email'] . '</a> <br />
							<span title=" CUSTOMER PHONE">' . $value['billing_address']['phone'] . '</span>
						</td>';
							$customer_address_url = $value['products']['url'];
							$customer_address = getbigcomm_others($customer_address_url);
							$product_details = json_decode($customer_address, true);

							$html .= '<td><div style="overflow: hidden;max-height: 130px !important;overflow-y: auto;" id="style-3">';
							foreach ($product_details as $itemdetail) {
								$html .= '<a href="' . $bigcommerce_path . '/manage/orders/' . $itemdetail['id'] . '" target="_blank" title="ORDER ID">#' . $itemdetail['order_id'] . '</a> - <a href="' . $bigcommerce_path . '/manage/products/' . $itemdetail['product_id'] . '/edit" target="_blank" title="PRODUCT ID">#' . $itemdetail['product_id'] . '</a><br />
							  <span title="PRODUCT NAME">' . $itemdetail['name'] . '</span><br/>
							  <span title="SKU">' . $itemdetail['sku'] . '</span><br/>
							  <span title="QUANTITY">Quantity: ' . $itemdetail['quantity'] . '</span>,
							  <span title="PRICE">' . $currency_symbols["$currency"] . $itemdetail['total_ex_tax'] . '</span><br/>
							  <span title="TOTAL TAX">Tax: ' . $currency_symbols["$currency"] . $itemdetail['total_tax'] . '</span><br/>
							  ';
								if ($itemdetail['is_refunded']) {
									$html .= '<span title="REFUND AMOUNT">Refund: ' . $currency_symbols["$currency"] . $itemdetail['refund_amount'] . '</span>';
								}
								if (count($product_details) != 1) {
									$html .= '<hr>';
								}
							}
							$html .= '</div></td>';
							$html .= '<td>' . $value['status'] . '</td>';
							$html .= '<td>' . $value['ip_address'] . '</td>';
							$html .= '<td>' . $value['order_source'] . '</td>';

							$html .= '</tr>';
						}
					}
					if ($noresults) {
						$html .= '<tr><td colspan="6" style="text-align: center;">No orders data found for last ' . $periodindays . ' days</td></tr>';
					}
					$html .= '</tbody></table>';
					echo $html;
					exit();
				}
				exit();
			}
			/**
			 * Ebay API Ajax calls
			 */
			if ($plugin_type == "amazon") {
				if ($amazon_config == "no") {
					echo "<div style='text-align: center;margin: 10% 0px;font-size: 14px;'>$amazon_msg</div>";
					exit();
				}
				if ($report_type == "orders") {
					/**
					 * [$orders description]
					 * needs to pass timestamp to get order details
					 * @var [type]
					 */
					$orders = get_amazon_orders($periodindays);
					$noresults = true;
					$html = '<table class="table table-bordered tile pltable" style="min-width:600px;/*max-width:1000px;*/">';
					$html .= '<thead><tr>
								<th>ORDER DATE</th>
			                	<th>Order Details</th>
			                	<th>Shipping</th>
			                	<th>Shipping address</th>
			                	<th>Status</th>
            				</thead></tr><tbody>';
					foreach ($orders as $value) {
						$date = strtotime($value['data']['PurchaseDate']);
						$order_date = date("Y-m-d", $date);
						$ship_dte = strtotime($value['data']['EarliestShipDate']);
						$ship_dte = date("M j, Y", $ship_dte);
						$ear_dlv_dte = strtotime($value['data']['EarliestDeliveryDate']);
						$lte_dlv_dte = strtotime($value['data']['LatestDeliveryDate']);
						$ear_dlv_dte = date("M j, Y", $ear_dlv_dte);
						$lte_dlv_dte = date("M j, Y", $lte_dlv_dte);
						if (($order_date >= $Since) && ($order_date <= $today)) {
							$noresults = false;
							$currency = $value['data']['OrderTotal']['CurrencyCode'];
							$html .= '<tr>';
							$html .= '<td>' . date("M j, Y", $date) . '<br/>' . date("h:i:s A", $date) . '</td>';
							$html .= '<td>' . '<a href="https://sellercentral.amazon.com/hz/orders/details?_encoding=UTF8&orderId=' . $value['data']['AmazonOrderId'] . '&ref_=ag_orddet_cont_myo" target="_blank" title="ORDER ID">#' . $value['data']['AmazonOrderId'] . '</a><br/><br/>
								Total Items: ' . $value['data']['NumberOfItemsShipped'] . '
								, Amount: <span title="TOTAL PRICE">' . $currency_symbols["$currency"] . $value['data']['OrderTotal']['Amount'] . '</span><br/>
								Buyer: <a href="mailto:' . $value['data']['BuyerEmail'] . '" target="_top" title=" CUSTOMER EMAIL">' . $value['data']['BuyerName'] . '</a> <br />
								Sales Channel: ' . $value['data']['SalesChannel'] . '<br />
								Fulfillment method: ' . $value['data']['FulfillmentChannel'] . '<br />
							</td>';
							$html .= '<td>
								<span title="Shipment Service Level Category">' . $value['data']['ShipmentServiceLevelCategory'] . '<br/><br/>
								Expected ship date:<br/>' . $ship_dte . '<br/><br/>
								Deliver by:<br/>' . $ear_dlv_dte . ' to ' . $lte_dlv_dte . '
							</td>';
							$html .= '<td>
							<span title="Name">' . $value['data']['ShippingAddress']['Name'] . '</span><br/>
							<span title="AddressLine1">' . $value['data']['ShippingAddress']['AddressLine1'] . '</span><br/>';
							if ($value['data']['ShippingAddress']['AddressLine2']) {
								$html .= '<span title="AddressLine2">' . $value['data']['ShippingAddress']['AddressLine2'] . '</span><br/>';
							}
							if ($value['data']['ShippingAddress']['AddressLine3']) {
								$html .= '<span title="AddressLine3">' . $value['data']['ShippingAddress']['AddressLine3'] . '</span><br/>';
							}
							$html .= '<span title="City">' . $value['data']['ShippingAddress']['City'] . '</span>, <span title="State Or Region">' . $value['data']['ShippingAddress']['StateOrRegion'] . '</span><br/>';
							$html .= '<span title="County">' . $value['data']['ShippingAddress']['County'] . '</span>, <span title="CountryCode">' . $value['data']['ShippingAddress']['CountryCode'] . '</span> - <span title="PostalCode">' . $value['data']['ShippingAddress']['PostalCode'] . '</span><br/>';
							if ($value['data']['ShippingAddress']['Phone']) {
								$html .= '<span title="Phone">' . $value['data']['ShippingAddress']['Phone'] . '</span><br/>';
							}
							$html .= '</td>';
							$html .= '<td><span title="Order Status">' . $value['data']['OrderStatus'] . '</span></td>';
							$html .= '</tr>';
						}
					}
					if ($noresults) {
						$html .= '<tr><td colspan="5" style="text-align: center;">No orders data found for last ' . $periodindays . ' days</td></tr>';
					}
					$html .= '</tbody></table>';
					echo $html;
					exit();
				}
				exit();
			}
			/**
			 * Ebay API Ajax calls
			 */
			if ($plugin_type == "ebay") {
				if ($ebay_config == "no") {
					echo "<div style='text-align: center;margin: 10% 0px;font-size: 14px;'>$ebay_msg</div>";
					exit();
				}
				if ($report_type == "orders") {
					/**
					 * [$orders description]
					 * needs to pass timestamp to get order details
					 * @var [type]
					 */
					$orders = get_ebay_orders();
					// $result = json_decode($orders, true);
					$noresults = true;
					if (isset($orders['Errors'])) {
						echo "<div style='text-align: center;margin: 8% 0px;font-size: 14px;'>
								<p>" . $orders['Errors']['ShortMessage'] . "</p>
								<p>" . $orders['Errors']['LongMessage'] . " Please provide valid ebay credentials.</p>
								</div>";
						exit();
					}

					$html = '<table class="table table-bordered tile pltable" style="min-width:600px;/*max-width:1000px;*/">';
					$html .= '<thead><tr>
					<th>ORDER Date</th>
                	<th>Order Details</th>
                	<th>Shipping Details</th>
                	<th>Shipping Address</th>
                	<th>Tax Details</th>
                	<th>Status</th>
            		</thead></tr><tbody>';
					foreach ($orders['OrderArray'] as $value) {
						$date = strtotime($value['CreatedTime']);
						$order_date = date("Y-m-d", $date);

						if (($order_date >= $Since) && ($order_date <= $today)) {
							$noresults = false;
							$currency = $value['TransactionArray']['Transaction']['TransactionSiteID'];

							$html .= '<tr>';
							$html .= '<td>' . date("M j, Y", $date) . '<br/>' . date("h:i:s A", $date) . '</td>';
							$html .= '<td><span title="Order ID">#' . $value['OrderID'] . '</span><br/><br/>
								<span title="Total Items">Total Items: ' . $value['TransactionArray']['Transaction']['QuantityPurchased'] . '</span><br>
								<span title="Item ID">#' . $value['TransactionArray']['Transaction']['Item']['ItemID'] . ', </span>
								<span title="Item Title">' . $value['TransactionArray']['Transaction']['Item']['Title'] . '</span><br><br/>
								<span title="Transaction ID">Transaction ID: #' . $value['TransactionArray']['Transaction']['TransactionID'] . '</span><br>Payment Methods:<br/>
							';
							foreach ($value['PaymentMethods'] as $vl) {
								$html .= '<span class="label label-default" style="margin-right: 5px;" title="Payment Methods">' . $vl . '</span>';
							}
							$html .= '</td>';
							$html .= '<td>
								<span title="Selling Manager Sales Record Number">Record Number: ' . $value['TransactionArray']['Transaction']['ShippingDetails']['SellingManagerSalesRecordNumber'] . '</span><br>
								<span title="Shipping Carrier Used">Shipping Carrier: ' . $value['TransactionArray']['Transaction']['ShippingDetails']['ShipmentTrackingDetails']['ShippingCarrierUsed'] . '</span><br>
								<span title="Shipment Tracking Number">Tracking No: #' . $value['TransactionArray']['Transaction']['ShippingDetails']['ShipmentTrackingDetails']['ShipmentTrackingNumber'] . '</span><br/>
								</td>';
							$html .= '<td>
							<span title="Name">' . $value['ShippingAddress']['Name'] . '</span><br/>
							<span title="Street1">' . $value['ShippingAddress']['Street1'] . '</span><br/>';
							if ($value['ShippingAddress']['Street2']) {
								$html .= '<span title="Street2">' . $value['ShippingAddress']['Street2'] . '</span><br/>';
							}
							$html .= '<span title="City">' . $value['ShippingAddress']['CityName'] . '</span>, <span title="State Or Region">' . $value['ShippingAddress']['StateOrProvince'] . '</span><br/>';
							$html .= '<span title="County">' . $value['ShippingAddress']['CountryName'] . '</span>, <span title="CountryCode">' . $value['ShippingAddress']['Country'] . '</span> - <span title="PostalCode">' . $value['ShippingAddress']['PostalCode'] . '</span><br/>';
							if ($value['ShippingAddress']['Phone']) {
								$html .= '<span title="Phone">' . $value['ShippingAddress']['Phone'] . '</span><br/>';
							}
							$html .= '</td>';
							$html .= '<td>
							<span title="Total Tax Amount">' . $currency_symbols["$currency"] . $value['TransactionArray']['Transaction']['Taxes']['TotalTaxAmount'] . '</span><br/><br/>';
							foreach ($value['TransactionArray']['Transaction']['Taxes']['TaxDetails'] as $vue) {
								$html .= '<span title="' . $vue['TaxDescription'] . '">' . $vue['Imposition'] . '</span><br/>';
								$html .= '<span title="Tax Amount">' . $currency_symbols["$currency"] . $vue['TaxAmount'] . '</span><br/><br/>';
							}

							$html .= '</td>';
							$html .= '<td><span class="label label-primary" title="status">' . $value['OrderStatus'] . '</span></td>';

							echo $html;
							exit();
							die();

							$html .= '<td><span title="Order Status">' . $value['data']['OrderStatus'] . '</span></td>';
							$html .= '</tr>';
						}
					}
					if ($noresults) {
						$html .= '<tr><td colspan="6" style="text-align: center;">No orders data found for last ' . $periodindays . ' days</td></tr>';
					}
					$html .= '</tbody></table>';
					echo $html;
					exit();
				}
			}

			/*******
				 *
				 * Unset Social success session variables.
				 *
			*/
			if ($request->input('unsetSocial') == "unset social success session") {
				unset($_SESSION['isSocialSuccess']);
				unset($_SESSION['SocialMsg']);
				echo "success";
				exit();
			}
		}
	}
	/**
	 * [save_ecommerce_credentials Save Credentials]
	 * @param  Request $request [description]
	 * @return [type]           [description]
	 */
	public function save_ecommerce_credentials(Request $request) {
		if ($request->ajax()) {
			if ($request->input('ecom_post_sign') == "save ecommerce credentials") {
				$admin_obj = new Admin;
				if ($request->input('ecommerce_plugin') == "shopify") {
					$data = array();
					$data['shopify_api_key'] = $request->input('shopify_api_key');
					$data['shopify_api_secret'] = $request->input('shopify_api_secret');
					$data['shopify_hostname'] = $request->input('shopify_hostname');

					$admin_obj->savePluginCredentials('Shopify', json_encode($data));
					echo "success";
					exit();
				}
				if ($request->input('ecommerce_plugin') == "woocommerce") {
					$data = array();
					$data['woocom_consumer_key'] = $request->input('woocom_consumer_key');
					$data['woocom_consumer_secret'] = $request->input('woocom_consumer_secret');
					$data['woocom_store_url'] = $request->input('woocom_store_url');

					$admin_obj->savePluginCredentials('WooCommerce', json_encode($data));
					echo "success";
					exit();
				}
				if ($request->input('ecommerce_plugin') == "bigcommerce") {
					$data = array();
					$data['bigcom_username'] = $request->input('bigcom_username');
					$data['bigcom_api_path'] = $request->input('bigcom_api_path');
					$data['bigcom_api_token'] = $request->input('bigcom_api_token');

					$admin_obj->savePluginCredentials('BigCommerce', json_encode($data));
					echo "success";
					exit();
				}
				if ($request->input('ecommerce_plugin') == "amazon") {
					$data = array();
					$data['amazon_merchantId'] = $request->input('amazon_merchantId');
					$data['amazon_marketplaceId'] = $request->input('amazon_marketplaceId');
					$data['amazon_keyId'] = $request->input('amazon_keyId');
					$data['amazon_secretKey'] = $request->input('amazon_secretKey');
					$data['amazon_serviceUrl'] = "https://mws.amazonservices.com/";
					$data['amazon_MWSAuthToken'] = $request->input('amazon_MWSAuthToken');

					$admin_obj->savePluginCredentials('Amazon', json_encode($data));
					echo "success";
					exit();
				}
				if ($request->input('ecommerce_plugin') == "ebay") {
					$data = array();
					$data['ebay_appId'] = $request->input('ebay_appId');
					$data['ebay_devId'] = $request->input('ebay_devId');
					$data['ebay_certId'] = $request->input('ebay_certId');
					$data['ebay_user_token'] = $request->input('ebay_user_token');
					if ($request->input('keyType') == "sandbox") {
						$data['ebay_server_url'] = 'https://api.sandbox.ebay.com/ws/api.dll';
					} else if ($request->input('keyType') == "sandbox") {
						$data['ebay_server_url'] = 'https://api.ebay.com/ws/api.dll';
					}
					$admin_obj->savePluginCredentials('Ebay', json_encode($data));
					echo "success";
					exit();
				}
				exit();
			}
		}
	}
}
