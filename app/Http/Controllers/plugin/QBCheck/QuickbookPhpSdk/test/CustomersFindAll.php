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

// Iterate through all Customers, even if it takes multiple pages
$i = 0;


while (1) {
	$allCustomers = $dataService->FindAll('Customer', $i, 500);
        
       // print_r($allCustomers);
        
	if (!$allCustomers || (0==count($allCustomers)))
		break;
	
	foreach($allCustomers as $oneCustomer)
	{
            
            echo "<hr>";
		echo "Customer[".($i++)."]: {$oneCustomer->DisplayName}\n";
		echo "\t * Id: [{$oneCustomer->Id}]\n";
                echo "<br>";
		echo "\t * Active: [{$oneCustomer->Active}]\n";
                echo "<br>";
                echo "\t * CompanyName: [{$oneCustomer->CompanyName}]\n";
                echo "<br>";
                echo "\t * DisplayName: [{$oneCustomer->DisplayName}]\n";
                echo "<br>";
                echo "\t * DisplayName: [{$oneCustomer->GivenName}]\n";
                echo "<br>";
                //echo "\t * DisplayName: [{$oneCustomer->DisplayName}]\n";
                //echo "<br>";
                echo "<a href=UpdateCustomer.php?id={$oneCustomer->Id}&operation=update>Edit</a>";
		echo "\n";
                echo "<br>";
	}
}

/*

Example output:

Customer[0]: JIMCO
	 * Id: [NG:953957]
	 * Active: [true]

Customer[1]: ACME Corp
	 * Id: [NG:953955]
	 * Active: [true]

Customer[2]: Smith Inc.
	 * Id: [NG:952359]
	 * Active: [true]


...

*/
?>