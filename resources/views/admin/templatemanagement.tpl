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

<!--Include Custom CSS -->
<link href="{$smarty.const.CSSLOCATION}customcss/module_templateManagement.css" rel="stylesheet">

{if !isset($popup)}
<div class="contentpanel">                        
   <div class="row">
      <div class="col-md-12">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="pull-right" style="margin-top:-5px;">                           
                                <a href="javascript:void(0);" onclick="getNewTemplate();" class="btn btn-primary btn-sm" title="{$smarty.const.get_new_template}">{$smarty.const.get_new_template}</a>
                       </div><!-- mypanel-btns -->
                     <h3 class="mypanel-title">{$smarty.const.templates_header}</h3>
        
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
                                             <input type="radio"  checked  class="moduleSource" id="moduleweb" checked name="platformtype" value="111">
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
                                              <input type="radio"   class="moduleSource" id="modulePhonegap" name="platformtype" value="11">
                                            </div>
                                         </div>	
                                    </label>
                               
                                   <label>
                                        <div class="moduleTypeLabel" title="{$smarty.const.windows8}">
                                          <div  id="moduleWindows8_img"  class="selectIcon">                                          
                                          </div><br/>
                                            <div class="moduleSourceContent">
                                                <img src="{$smarty.const.IMAGESLOCATION}userpanel/windows8_icon.png" height="25" width="25" title="{$smarty.const.windows8}">  
                                                <input type="radio" class="moduleSource" id="moduleWindows8" name="platformtype" value="1">
                                            </div>
                                        </div>	
                                    </label>
                           </div>
                        </div>
<!--Temlate Type List -->                       
                       <h5><strong>{$smarty.const.template_type}</strong></h5>
                        <div class="availModule_list">                           
                              <div class="row">
                                   <label>
                                        <div class="moduleTypeLabel"  title="Standard">
                                          <div  id="tempStandard_img"  class="selectTplTypeIcon">
                                          </div>
                                            <br/>
                                          <div  class="moduleSourceContent"> 
                                             <img src="{$smarty.const.IMAGESLOCATION}userpanel/section_name0.png" height="25" width="25" title="Standard">  
                                             <input type="radio"  checked  class="templateSource" id="tempStandard" checked name="templatetype" value="1" title="Standard">
                                          </div>
                                          </div>	
                                    </label>
                                          
                                    <label>
                                        <div class="moduleTypeLabel" title="Custom">                                            
                                          <div  id="tempCustom_img" class="selectTplTypeIcon">                                       
                                          </div>
                                            <br/>
                                           <div class="moduleSourceContent">
                                              <img src="{$smarty.const.IMAGESLOCATION}userpanel/section_name2.png" height="25" width="25" title="Custom">  
                                              <input type="radio"   class="templateSource" id="tempCustom" name="templatetype" value="3" title="Custom">
                                            </div>
                                         </div>	
                                    </label>
                               
                                   <label>
                                        <div class="moduleTypeLabel" title="Plugin">
                                          <div  id="tempPlugin_img"  class="selectTplTypeIcon">                                          
                                          </div><br/>
                                            <div class="moduleSourceContent">
                                                <img src="{$smarty.const.IMAGESLOCATION}userpanel/section_name1.png" height="25" width="25" title="Plugin">  
                                                <input type="radio" class="templateSource" id="tempPlugin" name="templatetype" value="2" title="Plugin">
                                            </div>
                                        </div>	
                                    </label>
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
  

                        
<script type="text/javascript">
    {literal}
        
    //Alert for new template type    
            function getNewTemplate()
            {
                 $.messager.alert('Alert for new templates!','Contact \'TVS infotech LTD.\' to get a New Template!','');
            }
            
  //Initial call for platform type and template type           
            getTemplateList();  
            
            $(".moduleSource").click(function()
            {    
                        getTemplateList();
            });
            
            $(".templateSource").click(function()
            {
                        getTemplateList();
            });
          
 //Load List of template from Ajax Module          
      function getTemplateList()
      {
              $(".selectIcon").html("");
              $(".selectTplTypeIcon").html("");
              
    // Checked For Selected Platform Type          
              var defSelectType = $(".moduleSource:checked").attr("id");              
              $("#"+defSelectType+"_img").html("<img  src='"+ImageLocation+"userpanel/selectSection.png'> ");
              var platformTypeVal = $("#"+defSelectType).val();  
             
    // Checked For Selected Template Type         
              var templateType =  $(".templateSource:checked").attr("id");
              $("#"+templateType+"_img").html("<img  src='"+ImageLocation+"userpanel/selectSection.png'> ");
              var templateTypeVal = $("#"+templateType).val();
              
               var templateTypeTxt =  $("#"+templateType).attr("title");  
    //Load template List From target div id           
               $.post(portalLocation+controller+"/templatemanagement_Ajax.php",{"templateTypeValue":platformTypeVal+templateTypeVal,"templateTypeTxt":templateTypeTxt},function(data)
                {     
                         $("#availReports_list").toggle('slow', function() {
                           $("#availReports_list").html(data);
                         });
                         $("#availReports_list").show("slow");
                });
              
      }
    {/literal}
</script>
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
   

<!--Load List of reports for Ajax Module-->
{if isset($templatedata)}
    <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{$smarty.const.report_template}</h4>
    </div>
             <div class="modal-body"> 
                            <table class="table table-bordered mb30">
                                  <thead>
				        <tr>	 
                                            <th>{$smarty.const.module_name}</th>
					    <th>{$smarty.const.menu_name}</th>                                            
					    <th>{$smarty.const.procedure_name}</th>
					</tr>
                                  </thead>
                                  <tbody>
				   {foreach from=$templatedata[$template_id]["menus"] name="sectionmenus" key=ksm item=ism}
                                        <tr>
                                           <td>{$ism["section_name"]}</td>
					   <td>{$ism["menu_name"]}</td>                                           
					   <td>{if $ism["procedure_name"]}{$ism["procedure_name"]|replace:'analyzr_I_':''|replace:'analyzr_D_':''}{else}{$smarty.const.no_procedure}{/if}</td>
			               </tr>
                                   {/foreach}
                                  </tbody>  
	                   </table>
             </div>               
            <div class="modal-footer">
               <button  data-dismiss="modal" class="btn btn-primary btn-sm" title="{$smarty.const.cancel}">{$smarty.const.cancel}</button>
            </div>        
            
{/if}    


