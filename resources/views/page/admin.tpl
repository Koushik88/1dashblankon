{if $smarty.session.expiry_msg eq '1'}
   <br/>
        <div class="col-xs-2"></div>
        <div class="alert alert-danger col-xs-8">
               Your last payment has failed. Kindly update your card details for unrestricted access
        </div>
        
{/if}


<br/>
<div class="block-area">
   

    <div class="col-md-11">
        <div class="tile">
                <h2 class="tile-title">Manage Users</h2>
                
                            <div class="tile-config dropdown">
                                <a id="prtour_admin_user" data-toggle="dropdown" href="" class="tile-menu"></a>
                                <ul class="dropdown-menu  pull-right text-right" style="min-width:130px !important;">                                                    
                                        <li><a href="#add_user" data-toggle="modal">Add User</a></li> 
                                        <li><a href="#add_role" onclick="addRoleClear()" data-toggle="modal">Add Role</a></li>
                                    </ul>
                            </div>
                
                <div class="listview icon-list" style="padding:0px 20px 0px 20px;"><br/>
                    <div class="table-responsive overflow" id="loadUserInfo">
                        
                    </div> 
                </div>
     </div>
    </div> 
    <div class="col-md-6">
    <div class="tile">
                        <h2 class="tile-title">Accounts Details</h2>
                        <div class="tile-config dropdown">
                              {*  <a  id="prtour_cancelAccount" data-toggle="dropdown" href="" class="tile-menu"></a>
                                *}<ul class="dropdown-menu  pull-right text-right">                                                    
                                    <li><a href="#cancelAccount"  data-toggle="modal">Cancel Account</a></li>
                                </ul>
                        </div>
                        <div class="listview icon-list"> 
                            <div class="media">                                                
                                <div class="media-body"> 
                                    <div class="col-md-6"> 
                                        Current Plan : -- <input type="hidden" id="license_id" value="{$licence_type["license_id"]}">
                                    </div> 
                                    
                                     {if $licence_type["license_id"] neq '1'} 
                                        <div class="col-md-3">
                                            <a href="javascript:void(0);" data-toggle="modal" class="btn btn-sm m-r-5 pull-right">Update Card</a>
                                        </div>     
                                    {else}
                                        <div class="col-md-3"></div>
                                        {/if}
                                    <div class="col-md-3">
                                     <a id="prtour_modifyPlan" href="javascript:void(0);" data-toggle="modal"  class="btn btn-sm m-r-5 pull-right">Modify/Renew - Plan</a>
                                    </div> 
                                </div>
                            </div>
                             <div class="media">                                                
                                <div class="media-body"> 
                                    <div class="col-md-6"> 
                                     Number of Users :   --
                                    </div>
                                    <div class="col-md-6"> 
                                     <a  id="prtour_additionalUser" href="javascript:void(0);"  class="btn btn-sm m-r-5 pull-right" >Buy Additional Users</a>
                                    </div>   
                                </div>
                            </div>
                             <div class="media">                                                
                                <div class="media-body"> 
                                    <div class="col-md-6"> 
                                     Plan Expires On :--
                                    </div>
                                    <div class="col-md-6"> 
                                      <a id="prtour_latestInvoice" href="javascript:void(0)" class="btn btn-sm m-r-5 pull-right" {if $licence_type["license_id"] eq '1'} disabled {/if}>Latest Invoice</a>
                                    </div>
                                </div>
                            </div>


                       </div>
    </div>
