<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

?>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>Add Customer</div>
        <form method="post" name="Addcustomer" action="CustomerCreate.php">
        <input type="text" name="CusId" value="">
        <div><label>Given Name</label>
        <input type="text" name="GivenName" value="">
        </div>
          <div><label>Family Name</label>
            <input type="text" name="FamilyName" value="">
        </div>
        
          <div><label>Email</label>
            <input type="text" name="Email" value="">
        </div>
        
         <div><label>Phone</label>
              <input type="text" name="Countrycode" value="">
            <input type="text" name="Phone" value="">
         </div>
        
        <div><label>Address</label>
            <input type="text" name="Street" value=""><br>
            <input type="text" name="City" value=""><br>
            <input type="text" name="Country" value=""><br>
            <input type="text" name="Postalcode" value="">
        </div>
        
        <div><input type="submit" name="submit" value="Save"></div>
        
        </form>
                
    </body>
</html>
