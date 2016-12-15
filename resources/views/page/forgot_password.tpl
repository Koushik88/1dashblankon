{*
#*******************************************************************#
#		Global Basics Inc   ::  Forgot Password Page        #
#*******************************************************************#

    Document       : Forgot Password Page
    Created on     : 05-07-2016
    Author         : Ponnar V
    Description    : Password Reset Page
    Last Edited on : 05-07-2016
    Last Edited by : Ponnar V
*}

<section id="login">
<br/><br/>
 <div class="alert alert-info alert-dismissable" style="display:none;width:500px;" id="pswresethdr">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <span id="pswresetmsg"></span>
 </div>

{if isset($changePsw)}

{if isset($userId)}
        
          <div class="box tile animated active">
              <h2 class="m-t-0 m-b-15">Reset Password</h2>
              <input type="password" class="login-control m-b-10" type="password" name="newPsw" id="newPsw" value="" required="required" placeholder="Password">
                <input type="password" class="login-control" type="password" name="confirmPsw" id="confirmPsw" value="" required="required" placeholder="Confirm Password" title="An Example: Abcdefg@19">
              <div class="checkbox m-b-20">
                   <input type="hidden" value="{$userId}" name = "userId" id="userId">
                   <input type="hidden" value="{$username}" name = "chpsd_email" id="chpsd_email">
              </div>
              <button class="btn btn-sm m-r-5" name="btn_login" onclick="chengePassword();">Submit</button>
          </div>
                 
{else}  
        <div style="text-align:center;padding-top:300px;color:#FF0000;font-weight:bold;"> <h3> Warning : Link has Expired </h3> </div>
{/if}        

</section> 


<script type="text/javascript"> 
  var link_msg =  "{$link_msg}";
  var redirectLoc = "{$redirectLoc}";
//Update new password in particular users module       
 {literal}

     if(link_msg.length > 0)
       {               
             setTimeout(function(){ window.location = link_msg ;}, 5000);
       }


   function chengePassword()
    {
        
          var newPsw = $("#newPsw").val();
          var confirmPsw = $("#confirmPsw").val();
          var userId = $("#userId").val();
          var chpsd_email = $("#chpsd_email").val();
          var pswd_policy=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{9,50}$/; 
          

           if(newPsw.length < 9 || newPsw.length >= 51)
           {
                $("#pswresethdr").show();
                $("#pswresetmsg").html("Password Minimum 9 , Maximum 50 characters  are allowed !"); 
                return false;              
           }
           else if(!newPsw.match(pswd_policy))
            {
                $("#pswresethdr").show();
                $("#pswresetmsg").html("Password contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character!");
                return false; 
            }
           else if(newPsw !== confirmPsw)
           {
                $("#pswresethdr").show();
                $("#pswresetmsg").html("Password Confirm Password does not match!"); 
               return false;  
           }
           else
           {
              
                  $.post('updateNewPassword',{"newPsw":newPsw,"userId":userId,"username":chpsd_email},function(data)
                   { 
                      // alert(data);
                        $("#pswresethdr").show();
                        $("#pswresetmsg").html("Password Chenged Successfully!"); 
                       
                              setTimeout(function(){ window.location = redirectLoc ;}, 5000);

                   });
           }
    } 
{/literal}  
</script>
{/if}