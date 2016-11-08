{*
==================================================================
#   Global Basics Inc - Backend	:: Module Management Template    #
==================================================================

    Document       : Module Management Template
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Managing the Module - Add New Module,Edit Module ,Edit Reports, Add Reports,Assign Report Section
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}


<!--Include Custom CSS -->
<link href="{$smarty.const.CSSLOCATION}customcss/module_templateManagement.css" rel="stylesheet">


<!--Notification  Messages-->
    {if isset($alertMessage)}
       <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$alertMessage}</strong> 
       </div>
    {/if}   
    
     {if isset($sectionMessage) && $sectionMessage eq '1'}        
        <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.section_add_msg}</strong>
        </div>
        
     {else if isset($sectionMessage) && $sectionMessage eq '0'}
           <div class="alert alert-danger">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
               <strong>{$smarty.const.section_error_msg}</strong>
           </div>
      {/if}  
    

      
<!--Module Management for Module,Reports -->     
      
{if !isset($popupCon)}
<div class="contentpanel">                        
   <div class="row">
      <div class="col-md-12">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="pull-right" style="margin-top:-5px;">                           
                            <a href="javascript:void(0);" class="btn btn-primary btn-sm" title="{$smarty.const.add_section}"  onclick="return addSectionModule()">{$smarty.const.add_section} +</a> 
                            <a href="addReports.php?am&c={$company_id}" class="btn btn-primary btn-sm" title="{$smarty.const.add_menu}">{$smarty.const.add_menu} +</a>
                       </div><!-- mypanel-btns -->
                                <h3 class="mypanel-title">{$smarty.const.modules_header}</h3>
        
                   </div>
                   <div class="mypanel-body">
                    <div class="moduleTypeLabel-header">   
                       <h5> <strong> {$smarty.const.platform_type} </strong> </h5>
                       <div class = "panel-content">      
                           
<!--Available Platform Type-->                           
                           <div class="row">
                                   <label>
                                        <div class="moduleTypeLabel"  title="{$smarty.const.module_web}">
                                          <div  id="moduleweb_img"  class="selectIcon">
                                          </div>
                                            <br/>
                                          <div  class="moduleSourceContent"> 
                                             <img src="{$smarty.const.IMAGESLOCATION}userpanel/web_icon.png" height="25" width="25" title="{$smarty.const.module_web}">  
                                             <input type="radio"  checked  class="moduleSource" id="moduleweb" checked name="platformtype" value="web">
                                          </div>
                                          </div>	
                                    </label>
                                          
                                    <label>
                                        <div class="moduleTypeLabel" title="{$smarty.const.phonegap}">                                            
                                          <div  id="modulePhonegap_img" class="selectIcon">                                       
                                          </div>
                                            <br/>
                                           <div class="moduleSourceContent">
                                              <img src="{$smarty.const.IMAGESLOCATION}userpanel/mobile_icon.png" height="25" width="25" title="{$smarty.const.phonegap}">  
                                              <input type="radio"   class="moduleSource" id="modulePhonegap" name="platformtype" value="mobile">
                                            </div>
                                         </div>	
                                    </label>
                               
                                   <label>
                                        <div class="moduleTypeLabel" title="{$smarty.const.windows8}">
                                          <div  id="moduleWindows8_img"  class="selectIcon">                                          
                                          </div><br/>
                                            <div class="moduleSourceContent">
                                                <img src="{$smarty.const.IMAGESLOCATION}userpanel/windows8_icon.png" height="25" width="25" title="{$smarty.const.windows8}">  
                                                <input type="radio" class="moduleSource" id="moduleWindows8" name="platformtype" value="windows8">
                                            </div>
                                        </div>	
                                    </label>
                                  
                                    <label>
                                        <div class="moduleTypeLabel" title="{$smarty.const.module_rest}">
                                         <div  id="moduleRest_img"  class="selectIcon">                                          
                                         </div>
                                            <br/>
                                          <div class="moduleSourceContent">
                                             <img src="{$smarty.const.IMAGESLOCATION}userpanel/rest_icon.png" height="25" width="25" titile="{$smarty.const.module_rest}">  
                                             <input type="radio"  class="moduleSource" id="moduleRest" name="platformtype" value="rest">
                                          </div> 
                                         </div>	
                                   </label>
                           </div>
                        </div>
