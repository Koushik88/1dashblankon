<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
echo '<a href="javascript:void(0)" onclick="goHome()">Home</a>';
echo '&nbsp;&nbsp;&nbsp;';
echo '<a href="javascript:void(0)" onclick="return intuit.ipp.anywhere.logout(function () { window.location.href = \'http://localhost/QuickbookSampleapp/PHPSample/index.php\'; });">Sign Out</a>';
echo '&nbsp;&nbsp;&nbsp;';
//echo '<a target="_blank" href="http://localhost/QuickbookSampleapp/PHPSample/ReadMe.htm">Read Me</a><br />';

?>

<body>
    <div>Create TaxAgency</div>   
            <form name="taxagency" method="post" action="CreateTaxagency.php">
            <div><input type="text" name="taxagency" value=""><input type="submit" name="submit" value="Save"></div>        
            </form>
    
    <div align="center">Create TaxAgency</div>
<form name="taxagency" method="post" action="CreateTaxAgency.php">
    <table align="center">
        <tr>
            <td><label>TaxAgency Name</label></td><td><input type="text" name="taxagency"  placeholder="TaxAgency" value=""></td>    
          
        </tr>   
        <tr><td></td>  <td><input type="submit" name="submit" value="Save"></td></tr>
        
        
        
    </table>  
    
    
    
</form>

    
    
    
    
    
</body>