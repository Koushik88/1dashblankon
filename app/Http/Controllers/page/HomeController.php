<?php
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

namespace App\Http\Controllers\Page;
use App\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


class HomeController extends Controller {
	/**
	|--------------------------------------------------------------------------
	| Home Controller
	|--------------------------------------------------------------------------
	|
	| Show Login screen
	|
	 */

	/**
	 * Handle the main request
	 *
	 * @return void
	 */
	public function index() {
		// $token = csrf_token();
		/**
		 * Redirect if alreday authenticated
		 */
		if (isset($_SESSION["token"])) {
			return redirect('/home');
		}
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', '1View');
		$this->addTemplateVar('page', 'page/index');
		return view('general.index', $this->template_vars);
	}
	/**
	 * [home description]
	 * @return [type] [description]
	 */
	public function home() {
		/**
		 * [$admin_obj description]
		 * @var Admin model
		 */
		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Home');
		$this->addTemplateVar('page', 'plugin/widget');
		return view('general.index', $this->template_vars);
	}
	
	/**
	 * [calendar description]
	 * @return [type] [description]
	 */
	public function calendar() {
		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Calendar');
		$this->addTemplateVar('page', 'module/calendar');
		return view('general.index', $this->template_vars);
	}
	/**
	 * [gmail_up description]
	 * @return [type] [description]
	 */
	public function gmail_up() {
		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();

		$this->addTemplateVar('menus', $menus);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Gmail');
		$this->addTemplateVar('page', 'module/gmail_up');
		return view('general.index', $this->template_vars);
	}
	/**
	 * [profile_page description]
	 * @return [type] [description]
	 */
	public function profile_page() {
		/**
		 * [$admin_obj description]
		 * @var Admin model
		 */
            
                $folderName = "1dash-micration";            
                if(isset($_SERVER['HTTPS'])) $protocol = 'https'; else $protocol = 'http';
                $server = $_SERVER['HTTP_HOST'];
                $buildUrl = "$protocol://localhost" . "/$folderName/";
                $currLocation = "$protocol://".$server.$_SERVER['SCRIPT_NAME'];
                $curr = $server.$_SERVER['SCRIPT_NAME'];
                $currPageServer = "$protocol://".$server;
              
            
		$admin_obj = new Admin;
		$menus = $admin_obj->getMenus();
		$dbres = $admin_obj->getAllPluginData([$_SESSION['userId']]);
		$plugins = [];
		foreach ($dbres as $key => $value) {
			array_push($plugins, $value["name"]);
		}
                
                $oauthredirect_url = $buildUrl;                
                $oauthredirect_function = $currPageServer.'/QBSaveCredentials';                
                $userinfo = $admin_obj->getUserInfo();                
                $this->addTemplateVar('menus', $menus);
                $this->addTemplateVar('userinfo', $userinfo);
		$this->addTemplateVar('plugins', $plugins);
                $this->addTemplateVar('oauthredirect_url', base64_encode($oauthredirect_url));
                $this->addTemplateVar('oauthredirect_function', base64_encode($oauthredirect_function));
		$this->addTemplateVar('buildUrl', $buildUrl);
		$this->addTemplateVar('csrf_token', csrf_token());
		$this->addTemplateVar('pageTitle', 'Profile Page');
		$this->addTemplateVar('page', 'page/profile');
		return view('general.index', $this->template_vars);
	}
        
