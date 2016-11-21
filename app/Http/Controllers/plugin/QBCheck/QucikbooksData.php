<?php 

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

            $realmId = trim(decrypt_string($aciveQB_list["realmId"]));
            $oauth_token = trim(decrypt_string($aciveQB_list["oauth_token"]));
            $oauth_token_secret = trim(decrypt_string($aciveQB_list["oauth_token_secret"]));            
            $OAUTH_CONSUMER_KEY = trim(decrypt_string($aciveQB_list["OAUTH_CONSUMER_KEY"]));
            $OAUTH_CONSUMER_SECRET = trim(decrypt_string($aciveQB_list["OAUTH_CONSUMER_SECRET"])); 



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
    
        unset($_SESSION["chartValue"]);
        unset($_SESSION["chartHeader"]);
        
        
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
         
               
}  


if(($_POST["widgetType"] == 'proandloss'))
{
   
      unset($_SESSION["chartValue"]);
      unset($_SESSION["chartHeader"]);
      unset($_SESSION["report_value"]);
                            $query = $_POST["widgetPeriod"];
                            $uri = "company/{1}/cdc?{2}";
                            $Pluri = "company/{1}/reports/ProfitAndLoss?{2}";
                            $Pluri = str_replace("{1}", $serviceContext->realmId, $Pluri);
                            $Pluri = str_replace("{2}", $query, $Pluri);

                    // Creates request parameters
                            $requestParameters = new RequestParameters($Pluri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
                             $restRequestHandler = new RestServiceHandler($serviceContext);
                            try
                            {
                                // gets response
                                    list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);


             
            }
            catch (Exception $e)
            {
                echo"There is an exception";
            }	
   
            $total_income = array();
            $net_income = array();
            $expenses = array();

            $resonseArray = json_decode($responseBody,true);  
            
            $col_tile = array();
            foreach($resonseArray["Columns"] as $key=>$value)   
            {
                    foreach($value as $key1=>$value1)  
                    {
                        array_push($col_tile,$value[$key1]["ColTitle"]);
                    }
            }


            foreach($resonseArray["Rows"]["Row"] as $key=>$value)    
            {
                    foreach($value as $key1=>$value1)
                    {                    
                       foreach($value1 as $key2=>$value2)
                        {
                          if(isset($value2[0]["value"]))
                          {
                              
                             foreach($value2 as $key3=>$value3)
                                  {
                                     array_push($total_income,$value3["value"]);                          
                                  }

                           }  

                          if($value2[0]["value"] == "Net Income")
                          {
                              foreach($value2 as $key3=>$value3)
                                  {
                                      array_push($net_income,$value3["value"]);                         
                                  }

                           } 

                           if($value2[0]["value"] == "Total Expenses")
                            {
                                foreach($value2 as $key3=>$value3)
                                    {
                                        array_push($expenses,$value3["value"]);                           
                                    }

                             } 

                        }    
                    }                 
            }
            
        if(isset($_SESSION["token_error"]))
        {
                    echo "<div style='padding-top:50px'><center><b>".$_SESSION["token_error"]."</b></center></div>";
                    exit;
        }        
          
    foreach($resonseArray["Rows"]["Row"][count($resonseArray["Rows"]["Row"])-1] as $key=>$value)
       {
           if($key != 'group' && $key != 'type')
           {
                $totalValue = $value["ColData"];
           }
       }

    $count = 0;   
    foreach($totalValue as $key=>$value)
    {
       if($key != '0' && $key != (count($totalValue)-1)) 
       {
            $chartValue[$count][0] = "$col_tile[$key]";
            $chartValue[$count][1] = $value["value"];
            $count = $count+1; 
       }
       
    }
    
         
            
}

