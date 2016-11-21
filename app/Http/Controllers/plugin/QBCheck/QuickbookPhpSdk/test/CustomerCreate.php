<?php

require_once('../config.php');

/*require_once(PATH_SDK_ROOT . 'Core/ServiceContext.php');
require_once(PATH_SDK_ROOT . 'DataService/DataService.php');
require_once(PATH_SDK_ROOT . 'PlatformService/PlatformService.php');
require_once(PATH_SDK_ROOT . 'Utility/Configuration/ConfigurationManager.php');*/
require_once(PATH_SDK_ROOT . 'Core/ServiceContext.php');
require_once(PATH_SDK_ROOT . 'DataService/DataService.php');
require_once(PATH_SDK_ROOT . 'PlatformService/PlatformService.php');
require_once(PATH_SDK_ROOT . 'Utility/Configuration/ConfigurationManager.php');
require_once(PATH_SDK_ROOT . 'QueryFilter/QueryMessage.php');


//echo  $_POST['Phone'];
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
$allCompanies = $dataService->FindAll('CompanyInfo');
//print_r($allCompanies);

foreach($allCompanies as $oneCompany)
{
	$oneCompanyReLookedUp = $dataService->FindById($oneCompany);
	//echo "Company Name: {$oneCompanyReLookedUp->CompanyName}\n";
}
//echo "ddd Company Name: $oneCompanyReLookedUp->CompanyName\n";
// Add a customer
/*$customerObj = new IPPCustomer();
$customerObj->Name = "Name" . rand();
$customerObj->CompanyName = "CompanyName" . rand();
$customerObj->GivenName = "GivenName" . rand();
$customerObj->DisplayName = "DisplayName" . rand();
$resultingCustomerObj = $dataService->Add($customerObj);*/

if($_POST['CusId'] ==""){
    
    echo "add";
    
    




$phoneObj=new IPPTelephoneNumber();
$phoneObj->CountryCode=$_POST['Countrycode'];
$phoneObj->FreeFormNumber=$_POST['Phone'];

$emailObj=new IPPEmailAddress();
$emailObj->Address=$_POST['Email'];

$addressObj=new IPPPhysicalAddress();
$addressObj->Line1=$_POST['Street'];
$addressObj->City=$_POST['City'];
$addressObj->Country=$_POST['Country'];
$addressObj->PostalCode=$_POST['Postalcode'];

$customerObj = new IPPCustomer();
$customerObj->FamilyName = $_POST['FamilyName'];
$customerObj->CompanyName = $oneCompanyReLookedUp->CompanyName;
$customerObj->GivenName = $_POST['GivenName'];
$customerObj->PrimaryPhone=$phoneObj;
$customerObj->PrimaryEmailAddr=$emailObj;
$customerObj->BillAddr=$addressObj;
/*echo "<pre>";
print_r($customerObj);
echo "</pre>";*/

//exit;
$resultingCustomerObj = $dataService->Add($customerObj);

/*echo "<pre>";
print_r($resultingCustomerObj);
echo "</pre>";*/

// Echo some formatted output
echo "Created Customer Id={$resultingCustomerObj->Id}. Reconstructed response body:\n\n";
$xmlBody = XmlObjectSerializer::getPostXmlFromArbitraryEntity($resultingCustomerObj, $urlResource);
echo $xmlBody . "\n";
}



if($_POST['CusId'] !=""){
    
    echo "edit";
//Update Customer
    
    
    $phoneObj=new IPPTelephoneNumber();
$phoneObj->CountryCode=$_POST['Countrycode'];
$phoneObj->FreeFormNumber=$_POST['Phone'];

$emailObj=new IPPEmailAddress();
$emailObj->Address=$_POST['Email'];

$addressObj=new IPPPhysicalAddress();
$addressObj->Line1=$_POST['Street'];
$addressObj->City=$_POST['City'];
$addressObj->Country=$_POST['Country'];
$addressObj->PostalCode=$_POST['Postalcode'];

$customerObj = new IPPCustomer();
$customerObj->FamilyName = $_POST['FamilyName'];
$customerObj->CompanyName = $oneCompanyReLookedUp->CompanyName;
$customerObj->GivenName = $_POST['GivenName'];
$customerObj->PrimaryPhone=$phoneObj;
$customerObj->PrimaryEmailAddr=$emailObj;
$customerObj->BillAddr=$addressObj;
    
    
    
 $resultingCustomerObj=$customerObj;   
    
    
    
    

$resultingCustomerObj->sparse = 'true';

$resultingCustomerObj->GivenName = $_POST['GivenName'];
$resultingCustomerObj->Id=$_POST['CusId'];
$resultingCustomerObj->SyncToken=0;
unset($resultingCustomerObj->PrintOnCheckName); // remove some elements that would normally be present
echo "unset";
print_r($resultingCustomerObj);


$xmlBody = XmlObjectSerializer::getPostXmlFromArbitraryEntity($resultingCustomerObj, $urlResource);
echo "About to do a Sparse Update on {$resultingCustomerObj->Id}:\n{$xmlBody}\n\n";

echo "<pre>";
print_r($resultingCustomerObj);
echo "</pre>";

//echo json_encode($resultingCustomerObj);
//exit;
$resultingCustomerUpdatedObj = $dataService->Update($resultingCustomerObj);
echo "UDated";
echo "<pre>";
print_r($resultingCustomerUpdatedObj);
echo "</pre>";


$xmlBody = XmlObjectSerializer::getPostXmlFromArbitraryEntity($resultingCustomerUpdatedObj, $urlResource);
echo "Completed a Sparse Update on {$resultingCustomerObj->Id} - updated object state is:\n{$xmlBody}\n\n";


}






/*
Created Customer Id=801. Reconstructed response body:

<?xml version="1.0" encoding="UTF-8"?>
<ns0:Customer xmlns:ns0="http://schema.intuit.com/finance/v3">
  <ns0:Id>801</ns0:Id>
  <ns0:SyncToken>0</ns0:SyncToken>
  <ns0:MetaData>
    <ns0:CreateTime>2013-08-05T07:41:45-07:00</ns0:CreateTime>
    <ns0:LastUpdatedTime>2013-08-05T07:41:45-07:00</ns0:LastUpdatedTime>
  </ns0:MetaData>
  <ns0:GivenName>GivenName21574516</ns0:GivenName>
  <ns0:FullyQualifiedName>GivenName21574516</ns0:FullyQualifiedName>
  <ns0:CompanyName>CompanyName426009111</ns0:CompanyName>
  <ns0:DisplayName>GivenName21574516</ns0:DisplayName>
  <ns0:PrintOnCheckName>CompanyName426009111</ns0:PrintOnCheckName>
  <ns0:Active>true</ns0:Active>
  <ns0:Taxable>true</ns0:Taxable>
  <ns0:Job>false</ns0:Job>
  <ns0:BillWithParent>false</ns0:BillWithParent>
  <ns0:Balance>0</ns0:Balance>
  <ns0:BalanceWithJobs>0</ns0:BalanceWithJobs>
  <ns0:PreferredDeliveryMethod>Print</ns0:PreferredDeliveryMethod>
</ns0:Customer>
*/

?>
