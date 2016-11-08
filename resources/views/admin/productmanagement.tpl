{*
==================================================================
#   Global Basics Inc - Backend	:: Product Management            #
==================================================================

    Document       : Product Management
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Display the Information about this product, displays no of 
                     modules,templates and procedures.
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V                       
                  
*}

<div class="contentpanel">                        
   <div class="row">
      <div class="col-sm-6">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="mypanel-btns">
                           <a href="" class="mypanel-minimize tooltips" data-toggle="tooltip" title="Minimize mypanel"><i class="fa fa-minus"></i></a>
                           <a href="" class="mypanel-close tooltips" data-toggle="tooltip" title="Close mypanel"><i class="fa fa-times"></i></a>
                       </div><!-- mypanel-btns -->
                                <h3 class="mypanel-title">{$smarty.const.product_details_header}</h3>
                   </div>
                   <div class="mypanel-body">                            
                        <div class="row">      
                                 <div class="form-group">
                                     <label class="col-sm-5 control-label"><b>{$smarty.const.product_name}</b></label>
                                         <div class="col-sm-7">
                                             {$productdetails['product_name']}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-5 control-label"><b>{$smarty.const.cmpy_name}</b></label>
                                         <div class="col-sm-6">
                                             {$productdetails['company_name']}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-5 control-label"><b>{$smarty.const.product_version}</b></label>
                                         <div class="col-sm-6">
                                             {$productdetails['product_version']}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-5 control-label"><b>{$smarty.const.installed_Date}</b></label>
                                         <div class="col-sm-6">
                                             {$productdetails['installeddate']}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-5 control-label"><b>{$smarty.const.product_type}</b></label>
                                         <div class="col-sm-6">
                                             {if $productdetails['product_type'] == 1}{$smarty.const.stand_alone}{elseif $productdetails['product_type'] == 80}{$smarty.const.cloud}{elseif $productdetails['product_type'] == 90}{$smarty.const.enterprise} - level1{elseif $productdetails['product_type'] == 100}{$smarty.const.enterprise} - level2{/if}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-5 control-label"><b>{$smarty.const.license_id}</b></label>
                                         <div class="col-sm-6">
                                             {$productdetails['license_id']}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-5 control-label"><b>{$smarty.const.product_eul}</b></label>
                                         <div class="col-sm-6">
                                             <a target="blank" {*href="{$smarty.const.ELULOCATION}eula2.pdf"*} href="javascript:void(0);">Click here</a>
                                         </div>
                                 </div><!-- form-group -->
                        </div>
                   </div>
         </div>           
     </div>
    
    <div class="col-sm-6">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="mypanel-btns">
                           <a href="" class="mypanel-minimize tooltips" data-toggle="tooltip" title="Minimize mypanel"><i class="fa fa-minus"></i></a>
                           <a href="" class="mypanel-close tooltips" data-toggle="tooltip" title="Close mypanel"><i class="fa fa-times"></i></a>
                       </div><!-- mypanel-btns -->
                                <h3 class="mypanel-title">{$smarty.const.section_total_header}</h3>
                   </div>
                   <div class="mypanel-body">                            
                        <div class="row"> 
                            <div class="form-group">
                                     <label class="col-sm-6 control-label"><b>{$smarty.const.total_no_users}</b></label>
                                         <div class="col-sm-6">
                                             {$total_counts["usercount"]}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-6 control-label"><b>{$smarty.const.total_no_sections}</b></label>
                                         <div class="col-sm-6">
                                             {$total_counts["section_count"]}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-6 control-label"><b>{$smarty.const.total_no_menus}</b></label>
                                         <div class="col-sm-6">
                                             {$total_counts["report_count"]}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-6 control-label"><b>{$smarty.const.total_no_templates}</b></label>
                                         <div class="col-sm-6">
                                             {$total_counts["template_count"]}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-6 control-label"><b>{$smarty.const.total_no_defaultprocedures}</b></label>
                                         <div class="col-sm-6">
                                             {$total_counts["proceduredefault_count"]}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-6 control-label"><b>{$smarty.const.total_no_installedprocedures}</b></label>
                                         <div class="col-sm-6">
                                             {$total_counts["procedureinstalled_count"]}
                                         </div>
                                 </div><!-- form-group -->
                                 <div class="form-group">
                                     <label class="col-sm-6 control-label"><b>{$smarty.const.total_no_widgetprocedures}</b></label>
                                         <div class="col-sm-6">
                                             {$total_counts["procedureWidget_count"]}
                                         </div>
                                 </div>
                        </div>
                   </div>
         </div>           
     </div>              
                                         
     <div class="col-sm-6">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="mypanel-btns">
                           <a href="" class="mypanel-minimize tooltips" data-toggle="tooltip" title="Minimize mypanel"><i class="fa fa-minus"></i></a>
                           <a href="" class="mypanel-close tooltips" data-toggle="tooltip" title="Close mypanel"><i class="fa fa-times"></i></a>
                       </div><!-- mypanel-btns -->
                                <h3 class="mypanel-title">{$smarty.const.Product_plugin}</h3>
                   </div>
                   <div class="mypanel-body">                            
                        <div class="row">     
                           {section res $pluginInfo} 
                                <div class="form-group">
                                     <label class="col-sm-5 control-label"><b>{$pluginInfo[res].name}</b></label>
                                         <div class="col-sm-6">
                                             {if $pluginInfo[res].active eq '1'}{$smarty.const.installed} {else}{$smarty.const.plugin_not_istalled}{/if}
                                         </div>
                                </div>
                            {/section}                
                        </div>
                   </div>
         </div>           
     </div>
     
    <div class="col-sm-6">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="mypanel-btns">
                           <a href="" class="mypanel-minimize tooltips" data-toggle="tooltip" title="Minimize mypanel"><i class="fa fa-minus"></i></a>
                           <a href="" class="mypanel-close tooltips" data-toggle="tooltip" title="Close mypanel"><i class="fa fa-times"></i></a>
                       </div><!-- mypanel-btns -->
                                <h3 class="mypanel-title">{$smarty.const.Product_webservices}</h3>
                   </div>
                   <div class="mypanel-body">                            
                        <div class="row">       
                            <div class="form-group">
                                     <label class="col-sm-5 control-label"><b>{$smarty.const.mobile_application}</b></label>
                                         <div class="col-sm-6">
                                             {if $productdetails['mobile_available'] == 'Y'}{$smarty.const.installed}{else}{$smarty.const.not_installed}{/if}
                                         </div>
                             </div>
                              
                             <div class="form-group">
                                     <label class="col-sm-5 control-label"><b>{$smarty.const.product_webservice}</b></label>
                                         <div class="col-sm-6">
                                             <div class="loading"></div>
                                                <div class="div-status">
                                                    <input id="chk-webservice" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/productmanagement.php?webservice','webservice');" {if $productdetails["webservice"] == "1"} checked="checked" {/if}  name="chk-webservice" type="checkbox" value="1" />
                                                    <label for="chk-webservice">Check-me</label>
                                                </div>
                                         </div>
                             </div>            
                             
                          </div>
                   </div>
         </div>           
     </div>
                   
          
     <div class="col-sm-6">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="mypanel-btns">
                           <a href="" class="mypanel-minimize tooltips" data-toggle="tooltip" title="Minimize mypanel"><i class="fa fa-minus"></i></a>
                           <a href="" class="mypanel-close tooltips" data-toggle="tooltip" title="Close mypanel"><i class="fa fa-times"></i></a>
                       </div><!-- mypanel-btns -->
                                <h3 class="mypanel-title">{$smarty.const.Product_addons}</h3>
                   </div>
                   <div class="mypanel-body">                            
                        <div class="row"> 
                             {if $productdetails['product_type'] == 100}
                                        <div class="form-group">
                                             <label class="col-sm-5 control-label"><b>{$smarty.const.Product_ruleengine}</b></label>
                                                 <div class="col-sm-7">
                                                     {$smarty.const.installed}
                                                 </div>
                                         </div><!-- form-group -->
                                         <div class="form-group">
                                             <label class="col-sm-5 control-label"><b>{$smarty.const.Product_formengine} [2.0]</b></label>
                                                 <div class="col-sm-6">
                                                     {$smarty.const.installed}
                                                 </div>
                                         </div><!-- form-group -->
                                         <div class="form-group">
                                             <label class="col-sm-5 control-label"><b>{$smarty.const.Product_pivot}</b></label>
                                                 <div class="col-sm-6">
                                                     {$smarty.const.installed}
                                                 </div>
                                         </div>
                              {else}
                                        Not Available
                              {/if}            
                        </div>
                   </div>
         </div>           
     </div>                              
   </div>       
</div>
<!-- mypanel -->

{literal}
	<script type="text/javascript">
            
		
                    
              function changeStatus(chk,url,div){
                   
                    chkid = chk.id;
                      
                     var divloader = $("#"+chkid).parent().siblings(".loading");
                        var checked = "0"; 
                        $("."+div+" .focused").prop("disabled","disabled");
                        if($("#"+chkid).prop("checked")){
                            $("."+div+" .focused").removeAttr("disabled");  
                            checked = "1";    
                        }
                        divloader.removeClass("nobg");    
                        divloader.html(""); 
                       
                         
                        $.get(url+"&ra="+checked,function(data){                              
                         divloader.addClass("nobg");
                          if(data == "1"){
                              //divloader.html("Success!");    
                         }else{
                            // divloader.html("Failed!");
                         }
                          divloader.delay(1000).fadeOut("slow");      
                        });
                }
                
	</script>
 {/literal}  
