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
	/**
	 * Wideget Routes
	 */
	Route::get('widget', 'plugin\OneviewController@widget')->name('widget');
        Route::post('widget_ajax', 'plugin\OneviewControllerAjax@widget_ajax');
        Route::post('chart_ajax', 'plugin\OneviewControllerAjax@chart_ajax');
        Route::post('change_chartType', 'plugin\OneviewControllerAjax@change_chartType');
        Route::post('loadValue_lable', 'plugin\OneviewControllerAjax@loadValue_lable');
        Route::post('QBCompanyInfo', 'plugin\OneviewControllerAjax@QBCompanyInfo');
        Route::post('switchQB_company', 'plugin\OneviewControllerAjax@switchQB_company');
        Route::post('ChangeQBOList', 'plugin\OneviewControllerAjax@ChangeQBOList');
        Route::post('loadToDoList', 'plugin\OneviewControllerAjax@loadToDoList');
        Route::post('createToDoList', 'plugin\OneviewControllerAjax@createToDoList');
        Route::post('updateToDo', 'plugin\OneviewControllerAjax@updateToDo');
        Route::post('cleartodo', 'plugin\OneviewControllerAjax@cleartodo');
        Route::post('loadRssFeeds', 'plugin\rssfeedController@loadRssFeeds');
        Route::post('rssbasic', 'plugin\rssfeedController@rssbasic');
        Route::post('rssmodal', 'plugin\rssfeedController@rssmodal');
        Route::post('updateRssFeedsUrl', 'plugin\rssfeedController@updateRssFeedsUrl'); 
        Route::post('loadQBOCompanyList','plugin\OneviewControllerAjax@loadQBOCompanyList');
        Route::post('deleteQBOCompanyList','plugin\OneviewControllerAjax@deleteQBOCompanyList');
	/**
	 * Social Stream Page
	 */
	Route::get('socialstream', 'socialstream\SocialStreamController@socialstream')->name('socialstream');
	Route::post('socialstreamAjax', 'socialstream\SocialStreamController@socialstreamAjax');
	/**
	 * Social Plugings connections
	 */
	Route::get('socialconnection/{plugin}', 'socialconnectons\SocialConnectionController@addConnection');
	Route::get('twitter_oauth', 'socialconnectons\TwitterController@index');
	Route::get('facebook_oauth', 'socialconnectons\FacebookController@index');
	Route::get('instagram_oauth', 'socialconnectons\InstagramController@index');
	Route::get('pinterest_oauth', 'socialconnectons\PinterestController@index');
	Route::get('vimeo_oauth', 'socialconnectons\VimeoController@index');
	/**
	 * Calendar Page
	 */
	Route::get('calendar', 'page\HomeController@calendar')->name('calendar');
	/**
	 * Gmail Routes
	 */
	Route::get('gmail_up', 'gmail\GmailController@gmail_up')->name('gmail_up');

	/**
	 * Ecommerce Routes
	 */
	Route::get('ecommerce', 'ecommerce\EcommerceController@ecommerce')->name('ecommerce');
	Route::post('ecommerce_ajax', 'ecommerce\EcommerceAjaxController@ecommerce_ajax');
	Route::get('chartTabTempMultiColumn', 'page\HomeController@home')->name('chartTabTempMultiColumn');
	/**
	 * Profile Page
	 */
	Route::get('profile', 'page\HomeController@profile_page')->name('profile');
        Route::post('profilePictureUpload', 'page\HomeController@profilePictureUpload');
        Route::post('currentPasswordValidation', 'page\settingsController@currentPasswordValidation');
        Route::post('currentPasswordChange', 'page\settingsController@currentPasswordChange');
        Route::get('QBSaveCredentials', 'page\HomeController@QBSaveCredentials');

        /*
         * Chat Page 
         */
        Route::post('chatCurrentUserList', 'page\settingsController@chatCurrentUserList');
        Route::post('insertChatMessage', 'page\settingsController@insertChatMessage');
        Route::post('loadChatMessage', 'page\settingsController@loadChatMessage');
        Route::post('loadNotifications', 'page\settingsController@loadNotifications');
        Route::post('getNotificationsCount', 'page\settingsController@getNotificationsCount');
        
        /*
         * Admin Page
         */
        Route::get('admin', 'Admin\AdminController@admin');
        Route::post('loadUserInfo', 'Admin\AdminAjaxController@loadUserInfo');
        Route::post('loadEditUserInfo', 'Admin\AdminAjaxController@loadEditUserInfo');
        Route::post('updateUserDetails', 'Admin\AdminAjaxController@updateUserDetails');
        Route::post('resetPasswordInfo', 'Admin\AdminAjaxController@resetPasswordInfo');
        Route::post('userStatusChange', 'Admin\AdminAjaxController@userStatusChange');
        Route::post('userCreation', 'Admin\AdminAjaxController@userCreation');
        Route::post('deleteUserInfo', 'Admin\AdminAjaxController@deleteUserInfo');
        Route::post('emailValidation', 'Admin\AdminAjaxController@emailValidation');
        Route::post('roleValidation', 'Admin\AdminAjaxController@roleValidation');
        Route::post('addNewRole', 'Admin\AdminAjaxController@addNewRole');
        
        
        
        
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