<!--Module List -->                       
                       <h5><strong>{$smarty.const.section_total_header}</strong></h5>
                        <div class="availModule_list">                           
                             <div id="availModule_list">
                             </div>                                
                        </div>
                     </div>   
<!--Report List-->                       
                     <div class="availReports_list">                     
                         <div id="availReports_list">
                          </div>
                      </div>
                     </div>
                     </div>
                </div>
         </div>
      </div>
   </div>



    <script type="text/javascript">
        var img_location = "{$smarty.const.IMAGESLOCATION}";
       
        {literal}
      $(function()
        {
    
   // View Available Module List using ajax Page     
              var defSelectType = $(".moduleSource:checked").attr("id");                    
              $("#"+defSelectType+"_img").html("<img  src='"+img_location+"userpanel/selectSection.png'> ");
              var selPalatformValue = $("#"+defSelectType).val();
              $.post(portalLocation+controller+"/modulemanagement_Ajax.php",{"selPalatformValue":selPalatformValue},function(data)
              {         
                  $("#availModule_list").html(data).toggle();
                  $("#availModule_list").toggle('slow', function() {
           
                });
                  
              });
            
              $(".moduleSource").click(function()
              {    
                  
                  $(".selectIcon").html("");
                  var selPalatformId = $(this).attr("id");
                  var selPalatformValue = $(this).val();                 
                  
                  $("#"+selPalatformId+"_img").html("<img  src='"+img_location+"userpanel/selectSection.png'> ");
                  
                     $.post(portalLocation+controller+"/modulemanagement_Ajax.php",{"selPalatformValue":selPalatformValue},function(data)
                     {         
                           
                           $("#availModule_list").toggle('slow', function() {
                            // Animation complete.
                                    $("#availModule_list").html(data);
                                });
                         $("#availModule_list").show("slow");
                         
                     });
                  
              });
         });
         
  //Add new section using modal dialog box       
         function addSectionModule()
         {
              $("#generalModal").modal("show");        
              $.get(portalLocation+controller+'/modulemanagement.php',{"addSection":"addSection","popup":"popup"},function(data)
                { 

                   $("#generalModalContent").html(data);

                });
         }
         
      {/literal}   
    </script>




<!--Drag And Drop Reports to Module,Edit Reports,Delete Reports-->
<!--Popup Module-->
<div class="modal fade" id="cnfrmMoveReports" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
          <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Conformation for move reports</h4>
              </div>
              <div class="modal-body">
                  <div id="cnfrmtext">
                      
                  </div> 
                   
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary btn-sm" onclick ="moveReports()">OK</button>
                <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">Cancel</button> 
              </div>
            </div><!-- modal-content -->
            </form>
          </div><!-- modal-dialog -->
</div><!-- modal -->



<input type="hidden" id="dragReportId" value="">
<input type="hidden" id="targetModules" value="">
<form method ="post" name="moveReptoModule" id="moveReptoModule" action="modulemanagement.php"> 
                    <input type="hidden" id="moveReportId" name = "moveReportId" value="">
                    <input type="hidden" id="moveModuleId" name = "moveModuleId" value="">
</form> 

<!--Edit Report--->
<input type="hidden" value="" id="editReportValues">