</div>
    
     
                            
                            
 <div class="modal fade" id="add_user" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Add User</h4>
                </div>
                <div class="modal-body"> 
                    
                
                    <form name="new_user" method="POST" id="new_user"> 
                        <div class="row">  
                            <div class="col-md-6 m-b-15">
                                     <label>Firstname *</label>
                                     <input type="text" class="input-sm form-control" name="frstname" id="frstname" value="" required autocomplete="off" maxlength="20">
                             </div>
                             <div class="col-md-6 m-b-15">
                                     <label>Lastname *</label>
                                     <input type="text" class="input-sm form-control" name="lstname" id="lstname" value=""  required autocomplete="off"  maxlength="20">
                             </div>
                        </div> 
                    
                        <div class="row">  
                            <div class="col-md-6 m-b-15">
                                     <label>Email *</label>
                                     <input type="text" class="input-sm form-control" name="usremail" id="usremail" value=""  required autocomplete="off" onblur="checkEmail();">
                            </div>
                            <div class="col-md-6 m-b-15">
                                    <label>Role *</label>
                                         <select style="padding-left:10px;width:275px;height:29px;background-color:transparent;border:1px solid rgba(255, 255, 255, 0.3);" id="role_no">
                                            {foreach $role as $key=>$value}
                                                <option value="{$value["id"]}">{$value["role"]}</option>   
                                            {/foreach}    
                                        </select>
                            </div>
                        </div> 
                       
                        <div class="row">  
                            <div class="col-md-6 m-b-15">
                                     <label>Password *</label>
                                     <input type="password" class="form-control input-sm" name="pswd" id="pswd" value=""  required autocomplete="off" maxlength="50">
                            </div>
                            <div class="col-md-6 m-b-15">
                                    <label>Confirm Password *</label>
                                    <input type="password" class="form-control input-sm"  name="cnfpswd" id="cnfpswd" value=""  required autocomplete="off" maxlength="50">
                            </div>
                        </div> 
                              <input type="hidden" value="" id="emailIdExist">          
                        <div class="modal-footer">
                              <button type="button" class="btn btn-sm" onclick="return saveUser();">Save</button>
                              <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
</div>                           
 
      
<div class="modal fade" id="add_role" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Add Role</h4>
            </div>
            <form name="new_rolefrm" method="POST" id="new_rolefrm"> 
            <div class="modal-body" style="height:75px !important">
                <div class="row">  
                            <div class="col-md-12 m-b-15">
                                     <label>Role *</label>
                                     <input type="text" class="form-control input-sm" name="new_role" id="new_role" value="" autocomplete="off" required>
                            </div>
                            
                </div> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm" onclick="return addNewrole();">Save</button>
                <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
            </div>
             </form>
        </div>
    </div>
</div>
                                        
                                        
 
                                        
<div class="modal fade" id="edit_user" tabindex="-1" role="dialog" aria-hidden="true">
  
</div>      
                                        
                                        
                                        
<div class="modal fade" id="reset_password" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm" style="width:500px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Reset Password</h4>
            </div>
            <form name="rstpswdfrm" method="POST" id="rstpswdfrm" action=""> 
               
                <div class="modal-body">
                    <div class="row">  
                                <div class="col-md-6 m-b-15">
                                         <label>Password *</label>
                                         <input type="password" class="form-control input-sm" name="rspswd" id="rspswd" value=""  required>
                                </div>
                                 <div class="col-md-6 m-b-15">
                                         <label>Confirm Password *</label>
                                         <input type="password" class="form-control input-sm" name="rsconfirmpswd" id="rsconfirmpswd" value=""  required>
                                </div>
                         
                    </div> 
                </div>
                 <input type="hidden" id="restUser_Id" value="">
                 <input type="hidden" id="restUser_email" value="">
                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm" onclick="return resetPassword();">Save</button>
                        <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
                    </div>
             </form>
        </div>
    </div>
</div>
                                      

<!--Update and Modify Plan -->  
<div class="modal fade" id="modify_plan" tabindex="-1" role="dialog" aria-hidden="true">
        
</div>                 


<!--Buy Additional User -->
<div class="modal fade" id="buy_additional_user" tabindex="-1" role="dialog" aria-hidden="true">
        
</div>    

