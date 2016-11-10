<?php
  require_once("./CSS Styles/StyleElements.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<h3>IPP PHP Sample App</h3>
<script type="text/javascript" src="https://appcenter.intuit.com/Content/IA/intuit.ipp.anywhere.js"></script>

</head>
<body>

<!--<a href="http://localhost/QuickbookSampleapp/PHPSample/index.php?connectWithIntuitOpenId">Go Back</a>&nbsp;&nbsp;&nbsp;-->

<?php
 # Add a link to allow the user to logout. The link makes a JavaScript call to intuit.ipp.anywhere.logout()
 echo '<a href="javascript:void(0)" onclick="return intuit.ipp.anywhere.logout(function () { window.location.href = \'http://localhost/Onedash/PHPSample/index.php\'; });">Sign Out</a>&nbsp;&nbsp;&nbsp;';
?>
			
<!--<a target="_blank" href="http://localhost/QuickbookSampleapp/PHPSample/ReadMe.htm">Read Me</a>--><br />

<!--<button class="myButton" style="margin-top:30px;margin-bottom:30px" title="Create an employee in QBO" onclick='createEmployee()'>Create Employee </button> <br />


<button class="myButton" style="margin-bottom:30px" title="Get the list of accounts in QBO" onclick='getAccounts()'>Get QBO Accounts </button> <br />

<button class="myButton" style="margin-bottom:30px" title="Create a General Journal entry in QBO" onclick='createGJE()'>Create Journal Entry </button> <br />

<button class="myButton" style="margin-bottom:30px" title="View QuikBooks Trial Balance Report" onclick='showTrialBalanceReport()'>Trial Balance Report </button>--> <br />


<button class="myButton" style="margin-bottom:30px" title="Add Customer" onclick='AddCustomer()'>Create Customer </button> <br />


<button class="myButton" style="margin-bottom:30px" title="Add TaxAgency" onclick='AddTaxagency()'>Create TaxAgency </button> <br />


<button class="myButton" style="margin-bottom:30px" title="Add Dept" onclick='AddDept()'>Create Department </button> <br />


<script>
function createEmployee(){
window.location.href = "http://localhost/Onedash/PHPSample/EmployeeCreate.php";
}

function getAccounts(){
window.location.href = "http://localhost/Onedash/PHPSample/AccountsFindAll.php";
}

function createGJE(){
window.location.href = "http://localhost/Onedash/PHPSample/CreateGJE.php";
}

function showTrialBalanceReport(){
window.location.href = "http://localhost/Onedash/PHPSample/TrailBalanceReport.php";
}

function AddCustomer(){
window.location.href = "http://localhost/Onedash/PHPSample/addCustomer.php";
}

function AddTaxagency(){
window.location.href = "http://localhost/Onedash/PHPSample/addTaxagency.php";
}

function AddDept(){
window.location.href = "http://localhost/Onedash/PHPSample/AddDept.php";
}


</script>


</body>
</html>