<script type="text/javascript">
              var img_location = "{$smarty.const.IMAGESLOCATION}";
  {literal} 
    //Drag Drap Reports
                    function allowDrop(ev)
                        {                            
                            ev.preventDefault();
                        }
                        function drag(ev)
                        {  
                            $("#dragReportId").val(ev);
                        }
                        function drop(targetModules)
                        {   
                            
                            var targetModulesValue =  targetModules.split("__");
                            var dagReportsValue = $("#dragReportId").val().split("__");  
                            $("#targetModules").val(targetModulesValue[0]);
                            var cnfrmtxt = "Are you sure you want move "+dagReportsValue[0]+" reports from "+dagReportsValue[2]+ " to " + targetModulesValue[1] +'?';
                            $("#cnfrmtext").html(cnfrmtxt);
                            $('#cnfrmMoveReports').modal('show');
                        }
                        function moveReports()
                        {
                            var targetModulesValue =  $("#targetModules").val();
                            var dagReportsValue = $("#dragReportId").val().split("__");
                            $("#moveReportId").val(dagReportsValue[1]);
                            $("#moveModuleId").val(targetModulesValue);                           
                            document.forms["moveReptoModule"].submit();
                        }
                       
    
   //Edit Reports Name 
               function editReportName(reportValue)
               {
                   $(".reportEdit").remove();
                   $(".editReportTxt").show();
                   var reportValues = reportValue.split("__");
                   $("#editReportTxt_"+reportValues[1]).hide();
                   $("#"+reportValues[1]+"_edit").append("<table style='width:85px;' class='reportEdit'><tr><td style='border:1px solid #ccc;background-color:#F9F9F9;width:20px;padding:2px;' title='Close'><a herf='javascript:void(0);' onclick='closeEdit()'><span class='fa fa-times-circle'></span></a></td><td style='border:1px solid #ccc;background-color:#F9F9F9;width:20px;padding:2px;' title='Save'><a herf='javascript:void(0);' onclick='editReports()'><span class='fa fa-save'></span></a></td><td style='border:1px solid #ccc;background-color:#F9F9F9;width:45px;'><span><input type='text' id='newReportVal' value = '' required></span></tr></table>");                   
                   $("#newReportVal").val(reportValues[0]);                  
                   $("#editReportValues").val(reportValues);
                }
               function closeEdit()
               {             
                   var editReportValues = $("#editReportValues").val().split(",");                   
                   $(".reportEdit").hide();
                   $(".editReportTxt").show();
                   $("#editReportTxt_"+editReportValues[1]).html(editReportValues[0]);
               }
               function editReports()
               {
                   var editReportValues = $("#editReportValues").val().split(","); 
                   var newReportVal = $("#newReportVal").val();
                 if(newReportVal.length != '0')
                  {
                   $.post(portalLocation+controller+"/modulemanagement_Ajax.php",{"newReportVal":newReportVal,"editReportValue":editReportValues[1]},function(data)
                   {  
                     if(data == 1)
                     {
                            jQuery.gritter.add({
                                   title: 'Edit Report Message!',
                                   text: 'Report name updated successfully!',
                                   class_name: 'growl-success',
                                   image: img_location+'screen.png',
                                   sticky: false,
                                   time: ''
                            });
                            
                            
                            // Select And Report Load               
                            var defSelectModule = $(".availmodules:checked").attr("id");
                            var selModuleValue = $("#"+defSelectModule).val();
                            var selModuleTitle = $("#"+defSelectModule).attr("title"); 
                            var module_active = $("#"+selModuleValue+"module_active").val();                            
                            $.post(portalLocation+controller+"/modulemanagement_Ajax.php",{"selModuleValue":selModuleValue,"selModuleTitle":selModuleTitle,"module_active":module_active},function(data)
                             {   
                                 $("#availReports_list").html(data);

                             });
                      }else if(data == 0)
                      {
                           jQuery.gritter.add({
                            title: 'Edit Report Message!',
                            text: 'Report name already exists!',
                            class_name: 'growl-danger',
                            image: img_location+'screen.png',
                            sticky: false,
                            time: ''
                           });
                      }

                   });
               }
               else
               {
                    $.messager.alert('Alert for Edit Report','Invalid report name','');
               }
           }
           
           
