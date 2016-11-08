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

<!--Available Module List Section -->
{if $moduleList}    
       <div class="row">
            {foreach $moduleList['result'] as $key=>$modules}
                    <label  ondrop="drop('{$modules["id"]}__{$modules["name"]}')" ondragover="allowDrop(event)">
                        <div class="moduleTypeLabel" title="{$modules["name"]}">
                            <div id="{$modules["id"]}module_img"  class="selectModuleIcon">

                            </div><br/>
                            <div class="moduleSourceContent"> 
                               <img src="{$smarty.const.IMAGESLOCATION}userpanel/{$modules["menu_image"]}" height="25" width="25"> 
                               <input type="radio" {if $key eq '0'} checked {/if}  class="availmodules" id="{$modules["id"]}module"  name="availmodules" value="{$modules["id"]}" data-toggle="modal" data-target=".availModal" title="{$modules["name"]}">
                            </div>
                        </div>	
                    </label>
                            <input type="hidden" id="{$modules["id"]}module_active" value="{$modules["active"]}">
            {/foreach} 
       </div>


    <script type="text/javascript">
        var img_location = "{$smarty.const.IMAGESLOCATION}";
        {literal}
          $(function()
          {
               var defSelectType = $(".availmodules:checked").attr("id"); 
               $("#"+defSelectType+"_img").html("<img  src='"+img_location+"userpanel/selectSection.png'> ");
           
                viewReports();
          
                $(".availmodules").click(function()
                 {  
                    viewReports();

                 });
                                    
          });
          
          function viewReports()
           {    
                    var defSelectType = $(".availmodules:checked").attr("id");   
                    $(".selectModuleIcon").html("");
                    $("#"+defSelectType+"_img").html("<img  src='"+img_location+"userpanel/selectSection.png'> ");
                    
                    
                    
                    // Select And Report Load Default               
                    var defSelectModule = $(".availmodules:checked").attr("id");
                    var selModuleValue = $("#"+defSelectModule).val();
                    var selModuleTitle = $("#"+defSelectModule).attr("title");                     
                    var module_active = $("#"+defSelectType+"_active").val();
                    
                    $.post(portalLocation+controller+"/modulemanagement_Ajax.php",{"selModuleValue":selModuleValue,"selModuleTitle":selModuleTitle,"module_active":module_active},function(data)
                     {   
                         $("#availReports_list").toggle('slow', function() 
                         {
                                 $("#availReports_list").html(data);
                         });
                         $("#availReports_list").show("slow");
                     });
                 
           }
    {/literal}
    </script>
{/if}


