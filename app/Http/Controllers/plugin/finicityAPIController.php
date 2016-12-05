<?php

namespace App\Http\Controllers\plugin;

use App\Admin;
use App\Http\Controllers\Controller;

class finicityAPIController extends Controller {

    public function InstitutionsList() {
        $search = $_POST["searchbyname"];
        $data = 'http://52.33.102.155/finicity-api/get-institution-lists.php?user_id={user_id}&search=' . $search;
        $banklist = file_get_contents($data);
        $institution = json_decode($banklist);
        $getInstitution = $institution->data->institutions;
        $Institution_list = json_decode(json_encode($getInstitution), True);
        $this->addTemplateVar('Institution', $Institution_list);
        return view('plugin.widget_ajax', $this->template_vars);
    }

    public function InstitutionsLoginForm() {
        $institutionId = $_POST['InstitutionId'];
        $data = 'http://52.33.102.155/finicity-api/get-institution-login-form.php?user_id={user_id}&institution_id=' . $institutionId;
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
        $ch = curl_init('http://52.33.102.155/finicity-api/institution-login.php?user_id=' . $_SESSION["finicity_userId"] . '&institution_id=' . $_SESSION["institutionId"]);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($_POST));
        $result = curl_exec($ch);
        curl_close($ch);

        $data = 'http://52.33.102.155/finicity-api/get-institution-accounts.php?user_id=' . $_SESSION["finicity_userId"] . '&institution_id=' . $_SESSION["institutionId"];
        $institution_list = file_get_contents($data);
        $institution_list_decode = json_decode($institution_list);
        $institutions = json_decode(json_encode($institution_list_decode), true);
        if ($institutions["success"] == '1') {
            $finicity_credentials = array('user_id' => $_SESSION["finicity_userId"], 'institution_id' => $_SESSION["institutionId"], 'InstitutionName' => $_SESSION["InstitutionName"], 'account_naumber' => $_POST["loginForm"][0]["value"]);
            $result = $admin_obj->saveFinicityPluginCredentials('Finicity', json_encode($finicity_credentials));
            unset($_SESSION["finicity_userId"]);
            unset($_SESSION["institutionId"]);
            //print_r($loginformData);
        } else {
            echo "Your Credential Invalid!";
        }
    }

    public function loadBankDetails() {
        $data = 'http://52.33.102.155/finicity-api/get-institution-accounts.php?user_id=' . $_POST["current_user_id"] . '&institution_id=' . $_POST["current_insitiution_id"];
        $institution_list = file_get_contents($data);
        $institution_list_decode = json_decode($institution_list);
        $institutions = json_decode(json_encode($institution_list_decode), true);

        if (isset($institutions["data"]["accounts"])) {
            $account_details = array();
            foreach ($institutions["data"]["accounts"] as $key => $value) {
                if ($value["type"] == 'investment' || $value["type"] == 'cd') {
                    $account_details['investment']["id"] = $value["id"];
                    $account_details['investment']["balance"] = $value["balance"];
                } elseif ($value["type"] == 'savings' || $value["type"] == 'checking' || $value["type"] == 'unknown') {

                    $account_details['savings']["id"] = $value["id"];
                    $account_details['savings']["balance"] = $value["balance"];
                } elseif ($value["type"] == 'creditCard' || $value["type"] == 'lineOfCredit') {

                    $account_details['creditcard']["id"] = $value["id"];
                    $account_details['creditcard']["balance"] = $value["balance"];
                } elseif ($value["type"] == 'mortgage' || $value["type"] == 'loan') {

                    $account_details['loan']["id"] = $value["id"];
                    $account_details['loan']["balance"] = $value["balance"];
                } elseif ($value["type"] == 'moneyMarket') {

                    $account_details['moneyMarket']["id"] = $value["id"];
                    $account_details['moneyMarket']["balance"] = $value["balance"];
                }
            }
            echo json_encode($account_details);
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

}
