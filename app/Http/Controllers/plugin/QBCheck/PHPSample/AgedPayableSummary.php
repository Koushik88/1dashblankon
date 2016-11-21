<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


require_once('../QuickbookPhpSdk/config.php');
require_once(PATH_SDK_ROOT . 'Core/ServiceContext.php');
require_once(PATH_SDK_ROOT . 'PlatformService/PlatformService.php');
require_once(PATH_SDK_ROOT . 'Utility/Configuration/ConfigurationManager.php');

require_once(PATH_SDK_ROOT . 'Core/CoreHelper.php');
require_once(PATH_SDK_ROOT . 'DataService/Batch.php');
require_once(PATH_SDK_ROOT . 'DataService/IntuitCDCResponse.php');
require_once(PATH_SDK_ROOT . 'Data/IntuitRestServiceDef/IPPAttachableResponse.php');
require_once(PATH_SDK_ROOT . 'Data/IntuitRestServiceDef/IPPFault.php');
require_once(PATH_SDK_ROOT . 'Data/IntuitRestServiceDef/IPPError.php');
require_once('RestServiceHandler.php');
require_once(PATH_SDK_ROOT . 'Core/OperationControlList.php');


	
// Echo some formatted output
/*echo '<a href="javascript:void(0)" onclick="goHome()">Home</a>';
echo '&nbsp;&nbsp;&nbsp;';
echo '<a href="javascript:void(0)" onclick="return intuit.ipp.anywhere.logout(function () { window.location.href = \'http://localhost/PHPSample/index.php\'; });">Sign Out</a>';
echo '&nbsp;&nbsp;&nbsp;';
echo '<a target="_blank" href="http://localhost/PHPSample/ReadMe.htm">Read Me</a><br />';*/
//Specify QBO or QBD
$serviceType = IntuitServicesType::QBO;

// Get App Config
$realmId = ConfigurationManager::AppSettings('RealmID');
if (!$realmId)
	exit("Please add realm to App.Config before running this sample.\n");

// Prep Service Context
$requestValidator = new OAuthRequestValidator(ConfigurationManager::AppSettings('AccessToken'),
                                              ConfigurationManager::AppSettings('AccessTokenSecret'),
                                              ConfigurationManager::AppSettings('ConsumerKey'),
                                              ConfigurationManager::AppSettings('ConsumerSecret'));
$serviceContext = new ServiceContext($realmId, $serviceType, $requestValidator);
if (!$serviceContext)
	exit("Problem while initializing ServiceContext.\n");

$serviceContext->IppConfiguration->Logger->RequestLog->Log(TraceLevel::Info, "Going to fetch report data.");


//$query = "entities=" . $entityString . "&changedSince=" . $formattedChangedSince;
		$queryParamValue="This Fiscal Year-to-date";
		
		$query = "date_macro='".$queryParamValue."'";
		$query=urlencode($query);
		//$uri = "company/{1}/cdc?{2}";
		$uri = "company/{1}/reports/AgedPayables?{2}";
		//$uri = str_replace("{0}", CoreConstants::VERSION, $uri);
		$uri = str_replace("{1}", $serviceContext->realmId, $uri);
		$uri = str_replace("{2}", $query, $uri);

        // Creates request parameters
		$requestParameters = new RequestParameters($uri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
		//var_dump($requestParameters);
		$restRequestHandler = new RestServiceHandler($serviceContext);
		try
		{
		    // gets response
			list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
			//CoreHelper::CheckNullResponseAndThrowException($responseBody);
			
			/*echo "response code is:".$responseCode."<br />";
			echo "response body is:".$responseBody."<br />";
			var_dump($responseCode);
			var_dump($responseBody);*/
                        
                        echo $responseBody;
			
			$responseArray = json_decode($responseBody, true);
                        
                        echo "<pre>";
                        print_r($responseArray);
                        echo "</pre>";
                        
                        
			
			//AgedReceivableReportUI($responseArray);
			
		}
		catch (Exception $e)
		{
			echo"There is an exception";
		}		