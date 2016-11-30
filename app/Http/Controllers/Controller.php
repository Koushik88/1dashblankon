<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

DEFINE("IMAGESLOCATION", "img/");
DEFINE("CSSLOCATION", "css");
DEFINE("JSLOCATION", "js");
DEFINE("title", "1Dash");
DEFINE('ANALYTICAL_TIMEZONE', 'Asia/calcutta');
session_start();
class Controller extends BaseController {
	use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

	/*
		* SMARTY Provider
	*/

	protected $template_vars = array();
	protected function addTemplateVar($key, $value) {
		$this->template_vars[$key] = $value;
	}

	/**
	 * Setup the layout used by the controller.
	 *
	 * @return void
	 */
	protected function setupLayout() {
		//not sure if I need this any more since I am using Smarty
		if (!is_null($this->layout)) {
			$this->layout = View::make($this->layout);
		}

		$this->addTemplateVar("style", HTML::style("css/bootstrap.css"));
	}
	// End Smarty Service Provider

}