        public function profilePictureUpload()
        {
           if(isset($_FILES["profileUpload"]))
                {
                    $admin_obj = new Admin;
                    if($_FILES["profileUpload"]["size"] < 1000141)
                        {
                        
                            $path_parts = $_FILES["profileUpload"]["name"]; //Name can be changed by the client. Use something safer.
                            $ext = explode(".", $path_parts);
                            $ext = end($ext);
                            $allowedExtensions = array("jpg","jpeg","png");                             
                            if (in_array($ext, $allowedExtensions)) 
                                    {
                                        $tmp_name = $_FILES["profileUpload"]["tmp_name"];    
                                        $name = $_FILES["profileUpload"]["name"];
                                        $filename = "profile_".mt_rand(2, 100).".".$ext;       
                                        if(move_uploaded_file($tmp_name, IMAGESLOCATION."profile-pics/".$filename))
                                            {
                                                    $admin_obj->updateProfilePic($filename);                    
                                            }
                                    }
                            else{
                                    echo "Upload Valid File";
                                    exit;
                            }
                    }else
                        {
                             echo "Maximum file size exceeds";
                             exit;
                        }
                }
            return redirect("profile");
        }
        
        public function QBSaveCredentials()
        {
                $QBCurrentCredentials = $_GET;
                $admin_obj = new Admin;
                $company_info = $admin_obj->getUpdateAllPluginData('Quickbook');
                $current_realm_id = trim($this->decrypt_string($QBCurrentCredentials["realmId"]));

                        foreach ($company_info as $key=>$value)
                        { 
                            $company_info_decode = json_decode($company_info[$key]["data"],true);
                            array_push($realmId_array,trim($this->decrypt_string($company_info_decode["realmId"])));

                            if(trim($this->decrypt_string($company_info_decode["realmId"])) == $current_realm_id)
                            {
                                $pid = $company_info[$key]["p_id"];
                                $update_plag = '1';
                                break;
                            }
                            else {
                                 $update_plag = '0';
                            }

                        }

                        $result = $admin_obj->savePluginCredentials('Quickbook',$QBCurrentCredentials,$update_plag,$pid);
                        echo '<script type="text/javascript">
                             window.opener.location.href = window.opener.location.href;
                                 window.close();
                             </script>';
        }
        

         public function decrypt_string($encodedText = '', $salt = '8638FD63E6CC16872ACDED6CE49E5A270ECDE1B3B938B590E547138BB7F120VG') {
                ini_set('error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE ^ E_STRICT ^ E_DEPRECATED); // Report all PHP errors (see changelog)
                $key = pack('H*', $salt);
                $ciphertext_dec = base64_decode($encodedText);
                $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
                $iv_dec = substr($ciphertext_dec, 0, $iv_size);
                $ciphertext_dec = substr($ciphertext_dec, $iv_size);
                return mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $ciphertext_dec, MCRYPT_MODE_CBC, $iv_dec);
            }












        //=============================================================================

	/**
	 * [demodb dummy functions]
	 * @return [type] [description]
	 */
	public function demodb() {
		echo MANI . "<br><br>";
		echo app_path();
		// die();
		$email_id = ["2", "ponnar.v@tvsnext.io"];
		// $email_id  = ["ponnar.v@tvsi.com"];
		$admin_obj = new Admin;
		$users = $admin_obj->getName($email_id);
		// $users = DB::select('select * from 1dash_app_userlist where active = ?', [1]);
		$plugins = $admin_obj->getPlugins();
		echo "<pre>";
		// print_r($DB);
		print_r($users);
		print_r($plugins);
		// echo "Local Connections: <br>";
		// print_r($plugins);
		// echo "Agin after instance: <br>";
		// print_r($users1);
		die();
	}
	public function demodb1() {
		// echo MANI . "<br><br>";
		// echo app_path();
		// $email_id = ["2", "ponnar.v@tvsnext.io"];
		$admin_obj = new Admin;
		// $users = $admin_obj->getName($email_id);
		// $plugins = $admin_obj->getPlugins();
		echo "<pre>";
		// print_r($users);
		// print_r($plugins);

		$users = $admin_obj->getUsers();
		print_r($users);
		die();
	}
	public function checkdb() {
		$email_id = ["2", "ponnar.v@tvsnext.io"];
		$admin_obj = new Admin;
		$users = $admin_obj->getName1($email_id);
		echo "<pre>";
		print_r($users);
	}
}
