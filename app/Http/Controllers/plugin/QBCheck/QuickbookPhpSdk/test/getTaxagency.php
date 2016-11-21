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



  /*  $taxAgencyId='';
    
    
   if($taxAgencyId ==''){
        
        
    $TaxAgencyQry = $dataService->Query("SELECT * FROM TaxAgency");    
       
    }
    
    
    if($taxAgencyId ==$_POST['taxagency']){


echo $taxAgencyId= $_POST['taxagency'];


$TaxAgencyQry = $dataService->Query("SELECT * FROM TaxAgency WHERE Id = '$taxAgencyId'");
   
}*/

   // }
/*$TaxAgencyQry = $dataService->Query("SELECT * FROM TaxAgency WHERE Id = '$taxAgencyId'");


echo "<pre>";
        print_r($TaxAgencyQry);
        echo "</pre>";*/
/*$i = 0;


while (1) {
	$allTaxAgency = $dataService->FindAll('TaxAgency', $i, 500);
        echo "<pre>";
        print_r($allTaxAgency);
        echo "</pre>";
	//if (!$allCustomers || (0==count($allCustomers)))
	//	break;
	
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
*/




        /*echo "<pre>";
        print_r($allTaxAgency);
        echo "</pre>";*/
        
        
  /* foreach($allTaxAgency as $oneTaxagency)
	{
              
          	echo "\t * Id: [{$oneTaxagency->Id}]\n";    
              echo "\t * Id: [{$oneTaxagency->DisplayName}]\n";   
          
        }*/          
        


?>


<!--<body>
    <div>TaxAgency</div> 
    <form name="Taxagency" method="post" action="getTaxagency.php">
    <div>
        <select name="taxagency" placeholder="Select... (Required)" style="width: 220px">
         
            
        
       <option value="">All</option>-->
        <?php
       // $i = 0;


//while (1) {
	//$allTaxAgency = $dataService->FindAll('TaxAgency', $i, 500);
        
     /*  $allTaxAgency= $dataService->Query("SELECT * FROM TaxAgency");
         foreach($allTaxAgency as $oneTaxagency)
	{
            
              if($taxAgencyId==$oneTaxagency->Id){
                  
                   $selected='selected ="selected"';
                  
              }else{
                  
                $selected='';  
                  
              }
          	echo "<option value=".$oneTaxagency->Id." $selected>".$oneTaxagency->DisplayName."</option>";    
               
          
        }  */  
        
        
//}
        ?>
        
        
       <!-- </select><input type="submit" name="submit" value="Report"></div>
    </form>-->
<div>List TaxAgency</div>
    <div>
        
        <?php
         $TaxAgencyQry = $dataService->Query("SELECT * FROM TaxAgency");  
        
        foreach($TaxAgencyQry as $oneTaxagency)
	{
            
            echo "<hr>";
		
		echo "\t * Id: [{$oneTaxagency->Id}]\n";
                echo "<br>";
		echo "\t * DisplayName: [{$oneTaxagency->DisplayName}]\n";
                echo "<br>";
                
		echo "\n";
                echo "<br>";
	}
        
        
        
        
        
        ?>
        
        
        
    </div>
   
      
    
</body>

