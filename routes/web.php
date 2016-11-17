<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
 */

// Route::get('/', function () {
//     return view('welcome');
// })->name('login');

/*
 * 1Dash-1View Golbal Basics Inc., USA
 */
/*

 *******************************************************************
 * COMPANY    - Global Basics Inc
 *******************************************************************

Page Description        : INDEX(LOGIN PAGE)
Defined parameters      : Load Constant page,db connection page, model page.
Created on              : 24-06-2016
Created by              : Rubanraj S,Ponnar.
Last modified on        : 25-09-2016
Last modified by        : Ponnar V

 */
Route::get('/', 'page\HomeController@index')->name('login');
Route::post('doLogin', 'LoginController@doLogin');
// Route::post('doLogin', ['as' => 'loginattemts', 'middleware' => 'throttle:3,10', 'uses' => 'LoginController@doLogin']);
Route::group(['middleware' => 'authCheck'], function () {
	Route::get('logout', 'LoginController@logout')->name('logout');
	Route::get('home', 'page\HomeController@home')->name('home');
	Route::get('widget', 'page\HomeController@widget')->name('widget');
	/**
	 * Social Stream Page
	 */
	Route::get('socialstream', 'socialstream\SocialStreamController@socialstream')->name('socialstream');
	Route::post('socialstreamAjax', 'socialstream\SocialStreamController@socialstreamAjax')->name('socialstream');
	/**
	 * Calendar Page
	 */
	Route::get('calendar', 'page\HomeController@calendar')->name('calendar');
	/**
	 * Gmail Page
	 */
	Route::get('gmail_up', 'page\HomeController@gmail_up')->name('gmail_up');
	/**
	 * Ecommerce Routes
	 */
	Route::get('ecommerce', 'ecommerce\EcommerceController@ecommerce')->name('ecommerce');
	Route::post('ecommerce_ajax', 'ecommerce\EcommerceAjaxController@ecommerce_ajax');
	Route::get('chartTabTempMultiColumn', 'page\HomeController@home')->name('chartTabTempMultiColumn');
	/**
	 * Profile Page
	 */
	Route::get('profile', 'page\HomeController@home');

	/**
	 * Dummy Routes
	 */
	Route::post('testAjax', 'TestController@testAjax');
	Route::get('wel', 'LoginController@wel');
	Route::get('demo', 'page\HomeController@demodb');
	Route::get('demo1', 'page\HomeController@demodb1');
	Route::get('checkdb', 'page\HomeController@checkdb');
	// Route::get('exxampple.helloworld', 'Page\Index@showHelloWorld');
	// Route::get('exxampple', 'HomeController')->name('home');
});
