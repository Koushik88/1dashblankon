<?php

namespace App\Http\Controllers\plugin;

use App\Admin;
use App\Http\Controllers\Controller;

class finicityAPIController extends Controller {

    public function InstitutionsList() {
        $search = $_POST["searchbyname"];
        $data = 'http://52.33.102.155/1dash-api/get-institution-lists.php?user_id={user_id}&search=' . $search;
        $banklist = file_get_contents($data);
        $institution = json_decode($banklist);
        $getInstitution = $institution->data->institutions;
        $Institution_list = json_decode(json_encode($getInstitution), True);
        $this->addTemplateVar('Institution', $Institution_list);
        return view('plugin.widget_ajax', $this->template_vars);
    }

    public function InstitutionsLoginForm() {
        $institutionId = $_POST['InstitutionId'];
        $data = 'http://52.33.102.155/1dash-api/get-institution-login-form.php?user_id={user_id}&institution_id=' . $institutionId;
        $loginform = file_get_contents($data);
        $loginformData = json_decode($loginform);
        $getloginformData = $loginformData->data->loginForm;
        $getloginformDatas = json_decode(json_encode($getloginformData), True);

        $_SESSION["institutionId"] = $_POST['InstitutionId'];
        $_SESSION["InstitutionName"] = $_POST['InstitutionName'];
        $_SESSION["finicity_userId"] = (strlen($_POST['InstitutionId']) + strlen($_POST['InstitutionName']) + $_SESSION["userId"] + rand(1, 100000));

        $this->addTemplateVar('getloginformDatas', $getloginformDatas);
        return view('plugin.widget_ajax', $this->template_vars);
    }

    public function institutionFormdataAggrication() {

        $admin_obj = new Admin;
        $finicity_CredentialList = $admin_obj->getAllPluginCredentials('Finicity');

        foreach ($finicity_CredentialList as $key => $value) {
            $decode_value = json_decode($finicity_CredentialList[$key]["data"], true);
            if ($decode_value["account_naumber"] == $_POST["loginForm"][0]["value"]) {
                echo "Account Id already Added Please try to another account Id";
                exit;
            }
        }

        $postFields = array('loginForm' => json_encode($_POST));
        $ch = curl_init('http://52.33.102.155/1dash-api/institution-login.php?user_id=' . $_SESSION["finicity_userId"] . '&institution_id=' . $_SESSION["institutionId"]);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($_POST));
        $result = curl_exec($ch);
        curl_close($ch);

        $data = 'http://52.33.102.155/1dash-api/get-institution-accounts.php?user_id=' . $_SESSION["finicity_userId"] . '&institution_id=' . $_SESSION["institutionId"];
        $institution_list = file_get_contents($data);
        $institution_list_decode = json_decode($institution_list);
        $institutions = json_decode(json_encode($institution_list_decode), true);
        if ($institutions["success"] == '1') {
            $finicity_credentials = array('user_id' => $_SESSION["finicity_userId"], 'institution_id' => $_SESSION["institutionId"], 'InstitutionName' => $_SESSION["InstitutionName"], 'account_naumber' => $_POST["loginForm"][0]["value"],'bank_aliesname'=>$_SESSION["BankAliesname"],"customerId"=>$institutions["data"]["accounts"][0]["customerId"]);
            $result = $admin_obj->saveFinicityPluginCredentials('Finicity', json_encode($finicity_credentials));
            unset($_SESSION["finicity_userId"]);
            unset($_SESSION["institutionId"]);
            echo "Your Account Added Successfully!";
            //print_r($loginformData);
        } else {
            echo "Your Credential Invalid!";
        }
    }

    public function loadBankDetails() {
        $data = 'http://52.33.102.155/1dash-api/get-institution-accounts.php?user_id=' . $_POST["current_user_id"] . '&institution_id=' . $_POST["current_insitiution_id"];
        $institution_list = file_get_contents($data);
        $institution_list_decode = json_decode($institution_list);
        $institutions = json_decode(json_encode($institution_list_decode), true);

        if (isset($institutions["data"]["accounts"])) {
            $account_details = array();

            unset($_SESSION["first_customer_id"]);
            unset($_SESSION["current_user_id"]);
            if ($institutions["data"]["accounts"]) {
                $_SESSION["first_customer_id"] = $institutions["data"]["accounts"][0]["id"];
                $_SESSION["current_user_id"] = $_POST["current_user_id"];
            }

            $this->addTemplateVar("current_user_id", $_POST["current_user_id"]);
            $this->addTemplateVar('customer_data', $institutions["data"]["accounts"]);
            return view('plugin.widget_ajax', $this->template_vars);
        } else {
            if (isset($institutions["message"])) {
                $error_message = json_decode($institutions["message"], true);
                echo "0";
            }
        }
    }

    public function changeFinicityAccount() {
        $admin_obj = new Admin;
        $admin_obj->updateFinicityActiveAcount($_POST["changePluginId"]);
    }

    public function viewCustomerTransaction() {
        
        if ($_POST["account_id"] == '0') {
            
            $_POST["account_id"] = $_SESSION["first_customer_id"];
            $_POST["selected_user_id"] = $_SESSION["current_user_id"];
        } 
        
        //echo date('Y-m-d',$_POST["finicity_startdate"]);
        $startDate = date("d/m/Y", strtotime($_POST["finicity_startdate"]));
        $endDate = date("d/m/Y", strtotime($_POST["finicity_enddate"]));
        $startDate = strtotime($startDate);
        $endDate = strtotime($endDate);
        $data = 'http://52.33.102.155/1dash-api/get-transaction-history.php?account_id=' . $_POST["account_id"] . '&user_id=' . $_POST["selected_user_id"].'&from='.$startDate.'&to='.$endDate;
        
        $transaction_data = file_get_contents($data);
        $decoded_data = json_decode($transaction_data);
        $customers_transaction = json_decode(json_encode($decoded_data), true);
        
        if($customers_transaction["success"] == '')
        {
           $error_msg = json_decode($customers_transaction["message"],true);
           echo "<br><div align='center'>".$error_msg["message"]."</div>";
           exit;
        }
        
        
        $this->addTemplateVar('transactions', $customers_transaction["data"]["transactions"]);
        return view('plugin.widget_ajax', $this->template_vars);
    }
    public function saveBankAliesname()
    {
        $_SESSION["BankAliesname"] = $_POST["bankAliesName"];
    }
    public function deleteTransaction()
    {
         // print_r($_POST);
        $data = 'http://52.33.102.155/1dash-api/customer-delete.php?user_id='.$_POST["deleteUserId"].'&customerId='.$_POST["deleteCustomerId"];
        $response = file_get_contents($data);
        $response = json_decode($response,true);
        if($response["success"] == 1)
        {
            $admin_obj = new Admin;
            $finicity_CredentialList = $admin_obj->deleteQBPluginInfo("Finicity", $_POST["delete_pluginId"]);
            echo "Your account has been deleted";
        }
        else 
        {
            $error_message = json_decode($response["message"],true);
            print_r($error_message["message"]);
        }
        
    }

}