//Edit Procedue       
       function editProcedureName(procId)
       {
           $(".availProcList").show();
           $(".reportProcedure").hide();
           $("#reportProcedure_"+procId).show();
           $("#availProcList_"+procId).hide();
       }
      function closeEditProc()
      {
          $(".availProcList").show();
          $(".reportProcedure").hide();
      }
      function editReportProcedure(reportId)
      {
          var getValue = $("#"+reportId+"_procedureList option:selected").val().split("_");
           $.post(portalLocation+controller+"/modulemanagement_Ajax.php",{"report_id":getValue[0],"procedure_id":getValue[1]},function(data)
            {
                
                 // Select And Report Load               
                            var defSelectModule = $(".availmodules:checked").attr("id");
                            var selModuleValue = $("#"+defSelectModule).val();
                            var selModuleTitle = $("#"+defSelectModule).attr("title"); 
                            var module_active = $("#"+defSelectModule+"_active").val(); 
                           
                            $.post(portalLocation+controller+"/modulemanagement_Ajax.php",{"selModuleValue":selModuleValue,"selModuleTitle":selModuleTitle,"module_active":module_active},function(data)
                             {   
                                 $("#availReports_list").html(data);

                             });
                             
                             
                           jQuery.gritter.add({
                                   title: 'Edit Report Message!',
                                   text: 'Procedure updated successfully!',
                                   class_name: 'growl-success',
                                   image: img_location +'screen.png',
                                   sticky: false,
                                   time: ''
                            });   
            });  
      }
        
    //Delete Reports section script 
    function confirmDelete(msg,menuId)
    {
        var reportlink =  $(".delReports").prop("href");
        reportlink = reportlink+"&menu_id="+menuId;
        $.messager.confirm('Confirmation for delete reports', msg, function(r){
                if (r)
                {
                   window.location = reportlink;
                }
                else
                {
                    return false;
                }
                    
           });
         return false;
      }
      
   //Delete Module Section script
      function confirmDeleteModule(msg,moduleId)
      {
            var moduleLink =  $(".delModule").prop("href");
                moduleLink = moduleLink+"&si="+moduleId;
             $.messager.confirm('Confirmation for delete module', msg, function(r){
                if (r)
                {
                   window.location = moduleLink;
                }
                else
                {
                    return false;
                }
                    
           });
         return false;
 
      }
    
    {/literal}
 </script>

    <!-- End Of Drag and dop moved reports,Edit Reports,Delete Reports -->    
{/if}


<!-- Assign Reports by Users Popup models-->
<div class="modal fade" id="generalModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
                <div id="generalModalContent"></div>   
            </div><!-- modal-content -->
            </form>
          </div><!-- modal-dialog -->
</div><!-- modal -->


