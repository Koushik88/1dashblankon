{*
==================================================================
#   Global Basics Inc - Backend	:: Module Management Template    #
==================================================================

    Document       : Module Management Template
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Managing the Module - Add New Reports using Ajax Page
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}

<!--Declare Custom CSS -->
<link href="{$smarty.const.CSSLOCATION}customcss/addReports.css" rel="stylesheet">

{if isset($smarty.get.addReports)}
       <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.add_new_reports}</strong> 
       </div>
{/if}

<!--Add Reports Progress Bar Panel-->
<div class="contentpanel contentpanel-wizard">                        
                        <div class="row">                           
                            <div class="col-md-11">
                                <form method="post" id="progressWizard" class="panel-wizard">
                                    <ul class="nav nav-justified nav-wizard">
                                        <li><a href="#tab1-3" data-toggle="tab"><strong>Step 1:<br/></strong>Report & Module</a></li>
                                        <li><a href="#tab2-3" data-toggle="tab"><strong>Step 2:<br/></strong>Template & Procedure</a></li>
                                        <li><a href="#tab3-3" data-toggle="tab"><strong>Step 3:<br/></strong>Assign User</a></li>
                                    </ul>
                                    <div class="progress progress-xs">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                
                                    <div class="tab-content" style="border-top:1px solid #ccc;margin-top:-10px;">
                                        <div class="tab-pane" id="tab1-3">
                                            <div class="form-group">
                                                <label class="col-sm-3">{$smarty.const.reports_name}</label>
                                                <div class="col-sm-8">
                                                    <input class="form-control" required type="text" name="menu_name" id="menu_name_init" maxlength="30" value=""/> 
                                                </div>
                                            </div><!-- form-group -->
                                            
                                          <div class="form-group">
                                              <label class="col-sm-3">{$smarty.const.platform_type}</label>
                                                <div class="col-sm-8">
                                                    <div class="platformTypePanel">   
                                                    <div  class="platformTypePanel-row">
                                                         <div class="row">
                                                                    <label>
                                                                         <div class="moduleTypeLabel" title="{$smarty.const.module_web}">
                                                                           <div  id="moduleweb_img"  class="selectIcon">

                                                                           </div>
                                                                           <br/>
                                                                           <div class="moduleSourceContent"> 
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
                                                                                 <input type="radio"   class="moduleSource" id="moduleWindows8" name="platformtype" value="windows8">
                                                                             </div>
                                                                         </div>	
                                                                     </label>

                                                                     <label>
                                                                         <div class="moduleTypeLabel" title="{$smarty.const.module_rest}">
                                                                          <div  id="moduleRest_img"  class="selectIcon">

                                                                          </div>
                                                                             <br/>
                                                                           <div class="moduleSourceContent">
                                                                              <img src="{$smarty.const.IMAGESLOCATION}userpanel/rest_icon.png" height="25" width="25" title="{$smarty.const.module_rest}">  
                                                                              <input type="radio"  class="moduleSource" id="moduleRest" name="platformtype" value="rest">
                                                                           </div> 
                                                                          </div>	
                                                                    </label>
                                                            </div> 
                                                          </div>
                                                     </div>
                                                </div>  
                                            </div><!-- form-group -->   
                                            
                                            <div class="form-group">
                                              <label class="col-sm-3">{$smarty.const.module_name}</label>
                                                <div class="col-sm-8">
                                                  <div class ="availModulelabel">   
                                                     <div class= "availModulelabelContent" >
                                                        <div id="availModule_list">

                                                        </div>
                                                    </div>
                                                </div>
                                               </div>
                                            </div>   
                                            
                                            
                                        </div><!-- tab-pane -->
                                        
                                        
                                        <div class="tab-pane" id="tab2-3">
                                            <div class="form-group">
                                                <label class="col-sm-3">{$smarty.const.template_type}</label>
                                                <div class="col-sm-8">
                                                          <div class="platformTypePanel">   
                                                            <div class="platformTypePanel-row">
                                                                 <div class="row">
                                                                            <label>
                                                                                 <div class="moduleTypeLabel" title="Standard">
                                                                                   <div  id="standardType_img"  class="selectTplTypeIcon">

                                                                                   </div><br/>
                                                                                   <div class="moduleSourceContent"> 
                                                                                      <img src="{$smarty.const.IMAGESLOCATION}userpanel/section_name0.png" height="25" width="25" title="Standard">  
                                                                                      <input type="radio"  checked  class="tplTypeSource" id="standardType" checked name="tplTypeSource" value="standard">
                                                                                   </div>
                                                                                   </div>	
                                                                             </label>

                                                                             <label>
                                                                                 <div class="moduleTypeLabel" title="Plugin">

                                                                                   <div  id="pluginType_img" class="selectTplTypeIcon">

                                                                                   </div><br/>
                                                                                    <div class="moduleSourceContent">
                                                                                       <img src="{$smarty.const.IMAGESLOCATION}userpanel/section_name1.png" height="25" width="25" title="Plugin">  
                                                                                       <input type="radio"   class="tplTypeSource" id="pluginType" name="tplTypeSource" value="plugin">
                                                                                     </div>
                                                                                  </div>	
                                                                             </label>

                                                                            <label>
                                                                                  <div class="moduleTypeLabel" title="Custom">
                                                                                   <div  id="custom_img"  class="selectTplTypeIcon">

                                                                                   </div><br/>

                                                                                     <div class="moduleSourceContent">
                                                                                         <img src="{$smarty.const.IMAGESLOCATION}userpanel/section_name2.png" height="25" width="25">  
                                                                                         <input type="radio"   class="tplTypeSource" id="custom" name="tplTypeSource" value="custom">
                                                                                     </div>
                                                                                 </div>	
                                                                             </label>
                                                                             
                                                                    </div>  
                                                            </div>
                                                     </div>
                                                    
                                                </div>
                                            </div><!-- form-group -->
                                            
                                            <div class="form-group">
                                                <label class="col-sm-3">No.Of.Procedure(s)</label>
                                                <div class="col-sm-8">
                                                    <div  class="procedureTypeLabel">                                                        
                                                        <input type="radio" name="procedureType" id="single_proc" value="1" class="procedureType" checked="checkecd"/> 
                                                    </div>
                                                    <div class="procedureTypeLabel">
                                                        One &nbsp;
                                                    </div>
                                                    
                                                    <div class="procedureTypeLabel">                                                        
                                                        <input type="radio" name="procedureType" id="double_proc" value="2" class="procedureType"/> 
                                                    </div>
                                                    <div class="procedureTypeLabel">
                                                       Two &nbsp;
                                                    </div>
                                                    
                                                    <div class="procedureTypeLabel">                                                        
                                                        <input type="radio" name="procedureType" id="multi_proc" value="N" class="procedureType"/> 
                                                    </div>
                                                    <div class="procedureTypeLabel">
                                                       Multiple
                                                    </div>
                                               </div>
                                            </div><!-- form-group -->
                                            
                                            <div class="form-group">
                                                <label class="col-sm-3">Available Template</label>
                                                <div class="col-sm-8">
                                                    <div id="availTemplateList">
                                                        
                                                    </div>   
                                                </div>
                                            </div><!-- form-group -->
                                            
                                            <div class="form-group">
                                                <label class="col-sm-3">Procedure</label>
                                                <div class="col-sm-8">
                                                    <div id="availProcedureList">
                                                    </div>   
                                                </div>
                                            </div><!-- form-group -->
                                        </div><!-- tab-pane -->
                                        
                                        
                                        
                                        
                                        <div class="tab-pane" id="tab3-3">
                                            <div class="form-group">
                                                <label class="col-sm-3">Link Reports</label>
                                                <div class="col-sm-8">
                                                  <div id="linkReportBox">   
                                                       
                                                  </div>
                                                </div>
                                            </div><!-- form-group -->
                                            
                                         
                                            <div class="form-group">
                                                <label class="col-sm-3">Status</label>
                                                <div class="col-sm-8">
                                                  <div class="div-status">
                                                                 <input id="menuActive" class="chk-status" checked="checked" name="menuActive" type="checkbox" value="1">
                                                                 <label for="menuActive">Check-me</label>
                                                  </div>
                                                </div>
                                            </div><!-- form-group -->
                                            
                      
                                            <div class="form-group">
                                                <label class="col-sm-3">Assign User to Reports</label>
                                                <div class="col-sm-8">
                                                    <select  id="assignUser" data-placeholder="Choose One" class="width300 assingUserPrivilages">
                                                            <option value="user_wise">By User</option>
                                                            <option value="role_wise">By Role</option>
                                                    </select>
                                                    <br/><br/>
                                                    <div class="table-responsive">
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
                                                                                                                                <input type="checkbox" name="chkmenulist[]" class="assignUser" id="chk_{$smarty.foreach.varuserlist.iteration}" value="{$item_ul["id"]}" />  </td>
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
                                                                                                                                        <input type="checkbox" name="chkrolelist[]" id="chk_{$smarty.foreach.varuserlist.iteration}"  value="{$item_ul["user_id"]}"  class="chkrolelist" />  </td>
                                                                                                                          {if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 0}
                                                                                                                             </tr>
                                                                                                                          {/if}
                                                                                                                {/foreach} 
                                                                                              </tbody>
                                                                            </table>                                   
                                                                  </div> 
                                                          </div>                                   
                                                </div>
                                                
                                            </div><!-- form-group -->
                                        </div><!-- tab-pane -->                                        
                                    </div><!-- tab-content -->
                                    
                                   
                                    <div class="mypanel-footer" style="border:1px solid #ccc;border-top:0px solid #ccc;">
                                     <div class="row">
                                        <div class="col-sm-12">
                                                <ul class="list-unstyled wizard">
                                                    <li class="pull-left previous"><button type="button" class="btn btn-primary">Previous</button></li>
                                                    <li class="pull-right next"><button type="button" class="btn btn-primary">Next</button></li>
                                                    <li class="pull-right finish hide"><button type="button" onclick="saveMenu()" class="btn btn-primary">Finish</button></li>
                                                </ul>
                                       </div>     
                                   </div>
                                 </div>      
                                </form><!-- panel-wizard -->
              
                            </div><!-- col-md-6 -->
                            
                            
