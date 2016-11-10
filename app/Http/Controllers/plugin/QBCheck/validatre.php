<?php 

   //ini_set("display_errors",1);         
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

        $serviceType = IntuitServicesType::QBO;
        

           // Prep Service Context
    $requestValidator = new OAuthRequestValidator($oauth_token,$oauth_token_secret,$OAUTH_CONSUMER_KEY,$OAUTH_CONSUMER_SECRET);
    $serviceContext = new ServiceContext($realmId, $serviceType, $requestValidator);
    if (!$serviceContext)
            exit("Problem while initializing ServiceContext.\n");

    $serviceContext->IppConfiguration->Logger->RequestLog->Log(TraceLevel::Info, "Going to fetch report data.");


if($_POST["widgetType"] == 'balancesheet'){
      
                $query = $_POST["widgetPeriod"];
                $Bsuri = "company/{1}/reports/BalanceSheet?{2}";
                $Bsuri = str_replace("{1}", $serviceContext->realmId, $Bsuri);
                $Bsuri = str_replace("{2}", $query, $Bsuri);

                // Creates request parameters
                    $requestParameters = new RequestParameters($Bsuri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
                   //var_dump($requestParameters); 
                    $restRequestHandler = new RestServiceHandler($serviceContext);
                    try
                    {
                        // gets response
                            list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
                            $balanceSheet = json_decode($responseBody,true);    
                    }
                    catch (Exception $e)
                    {
                            echo"There is an exception";
                    }	

                $balance_sheet_coll_title = array();    
                foreach($balanceSheet["Columns"] as $key=>$value)   
                {
                        foreach($value as $key1=>$value1)  
                        {
                            array_push($balance_sheet_coll_title,$value[$key1]["ColTitle"]);
                        }
                }   

                
                
    foreach($balanceSheet["Rows"]["Row"][count($balanceSheet["Rows"]["Row"])-1] as $key=>$value)
       {
      
           if($key != 'group' && $key != 'type' && isset($value["ColData"]))
           {
                $totalValue = $value["ColData"];
           }
       }

    $count = 0;   
    foreach($totalValue as $key=>$value)
    {
       if($key != '0') 
       {
            $chartValue[$count][0] = "$balance_sheet_coll_title[$key]";
            $chartValue[$count][1] = $value["value"];
            $count = $count+1; 
       }
       
    }
    
    
         //$_SESSION["chartValue"] = $chartValue;         
         //$_SESSION["chartHeader"] = $totalValue[0]["value"];       
                //Balance Sheet Details
                
           // $smarty->assign("balance_sheet_coll_title",$balance_sheet_coll_title); 
           // $smarty->assign("balance_sheet_array",$balanceSheet["Rows"]["Row"]); 
    
  //echo "<pre>";  
   print_r($balanceSheet["Rows"]["Row"]);
//  echo "</pre>";   
    
               
}  
            

?>