if($_POST["widgetType"] == "Income")
{
    unset($_SESSION["chartValue"]);
    unset($_SESSION["chartHeader"]);
    
$query = $_POST["widgetPeriod"];    
$query1 ="accounttype=10&sel_columns=0%2C1%2C2%2C3%2C4&full_columns=~date%3ATxDate%2C~ar_paid%3AIsARPaid%2C~name_label%3ATxHeader%2FNameID%2C-~amount_label%3ANaturalAmount%2C%3D~balance_label%3ANaturalAmount%2C~account_id_label%3AAccountID%2C~adjusting_text%3ATxHeader%2FIsAdjusting%2C~check_printed%3ATxHeader%2FCheckPrintState%2C~client%3ACustomerID%2C~is_cleared%3AIsCleared%2C~create_date_label%3ACreateDate%2C%7B~created_by%2CCreateUser%2FFirstName%2CCreateUser%2FLastName%7D%2C!~credit_label%3AAmount%2C!~debit_label%3AAmount%2C~employee_label%3AEmployeeID%2C~invoice_date%3AInvoiceDate%2C~last_modified%3ALastModifyDate%2C%7B~last_modified_by%2CModifyUser%2FFirstName%2CModifyUser%2FLastName%7D%2C~memo_desc_label%3AMemoText%2C~doc_num%3ATxHeader%2FDocNum%2C~olb_label%3AOlbMatchMode%2C~product_service_label%3AItemID%2C~ls_qty_col_header%3AQuantity%2C~rate_label%3ARate%2C~split_label%3AOtherAccountID%2C~txn_type_label%3ATxTypeID%2C~vendor_name_id%3AVendorID&token=GENERIC_QZREPORT&hidecents=false&divideby1000=false&negativered=false&ar_paid=unpaid&groupby=none&customized=yes&";
$query = $query1.$query;
$uri = "company/{1}/reports/QZReport?{2}";
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
     $income = json_decode($responseBody, true);
	  
}
catch (Exception $e)
{
        echo"There is an exception";
}	

        $income_col_tile = array();
            foreach($income["Columns"] as $key=>$value)   
            {
                    foreach($value as $key1=>$value1)  
                    {
                        array_push($income_col_tile,$value[$key1]["ColTitle"]);
                    }
            }
            


}

if($_POST["widgetType"] == "expensess")
{
    unset($_SESSION["chartValue"]);
    unset($_SESSION["chartHeader"]);
    
        $query = $_POST["widgetPeriod"];
        $query1 = "accounttype=11,12,14&cash_basis=no&crit=nopost%3Dfalse%3B&token=GENERIC_QZREPORT&groupby=(Account%2FAccountTypeID%2CAccount%2FOrderName&";
        $query = $query1.$query;
        $uri = "company/{1}/reports/QZReport?{2}";
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

        $QZReport = json_decode($responseBody, true);


        }
        catch (Exception $e)
        {
                echo"There is an exception";
        }	

        $QZReporttile = array();
        foreach($QZReport["Columns"] as $key=>$value)   
        {
                foreach($value as $key1=>$value1)  
                {
                    array_push($QZReporttile,$value[$key1]["ColTitle"]);
                }
        }

        $net_total_expensess = array();
        foreach($QZReport["Rows"]["Row"] as $key=>$value)    
        {
                foreach($value as $key1=>$value1)
                {                    
                   foreach($value1 as $key2=>$value2)
                    {
                       if($value2[0]["value"] == "TOTAL")
                       {
                           foreach($value2 as $key3=>$value3)
                           { 
                                if($value3["value"] != '')
                                {  
                                  array_push($net_total_expensess, $value3["value"]);
                                }
                           }     
                       }

                    }    
                }                 
        } 



}