</div>
</div>


<script type="text/javascript">
        var img_location = "{$smarty.const.IMAGESLOCATION}"; 
      {literal}  
         // Progress Wizard
                jQuery('#progressWizard').bootstrapWizard({
                    onTabShow: function(tab, navigation, index) {
                        tab.prevAll().addClass('done');
                        tab.nextAll().removeClass('done');
                        tab.removeClass('done');
                        
                        var $total = navigation.find('li').length;
                        var $current = index + 1;
                        
                        if($current >= $total) {
                            $('#progressWizard').find('.wizard .next').addClass('hide');
                            $('#progressWizard').find('.wizard .finish').removeClass('hide');
                        } else {
                            $('#progressWizard').find('.wizard .next').removeClass('hide');
                            $('#progressWizard').find('.wizard .finish').addClass('hide');
                        }
                        
                        var $percent = ($current/$total) * 100;
                        $('#progressWizard').find('.progress-bar').css('width', $percent+'%');
                    }
                });
                
              
    
    //Module Selection
            getModuleList();
         $(".moduleSource").click(function()
         {    
                  getModuleList();
         }); 
              
   function getModuleList()
   {
             $(".selectIcon").html("");
                  var selPalatformId = $(".moduleSource:checked").attr("id");
                  var selPalatformValue = $("#"+selPalatformId).val();
                  
                  $("#"+selPalatformId+"_img").html("<img  src='"+img_location+"userpanel/selectSection.png'> ");
                  
                     $.post(portalLocation+controller+"/addReportAjax.php",{"selPalatformValue":selPalatformValue},function(data)
                     {         
                           
                           $("#availModule_list").toggle('slow', function() {
                            // Animation complete.
                                    $("#availModule_list").html(data);
                                });
                         $("#availModule_list").show("slow");
                         
                     });
                     
                      $.post(portalLocation+controller+"/addReportAjax.php",{"assignLinkReports":selPalatformValue},function(data)
                         {      
                            
                                $("#linkReportBox").html(data);
                         }); 
   }
    
