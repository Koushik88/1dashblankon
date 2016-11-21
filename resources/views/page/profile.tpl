{if $smarty.session.expiry_msg eq '1'}
   <br/>
        <div class="col-xs-2"></div>
        <div class="alert alert-danger col-xs-8">
               Your last payment has failed. Kindly update your card details for unrestricted access
        </div>
        
{/if}

  <div class="block-area">
    <div class="row">
        <div class="col-md-6">
            <div class="row">
                <!-- Works -->
                <div class="col-md-12" id="prtour_changePswd">
                             <div class="alert alert-info alert-dismissable" style="display:none;" id="pssdChgAlert">
                                 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                <span id="pssdChgAlertMsg"></span>
                            </div>
                    <div class="tile">
                        <h2 class="tile-title">Change Password</h2>
                        <div class="p-10">                                               
                                <div class="form-group">
                                    <label for="currentPassword">Current Password</label>
                                    <input type="password" class="form-control input-sm" id="currentPsw" name="currentPsw" placeholder="Current Password" onblur="checkCurrentPassword();">
                                </div>

                                <div class="form-group">
                                     <label for="newPassword">New Password</label>
                                    <input type="password" class="form-control input-sm" id="newPsw" name="newPsw" placeholder="New Password" maxlength="50">
                                </div>

                                <div class="form-group">
                                     <label for="confirmPassword">Confirm Password</label>
                                    <input type="password" class="form-control input-sm" id="confirmPsw" name="confirmPsw" placeholder="Confirm Password" maxlength="50">
                                </div>
                            
                            <input type="hidden" id="validateCurrPsw" value="0">   
                            <button type="submit" class="btn btn-sm m-t-10" onclick="chengePassword();">Submit</button>
                           

                        </div>  
                    </div>
                </div>
                                          
            </div>                            
        </div>
        
        
        
        <div class="col-md-6">                            
            <!-- About Me -->
            <div class="tile">
                <h2 class="tile-title">About me</h2>
                <div class="tile-config dropdown" id="prtour_aboutme">
                   <a  data-toggle="dropdown" href="" class="tooltips tile-menu" title="" data-original-title="Options"></a>
                    <ul class="dropdown-menu pull-right text-right"> 
                        <li><a  href="#uploadPhoto" data-toggle="modal">Upoad Photo</a></li>                                        
                    </ul>
                </div>
                
                <div class="listview icon-list">
                    <div class="media">
                        <i class="icon pull-left">&#61844;</i>
                        <div class="media-body">User : {$smarty.session.name|ucfirst}</div>
                    </div>
                    
                    <div class="media">
                        <i class="icon pull-left">&#61880;</i>
                        <div class="media-body"> {$smarty.const.login_email} : {$smarty.session.email}</div>
                    </div>
                    
                    <div class="media">
                        <i class="icon pull-left">&#61868;</i>
                        <div class="media-body">{$smarty.const.tp_Last_login} : {$userinfo['last_login']|date_format:'%d-%b-%Y %H:%M:%S'}</div>
                    </div>
                    
                    <div class="media">
                        <i class="icon pull-left">&#61787;</i>
                        <div class="media-body"> {$smarty.const.tp_ip} : {$userinfo['ip']}</div>
                    </div>
                </div>
            </div>
           
         <!-- Plugin Page-->
         {include 'plugin/genericPluginPage.tpl'}
            
        </div>
    </div>
  </div>
                                       
                                        
                                        