if($_POST["widgetType"] == 'ardetails')
{
    unset($_SESSION["chartValue"]);
    unset($_SESSION["chartHeader"]);
      
        $query = $_POST["widgetPeriod"];
        $Aruri = "company/{1}/reports/AgedReceivables?{2}";
        $Aruri = str_replace("{1}", $serviceContext->realmId, $Aruri);
        $Aruri = str_replace("{2}", $query, $Aruri);

                // Creates request parameters
        $requestParameters = new RequestParameters($Aruri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
        $restRequestHandler = new RestServiceHandler($serviceContext);
        try
            {
                // gets response
                list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
                $arReceivable = json_decode($responseBody,true); 

            }
        catch (Exception $e)
        {
                echo"There is an exception";
        }

        $arb_col_tile = array();
        foreach($arReceivable["Columns"] as $key=>$value)   
        {
                foreach($value as $key1=>$value1)  
                {
                    array_push($arb_col_tile,$value[$key1]["ColTitle"]);
                }
        }

        
    foreach($arReceivable["Rows"]["Row"][count($arReceivable["Rows"]["Row"])-1] as $key=>$value)
       {
           if($key != 'group' && $key != 'type')
           {
                $totalValue = $value["ColData"];
           }
       }

    $count = 0;   
    foreach($totalValue as $key=>$value)
    {
       if($key != '0' && $key != (count($totalValue)-1)) 
       {
            $chartValue[$count][0] = "$arb_col_tile[$key]";
            $chartValue[$count][1] = $value["value"];
            $count = $count+1; 
       }
       
    }
   
       
    
}

if($_POST["widgetType"] == 'apdetails')
{
    unset($_SESSION["chartValue"]);
    unset($_SESSION["chartHeader"]);
    
        $query = $_POST["widgetPeriod"];
        $Apuri = "company/{1}/reports/AgedPayables?{2}";
        $Apuri = str_replace("{1}", $serviceContext->realmId, $Apuri);
        $Apuri = str_replace("{2}", $query, $Apuri);

        // Creates request parameters
        $requestParameters = new RequestParameters($Apuri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
        $restRequestHandler = new RestServiceHandler($serviceContext);
        try
        {
            // gets response
                list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
                $arPayable = json_decode($responseBody,true); 
                //print_r($arPayable);
        }
        catch (Exception $e)
        {
                echo"There is an exception";
        }

        $ar_col_tile = array();
        foreach($arPayable["Columns"] as $key=>$value)   
        {
                foreach($value as $key1=>$value1)  
                {
                    array_push($ar_col_tile,$value[$key1]["ColTitle"]);
                }
        }

 foreach($arPayable["Rows"]["Row"][count($arPayable["Rows"]["Row"])-1] as $key=>$value)
       {
           if($key != 'group' && $key != 'type')
           {
                $totalValue = $value["ColData"];
           }
       }

    $count = 0;   
    foreach($totalValue as $key=>$value)
    {
       if($key != '0' && $key != (count($totalValue)-1)) 
       {
            $chartValue[$count][0] = "$ar_col_tile[$key]";
            $chartValue[$count][1] = $value["value"];
            $count = $count+1; 
       }
       
    }
   
   
}

if($_POST["widgetType"] == 'caseflow')
{
    unset($_SESSION["chartValue"]);
    unset($_SESSION["chartHeader"]);
    
        $query = $_POST["widgetPeriod"];
        $Apuri = "company/{1}/reports/CashFlow?{2}";
        $Apuri = str_replace("{1}", $serviceContext->realmId, $Apuri);
        $Apuri = str_replace("{2}", $query, $Apuri);

        // Creates request parameters
        $requestParameters = new RequestParameters($Apuri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
        //var_dump($requestParameters);
        $restRequestHandler = new RestServiceHandler($serviceContext);
        try
        {
            // gets response
                list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
                $caseflow = json_decode($responseBody,true); 
                
        }
        catch (Exception $e)
        {
                echo"There is an exception";
        }

        $caseflow_tile = array();
        foreach($caseflow["Columns"] as $key=>$value)   
        {
                foreach($value as $key1=>$value1)  
                {
                    array_push($caseflow_tile,$value[$key1]["ColTitle"]);
                }
        }

 foreach($caseflow["Rows"]["Row"][count($caseflow["Rows"]["Row"])-1] as $key=>$value)
       {
           if($key != 'group' && $key != 'type')
           {
                $totalValue = $value["ColData"];
           }
       }

    $count = 0;   
    foreach($totalValue as $key=>$value)
    {
       if($key != '0' && $key != (count($totalValue)-1)) 
       {
            $chartValue[$count][0] = "$caseflow_tile[$key]";
            $chartValue[$count][1] = $value["value"];
            $count = $count+1; 
       }
       
    }

   
   

   
}       


if($_POST["widgetType"] == 'salesbycustomer')        
{
    unset($_SESSION["chartValue"]);
    unset($_SESSION["chartHeader"]);
    
    
        $query = $_POST["widgetPeriod"];
        $query1 = "sort_mode=descend&";
        $query = $query1.$query;
        $Apuri = "company/{1}/reports/CustomerSales?{2}";
        $Apuri = str_replace("{1}", $serviceContext->realmId, $Apuri);
        $Apuri = str_replace("{2}", $query, $Apuri);

        // Creates request parameters
        $requestParameters = new RequestParameters($Apuri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
        //var_dump($requestParameters);
        $restRequestHandler = new RestServiceHandler($serviceContext);
        try
        {
            // gets response
                list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
                $sales_customer = json_decode($responseBody,true);
              
               // print_r($sales_customer);
        }
        catch (Exception $e)
        {
                echo"There is an exception";
        }

        $sales_customer_tile = array();
        foreach($sales_customer["Columns"] as $key=>$value)   
        {
                foreach($value as $key1=>$value1)  
                {
                    array_push($sales_customer_tile,$value[$key1]["ColTitle"]);
                }
        }

   
        
   foreach($sales_customer["Rows"]["Row"][count($sales_customer["Rows"]["Row"])-1] as $key=>$value)
       {
           if($key != 'group' && $key != 'type')
           {
                $totalValue = $value["ColData"];
           }
       }

    $count = 0;   
    foreach($totalValue as $key=>$value)
    {
       if($key != '0' && $key != (count($totalValue)-1)) 
       {
            $chartValue[$count][0] = "$sales_customer_tile[$key]";
            $chartValue[$count][1] = $value["value"];
            $count = $count+1; 
       }
       
    }

   
    
    
    
}
  


if(isset($_POST["lableValue"]))   
 {
     
     
        $query = $_POST["period"];
        $Apuri = "company/{1}/reports/AgedPayables?{2}";
        $Apuri = str_replace("{1}", $serviceContext->realmId, $Apuri);
        $Apuri = str_replace("{2}", $query, $Apuri);

        // Creates request parameters
        $requestParameters = new RequestParameters($Apuri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
        $restRequestHandler = new RestServiceHandler($serviceContext);
        try
        {
            // gets response
                list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
                $arPayable = json_decode($responseBody,true); 
               // print_r($arPayable);
        }
        catch (Exception $e)
        {
                echo"There is an exception";
        }
     
        foreach($arPayable["Rows"]["Row"][count($arPayable["Rows"]["Row"])-1] as $key=>$value)
       {
           if($key != 'group' && $key != 'type')
           {
                $totalValue1 = $value["ColData"];
           }
       }
        
        
        
        $Aruri = "company/{1}/reports/AgedReceivables?{2}";
        $Aruri = str_replace("{1}", $serviceContext->realmId, $Aruri);
        $Aruri = str_replace("{2}", $query, $Aruri);

                // Creates request parameters
        $requestParameters = new RequestParameters($Aruri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
        $restRequestHandler = new RestServiceHandler($serviceContext);
        try
            {
                // gets response
                list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
                $arReceivable = json_decode($responseBody,true); 
               // print_r($arReceivable);

            }
        catch (Exception $e)
        {
                echo"There is an exception";
        }
        
        
       foreach($arReceivable["Rows"]["Row"][count($arReceivable["Rows"]["Row"])-1] as $key=>$value)
       {
           if($key != 'group' && $key != 'type')
           {
                $totalValue = $value["ColData"];
           }
       }
        
      // echo $totalValue[count($totalValue)-1]["value"];
    
   
     
 }

 
if(isset($_POST["companyInfo"]))
{
   
        $uri = "company/{1}/companyinfo/{1}";
        $uri = str_replace("{1}", $serviceContext->realmId, $uri);
                // Creates request parameters
        $requestParameters = new RequestParameters($uri, 'GET', CoreConstants::CONTENTTYPE_APPLICATIONJSON, NULL);
        //var_dump($requestParameters);
        $restRequestHandler = new RestServiceHandler($serviceContext);
        try
        {
                            // gets response
            list($responseCode,$responseBody) = $restRequestHandler->GetReportsResponse($requestParameters, NULL, NULL);
            $cmpanyInfo = json_decode($responseBody, true);
            

        }
        catch (Exception $e)
        {
                echo"There is an exception";
        }
}
 





?>