//Template Type Selection  
     getTemplateList(); 
       $(".tplTypeSource").click(function()
       {        
                getTemplateList();
       });
             
       $(".procedureType").click(function()
       {        
                getTemplateList();
       });
       
      function getTemplateList()
      {   
                 $(".selectTplTypeIcon").html("");    
                 var selTplTypeId = $(".tplTypeSource:checked").attr("id");
                 $("#"+selTplTypeId+"_img").html("<img  src='"+img_location+"userpanel/selectSection.png'>")
            
                 var procedureType = $(".procedureType:checked").attr("id");                 
                 var tplTypeId = $("#"+selTplTypeId).val();
                 var procedureTypeId = $("#"+procedureType).val();
                 
                   $.post(portalLocation+controller+"/addReportAjax.php",{"procedureTypeId":procedureTypeId,"tplTypeId":tplTypeId},function(data)
                     {  
                       
                         $("#availTemplateList").html(data);
                            
                     });
                     
                  $.post(portalLocation+controller+"/addReportAjax.php",{"selectProcedureType":procedureTypeId},function(data)
                     {  
                       
                         $("#availProcedureList").html(data);
                            
                     });
       }      
      
      
       $(".assingUserPrivilages").change(function()
        {
           var asignPrivlages = $(".assingUserPrivilages option:selected").val(); 
                
                $(".assignUser").prop("checked",false);
                $(".chkrolelist").prop("checked",false);

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
        
      
   $("#menuActive").change(function()
    {
        
       if($(this).val() == '1')
         {
             $("#menuActive").val(0);
                 
         }
         else
            {
                 $("#menuActive").val(1);
            }
              
    });
    
    
 function saveMenu()
 {
     var menu_name = $("#menu_name_init").val();
     var platformType = $(".moduleSource:checked").val();
     var module_id = $(".availmodules:checked").val();
     var template_id = $("#templateList option:selected").val();
     var linkReport_id = $("#availLinkReport option:selected").val();
     var menu_active = $("#menuActive").val();
     
      var sel_proc_id =[];  
     $(".procedureAvailList").each(function()
     {       
            var  procAvailId = $(this).attr("id");
            var procValue = $("#"+procAvailId).val();
            if(procValue)
            {
                 sel_proc_id.push(procValue);  
            }
     });
     var proc_id = sel_proc_id[0];
     sel_proc_id = sel_proc_id.slice(1);
     
     
     var userList = []; 
       var roleList = [];    
        $(".assignUser:checked").each(function()
        { 
          userList.push($(this).val());     

        });
            
        $(".chkrolelist:checked").each(function()
        { 
            
          roleList.push($(this).val());     

        });
      
       if(menu_name.length != '0')
       {
              $.post(portalLocation+controller+"/addReportAjax.php", {"menu_name":menu_name,"platformType":platformType,"module_id":module_id,"template_id":template_id,"linkReport_id":linkReport_id,"menu_active":menu_active,"proc_id":proc_id,"sel_proc_id":sel_proc_id,"userList":userList,"roleList":roleList}, function(data)
              {    
                  
                 if(data == 0)
                 {
                    
                     jQuery.gritter.add({
                            title: 'Edit Report Message!',
                            text: 'Report already exists!',
                            class_name: 'growl-danger',
                            image: img_location+'screen.png',
                            sticky: false,
                            time: ''
                           });
                 }
                 else
                 {
                     window.location = portalLocation+'admin/addReports.php?addReports';
                 }
              });
       }   
       else
       {
            $.messager.alert('Alert for Report name validation!','Enter valid report name!','');
       }
     
     
 }   
  
{/literal} 
</script>





