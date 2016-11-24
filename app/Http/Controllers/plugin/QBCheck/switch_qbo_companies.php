<?php

/*
#*******************************************************************#
#		 Global Basics Inc :: Generic module page           #
#*******************************************************************#

    Document       : Generic module
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Initial page
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*/

ini_set('error_reporting', E_ALL ^ E_WARNING ^ E_NOTICE ^ E_STRICT ^ E_DEPRECATED); // Report all PHP errors (see changelog)
ini_set('html_errors',TRUE); // Report html errors
ini_set("display_errors", TRUE); // Display errors
ini_set("log_errors", TRUE); // All type of logged in file phpError.txt


function decrypt_string($encodedText = '', $salt = '8638FD63E6CC16872ACDED6CE49E5A270ECDE1B3B938B590E547138BB7F120VG') {
    $key = pack('H*', $salt);
    $ciphertext_dec = base64_decode($encodedText);
    $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC);
    $iv_dec = substr($ciphertext_dec, 0, $iv_size);
    $ciphertext_dec = substr($ciphertext_dec, $iv_size);
    return mcrypt_decrypt(MCRYPT_RIJNDAEL_128, $key, $ciphertext_dec, MCRYPT_MODE_CBC, $iv_dec);
    }
    

if(isset($_POST["swich_company"]))
{
    
    require_once('QuickbookPhpSdk/config.php');
    require_once(PATH_SDK_ROOT . 'Core/ServiceContext.php');
    require_once(PATH_SDK_ROOT . 'PlatformService/PlatformService.php');
    require_once(PATH_SDK_ROOT . 'Utility/Configuration/ConfigurationManager.php');
    require_once(PATH_SDK_ROOT . 'Core/CoreHelper.php');
    require_once(PATH_SDK_ROOT . 'DataService/Batch.php');
    require_once(PATH_SDK_ROOT . 'DataService/IntuitCDCResponse.php');
    require_once(PATH_SDK_ROOT . 'Data/IntuitRestServiceDef/IPPAttachableResponse.php');
    require_once(PATH_SDK_ROOT . 'Data/IntuitRestServiceDef/IPPFault.php');
    require_once(PATH_SDK_ROOT . 'Data/IntuitRestServiceDef/IPPError.php');
    require_once('PHPSample/RestServiceHandler.php');
    require_once(PATH_SDK_ROOT . 'Core/OperationControlList.php');
    
      
            $realemId_Array = array();
            $pid_Array = array();
            $qbcompanyInfo = array();

            foreach ($QBCredential1 as $key=> $QBCredential) 
            {

                array_push($pid_Array,$QBCredential["p_id"]);
                $pid = $QBCredential["p_id"];
               
                $QBCredential = json_decode($QBCredential["data"],true);
                $realmId = trim(decrypt_string($QBCredential["realmId"]));
                $oauth_token = trim(decrypt_string($QBCredential["oauth_token"]));
                $oauth_token_secret = trim(decrypt_string($QBCredential["oauth_token_secret"]));
                $OAUTH_CONSUMER_KEY = trim(decrypt_string($QBCredential["OAUTH_CONSUMER_KEY"]));
                $OAUTH_CONSUMER_SECRET = trim(decrypt_string($QBCredential["OAUTH_CONSUMER_SECRET"]));


                $serviceType = IntuitServicesType::QBO;
            // Prep Service Context
                $requestValidator = new OAuthRequestValidator($oauth_token,$oauth_token_secret,$OAUTH_CONSUMER_KEY,$OAUTH_CONSUMER_SECRET);
                $serviceContext = new ServiceContext($realmId, $serviceType, $requestValidator);
                if (!$serviceContext)
                        exit("Problem while initializing ServiceContext.\n");

                $serviceContext->IppConfiguration->Logger->RequestLog->Log(TraceLevel::Info, "Going to fetch report data.");

                    $uri = "company/{1}/companyinfo/{1}";
                    $uri = str_replace("{1}", $serviceContext->realmId, $uri);
                            // Creates request parameters
                    $requestParameters = new RequestParameters($uri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
                    //var_dump($requestParameters);
                    $restRequestHandler = new RestServiceHandler($serviceContext);
                    try
                    {
                        //echo $realmId."<br/>";
                                        // gets response
                        list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
                        $cmpanyInfo = json_decode($responseBody, true);

                        if($cmpanyInfo["CompanyInfo"]["CompanyName"])
                        {
                            array_push($realemId_Array,$cmpanyInfo["CompanyInfo"]["CompanyName"]);
                            $qbcompanyInfo["cmp_info"][$key] = $cmpanyInfo["CompanyInfo"]["CompanyName"];
                            $qbcompanyInfo["pid"][$key] = $pid;
                            $qbcompanyInfo["realmId"][$key] = $realmId;
                        }

                    }
                    catch (Exception $e)
                    {
                            echo"There is an exception";
                    }

                    

            }
    
      
        
        
}

if(isset($_POST["deletePluginInfo"]))
{
               $realmId = trim(decrypt_string($QBCredential["realmId"]));
               $oauth_token = trim(decrypt_string($QBCredential["oauth_token"]));
               $oauth_token_secret = trim(decrypt_string($QBCredential["oauth_token_secret"]));
               $OAUTH_CONSUMER_KEY = trim(decrypt_string($QBCredential["OAUTH_CONSUMER_KEY"]));
               $OAUTH_CONSUMER_SECRET = trim(decrypt_string($QBCredential["OAUTH_CONSUMER_SECRET"]));

               
               require_once('QuickbookPhpSdk/config.php');
               require_once(PATH_SDK_ROOT . 'Core/ServiceContext.php');
               require_once(PATH_SDK_ROOT . 'PlatformService/PlatformService.php');
               require_once(PATH_SDK_ROOT . 'Utility/Configuration/ConfigurationManager.php');
               require_once(PATH_SDK_ROOT . 'Core/OperationControlList.php');
               
               $serviceType = IntuitServicesType::QBO;
                // Get App Config
                if($realmId)
                {
                    if (!$realmId)
                        exit("Please add realm to App.Config before running this sample.\n");

                    // Prep Service Context
                    $requestValidator = new OAuthRequestValidator($oauth_token,$oauth_token_secret,$OAUTH_CONSUMER_KEY,$OAUTH_CONSUMER_SECRET);
                    $serviceContext = new ServiceContext($realmId, $serviceType, $requestValidator);
                    if (!$serviceContext)
                            exit("Problem while initializing ServiceContext.\n");

                // Prep Platform Services
                    $platformService = new PlatformService($serviceContext);

                // Get App Menu HTML
                    $Respxml = $platformService->Disconnect();
                }
}




?>
