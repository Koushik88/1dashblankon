<?php

ini_set('error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE ^ E_STRICT ^ E_DEPRECATED); // Report all PHP errors (see changelog)
ini_set('html_errors', TRUE); // Report html errors
ini_set("display_errors", TRUE); // Display errors
ini_set("log_errors", TRUE); // All type of logged in file phpError.txt

try {
	$xmlDoc = new DOMDocument();

	if (!$xmlDoc->load($xml)) {
		throw new Exception("Invaild URL, Please give correct one.");
	}
	$xmlDoc->load($xml);
	//get elements from "<channel>"
	$channel = $xmlDoc->getElementsByTagName('channel')->item(0);
	$channel_title = $channel->getElementsByTagName('title')
		->item(0)->childNodes->item(0)->nodeValue;
	$channel_link = $channel->getElementsByTagName('link')
		->item(0)->childNodes->item(0)->nodeValue;
	$channel_desc = $channel->getElementsByTagName('description')
		->item(0)->childNodes->item(0)->nodeValue;

	//output elements from "<channel>"
	echo ("<p><a target='_blank' href='" . $channel_link . "'><strong style='font-size: 14px;'>" . $channel_title . "</strong></a>");
	echo ("<br>");
	echo ($channel_desc . "</p><br>");

	//get and output "<item>" elements
	$items = array();
	$i = 0;
	foreach ($xmlDoc->getElementsByTagName('item') as $item) {

		$item_title = $item->getElementsByTagName('title')->item(0)->nodeValue;
		$item_desc = $item->getElementsByTagName('description')->item(0)->nodeValue;
		$item_link = $item->getElementsByTagName('link')->item(0)->nodeValue;
		$date = $item->getElementsByTagName('pubDate')->item(0)->nodeValue;
		echo ("<p><a target='_blank' href='" . $item_link
			. "'><strong>" . $item_title . "</strong></a>");
		echo ("<br>");
		echo ($item_desc . "</p><br>");
		if (++$i >= 8) {
			break;
		}

	}

} catch (Exception $e) {
	echo $e->getMessage();
}

?>