<!-- Available Report List Details using grid View  -->
{if isset($selModuleTitle)}    
    <link href="{$smarty.const.CSSLOCATION}style.datatables.css" rel="stylesheet">
      {assign var="msg" value="Are you Sure Delete this Module \'"|cat:$selModuleTitle|cat:"\' "} 
                                             
    <div class="datagrid-header-content">  
        <div class ="moduleStatus">
            <div style="float:left;">
                         <table id="editModuleTxt">
                             <tr>
                                 <td class="editModuleContd"><a href="javascript:void(0);" onclick="closeEditModule();"><span class="fa fa-times-circle"></span></a></td>
                                 <td class="editModuleContd"><a href="javascript:void(0);" onclick="saveModuleName('{$selModuleValue}');"><span class="fa fa-save"></span></a></td>
                                 <td style="padding:2px;"><input type="text" value="{$selModuleTitle}" id="moduleNameEdit"></td>
                             </tr>
                         </table> 
                         <span id="moduleTxt"><a href="javascript:void(0);" onclick="editModuleBox();" id="editModuleBox">{$selModuleTitle}</a></span>

             </div>
                <div class="pull-right">
                        <div class= "moduleStatusContent">
                            <a href="modulemanagement.php?ds" onclick="return confirmDeleteModule('{$msg}','{$selModuleValue}');" title="Delete Module" class="delModule"><span class="glyphicon glyphicon-trash"></span></a>
                        </div>
                        <div class="moduleStatusContent"> 
                              <div class="div-status">
                                 <input id="chk-module" class="chk-status" {if $module_active eq '1'} checked="checked" {/if} name="chk-module" value="{$selModuleValue}" type="checkbox">
                                 <label for="chk-module">Check-me</label>
                              </div>
                        </div>    
                </div>
        </div>    
    
    <div class="mypanel-body" style="margin-top:-18px;">
      <div class="table-responsive">  
        <table id="basicTable" class="table table-bordered responsive">
                                    <thead>
                                        <tr style="background-color:#F9F9F9;">
                                            <th style="border-bottom:0px solid #ccc;">{$smarty.const.menu_name}</th>
                                            <th style="border-bottom:0px solid #ccc;">{$smarty.const.modules}</th>
                                            <th style="border-bottom:0px solid #ccc;">{$smarty.const.template_type}</th>
                                            <th style="border-bottom:0px solid #ccc;">{$smarty.const.template_name}</th>
                                            <th style="border-bottom:0px solid #ccc;">{$smarty.const.procedure_name}</th>
                                            <th style="border-bottom:0px solid #ccc;">{$smarty.const.actions}</th>
                                        </tr>
                                    </thead>

                                   <tbody>
                                            {foreach $reportList['menus'] as $key=>$listVal}                                        
                                                <tr>    
                                                          <td style="text-align: left !important;cursor:pointer;" ondragstart="drag('{$listVal['menu_name']}__{$listVal['menu_id']}__{$reportList['name']}')" draggable="true"  id="{$listVal['menu_id']}_edit">
                                                              <a href="javascript:void(0)" style="color:#000 !important" onclick="editReportName('{$listVal['menu_name']}__{$listVal['menu_id']}');" class="editReportTxt" id="editReportTxt_{$listVal['menu_id']}">{$listVal['menu_name']}</a>
                                                          </td>
                                                          <td style="text-align: left;">{$reportList['name']}</td>
                                                          <td style="text-align: left;">{$listVal['template_type']}</td>
                                                          <td style="text-align: left;">{$listVal['template_name']}</td>
                                                          <td style="text-align: left;">
                                                              <table style='width:150px;display:none;' class='reportProcedure'  id = "reportProcedure_{$key}{$listVal['procedure_id']}">
                                                                  <tr>
                                                                      <td style='border:1px solid #ccc;background-color:#F9F9F9;width:20px;padding:2px;' title='Close'>
                                                                          <a herf="javascript:void(0);" onclick="closeEditProc();" style="cursor:pointer;"><span class="fa fa-times-circle"></span></a>
                                                                      </td>
                                                                      <td style='border:1px solid #ccc;background-color:#F9F9F9;width:20px;padding:2px;' title='Save'>
                                                                          <a herf="javascript:void(0);" onclick="editReportProcedure('{$listVal['menu_id']}')" style="cursor:pointer;"><span class="fa fa-save"></span></a>
                                                                      </td>
                                                                      <td style='border:1px solid #ccc;background-color:#F9F9F9;width:130px;padding:2px'>
                                                                            <select style="width:110px;height:25px;display:block;" name="procedueList" class="procedureList" id="{$listVal['menu_id']}_procedureList">
                                                                                        <option value="{$listVal['menu_id']}_0">No Procedure</option>
                                                                                        {foreach $availProcedure as $key1=>$listValue}
                                                                                            <option {if $listVal['procedure_id'] eq  $listValue['id']} selected {/if} value="{$listVal['menu_id']}_{$listValue['id']}">{$listValue['name']|replace:'analyzr_I_':''|replace:'analyzr_F_':''}</option>
                                                                                        {/foreach}
                                                                            </select>
                                                                      </td>
                                                                  </tr>
                                                              </table>                                                             
                                                              <a href="javascript:void(0)" style="color:#000 !important" onclick="editProcedureName('{$key}{$listVal['procedure_id']}')" class="availProcList" id="availProcList_{$key}{$listVal['procedure_id']}">  {if $listVal['procedure_name']} {$listVal['procedure_name']|replace:'analyzr_I_':''} {else} No Procedure  {/if}</a>
                                                           </td>
                                                          <td style="text-align: center;">
                                                                {assign var="msg" value="Are you Sure Delete this menu \'"|cat:$listVal['menu_name']|cat:"\' "} 
                                                              <a href="modulemanagement.php?deleteMenu" onclick="return confirmDelete('{$msg}','{$listVal['menu_id']}');" title="Delete Report" class="delReports"><span class="glyphicon glyphicon-trash"></span></a> 
                                                              <a href="javascript:void(0)" title="Assign Users" {*data-toggle="modal" data-target="#assignReports"*} class = "assignReports" onclick="return assignReportsModal('{$listVal['menu_id']}')"><span class="fa fa-users"></span></a>
                                                          </td>
                                                </tr>
                                            {/foreach}     
                                   </tbody>
                     </table>
            </div>
       </div>                          
    </div> 
                                   
   <script src="{$smarty.const.JSLOCATION}dataTables.bootstrap.js"></script>
        
    {literal}
        <script type="text/javascript">
            
            jQuery('#basicTable').DataTable({
                    responsive: true,
                    "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]
                });
           $("#basicTable_info").css("text-align","left");
           
           //check Enable/disable sections   
                $(".chk-status").change(function(){
                  
                    var divloader = $(this).parent().siblings(".loading");
                    var checked = $(this).prop("checked") ? "1" : "0";
                    divloader.removeClass("nobg");    
                    divloader.html(""); 

                divloader.show(); 
                
                    $.get("modulemanagement.php?chs&si="+$(this).val()+"&act="+checked,function(data){
                     divloader.addClass("nobg");
                      if(data == "1"){
                       divloader.html("Success!");    
                     }else{
                         divloader.html("Failed!");
                     }
                         
                      divloader.delay(1000).fadeOut("slow");     
                          
                    });
                    
                });    
     
    
