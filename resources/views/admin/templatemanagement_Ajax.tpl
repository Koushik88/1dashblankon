{*
==================================================================
#   Global Basics Inc - Backend	:: Template Management           #
==================================================================

     Document       : Template Management
     Created on     : 24-06-2016
     Author         : Ponnar V
     Description    : Managing the templates, assigning the templates for 
                      reports. 
     Last Edited on : 24-06-2016
     Last Edited by : Ponnar V                  
*}


<!-- Available template List Details using grid View  -->
{if isset($templateTypeValue)}    
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
                         <span id="moduleTxt">{$templateTypeTxt} Templates</span>

             </div>
        </div>    
    
    <div class="mypanel-body" style="margin-top:-18px;">
      <div class="table-responsive">  
                  <table id="basicTable" class="table table-bordered responsive">
                                    <thead>
                                        <tr style="background-color:#F9F9F9;">
                                            <th style="border-bottom:0px solid #ccc;">{$smarty.const.tpl_name}</th>
                                            <th style="border-bottom:0px solid #ccc;">{$smarty.const.model_name}</th>
                                            <th style="border-bottom:0px solid #ccc;">{$smarty.const.controller_desc}</th>
                                            <th style="border-bottom:0px solid #ccc;">{$smarty.const.assinedreports}</th>                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                            {foreach $template_list as $key=>$listVal}                                        
                                                <tr>  
                                                          <td style="text-align: left !important;" id="{$listVal['template_id']}_edit">
                                                             <a href="javascript:void(0)" style="color:#000 !important" onclick="editTemplateName('{$listVal['name']}__{$listVal["template_id"]}');" class="editTemplateTxt" id="editTemplateTxt_{$listVal['template_id']}">{$listVal['name']}</a>
                                                          </td>
                                                          <td style="text-align: left;">{$listVal['model_name']}</td>
                                                          <td style="text-align: left;">{$listVal['controller']}</td>
                                                          <td style="text-align: center;">
                                                              <a href="templatemanagement.php?et&tid=" class="totalAssignedReports" onclick="return getAssignedReportsList('{$listVal["template_id"]}');">{count($listVal['menus'])}</a>
                                                          </td>
                                                </tr>
                                            {/foreach}     
                                   </tbody>
                    </table>
            </div>
       </div>                          
    </div>  
                                   
 <!--Edit Template List - Particular Template Name And Template Id-->
<input type="hidden" value="" id="editTemplateValues">                                  
                                   
                       
<!--Include Bootsrtap JS -->                                   
<script src="{$smarty.const.JSLOCATION}dataTables.bootstrap.js"></script>

<script type="text/javascript"> 
  {literal}    
//Data table initate Module
        jQuery('#basicTable').DataTable({
                         responsive: true,
                         "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]
                     });
                $("#basicTable_info").css("text-align","left");

//Load assigned reports for list using Ajax module
      function getAssignedReportsList(template_id)
      {

         $("#generalModal").modal("show");
         $.get(portalLocation+controller+"/templatemanagement.php",{"tid":template_id,"popup":"popup"},function(data)
         {  
            
             $("#generalModalContent").html(data);

         });
         return false;
      }
//Ednable Template Name Edit Page      
      function editTemplateName(templateValue)
      { 
                $(".templateEdit").remove();
                $(".editTemplateTxt").show();
                var templateValues = templateValue.split("__");
                $("#editTemplateTxt_"+templateValues[1]).hide();
                $("#"+templateValues[1]+"_edit").append("<table style='width:85px;' class='templateEdit'><tr><td style='border:1px solid #ccc;background-color:#F9F9F9;width:20px;padding:2px;cursor:pointer;' title='Close'><a herf='javascript:void(0);' onclick='closeEdit()'><span class='fa fa-times-circle'></span></a></td><td style='border:1px solid #ccc;background-color:#F9F9F9;width:20px;padding:2px;cursor:pointer;' title='Save'><a herf='javascript:void(0);' onclick='editReports()'><span class='fa fa-save'></span></a></td><td style='border:1px solid #ccc;background-color:#F9F9F9;width:45px;'><span><input type='text' id='newReportVal' value = '' required></span></tr></table>");                   
                $("#newReportVal").val(templateValues[0]);                  
                $("#editTemplateValues").val(templateValues);
     }      
//Close Template Edit Module      
     function closeEdit()
      {             
                var editTemplateValues = $("#editTemplateValues").val().split(",");                   
                $(".templateEdit").hide();
                $(".editTemplateTxt").show();
                $("#editTemplateTxt_"+editTemplateValues[1]).html(editTemplateValues[0]);
      }
//Edit Template Name Module using Ajax Module      
      function editReports()
       {
               var editTemplateValues = $("#editTemplateValues").val().split(",");                   
               var newReportVal = $("#newReportVal").val();
                 if(newReportVal.length != '0')
                  {
                   $.post(portalLocation+controller+"/templatemanagement_Ajax.php",{"newReportVal":newReportVal,"editTemplateValues":editTemplateValues[1]},function(data)
                   {  
                     
                     if(data == 1)
                     {
                            jQuery.gritter.add({
                                   title: 'Edit Report Message!',
                                   text: 'Report name updated successfully!',
                                   class_name: 'growl-success',
                                   image: ImageLocation+'screen.png',
                                   sticky: false,
                                   time: ''
                            });
                            
                            
                                    var defSelectType = $(".moduleSource:checked").attr("id");              
                                    var platformTypeVal = $("#"+defSelectType).val();  


                                    var templateType =  $(".templateSource:checked").attr("id");
                                    var templateTypeVal = $("#"+templateType).val();

                                     var templateTypeTxt =  $("#"+templateType).attr("title");              
                                     $.post(portalLocation+controller+"/templatemanagement_Ajax.php",{"templateTypeValue":platformTypeVal+templateTypeVal,"templateTypeTxt":templateTypeTxt},function(data)
                                      {     
                                         $("#availReports_list").html(data);
                                      });
                           
                      }
                      else if(data == 0)
                      {
                           jQuery.gritter.add({
                            title: 'Edit Report Message!',
                            text: 'Report name already exists!',
                            class_name: 'growl-danger',
                            image: ImageLocation+'screen.png',
                            sticky: false,
                            time: ''
                           });
                      }

                   });
               }
               else
               {
                    $.messager.alert('Alert for Edit Report','Enter valid template name!','');
               }
           }
           
 {/literal} 
</script>                                            
{/if}  
