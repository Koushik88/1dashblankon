<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include('../config.php');
echo header('Content-Type: text/html; charset=UTF-8');
 //header('Access-Control-Allow-Origin: *');  

 if (isset($_REQUEST["action"])) {
    if ($_REQUEST["action"] == "GetWidgets") {


        $id = $_GET['id'];
        //echo "dhana";    
        $qry = "SELECT * FROM tbl_modules where ModuleId=$id";
        $result = mysql_query($qry);


        $number_result = mysql_num_rows($result);
        if ($number_result != "") {
            $getWidget = array();
            while ($row = mysql_fetch_assoc($result)) {
               

                $getWidget = array(
                    "ModuleId" => $row['ModuleId'],
                    "ModuleName" => $row['ModuleName'],
                    "Title" => $row['Title'],
                    "Description" => $row['Description'],
                    "ApiURI" => $row['ApiURl'],
                );
                 
               
            }

            $Ouput = array("ResponseObject" => $getWidget,
                "IsSuccess" => true
            );
        } else {
            $Ouput = array("ErrorObject" => "No Data Available",
                "IsSuccess" => false
            );
        }
        echo json_encode($Ouput);
        
        
    }
}