<!--Account Cancel-->
<div class="modal fade" id="cancelAccount" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Account Cancel</h4>
                </div>
                <div class="modal-body"> 
                    <div class="form-group">
                        After you cancel your 1Dash account all of your current data and application will be deleted and you will lose access to 1Dash. We will not be retaining any details and you have to sign up once again as an new user.
                    </div>
                     <br/><br/>
                    <div class="form-group">
                        <b>Reason for Cancellation</b>
                          
                    </div>
                  <div style="padding-left:20px;">  
                    <div class="radio">
                        <label>
                            <input type="radio" name="radio" class="reason_cancel" value="1Dash is not useful">
                            1Dash is not useful
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="radio" class="reason_cancel" value="My usage for 1Dash ended">
                            My usage for 1Dash ended
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                          <input type="radio" name="radio" class="reason_cancel" value="1Dash is too expensive">
                          1Dash is too expensive
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="radio" class="reason_cancel" value="I am using some other Product">
                            I am using some other Product
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="radio" class="reason_cancel" value="I have privacy concerns">
                           I have privacy concerns
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="radio" class="reason_cancel" value="1Dash has very limited features">
                           1Dash has very limited features
                        </label>
                    </div>
                     <div class="radio">
                        <label>
                            <input type="radio" name="radio" class="reason_cancel" value="Others">
                           Others
                        </label>
                     </div>
                </div>
                        <div class="row">
                            <div class="col-md-7">
                                    <div class="form-group">
                                        <label for="Message">Explain in Detail</label>
                                        <textarea class="form-control overflow" id="reason_details" rows="4" placeholder="" tabindex="5003" style="overflow: hidden; outline: none;"></textarea>
                                    </div>
                                    <div class="form-group">
                                       <label for="paswd">Account password</label>
                                       <input type="password" class="form-control input-sm"  placeholder="" id="currentPassword">
                                   </div>
                            </div>
                        </div>
                             <button onclick="cancelAccount();"  class="btn btn-sm m-t-10">Submit</button>
                   </div>
            </div>
        </div>
</div>
</div>

           
<div class="modal fade" id="latest_invoice" tabindex="-1" role="dialog" aria-hidden="true">
        
