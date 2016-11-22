<?php

namespace App\Http\Controllers\socialconnectons;

use App\Http\Controllers\Controller;

class SocialConnectionController extends Controller {
	/**
	 * [addConnection description]
	 * @param [type] $plugin [description]
	 */
	public function addConnection($plugin) {
		if ($plugin == "Twitter") {
			require CONTROLLERPATH . "socialconnectons/twitter/twitter_config.php";
			echo dirname(__FILE__);
			// echo CONTROLLERPATH;
		} else if ($plugin == "Facebook") {

		} else if ($plugin == "Instagram") {

		} else if ($plugin == "Pinterest") {

		} else if ($plugin == "Vimeo") {

		} else if ($plugin == "LinkedIn") {

		} else if ($plugin == "Google") {

		} else {
			return redirect("profile");
		}
	}
}