<!-- Modal Add new Todo -->	
                  <div class="modal fade" id="modalCreatTodo" tabindex="-1" role="dialog" aria-hidden="true">
                       <div class="modal-dialog">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                   <h4 class="modal-title">Create To Do</h4>
                               </div>
                               <div class="modal-body">
                                   <div class="input-group">
                                       <input style="" class="form-control ng-pristine ng-valid" placeholder="" aria-describedby="basic-send" id="newtodo" type="text" required="required"><br/>

                                       <div class="col-md-12 m-b-15" >
                                       <p style="margin-top: 20px;">Reminder</p>
                                       <div class="make-switch switch-small" onclick ="yesnoCheck();">
                                           <input type="checkbox" class="form-control" >
                                       </div>
                                       </div>


                                   <div id="ifYes" style="visibility:hidden">
                                <div class="col-md-4 m-b-15" >
                                    <p>Date Picker</p>
                                    <div class="input-icon datetime-pick date-only" id="datetimepicker">
                                        <input data-format="yyyy-MM-dd"   type="text" id="date" name="date" class="form-control input-sm" required   value=""  />
                                        <span class="add-on">
                                           <i class="sa-plus"></i>
                                        </span>
                                    </div>
                               </div>
                               <div class="col-md-4 m-b-15">
                                   <p>Time Picker</p>
                                   <div class="input-icon datetime-pick time-only-12">
                                       <input data-format="hh:mm:ss" id="timepicker" type="text" name="fromTime" required class="form-control input-sm" value="" />
                                       <span class="add-on">
                                           <i class="sa-plus"></i>
                                       </span>
                                   </div>
                               </div>
                               </div>
                       
                                     <!--   <span class="input-group-addon btn btn-primary btn-metro" id="basic-send" onclick="createTodo();" required="" style="cursor: pointer;color: #fff;"><i class="fa fa-chevron-right"></i></span> -->
                                   </div>
                               </div>
                               <div class="modal-footer">
                                   <button type="button" class="btn btn-sm" onclick="createTodo();" id="basic-send">Submit</button>
                                   <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
                               </div>
                           </div>
                       </div>
                   </div>

                                      
                          
                    


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
                            <input type="radio" name="radio">
                            1Dash is not useful
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="radio">
                            My usage for 1Dash ended
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                          <input type="radio" name="radio">
                          1Dash is too expensive
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="radio">
                            I am using some other Product
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="radio">
                           I have privacy concerns
                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="radio">
                           1Dash has very limited features
                        </label>
                    </div>
                     <div class="radio">
                        <label>
                            <input type="radio" name="radio">
                           Others
                        </label>
                     </div>
                </div>
                <div class="row">
                    <div class="col-md-7">
                            <div class="form-group">
                                <label for="Message">Explain in Detail</label>
                                <textarea class="form-control overflow" rows="4" placeholder="" tabindex="5003" style="overflow: hidden; outline: none;"></textarea>
                            </div>
                            <div class="form-group">
                               <label for="paswd">Account password</label>
                               <input type="password" class="form-control input-sm"  placeholder="">
                            </div>
                    </div>
                </div>
                             <button type="submit" disabled class="btn btn-sm m-t-10">Submit</button>
                   </div>
            </div>
        </div>
</div>



<input id="logouturl" type="hidden" value="{$smarty.const.PORTALLOCATION}page/index.php?lg=1">                                      
 
    <!-- Upload Photo-->
        <div class="modal fade" id="uploadPhoto" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="background-color:rgba(0, 0, 0, 0.99) !important;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Upload Photo</h4>
                        </div>
                            <div class="modal-body">
                                <p>Image Preview</p>
                                    <form method="post" name="frmmenulist" enctype="multipart/form-data" action="profile.php?mid=1334&nav=12">   
                                            <div class="fileupload fileupload-new" data-provides="fileupload"><input type="hidden">
                                                  <div class="fileupload-preview thumbnail form-control" style="background-color:rgba(0,0,0,0.3);border:1px solid #ccc;"></div>
                                                    <div>
                                                        <span class="btn btn-file btn-alt btn-sm">
                                                            <span class="fileupload-new">Select image</span>
                                                            <span class="fileupload-exists">Change</span>
                                                            <input type="file" name="profileUpload" id="profileUpload" accept="image/*">
                                                        </span>
                                                        <a href="#" class="btn fileupload-exists btn-sm" data-dismiss="fileupload">Remove</a>
                                                        <button type="submit" class="btn btn-sm" name="upload_btn" onclick="return ValidateFileleInput(this)">Submit</button>
                                                    </div>
                                             </div>
                                     </form>
                            </div>
                    </div>
                </div>
         </div>

    

<script src="{$smarty.const.JSLOCATION}/datetimepicker.min.js"></script>
                                       
