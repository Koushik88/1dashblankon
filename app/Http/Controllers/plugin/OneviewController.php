<?php

namespace App\Http\Controllers\plugin;
//use App\Http\Controllers\plugin\QuickbookPhpSdk\Security;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Admin;

//use App\Http\Controllers;
//use App\Http\Controllers\plugin\QuickbookPhpSdk\Core;
// \Security\OAuthRequestValidator;




//use \Security\OAuthRequestValidator;
//use \Core\ServiceContext;
//use App\Http\Controllers\plugin\QuickbookPhpSdk\Core\LocalConfigReader;
//use App\Http\Controllers\plugin\QuickbookPhpSdk\Core\Configuration\IppConfiguration;
//use App\Http\Controllers\plugin\QuickbookPhpSdk;

//use App\Http\Controllers\plugin\QuickbookPhpSdk\Security\OAuthRequestValidator;
/*use App\Http\Controllers\plugin\QuickbookPhpSdk\Core\ServiceContext;
use App\Http\Controllers\plugin\QuickbookPhpSdk\Diagnostics\TraceLevel;
use App\Http\Controllers\plugin\QuickbookPhpSdk\Core\RestCalls\RequestParameters;
use App\Http\Controllers\plugin\PHPSample\RestServiceHandler;
*/
class OneviewController extends Controller
{
         /**
	 * [widget description]
	 * @return [type] [description]
	 */
    public function widget() {
        
            $admin_obj = new Admin;
            $menus = $admin_obj->getMenus();
        
            
                    $realmId = '1381325280';
                    $oauth_token = 'qyprdozycsUWumbriGR6CH1kuzSoNu7MPRtqSR2VXbiibETi';
                    $oauth_token_secret = '8d6Zt3Y6s3WnMFUtSzgR0jlRaKlXnbYYja7tz1ip';
                    $OAUTH_CONSUMER_KEY = 'qyprd1NN1kHiN9QXEMlz0fLLvMgEKi';
                    $OAUTH_CONSUMER_SECRET = 'vBn6g62fNX3t952i5NDvholn3zkwg6nPKmdS6LZU';
           
        $_POST["widgetType"] = 'balancesheet';
        $_POST["widgetPeriod"] = 'date_macro=thisyear&column=quarterly';
            
    //require_once '/var/www/html/1dash-micration/app/Http/Controllers/plugin/QBCheck/validatre.php';
            
            //die();
            
            
//            $realmId = '1381325280';
//            $oauth_token = 'qyprdozycsUWumbriGR6CH1kuzSoNu7MPRtqSR2VXbiibETi';
//            $oauth_token_secret = '8d6Zt3Y6s3WnMFUtSzgR0jlRaKlXnbYYja7tz1ip';
//            $OAUTH_CONSUMER_KEY = 'qyprd1NN1kHiN9QXEMlz0fLLvMgEKi';
//            $OAUTH_CONSUMER_SECRET = 'vBn6g62fNX3t952i5NDvholn3zkwg6nPKmdS6LZU';
//           
////            
////            
//            require_once(app_path().'/Http/Controllers/plugin/QuickbookPhpSdk/config.php');
//            require_once(PATH_SDK_ROOT . 'Core/ServiceContext.php');
//            require_once(PATH_SDK_ROOT . 'PlatformService/PlatformService.php');
//            require_once(PATH_SDK_ROOT . 'Utility/Configuration/ConfigurationManager.php');
//
//            require_once(PATH_SDK_ROOT . 'Core/CoreHelper.php');
//            require_once(PATH_SDK_ROOT . 'DataService/Batch.php');
//            require_once(PATH_SDK_ROOT . 'DataService/IntuitCDCResponse.php');
//            require_once(PATH_SDK_ROOT . 'Data/IntuitRestServiceDef/IPPAttachableResponse.php');
//            require_once(PATH_SDK_ROOT . 'Data/IntuitRestServiceDef/IPPFault.php');
//            require_once(PATH_SDK_ROOT . 'Data/IntuitRestServiceDef/IPPError.php');
//            require_once(app_path().'/Http/Controllers/plugin/PHPSample/RestServiceHandler.php');
//            require_once(PATH_SDK_ROOT . 'Core/OperationControlList.php');
//
//
//            $serviceType = 'QBO';
//
//            // Prep Service Context
//            $requestValidator = new Security\OAuthRequestValidator($oauth_token,$oauth_token_secret,$OAUTH_CONSUMER_KEY,$OAUTH_CONSUMER_SECRET);
//           // print_r($requestValidator); die();
//            $serviceContext = new ServiceContext($realmId, $serviceType, $requestValidator);
//            
//           if (!$serviceContext)
//                    exit("Problem while initializing ServiceContext.\n");
//
//            $serviceContext->IppConfiguration->Logger->RequestLog->Log(TraceLevel::Info, "Going to fetch report data.");
//
//                $query = 'date_macro=thisyear&column=quarterly';
//                $Bsuri = "company/{1}/reports/BalanceSheet?{2}";
//                $Bsuri = str_replace("{1}", $serviceContext->realmId, $Bsuri);
//                $Bsuri = str_replace("{2}", $query, $Bsuri);
//
//                // Creates request parameters
//                    $requestParameters = new RequestParameters($Bsuri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
//                    var_dump($requestParameters); 
//                    die(); 
//                    
//                    
//                    
//                    $restRequestHandler = new RestServiceHandler($serviceContext);
//                    try
//                    {
//                        // gets response
//                            list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
//
//                        $balanceSheet = json_decode($responseBody,true);    
//                    }
//                    catch (Exception $e)
//                    {
//                            echo"There is an exception";
//                    }
//            
//         
    
        $query = "date_macro=thisyear&column=quarterly";
        $this->addTemplateVar('query', $query);
        $this->addTemplateVar('menus', $menus);
        $this->addTemplateVar('csrf_token', csrf_token());
        $this->addTemplateVar('pageTitle', '1View');
        $this->addTemplateVar('page', 'plugin/widget');
        return view('general.index', $this->template_vars);
    
            
    }
}