</div> 
                
                
   <div class="modal fade" id="updateCardDetials" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" style="width:380px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Update Card</h4>
                </div>
                    <div class="modal-body"> 
                   
                    <form name="update_carddetails_form" method="POST" id="update_carddetails_form" action=""> 
                     
                      <div class="row">
                            <div class="col-md-12 m-b-15">
                                    <label>Name</label>
                                    <input type="text" class="input-sm form-control" name="cust_name" id="cust_name" required="required">
                            </div>
                       </div>
                            
                        <div class="row">
                            <div class="col-md-12 m-b-15">
                                    <label>Card Number</label>
                                    <input type="text" class="input-sm form-control" name="cc_number" id="cc_number" required="required">
                            </div>
                        </div>  
                        <div class="row">
                             <div class="col-md-6 m-b-15">
                                            <label>Expiration</label>
                                            <input type="text" class="input-sm form-control" name="cc_expiration" id="cc_expiration" required="required">
                            </div>
                            <div class="col-md-6 m-b-15">
                                            <label>CVC</label>
                                            <input type="text"  class="input-sm form-control" name="cc_cvc" id="cc_cvc" required="required">
                            </div>
                        </div>  
                        
                        <input type="hidden" value="{$licence_type["payment_customer_id"]}" id="customer_id">
                            
                            <div class="modal-footer">
                                 <button type="button" class="btn btn-sm" onclick="return updateCardDetail();">Save</button>
                                 <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
                            </div>
                    </form>
                    </div>
	
                </div>
            </div>
        </div>
        
 <script src='{$smarty.const.JSLOCATION}/jquery.payment.min.js'></script>               
 <script src="{$smarty.const.JSLOCATION}/credicard_validation.js"></script> 

 
    <script type="text/javascript">
         var prtour = "{$smarty.get.prtour}";
         var NoOfLicenceUser = "{$userListCount-1}";
         
        
        {literal}
         loadUserInfo();
         
        if(prtour === '1')
        {
          productTour(csslocation);
        } 
         
        function saveUser()
        {
             
             if($("form").valid()){ 
                 
                var frstname = $("#frstname").val();
                var lstname = $("#lstname").val();
                var role = $("#role_no option:selected").val();
                var email = $("#usremail").val();
                var password = $("#pswd").val();
                var confirmpswd = $("#cnfpswd").val();
                
                var atpos = email.indexOf("@");
                var dotpos = email.lastIndexOf(".");
                var email_check = $("#emailIdExist").val();
                var pswd_policy=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{9,50}$/; 
                 
                     if(frstname.length < 3 || frstname.length > 21)
                     {
                         alert("Enter Firstname with 3 to 20 characters!");
                     }else if(lstname.length < 1 || lstname.length > 21)
                     {
                          alert("Enter Lastname with 1 to 20 characters!");
                     }else if(atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
                     {
                         alert("Enter Valid Email Address!");
                     }
                     else if(password.length < 9 || password.length > 51)
                     {
                         alert("Enter password with 9 to 50 characters!");
                     }
                     /*else if(!password.match(pswd_policy))
                     {
                         alert("Password contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character!");
                     }*/
                     else if(password != confirmpswd)
                     {
                         alert("New password and Confirm password does not match!");
                     }
                     else if(email_check == '1'){
                         alert("Email id already exists!");
                     }
                     else
                     {
                            $.post("userCreation", {"frstname":frstname,"lstname":lstname,"role":role,"email":email,"password":password,"confirmpswd":confirmpswd,"addUser":"addUser"}, function(data){    
                                 $('#add_user').modal('toggle');
                                    window.location.href=window.location.href;
                                    //loadUserInfo();
                            });
                     }
                     
                   }
                     
            
             return false;
        }
        
    function addNewrole()
    {

          if($("#new_rolefrm").valid()){
                     var newrole = $("#new_role").val();
                     
                     $.post("roleValidation", {"roleValidation":newrole}, function(data)
                     {    
                         
                            if(data === '1')
                            {
                              alert("Role already exists!.");  
                            }
                            else
                            {
                                 $.post("addNewRole", {"newrole":newrole}, function(data)
                                 {    
                                      alert("Role added successfully!."); 
                                      window.location.href=window.location.href; 
                                        
                                 }); 
                             }
                      });
                     
                     
                    
         }
         return false;
    }
    
    function addRoleClear()
    {
        $("#new_role").val("");
    }
    
    
    function editContent(userId)
    {
          $("#up_frstname").val("");
          $("#up_lstname").val("");
          $("#up_role_no option:selected").val("");
          $("#updateuserId").val("");        
                $.post("loadEditUserInfo", {"userId":userId,"edituser":"edituser"}, function(data){    

                        $("#edit_user").html(data);     

                });
    }
    
        function deleteUser(userId,email,username)
        {
            var msg =confirm("Are you sure you want to delete the user?");
                    if (msg == true) {
                            $.post("deleteUserInfo", {"userId":userId,"deleteUser":"deleteUser","email":email,"del_username":username}, function(data){    
                                 loadUserInfo();   
                            });
                    }
        }
    
    function resetPassword()
    {
        if($("#rstpswdfrm").valid()){
            
             var password = $("#rspswd").val();
             var confirmPassword = $("#rsconfirmpswd").val(); 
             var resetId = $("#restUser_Id").val();
             var restUser_email = $("#restUser_email").val();
             var pswd_policy=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{9,50}$/; 
               
            
                   if(password.length < 9 || password.length > 51)
                     {
                         alert("Enter password with 9 to 50 characters!");
                     }
                     else if(!password.match(pswd_policy))
                     {
                         alert("Password contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character!");
                     }
                     else if(password != confirmPassword)
                     {
                         alert("New password and Confirm password does not match!");
                     }
             
                    else
                    {
                         $.post("resetPasswordInfo", {"password":password,"confirmPassword":confirmPassword,"resetPswd":"resetPswd","resetId":resetId,"restUser_email":restUser_email}, function(data){    
                            $('#reset_password').modal('toggle');
                                    loadUserInfo();
                        });
                    }
        }
         return false;
    }
    
    
    function restPasswordInfo(id,email)
    {
      
        $("#rspswd").val("");
        $("#rsconfirmpswd").val("");
        $("#restUser_email").val(email);
        $("#restUser_Id").val(id);
        
    }
    
    
    function changeStatus(id,status,action)
    {
        
       var msg =confirm("Are you sure you want to "+action+" the user?");
       if (msg == true) {
         $.post("userStatusChange", {"id":id,"status":status,"changestatus":"changestatus"}, function(data){    
                       
                loadUserInfo();         
         });
     }
    }
    
    
    function checkEmail()
    {
        var email = $("#usremail").val();
                    $.post("emailValidation", {"email":email,"emailCheck":"emailCheck"}, function(data){    
                            
                           
                        $("#emailIdExist").val(data);
                      
                     });
    
    }
    
   
    
    function loadUserInfo()
    {
                    $.post("loadUserInfo", {"loadUserInfo":"loadUserInfo"}, function(data){    
                     
                        $("#loadUserInfo").html(data);
                      
                     });
    }
    
    function modifyPlan()
    {
            var license_id = $("#license_id").val();
            $.post(portalLocation+"plugin/payment_gatewayAjax.php", {"modifyPlan":"modifyPlan","license_id":license_id}, function(data){    
               //alert(data);
                 $("#modify_plan").html(data);
                  
            });
        
    }
    
    function buyAdditionalUser(){
        
             $.post(portalLocation+"plugin/payment_gatewayAjax.php", {"buyUser":"buyUser"}, function(data){    
               
                 $("#buy_additional_user").html(data);
                  
            });
    }
    
    function cancelAccount()
    {
         var reason_cancel = $(".reason_cancel:checked").val();
         var currentPsw = $("#currentPassword").val();
         var reason_details = $("#reason_details").val();
      
            if( typeof reason_cancel === 'undefined' || reason_cancel === null ){
                 alert("Select valid Reason for Cancellation");
            }
            else if(currentPsw.length === '')
            {
                 alert("Enter Valid Password!");
            }
            else
            {
                $.post(portalLocation+controller+"/settings.php", {"currentPasssword":currentPsw}, function(data)
                {        
                        if(data.length == '')
                        {
                            alert("Current Password does not match. Enter Valid Password!");
                        }
                        else{
                         
                              var msg =confirm("Are you sure you want to cancel your Account?");
                                 if (msg == true) 
                                {
                                    $.post(portalLocation+"plugin/payment_gatewayAjax.php", {"reason_cancel":reason_cancel,"reason_details":reason_details,"account_cancel":"account_cance"}, function(data)
                                     { 
                                         alert("Your Account Successfully deleted!");
                                         window.location.href = portalLocation+'page/login.php?lg=1';
                                        
                                     });
                                }
                           }
               });
            }
    }
    
    function getLatestInvoice(invoice_id)
    {
       // alert(invoice_id);
         $.post(portalLocation+"plugin/payment_gatewayAjax.php", {"findInvoice":invoice_id}, function(data){    
               
              $("#latest_invoice").modal('toggle');
               $("#latest_invoice").html(data);
        });
    }
    
    
    function updateCardDetail()
    {
        if($("#update_carddetails_form").valid())
        {
            var cust_name = $("#cust_name").val();
            var cc_number = $("#cc_number").val();                
            var cc_expiration = $("#cc_expiration").val();
            var cc_expiration_val = cc_expiration.split("/");
            var cc_cvc = $("#cc_cvc").val();
                
                var date1 = new Date('01/'+cc_expiration_val[0].trim()+'/'+cc_expiration_val[1].trim());
                var date3 = new Date();
                var date2 = new Date('01/'+date3.getMonth()+'/'+date3.getFullYear());
                var diffDays = Math.round((date2-date1)/(1000*60*60*24));
                
            var customer_id = $("#customer_id").val();
             
                if(cc_number.length !== 19)
                {
                    alert("Enter valid card number!");
                }
                else if(cc_expiration_val[0] >= 12)
                {
                    alert("Enter valid month!");
                }
                else if(diffDays > 0)
                {
                    alert("Enter valid expiration!");
                }
                else
                {
                    $.post(portalLocation+"plugin/payment_gatewayAjax.php", {"cust_name":cust_name,"cc_number":cc_number,"cc_expiration1":cc_expiration_val[0],"cc_expiration2":cc_expiration_val[1],"cc_cvc":cc_cvc,"customer_id":customer_id,"updateCardDetails":"updateCardDetails"}, function(data){    
                    
                            alert(data);
                    });
                }
                
                
              
            
        }
        return false;
    }
    
    function updateUser()
        {
            
                if($("#upnew_user").valid()){ 


                    var frstname = $("#up_frstname").val();
                    var lstname = $("#up_lstname").val();
                    var role = $("#up_role_no option:selected").val();
                    var user_id = $("#updateuserId").val();

                    if(frstname.length < 3 || frstname.length > 21)
                     {
                         alert("Enter Firstname with 3 to 20 characters!");
                     }else if(lstname.length < 1 || lstname.length > 21)
                     {
                          alert("Enter Lastname with 1 to 20 characters!");
                     }else
                     {
                            $.post("updateUserDetails", {"frstname":frstname,"lstname":lstname,"role":role,"user_id":user_id,"updateUser":"updateUser"}, function(data){    
                               
                                window.location.href=window.location.href;
                                   //$('#edit_user').modal('toggle');
                                   // loadUserInfo();
                             });
                    }     
            }    
        } 
    
    
    $('#sidebar').css('max-height',(document.body.scrollHeight-100));
  
    {/literal}
    </script>
  

   