<script type="text/javascript">
        var prtour = "{$smarty.get.prtour}";
        var pageToken = "{$pageToken}"; 
       
    {literal} 
        
        loadToDoAjax();
             
        if(prtour === '1')
        {
          productTour(csslocation);
        } 
       
     
          function checkCurrentPassword()
          {
              $("#pssdChgAlert").hide();
              $("#validateCurrPsw").val("1");
              var currentPsw = $("#currentPsw").val();

                $.post(portalLocation+controller+"/settings.php", {"currentPasssword":currentPsw}, function(data){    

                        if(data.length == '')
                        {
                              $("#pssdChgAlert").show();
                              $("#pssdChgAlertMsg").html("Current Password does not match.Enter Valid Password!");
                              $("#validateCurrPsw").val("0");
                        }

                    });
          }
          
          //Update new password in particular users module         
 function chengePassword()
  {
      
        $("#pssdChgAlert").hide();
         var newPsw = $("#newPsw").val();
         var confirmPsw = $("#confirmPsw").val();
         var validateCurrPsw = $("#validateCurrPsw").val();
         var pswd_policy=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{9,50}$/; 
             
    
         $("#pssdChgAlert").show();
         if(validateCurrPsw == '0')
         {
                $("#pssdChgAlertMsg").html("Current Password does not match.Enter Valid Password!");
         }
         else if(newPsw.length < 9 || newPsw.length > 51)
         {
                $("#pssdChgAlertMsg").html("Enter password with 9 to 50 characters!");
         }
         else if(!newPsw.match(pswd_policy))
        {
            $("#pssdChgAlertMsg").html("Password contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character!");
        }
         else if(newPsw != confirmPsw)
         {             
                $("#pssdChgAlertMsg").html("New password and Confirm password does not match!");
         }
         else
         {
                    $.post(portalLocation+controller+"/settings.php", {"newPsw":newPsw,"confirmPsw":confirmPsw}, function(data){    
                       $("#pssdChgAlertMsg").html("Password Updated Successfully. You will be signed out. Please login again.");
                        $("#newPsw").val("");
                        $("#confirmPsw").val("");
                        $("#currentPsw").val("");
                        setTimeout(function(){  $("#pssdChgAlert").hide();var logid = $("#logouturl").val();window.location=logid; }, 3000);
                });
         }
  } 
          
    function createTodo()
    {
            var newtodo = $("#newtodo").val();
            var datepicker = $("#date").val();
            var timepicker = $("#timepicker").val();
              if(newtodo != "")   
              {  
                $.ajax({
                        url: "settings.php",
                        headers: {
                            'page-token': pageToken,
                        },
                        method: 'POST',                    
                        data : "newtodo="+newtodo+"&datepicker="+datepicker+"&timepicker="+timepicker,
                        success: function(data){
                            //alert(data);
                         window.location.href=window.location.href;
                            //$("#newtodo").val("");
                            //$('#modalCreatTodo').modal('toggle');
                            //loadToDoAjax();
                          
                        },
                            error: function(e) {
                                  
                                  console.log(e.message);
                        }
                });
            } 
            else
             {
                 alert("Enter Valid Message!");
             }
                
               
               
               
    }
 
    function loadToDoAjax()
    {
               var date = new Date();
               var d=("0" + date.getDate()).slice(-2);
               var m=("0" + (date.getMonth() + 1)).slice(-2);
               var y = date.getFullYear();

               var cldate = y + "-" + m + "-" + d;
               var cstime=date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();
              
                $("#date").val(cldate);
                $("#timepicker").val(cstime);
        
        
                $.post(portalLocation+controller+"/settings.php", {"loadToDo":"loadToDo"}, function(data)
                   { 
                        $("#toListAjax").html(data);
                  });
    }
    
    
    
    $('#newtodo').on("keypress", function(e) {
        if (e.keyCode == 13) {
             createTodo();
            return false; // prevent the button click from happening
        }
        
    });
    
    
       
function ValidateFileleInput() {
   var fuData = document.getElementById('profileUpload');
    var _validFileExtensions = [".jpg", ".jpeg",".png"]; 
     if (fuData.type == "file") {
        var sFileName = fuData.value;
         if (sFileName.length > 0) {
            var blnValid = false;
            for (var j = 0; j < _validFileExtensions.length; j++) {
                var sCurExtension = _validFileExtensions[j];
                if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                    blnValid = true;
                    break;
                }
            }
             
            if (!blnValid) {
                alert("Sorry, " + fuData.files[0].name + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                fuData.value = "";
                return false;
            }
            else if(fuData.files[0].size > 1000141)
            {
                 alert("Maximum file size exceeds");
                  return false;
                 
            }
            else{
                return true;
            }
        }
    } 
     
    return false;
  
}



function yesnoCheck() {
    var a=$(".switch-animate").attr("class");
       if (a == 'switch-on switch-animate') {
       document.getElementById('ifYes').style.visibility = 'visible';
   }
   else document.getElementById('ifYes').style.visibility = 'hidden';

}
    
    
    
  {/literal}   
</script>
 