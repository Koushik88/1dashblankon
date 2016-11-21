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
require_once(PATH_SDK_ROOT . 'QueryFilter/QueryMessage.php');

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




 $EditCustId=$_GET['id'];
 
 $Cusentities = $dataService->Query("SELECT * FROM Customer WHERE Id = '$EditCustId'");

echo "<pre>";
print_r($Cusentities);
echo "</pre>";

 


?>
<html>
   
    <body>
       
       
        <div>Update Customer</div>
        <form method="post" name="Updatecustomer" action="CustomerCreate.php">
           
       <?php 
       foreach($Cusentities as $cusObj){ ?>
           
             <input type="hiden" name="CusId" value="<?php echo $cusObj->Id; ?>">
        <div><label>Given Name</label>
        <input type="text" name="GivenName" value="<?php echo $cusObj->GivenName; ?>">
        </div>
          <div><label>Family Name</label>
            <input type="text" name="FamilyName" value="<?php echo $cusObj->FamilyName; ?>">
        </div>
        
          <div><label>Email</label>
            <input type="text" name="Email" value="<?php echo $cusObj->PrimaryEmailAddr->Address; ?>">
        </div>
        
          <div><label>Phone</label>
              <input type="text" name="Countrycode" value="">
            <input type="text" name="Phone" value="<?php echo $cusObj->PrimaryPhone->FreeFormNumber; ?>">
         </div>
        
        <div><label>Address</label>
            <input type="text" name="Street" value="<?php echo $cusObj->BillAddr->Line1; ?>"><br>
            <input type="text" name="City" value="<?php echo $cusObj->BillAddr->City; ?>"><br>
            <input type="text" name="Country" value="<?php echo $cusObj->BillAddr->Country; ?>"><br>
            <input type="text" name="Postalcode" value="<?php echo $cusObj->BillAddr->PostalCode; ?>">
        </div>
        
        <div><input type="submit" name="submit" value="Update"></div>
       <?php } 
       
       //}?>
        </form>
        
        
        
    </body>
</html>
