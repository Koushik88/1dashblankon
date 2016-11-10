<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

require_once('../config.php');

require_once(PATH_SDK_ROOT . 'Core/ServiceContext.php');
require_once(PATH_SDK_ROOT . 'DataService/DataService.php');
require_once(PATH_SDK_ROOT . 'PlatformService/PlatformService.php');
require_once(PATH_SDK_ROOT . 'Utility/Configuration/ConfigurationManager.php');

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

// Prep Data Services
$dataService = new DataService($serviceContext);
if (!$dataService)
	exit("Problem while initializing DataService.\n");

echo "hiii";
 //$Query = $dataService->Query("SELECT * FROM AgedPayableDetail1111");
$Query = $dataService->Query("/AgedPayableDetail");
 
 //print_r($Query);

//$URI=$dataService->getGetRequestParameters();
 
 
 
 
 
 echo $realmId;
 
 echo "<br>";
 
 //$httpsUri = "company/".$realmId."/reports/AgedPayables";  //?date_macro=Today
echo $httpsUri = 'company/'.$realmId.'/companyinfo/'.$realmId;
echo "<br>";

//$httpsUri = 'company/'.$realmId.'/query';
//$httpsPostBody = 'select * from CompanyInfo startPosition 0 maxResults 500';
$httpsPostBody = NULL;

$httpsContentType = CoreConstants::CONTENTTYPE_APPLICATIONTEXT;

$requestParameters = new RequestParameters($httpsUri, 'GET', $httpsContentType, NULL);
//print_r($requestParameters);

$restRequestHandler = new SyncRestHandler($serviceContext);

//print_r($restRequestHandler);

list($responseCode, $responseBody) = $restRequestHandler->GetResponse($requestParameters, $httpsPostBody, NULL);

$parsedResponseBody = NULL;
try {
    $responseXmlObj = simplexml_load_string($responseBody);
   // echo "<br>";
  // print_r($responseXmlObj);
   // if ($responseXmlObj && $responseXmlObj->QueryResponse)
   // {
        $responseSerializer = CoreHelper::GetSerializer($serviceContext, false);
      //  print_r($responseSerializer);
        $parsedResponseBody = $responseSerializer->Deserialize($responseXmlObj->QueryResponse->asXML(), FALSE);                                                                 
        
        
   // }
}
catch (Exception $e) {
    echo $e->getMessage();
    IdsExceptionManager::HandleException($e);
}       

print_r($parsedResponseBody);
 
 
 
 
 
 



?>


<body>
    <div>Reports</div>    
    
    
    <div>Report<select name="params[reportType]" placeholder="Select... (Required)" style="width: 220px">
                                                            <option value="">Select... (Required)</option>
                                                                <option value="AgedPayableDetail">AgedPayableDetail</option>
                                                                <option value="AgedPayables">AgedPayables</option>
                                                                <option value="AgedReceivableDetail">AgedReceivableDetail</option>
                                                                <option value="AgedReceivables">AgedReceivables</option>
                                                                <option value="BalanceSheet">BalanceSheet</option>
                                                                <option value="CashFlow">CashFlow</option>
                                                                <option value="ClassSales">ClassSales</option>
                                                                <option value="CustomerBalance">CustomerBalance</option>
                                                                <option value="CustomerBalanceDetail">CustomerBalanceDetail</option>
                                                                <option value="CustomerIncome">CustomerIncome</option>
                                                                <option value="CustomerSales">CustomerSales</option>
                                                                <option value="DepartmentSales">DepartmentSales</option>
                                                                <option value="GeneralLedger">GeneralLedger</option>
                                                                <option value="InventoryValuationSummary">InventoryValuationSummary</option>
                                                                <option value="ItemSales">ItemSales</option>
                                                                <option value="ProfitAndLoss">ProfitAndLoss</option>
                                                                <option value="ProfitAndLossDetail">ProfitAndLossDetail</option>
                                                                <option value="TrialBalance">TrialBalance</option>
                                                                <option value="VendorBalance">VendorBalance</option>
                                                                <option value="VendorBalanceDetail">VendorBalanceDetail</option>
                                                                <option value="VendorExpenses">VendorExpenses</option>
                                                        </select><input type="submit" name="submit" value="Report"></div>
    
    
    
    
    
    
</body>