<!-- Assign Reports by Users Content Modules-->
{if isset($assignUser)}
<form method = "post" name="frmmenulist" id="frmmenulist" action="modulemanagement.php{if isset($smarty.get.se)}?se={$smarty.get.se}{/if}">    
<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{$smarty.const.assign_forms_user}</h4>
              </div>
              <div class="modal-body">
                 
                   <div class="form-group">      
                       <label class="col-sm-3 control-label">
                           {$smarty.const.assign_menus}
                       </label>
                       <div class="col-sm-9">
                           &nbsp;&nbsp;
                            <select  id="select-search-hide" data-placeholder="Choose One" class="width300 assingUserPrivilages">
                                <option value="user_wise">By User</option>
                                <option value="role_wise">By Role</option>
                            </select>
                       </div>
                   </div>   
                    <div  class ="userWise">                         
                        <table  class="table table-info mb30 assinguser_list">
                                                <thead>
                                                          <tr>
                                                              <th>{$smarty.const.user_name}</th>                                                    
                                                              <th>Role</th>  
                                                              <th>{$smarty.const.enable}  </th> 
                                                              <th>{$smarty.const.user_name}</th>                                                  
                                                               <th>Role</th>  
                                                              <th>{$smarty.const.enable}  </th> 
                                                          </tr>
                                                </thead>
                                                <tbody>
                                                            {$colPerRow = 2}

                                                              {foreach from=$allmenus["result"] name="varuserlist" key=key_ul item=item_ul}

                                                                       {if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 1}
                                                                           <tr>
                                                                          {/if}
                                                                               <td style="border-top:0px solid #ccc;">{$item_ul["username"]}</td>                                                              
                                                                               <td style="border-top:0px solid #ccc;">{$item_ul["user_role"]}</td>
                                                                               <td style="border-top:0px solid #ccc;{if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 1 } border-right:1px solid #ccc; {/if}">
                                                                                   <input type="checkbox" name="chkmenulist[]" id="chk_{$smarty.foreach.varuserlist.iteration}" {if ($userprivileges["count"]) > 0 && in_array($item_ul["id"],$userprivileges["result"])} checked="checked" class="case" {/if} value="{$item_ul["id"]}" />
                                                                               </td>
                                                                       {if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 0}
                                                                           </tr>
                                                                        {/if}
                                                              {/foreach}                                                   
                                                </tbody>                    
                            </table> 
                       </div>                                   
                        
                     <div class ="roleWise" style="display:none;">     
                              <table  class="table table-info mb30 mb30 assinguser_list">  
                                                        <thead>
                                                            <tr>
                                                                {$colPerRow = 2}                              
                                                                  <th>Role</th>  
                                                                  <th>{$smarty.const.enable}  </th>                                                                                                   
                                                                  <th>Role</th>  
                                                                  <th>{$smarty.const.enable}  </th>
                                                            </tr>    
                                                        </thead> 
                                                        <tbody>
                                                                  {foreach from=$userRole name="varuserlist" key=key_ul item=item_ul}

                                                                           {if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 1}
                                                                              <tr>
                                                                           {/if}                                                                                                                                      
                                                                                   <td style="border-top:0px solid #ccc;">{$item_ul["user_role"]}&nbsp; [{$item_ul["user_count"]}]</td>
                                                                                   <td style="border-top:0px solid #ccc;{if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 1} border-right:1px solid #ccc;{/if}">
                                                                                       <input type="checkbox" name="chkrolelist[]" id="chk_{$smarty.foreach.varuserlist.iteration}"  value="{$item_ul["user_id"]}"  />
                                                                                   </td>
                                                                            {if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 0}
                                                                               </tr>
                                                                            {/if}
                                                                  {/foreach} 
                                                        </tbody>
                              </table>                                   
                      </div>                   
              </div>
                  <div style="display:none;">
                        <input type="text" name="menuid" value="{$saveMenuId}" />
                        <input type="text" name="s" value="{$smarty.get.s|default:$smarty.post.s}" />
                  </div>
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary btn-sm" name="btn_menulist" id="btn_menulist">{$smarty.const.save_credentials}</button>
                <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">{$smarty.const.cancel}</button> 
              </div>
 </form>
                                                                  
                                                                  
 {literal}                                                                 
     <script type="text/javascript"> 
   //Drop down init script      
          jQuery("#select-basic, #select-multi").select2();
                jQuery('#select-search-hide').select2({
                    minimumResultsForSearch: -1
                });
                
  // Asign user by Reports using show and hide module              
        $(".assingUserPrivilages").change(function()
        {
           var asignPrivlages = $(".assingUserPrivilages option:selected").val(); 

           if(asignPrivlages == "role_wise")
            {
                $(".roleWise").show();
                $(".userWise").hide();    
            }
            else if(asignPrivlages == "user_wise")
            {

                $(".roleWise").hide();
                $(".userWise").show();
            }   
        });    
                                                                  
     </script>                                                             
 {/literal}                                                                 
                                                                  
{/if}