//Module Edit,save, cancel edit section    
    function closeEditModule()
    {
        $(".moduleStatus").css("height","40");
        $("#editModuleTxt").hide();
        $("#moduleTxt").show();
    }
    
    function editModuleBox()
    {
        $(".moduleStatus").css("height","50");
        $("#editModuleTxt").show();
        $("#moduleTxt").hide();
    }
    
    function saveModuleName(module_id)
    {
         var module_name = $("#moduleNameEdit").val();
         $.post(portalLocation+controller+'/modulemanagement_Ajax.php',{"module_name":module_name,"module_id":module_id},function(data)
         {            
                 if(data == 1)
                     {
                            jQuery.gritter.add({
                                   title: 'Edit Module Notification!',
                                   text: 'Module name updated successfully!',
                                   class_name: 'growl-success',
                                   image: ImageLocation+'screen.png',
                                   sticky: false,
                                   time: ''
                            });
                            
                          $("#editModuleTxt").hide();
                          $("#moduleTxt").show();
                          $("#editModuleBox").html(module_name);
                          $("#"+module_id+"module").prop('title',module_name);
                          $(".moduleStatus").css("height","40");
                           
                      }
                      else if(data == 0)
                      {
                           jQuery.gritter.add({
                            title: 'Edit Module Notification!',
                            text: 'Module name already exists!',
                            class_name: 'growl-danger',
                            image: ImageLocation +'screen.png',
                            sticky: false,
                            time: ''
                           });
                      }
                
         });
    }
    
    
  //Assign Reports by user wise for modal dialog  
    
    function assignReportsModal(reportId)
    {  
       $("#generalModal").modal("show");  
        $.get(portalLocation+controller+'/modulemanagement.php',{"assignUser":"assignUser","menuid":reportId,"popup":"popup"},function(data)
           { 
                $("#generalModalContent").html(data);
           });
            return false;
    }
    
    </script>    
 {/literal}
{/if} 
