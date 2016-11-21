<?php

namespace App\Http\Controllers;

class TestController extends Controller {
	public function testAjax() {
		$this->addTemplateVar('pageTitle', 'Manigandan');
		return view('page.index', $this->template_vars);
	}
}