<!-- Add new Section module--> 
{if isset($addSection)}
          <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{$smarty.const.add_section}</h4>
          </div>
           <form method = "post" name="frmmenulist" id="frmmenulist" enctype="multipart/form-data" action="modulemanagement.php" >
                          
              <div class="modal-body">                                      
                                          <div class="row">       
                                            <div class="form-group">
                                              <label class="col-sm-3 control-label">{$smarty.const.section_name}</label>
                                                  <div class="col-sm-9">
                                                        <input  class="form-control" type="text"  name="section_name" id="section_name" value="{$section["result"][0]["name"]|default:""}" required/>
                                                  </div>
                                            </div>
                                                   
                                                      
                                            <div class="form-group">
                                              <label class="col-sm-3 control-label">{$smarty.const.version_type}</label>
                                                 <div class="col-sm-9">
                                                    <table> 
                                                       <tr>
                                                          <td><input type="radio" id="web" class="version" value="web" name="version_type" {if isset($smarty.get.es) && ($section["result"][0]["type"] == 'web')}checked{else}checked{/if}></td><td>&nbsp;{$smarty.const.module_web}&nbsp;&nbsp;</td> 
                                                          <td>&nbsp;<input type="radio" id="device" class="version" value="device" name="version_type" {if isset($smarty.get.es) && ($section["result"][0]["type"] == 'mobile')}checked{/if}></td><td>&nbsp;{$smarty.const.module_devices}</td>
                                                          <td>&nbsp;<input type="radio" id="REST" class="version" value="REST" name="version_type" {if isset($smarty.get.es) && ($section["result"][0]["type"] == 'REST')}checked{/if}></td><td>&nbsp;{$smarty.const.module_rest}</td>
                                                       </tr>
                                                    </table>

                                                    <div>     
                                                            <table id="deviceCheck"> 
                                                                    <tr>
                                                                      <td style="padding-left:25px">&nbsp;==>&nbsp;</td><td><input type="radio" id="mobile" class="versionDevice" value="mobile" name="version_types" {if isset($smarty.get.es) && ($section["result"][0]["type"] == 'web')}checked{else}checked{/if}></td><td>&nbsp;{$smarty.const.phonegap}&nbsp;&nbsp;</td> 
                                                                      <td>&nbsp;<input type="radio" id="windows8" class="versionDevice" value="windows8" name="version_types" {if isset($smarty.get.es) && ($section["result"][0]["type"] == 'mobile')}checked{/if}></td><td>&nbsp;{$smarty.const.windows8}</td>
                                                                     </tr>
                                                             </table>
                                                     </div>     
                                                   </div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-sm-3 control-label">{$smarty.const.status}</label>
                                                <div class="col-sm-9">
                                                    {assign var="activestatus" value=$section["result"][0]["active"]|default:"-1"} 
                                                    <div class="div-status" style="margin-top:5px;">
                                                    <input id="sectionactive" class="chk-status" {if $activestatus == 1} checked="checked" {/if}  name="sectionactive" type="checkbox" value="1" />
                                                         <label for="sectionactive">Check-me</label>
                                                    </div>
                                                </div>
                                             </div> 

                                               <div class="form-group">
                                                   <label class="col-sm-3 control-label">Module Image</label>
                                                      <div class="col-sm-9">                                                          
                                                          <table    >
                                                              <tr>
                                                                  <td style="border:1px solid #ccc;">
                                                                        <table> 
                                                                           {$colPerRow = 4} 
                                                                           {section name=res loop=11}
                                                                                  {if $smarty.section.res.iteration mod $colPerRow eq 1}
                                                                                         <tr>
                                                                                   {/if} 
                                                                                     <td style="padding-left:5px;">
                                                                                          <input type="radio" name="module_image_name" value="section{$smarty.section.res.index+1}.png" {if $smarty.section.res.index eq '0'} checked {/if}>
                                                                                     </td>
                                                                                      <td  style="padding:5px 5px 5px 5px;">
                                                                                        <img src="{$smarty.const.IMAGESLOCATION}userpanel/section{$smarty.section.res.index+1}.png">
                                                                                      </td>       

                                                                                    {if $smarty.section.res.iteration mod $colPerRow eq 0}
                                                                                         </tr>
                                                                                    {/if}
                                                                           {/section}
                                                                          </table>
                                                                  </td>
                                                                  <td style="border:1px solid #ccc;padding:5px;">
                                                                            <input type="file"  style="width:100%;" name="section_image" id="section_image"  accept="image/*"> 
                                                                  </td>
                                                             </tr> 
                                                          </table>     
                                                       </div>                   
                                                 </div>  
                                   </div>                           
                                                         
              </div>    
          <div class="modal-footer">
                <button type="submit"  name="btn_section" id="btn_section" class="btn btn-primary btn-sm" title="{$smarty.const.save_section}" onclick="return modules(this)" {if isset($mobileuser)}disabled{/if}>{$smarty.const.save_section}</button>
                <button  data-dismiss="modal" class="btn btn-primary btn-sm" title="{$smarty.const.cancel}">{$smarty.const.cancel}</button>
          </div>
        </form>          
                
                
  {literal}              
      <script type="text/javascript">        
          
                $(".version").click(function()
                {
                   
                      $(".version").prop("checked",false);
                      var id = $(this).prop("id");
                         if(id == 'device')
                         {
                             $("#deviceCheck").show();
                         }
                        else
                         {
                              $("#deviceCheck").hide();
                        }
                      $("#"+id).prop("checked",true);
                     
                });
                    
               $(".versionDevice").click(function()
                {   
                   
                     $(".versionDevice").prop("checked",false);
                          $("#device").prop("checked",true);
                     var id = $(this).prop("id");
                     $("#"+id).prop("checked",true); 
                          
                 });   
            
      </script>           
  {/literal}              
                
{/if}

 