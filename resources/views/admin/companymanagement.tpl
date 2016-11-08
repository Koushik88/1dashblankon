{*
==================================================================
#   Global Basics Inc - Backend	:: Company Management Template   #
==================================================================

    Document       : Company Management Template
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Managing the Company, Api and Email Settings
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}

<!-- Basic Info -->
{* Default "casemenu" display the company Basic Information *}
{if $casemenu eq '1'}
   
    {if $status eq '1'}
       <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.company_details_saved}</strong> 
       </div>
    {/if}
    
    {if $estatus eq '1'}
        <div class="alert alert-danger">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
               <strong>{$smarty.const.upload_png_file}</strong> 
        </div>
    {/if}
    
   {assign var="pagelink" value=""}
    {if isset($smarty.get.page)}
        {assign var="pagelink" value="&page="|cat:$smarty.get.page}
    {/if}
    
    
<div class="contentpanel">                        
   <div class="row">
      <div class="col-md-8">
       <form method = "post" name="frmmenulist" id="frmmenulist" enctype="multipart/form-data" action="companymanagement.php?s=1&activeId=0"> 
        <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>

         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="mypanel-btns">
                           <a href="" class="mypanel-minimize tooltips" data-toggle="tooltip" title="Minimize mypanel"><i class="fa fa-minus"></i></a>
                           <a href="" class="mypanel-close tooltips" data-toggle="tooltip" title="Close mypanel"><i class="fa fa-times"></i></a>
                       </div><!-- mypanel-btns -->
                                <h3 class="mypanel-title">{$section_title|default:""}</h3>
        
                   </div>
                   <div class="mypanel-body">                            
                        <div class="row">                                        
                                 <div class="form-group">
                                     <label class="col-sm-3 control-label">{$smarty.const.company_name} <span class="asterisk">*</span></label>
                                         <div class="col-sm-9">
                                            <div class="input-group mb15">
                                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                    <input type="text" name="company_name" id="company_name" class="form-control" placeholder="Type your name..." required value="{$companydetails["result"][0]["name"]|default:""}" />
                                            </div>       
                                            </div>
                                 </div><!-- form-group -->
                            
                                         
                                 <div class="form-group">
                                     <label class="col-sm-3 control-label">{$smarty.const.company_description} <span class="asterisk">*</span></label>
                                         <div class="col-sm-9">
                                             <textarea  class="form-control" name="company_desc"  cols="45" rows="7" id="company_desc" placeholder="Type your comment..." required="">{$companydetails["result"][0]["description"]|default:""}</textarea>
                                         </div>
                                 </div><!-- form-group -->
                             
                                 
                                 <div class="form-group">
                                     <label class="col-sm-3 control-label">{$smarty.const.web_logo} <span class="asterisk">*</span></label>
                                         <div class="col-sm-9">
                                               <input type="file" name="company_logo" id="company_logo" accept="image/*"/>
                                         </div>
                                 </div><!-- form-group -->
                                 
                                    {if isset($companydetails["result"][0]["logo"])}
                                       <div class="form-group">
                                           <label class="col-sm-3 control-label"></label>
                                           <input name="logo" type="hidden" id="logo" value="{$companydetails["result"][0]["logo"]}"/>
                                           <div class="col-sm-9">
                                               File Name: {$companydetails["result"][0]["logo"]} <br/>
                                               <span style="color:#1496D9;">Required logo size[width 231px,height 57px]</span><br/>
                                               <span style="color:#1496D9;">Required logo .jpg format</span>
                                               <br/><img class="hlogo" src="{$smarty.const.PAGELOCATION}logo/{$companydetails["result"][0]["logo"]}"/>
                                           </div> 
                                       </div>
                                     {/if}
                                    
                                 <div class="form-group">
                                     <label class="col-sm-3 control-label">{$smarty.const.mobile_logo}<span class="asterisk">*</span></label>
                                         <div class="col-sm-9">
                                               <input type="file" name="mobile_logo" {if !isset($companydetails["result"][0]["logo"])}required{/if} id="mobile_logo" accept="image/*"/>
                                         </div>
                                 </div><!-- form-group -->
                                 
                         </div>       
                      </div>   
                                         
                    <div class="mypanel-footer">
                            <div class="row">
                                     <div class="col-sm-9 col-sm-offset-3">
                                         <input type="hidden" value="1" name="btn_company" >
                                         <button  type="submit" class="btn btn-primary btn-sm" name="btns_company" id="btn_company" title="{$smarty.const.save_company}">{$smarty.const.save_company}</button>
                                         <a href="{$smarty.const.PORTALLOCATION}admin/index.php"  class="btn btn-primary btn-sm" title="{$smarty.const.cancel}">{$smarty.const.cancel}</a>
                                     </div>
                            </div>
                    </div>               
           </div> 
       </form>
      </div>
             
     <div class="col-md-4">      
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="mypanel-btns">
                           <a href="" class="mypanel-minimize tooltips" data-toggle="tooltip" title="Minimize mypanel"><i class="fa fa-minus"></i></a>
                           <a href="" class="mypanel-close tooltips" data-toggle="tooltip" title="Close mypanel"><i class="fa fa-times"></i></a>
                       </div><!-- mypanel-btns -->
                                <h3 class="mypanel-title">{$smarty.const.menu_settings}</h3>
        
                   </div>
          <div class="mypanel-body"> 
            <div class="row">  
                     
                   <div class="mypanel-heading noborder">
                       <div class="pull-right">
                              <div class="setting_btn">                               
                                   <a href="javascript:void(0)" data-toggle="modal" data-target="#print_notify">
                                        <span class="fa fa-clipboard"></span>    
                                   </a>
                               </div>
                                <div class="div-status">
                                        <input id="chk-print" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/companymanagement.php?print','print');" {if $print["active"] == "1"} checked="checked" {/if}  name="chk-print" type="checkbox" value="1" />
                                        <label for="chk-print">Check-me</label>
                                </div>                   
                        </div><!-- mypanel-btns -->
                                <h5 class="mypanel-title">{$smarty.const.printing}</h5>
                   </div>
              
                   
              
                    <div class="mypanel-heading noborder">
                       <div class="pull-right">
                              <div class="setting_btn">                               
                                   <a href="javascript:void(0)" data-toggle="modal" data-target="#extshare">
                                        <span class="fa fa-clipboard"></span>    
                                   </a>
                               </div>
                                <div class="div-status">
                                        <input id="chk-extshare" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/companymanagement.php?eextshr','extshare');" {if $extshare["active"] == "1"} checked="checked" {/if}  name="chk-extshare" type="checkbox" value="1" />
                                        <label for="chk-extshare">Check-me</label>
                                </div>                  
                        </div><!-- mypanel-btns -->
                                <h5 class="mypanel-title">{$smarty.const.external_sharing}</h5>
                   </div>
             
                   <div class="mypanel-heading noborder">
                       <div class="pull-right">
                              <div class="setting_btn">                               
                                   <a href="javascript:void(0)" data-toggle="modal" data-target="#pivot_notify">
                                        <span class="fa fa-clipboard"></span>    
                                   </a>
                               </div>
                                <div class="div-status">
                                        <input id="chk-customemail" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/companymanagement.php?customupload','customupload');" {if $customupload["active"] == "1"} checked="checked" {/if}  name="chk-customupload" type="checkbox" value="1" />
                                        <label for="chk-customemail">Check-me</label>
                                </div>                 
                        </div><!-- mypanel-btns -->
                                <h5 class="mypanel-title">{$smarty.const.pivot_upload_msg}</h5>
                 </div> 
          
                   <div class="mypanel-heading noborder">
                       <div class="pull-right">
                               <div class="setting_btn">                               
                                   <a href="javascript:void(0)" data-toggle="modal" data-target="#export">
                                        <span class="fa fa-clipboard"></span>    
                                   </a>
                               </div>
                                    <div class="div-status">
                                            <input id="chk-export" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/companymanagement.php?export','export');" {if $export["active"] == "1"} checked="checked" {/if}  name="chk-export" type="checkbox" value="1" />
                                            <label for="chk-export">Check-me</label>
                                    </div>   
                                                          
                        </div><!-- mypanel-btns -->
                                <h5 class="mypanel-title">{$smarty.const.export_reports}</h5>
                   </div>
         </div>    
      </div>
      </div>            
     </div>               
     </div>               
    </div> 
   </div>
                                 
<!-- mypanel -->

 <!-- Modal -->
        <div class="modal fade" id="export" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">{$smarty.const.export_reports}</h4>
              </div>
              <div class="modal-body">
                            <div>{$smarty.const.exportmsg}</div>
                          
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{$smarty.const.cancel}</button>
                
              </div>
            </div><!-- modal-content -->
          </div><!-- modal-dialog -->
        </div><!-- modal -->
        
        
        
        
        <div class="modal fade" id="pivot_notify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">{$smarty.const.pivot_upload_msg}</h4>
              </div>
              <div class="modal-body">
                            <div>{$smarty.const.emmessage}</div>
                          
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{$smarty.const.cancel}</button>
                
              </div>
            </div><!-- modal-content -->
          </div><!-- modal-dialog -->
        </div><!-- modal -->


       <div class="modal fade" id="extshare" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">{$smarty.const.external_sharing}</h4>
              </div>
              <div class="modal-body">
                          <div>{$smarty.const.external_sharing_desc}</div>
                            <div align="center">
                              <img src="http://w.sharethis.com/images/facebook_16.png" width="25" height="20">&nbsp;
                              <img src="http://w.sharethis.com/images/googleplus_16.png" width="25" height="20">&nbsp;
                              <img src="http://w.sharethis.com/images/linkedin_16.png" width="25" height="20">&nbsp;
                              <img src="http://w.sharethis.com/images/twitter_16.png" width="25" height="20">
                            </div>
                          
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{$smarty.const.cancel}</button>
                
              </div>
            </div><!-- modal-content -->
          </div><!-- modal-dialog -->
        </div><!-- modal -->
        
        
        
        <div class="modal fade" id="print_notify" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">{$smarty.const.printing}</h4>
              </div>
              <div class="modal-body">
                            <div>{$smarty.const.print_desc}</div>
                          
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">{$smarty.const.cancel}</button>
                
              </div>
            </div><!-- modal-content -->
          </div><!-- modal-dialog -->
        </div><!-- modal -->

{/if}
   
{* casemenu 1 ends *}





<!-- LDAP view,enable credentials -->
{* displays LDAP settings page *} 
{if $casemenu eq '10'}
  
  {if $status eq '1'}        
        <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.ldap_settings_saved}</strong> 
       </div>
  {/if} 
 <div class="contentmypanel">                        
   <div class="row">
      <div class="col-md-10">
       <form method = "post" name="frmldapsettings" id="frmldapsettings" action="companymanagement.php?s=10&activeId=0">
        <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>
         <div class="mypanel mypanel-default sldap">
                   <div class="mypanel-heading">
                       <div class="pull-right">
                              <div class="msg-loading"></div>
                                <div class="div-status">
                                        <input id="chk-sldap" class="chk-status" onchange="changeStatusOnOff(this,'{$smarty.const.PORTALLOCATION}admin/companymanagement.php?edldap','sldap');" {if $ldapdata["active"] == "1"} checked="checked" {/if}  name="chk-sldap" type="checkbox" value="1" />
                                        <label for="chk-sldap">Check-me</label>
                                </div>                  
                        </div><!-- mypanel-btns -->
                       
                                <h3 class="mypanel-title">{$smarty.const.ldap_settings|default:""}</h3>
                   </div>
                   <div class="mypanel-body">                            
                        <div class="row">        
                            
                                    <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>
                                    <input name="cred_key" id="cred_key" type="hidden" value="{$ldapdata["cred_key"]|default:'0'}"/>
                     
                                 <div class="form-group">
                                     <label class="col-sm-3 control-label">{$smarty.const.url}</label>
                                         <div class="col-sm-9">
                                            <div class="input-group mb15">
                                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                    <input name="ldap_url" id="ldap_url" type="text" value="{$ldapdata["miscdata"]["ldap_url"]|default:''}" class="form-control" required />
                                            </div>       
                                            </div>
                                 </div><!-- form-group -->
                                 
                                 
                                 <div class="form-group">
                                    <label class="col-sm-3 control-label">{$smarty.const.ldap_dom_comp}</label>
                                    <div class="col-sm-9">
                                      <div class="input-group mb15">  
                                            <span class="input-group-addon"><i class="fa fa-home"></i></span> 
                                            <input {$disabled_status|default:""} class="form-control" name="ldap_dom_comp" id="ldap_dom_comp" type="text" value="{$ldapdata["miscdata"]["ldap_dom_comp"]|default:''}"/>
                                      </div>
                                    </div> 
                                </div> 
                                  
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">{$smarty.const.ldap_auth_type}</label>
                                    <div class="col-sm-9">
                                        <select id="select-search-hide" data-placeholder="Choose One" class="width300">
                                               <option value="1" {if $ldapdata["miscdata"]["ldap_auth_type"] == "1"}selected="selected"{/if}>simple</option>
                                        </select>
                                      </div>
                                    </div> 
                                    
                                      
                               <div class="form-group">
                                    <label class="col-sm-3 control-label">{$smarty.const.ldap_auth_attr}</label>
                                    <div class="col-sm-9">
                                      <div class="input-group mb15">  
                                            <span class="input-group-addon"><i class="fa fa-home"></i></span> 
                                            <input {$disabled_status|default:""} class="form-control" name="ldap_auth_attr" id="ldap_auth_attr" type="text" value="{$ldapdata["miscdata"]["ldap_auth_attr"]|default:''}"/>
                                      </div>
                                    </div> 
                                </div>
                                      
                         </div>
                   </div>
                                      
                        <div class="alert alert-success" style="display:none;" id="ldap_success">
                            <strong>{$smarty.const.test_ok}</strong> 
                        </div>
                        
                       <div class="alert alert-danger" style="display:none;" id="ldap_failure">
                            <strong>{$smarty.const.test_not_ok}</strong> 
                       </div>
                               
                       
                       <div class="mypanel-footer">
                                            <div class="row">
                                              <div class="col-sm-9 col-sm-offset-3">
                                                  <button  type="submit" class="btn btn-primary btn-sm" {$disabled_status|default:""} type="submit" name="btn_subldap" id="btn_subldap" title="{$smarty.const.save_company}">{$smarty.const.save_company}</button>
                                                  <button type="button" class="btn btn-primary btn-sm" name="test_ldap" id="test_ldap" title="{$smarty.const.test_ldap}" >{$smarty.const.test_ldap}</button>
                                                  <a href="{$smarty.const.PORTALLOCATION}admin/index.php"  class="btn btn-primary btn-sm" title="{$smarty.const.cancel}">{$smarty.const.cancel}</a>
                                                   <span class="loading" id="tl_loading" style="float:left;display:none;margin:5px;"></span>                             
                                              </div>
                                            </div>
                     </div>
          </div>                              
       </form>
      </div>
   </div>
 </div>                                            
    
                                      
 {literal}
  <script type="text/javascript">
               
                //Check Enable/Disable 
                function changeStatusOnOff(chk,url,div){
                    chkid = chk.id;
                        var divloader = $("#"+chkid).parent().siblings(".msg-loading");
                        var checked = "0"; 
                        $("."+div+" .form-control").prop("disabled",true);
                        $("."+div+" .btn-sm").prop("disabled",true);
                        
                        if($("#"+chkid).prop("checked")){
                            $("."+div+" .form-control").removeAttr("disabled");  
                            $("."+div+" .btn-sm").removeAttr("disabled");
                            checked = "1";    
                        }
                        divloader.removeClass("nobg");    
                        divloader.html(""); 
                        divloader.show();    
                        $.get(url+"&ra="+checked,function(data){                      
                         divloader.addClass("nobg");
                          if(data == "1"){
                           divloader.html("Success!");    
                         }else{
                             divloader.html("Failed!");
                         }
                          divloader.delay(1000).fadeOut("slow");      
                        });
                }
             
    //Enable ldap ON/OFF
                        $("#test_ldap").click(function(){
                            var form = $("#frmldapsettings").serialize();
                             $.get(portalLocation+"admin/companymanagement.php?chk_ldap&"+form,function(data){                         
                             if(data == "1"){
                                     $("#ldap_success").show();
                                     $("#ldap_success").fadeOut(5000);
                                   
                             }else{
                                    $("#ldap_failure").show(); 
                                    $("#ldap_failure").fadeOut(5000); 
                             }    
                            });    
                        });  
        
          </script>                            
{/literal}                                
{/if}


{* casemenu 3 starts *}

 <!-- Email credential saved massage --> 
 
{if $casemenu eq '3'}
   {if $status eq '3'} 
       <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.company_email_saved}</strong> 
       </div>
    {/if} 
    
    {if isset($delStatus)} 
       <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$delStatus}</strong> 
       </div>
    {/if} 
    
    
 <div class="contentmypanel">                        
   <div class="row">
      <div class="col-md-10">
       <form  method = "post" name="frmsmtpsettings" id="frmsmtpsettings" action="companymanagement.php?s=3&activeId=0">
            <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>
            <input name="cred_key" id="cred_key" type="hidden" value="{$emaildata["cred_key"]|default:'0'}"/>
                   <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="pull-right">
                              <div class="msg-loading"></div>
                                <div class="div-status">
                                  <input id="chk-semail" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/companymanagement.php?edm','ssmtp');" {if $emaildata["active"] == "1"} checked="checked" {/if}  name="chk-semail" type="checkbox" value="1" />
                                   <label for="chk-semail">Check-me</label>
                                </div>                  
                        </div><!-- mypanel-btns -->
                       
                         <h3 class="mypanel-title">{$smarty.const.smtp_settings|default:""}</h3>
                   </div>
                   <div class="mypanel-body">                            
                        <div class="row">   
                            <div class="form-group">
                                     <label class="col-sm-3 control-label">{$smarty.const.smtp_server}</label>
                                         <div class="col-sm-9">
                                            <div class="input-group mb15">
                                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                    <input name="smtp_servername" id="smtp_servername" type="text" required value="{$emaildata["miscdata"]["smtp_servername"]|default:''}" class="form-control"/>
                                            </div>       
                                            </div>
                            </div><!-- form-group -->
                            <div class="form-group">
                                     <label class="col-sm-3 control-label">{$smarty.const.smtp_port}</label>
                                         <div class="col-sm-9">
                                            <div class="input-group mb15">
                                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                    <input name="smtp_portno" id="smtp_portno" type="text" value="{if isset($emaildata["miscdata"]["smtp_portno"]) && $emaildata["miscdata"]["smtp_portno"] > 0}{$emaildata["miscdata"]["smtp_portno"]}{/if}" class="form-control"/>
                                            </div>       
                                            </div>
                            </div><!-- form-group -->
                            <div class="form-group">
                                     <label class="col-sm-3 control-label">{$smarty.const.user_name}</label>
                                         <div class="col-sm-9">
                                            <div class="input-group mb15">
                                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                    <input name="{$key}_username" id="{$key}_username" type="text" required value="{$emaildata["username"]|default:''}" class="form-control"/>
                                            </div>       
                                            </div>
                            </div><!-- form-group -->
                            <div class="form-group">
                                     <label class="col-sm-3 control-label">{$smarty.const.password}</label>
                                         <div class="col-sm-9">
                                            <div class="input-group mb15">
                                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                    <input name="{$key}_password" id="{$key}_password" type="password" {if !isset($emaildata["password"])}required{/if} value="{$emaildata["decrypt_password"]|default:''}" class="form-control"/>
                                            </div>       
                                            </div>
                            </div><!-- form-group -->
                        </div>        
                   </div>
                   <div class="mypanel-footer">
                          <div class="row">
                             <div class="col-sm-9 col-sm-offset-3">
                                 <button  type="submit" class="btn btn-primary btn-sm" name="btn_subsmpt" id="btn_subsmpt" title="{$smarty.const.save_company}">{$smarty.const.save_company}</button>
                                    <a href="{$smarty.const.PORTALLOCATION}admin/index.php"  class="btn btn-primary btn-sm" title="{$smarty.const.cancel}">{$smarty.const.cancel}</a>
                              </div>
                           </div>
                   </div>
          </div>
       </form>
      </div>
    </div>  
 </div>                   
    

<div class="contentmypanel">                        
   <div class="row">
      <div class="col-md-10">
            <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="pull-right">
                              <div class="msg-loading"></div>
                                <div class="div-status">
                                  <input id="chk-ruleset" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/companymanagement.php?rule_set','ruleengine');" {if $ruleSetting["active"] == "1"} checked="checked" {/if}  name="chk-ruleset" type="checkbox" value="1" />
                                  <label for="chk-ruleset">Check-me</label>
                                </div>                  
                        </div><!-- mypanel-btns -->
                       
                         <h3 class="mypanel-title">{$smarty.const.rule_engine_setting|default:""}</h3>
                   </div>
                   <div class="mypanel-body">                            
                        <div class="row">   
                              <div>{$smarty.const.rule_engine_email}</div>
                        </div>
                   </div>
               </div>
      </div>
   </div>
</div>
                        
<div class="contentmypanel">                        
 <div class="row">
     <div class="col-md-10">
         <div class="table-responsive">
             <h5 class="lg-title mb5">{$smarty.const.user_email_log}</h5>
                                  <table class="table table-primary mb30">
                                            <thead>
                                              <tr>
                                                <th>{$smarty.const.user_name}</th>
                                                <th>{$smarty.const.to_email}</th>
                                                <th>{$smarty.const.last_login}</th>
                                                <th>{$smarty.const.mail_count}</th>
                                                <th>{$smarty.const.action}</th>        
                                              </tr>
                                            </thead>
                                 
                                            {foreach from=$usermail["result"] name="varuserlist" key=key_ul item=item_ul}
                                             {if $item_ul["mail_count"] > 0}
                                             {assign var="msg" value="Are you Sure Delete this Logs For \'"|cat:$item_ul["username"]|cat:"\' "}
                                             <tr>
                                                 {assign var="title" value=$smarty.const.name|cat:":&nbsp;"|cat:$item_ul["first_name"]|cat:"&nbsp;"|cat:$item_ul["last_name"]|cat:"\n"}
                                                 {assign var="title" value=$title|cat:$smarty.const.email|cat:":&nbsp;"|cat:$item_ul["email"]}
                                              <td><label title="{$title}">{$item_ul["username"]}</label></td>
                                              <td>{$item_ul["email"]|lower}</td>
                                              <td>{$item_ul["last_login"]}</td>
                                              <td>
                                                   <a href="javascript:void(0)" title="{$item_ul["mail_count"]}&nbsp;{$smarty.const.cron_logs}" class="easyui-linkbutton" onclick="callPopup('companymanagement.php?uml&u={$item_ul["id"]}&pop=1&s=5','Cron Logs')">{$item_ul["mail_count"]}</a>
                                              </td>
                                              <td>
                                                   <a class="emaildel_href"  title="{$smarty.const.delete_section}" href="companymanagement.php?dl&s=3&activeId=0" onclick="return confirmDelete('{$msg}','{$item_ul["id"]}');"><i class="glyphicon glyphicon-trash"></i></a>
                                              </td>
                                              </tr>
                                              {/if}
                                         {/foreach}   
                                    </table>
              </div><!-- table-responsive -->
        </div>
 </div>                   
</div>
                        

{/if}
{* casemenu 3 ends *}


{if $casemenu eq '5'}   
    <h5 class="lg-title mb5">{$smarty.const.email_log} {$smarty.const.text_for} "{$usermail["result"][0]["username"]}" </h5>
     {if $usermail["result"]|@count > 0}
                <table  class="table table-bordered mb30" cellpadding="2">
                        <thead> 
                                    <tr>
                                        <th align="center">{$smarty.const.user_name}</th>
                                        <th align="center">{$smarty.const.menu_name}</th>
                                        <th align="center">{$smarty.const.template_name}</th>
                                        <th align="center">{$smarty.const.procedure_name}</th>
                                        <th align="center">{$smarty.const.log_time}</th>   

                                    </tr>
                        </thead>
                            {foreach from=$usermail["result"] name="varuserlist" key=key_ul item=item_ul}
                                <tbody
                                        <tr>
                                            <td align="center">{$item_ul["username"]}</td>
                                            <td align="center">{$item_ul["report_name"]}</td>
                                            <td align="center">{$item_ul["template_name"]}</td>
                                            <td align="center">{$item_ul["procedure_name"]}</td>
                                            <td align="center">{$item_ul["log_time"]}</td>
                                        <tr>
                                </tbody>    
                            {/foreach}
                </table>
                {else}
                   <div class="msg">{$smarty.const.no_users_for_company|replace:"#":$adduserlink}</div>
                {/if}
     
{/if}
{*$casemenu 5 ends *}




<!-- Settings -->
 {* displays the Cron Settings Page - casemenu4 *}
 {if $casemenu eq '4'}   
             
{if !isset($cronlogFileContent)} 
    {if $status eq '4'}
        <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.company_cron_saved}</strong> 
        </div>
    {/if}
    {if $status eq '5'}
        <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.file_uploaded}</strong> 
        </div>
    {/if}
    {if $status eq '6'}
        <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.cron_save_fileInformation}</strong> 
        </div>
    {/if}
    
    {if $estatus eq '1'}
        <div class="alert alert-danger">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.upload_excel_file}</strong> 
       </div>
    {/if}
    {if $estatus eq '2'}      
        <div class="alert alert-danger">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.file_not_uploaded}</strong> 
       </div>
    {/if}
    {if $estatus eq '3'}        
        <div class="alert alert-danger">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$smarty.const.weblog_file_exist}</strong> 
       </div>
    {/if}
    {if isset($cron_msg)}        
        <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$cron_msg}</strong> 
        </div>
    {/if}
    {if isset($destPathMsg)}        
        <div class="alert alert-danger">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$destPathMsg}</strong> 
       </div>
    {/if}  
    
<div class="contentpanel">                        
   <div class="row">
      <div class="col-md-11">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="pull-right">
                           <div class="msg-loading"></div>
                            <div class="div-status">
                                    <input id="chk-scron" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/companymanagement.php?edcron','scron');" class="chk-crstatus" {if $crondata["active"] == "1"} checked="checked" {/if}  name="chk-scron" type="checkbox" value="1" />
                                    <label for="chk-scron">Check-me</label>
                            </div>
                       </div>
                                <h3 class="mypanel-title">{$smarty.const.cron_settings|default:""}</h3>
                        </div>                <!-- mypanel-btns -->
                     <div class="mypanel-body">                            
                        <div class="row"> 
                            
                            <ul class="nav nav-tabs">
                                    <li class="active"><a href="#single_file_log" data-toggle="tab">{$smarty.const.single_file_log}</a></li>
                                    <li><a href="#multi_file_log" data-toggle="tab">{$smarty.const.multi_file_log}</a></li>
                                    <li><a href="#web_log" data-toggle="tab">{$smarty.const.multi_log}</a></li>
                            </ul>
        
                                <!-- Tab panes -->
                                <div class="tab-content mb30">
                                    <div class="tab-pane active" id="single_file_log">
                                     {if isset($singleparser)}
                                        <table class="table table-bordered mb30">
                                          <thead>
                                            <tr>
                                              <th>{$smarty.const.file_name}</th>
                                              <th>{$smarty.const.cron_parser_name}</th>
                                              <th>{$smarty.const.left_time}</th>
                                              <th>{$smarty.const.runs}</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <tr>
                                              <td>{$lefttime['file_name']}</td>
                                              <td>{$singleparser}</td>
                                                {if isset($lefttime)}  
                                                    <td>{$lefttime['sync_time']}</td>
                                                {else}  
                                                    <td>{$failmsg}</td>
                                                {/if}  
                                                <td>Every 6 hours</td>   
                                            </tr>
                                          </tbody>
                                        </table>
                                      {else}
                                            <div class="alert alert-danger">
                                                     <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                         <strong>{$cronfilenotfound}</strong> 
                                            </div>
                                      {/if}
                                    </div><!-- tab-pane -->
                                  
                                    <div class="tab-pane" id="multi_file_log">
                                            {if isset($multiparser)}
                                                    <table class="table table-bordered mb30">
                                                      <thead>
                                                        <tr>
                                                          <th>{$smarty.const.file_name}</th>
                                                          <th>{$smarty.const.cron_parser_name}</th>
                                                          <th>{$smarty.const.left_time}</th>
                                                          <th>{$smarty.const.runs}</th>
                                                        </tr>
                                                      </thead>
                                                      <tbody>
                                                        <tr>
                                                          <td>{$smarty.const.multi_file}</td>
                                                          <td>{$multiparser}</td>
                                                            {if isset($cronRunTime)}  
                                                                <td>{$cronRunTime['cron_runtime']}</td>
                                                            {else}  
                                                                <td>{$failmsg}</td>
                                                            {/if}  
                                                            <td>Every 6 hours</td>   
                                                        </tr>
                                                      </tbody>
                                                    </table>
                                            {else}
                                                    <div class="alert alert-danger">
                                                             <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                                 <strong>{$errormultipart}</strong> 
                                                    </div>
                                            {/if}
                                    </div><!-- tab-pane -->
                                  
                                    <div class="tab-pane" id="web_log">
                                        {if isset($weblog_parser)}
                                                    <table class="table table-bordered mb30">
                                                      <thead>
                                                        <tr>
                                                          <th>{$smarty.const.file_name}</th>
                                                          <th>{$smarty.const.cron_parser_name}</th>
                                                          <th>{$smarty.const.left_time}</th>
                                                          <th>{$smarty.const.runs}</th>
                                                        </tr>
                                                      </thead>
                                                      <tbody>
                                                        <tr>
                                                          <td>{$weblogCronTime['source_filename']}</td>
                                                          <td>{$weblog_parser}</td>
                                                            {if isset($weblogCronTime)}  
                                                                <td>{$weblogCronTime['cron_runtime']}</td>
                                                            {else}  
                                                                <td>{$failmsg2}</td>
                                                            {/if}  
                                                            <td>Every 6 hours</td>   
                                                        </tr>
                                                      </tbody>
                                                    </table>
                                            {else}
                                                    <div class="alert alert-danger">
                                                             <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                                                 <strong>{$errormultipart}</strong> 
                                                    </div>
                                            {/if}
                                    </div><!-- tab-pane -->
                                 </div><!-- tab-content -->
                            </div><!-- col-md-6 -->
                          
                        </div>
                   </div>
         </div>
      </div>
   </div>
         <div class="col-md-11">                           
                    <ul class="nav nav-tabs">
                           <li class="active"><a href="#single_file_upload" data-toggle="tab">{$smarty.const.file_import_single}</a></li>
                           <li><a href="#multi_file_upload" data-toggle="tab">{$smarty.const.file_import_multi}</a></li>
                           <li><a href="#db_import" data-toggle="tab">{$smarty.const.db_import}</a></li>
                           <li><a href="#weblog_import" data-toggle="tab">{$smarty.const.web_log_import}</a></li>
                    </ul>
                    <div class="tab-content mb30">
                                <div class="tab-pane active" id="single_file_upload">   
                                       <form method = "post" name="frmcronupload" id="frmcronupload" enctype="multipart/form-data" action="companymanagement.php?s=4&activeId=0">
                                           <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>
                                                 <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.upload_excel}</label>
                                                           <div class="col-sm-9">
                                                                 <input type="file" name="cron_upload[]" id="cron_upload_1"/>
                                                                {* <a class="asamplecsv" id="cron_an_1" href="{$smarty.const.PAGELOCATION}{$smarty.const.DIRNAME_PUBLIC}automation_csv/sample_{$companytables[0][0]}.xls">sample_{$companytables[0][0]}.xls</a>*} 
                                                           </div>
                                                   </div><!-- form-group -->
                                                 <div class="form-group">
                                                   <label class="col-sm-3 control-label">{$smarty.const.table_name}</label>
                                                   <div class="col-sm-9">
                                                         {if isset($companytables)}
                                                                <select id="select-search-hide" data-placeholder="Choose One" class="width300" name="cron_tablename[]"  onchange="crstatus(this)">
                                                                   {foreach from=$companytables name="ctn" key=key_ctn item=item_ctn}
                                                                       <option value="{$item_ctn[0]|lower}">{$item_ctn[0]}</option>
                                                                    {/foreach}
                                                                 </select>
                                                         {/if}      
                                                     </div>
                                                  </div> 
                                               <div class="row">
                                                 <div class="col-sm-9 col-sm-offset-3">                                         
                                                               <button  {$disabled_status|default:""} type="submit" class="btn btn-primary btn-sm" name="btn_upcron" id="btn_upcron" title="{$smarty.const.save_company}">{$smarty.const.save_company}</button>
                                                               <a href="{$smarty.const.PORTALLOCATION}admin/index.php"  class="btn btn-primary btn-sm" title="{$smarty.const.cancel}">{$smarty.const.cancel}</a>
                                                 </div>
                                               </div>          
                                   </form> 
 <!-- Atomation upload file log table --> 
                         <br/>
 <h5>Automation Log</h5>
                                  <table class="table table-bordered mb30">
                                        <thead>
                                             <tr>
                                                <th>{$smarty.const.file_name}</th>
                                                <th>{$smarty.const.table_name}</th>
                                                <th>{$smarty.const.uploaded_time}</th>
                                                <th>{$smarty.const.parsedtime}</th>
                                                <th>{$smarty.const.status}</th>
                                                <th>{$smarty.const.action}</th>
                                              </tr>
                                         </thead>
                                         <tbody>
                                            {foreach from=$cronlog["result"] name="varuserlist" key=key_ul item=item_ul}
                                            {assign var="msg" value="Are you Sure Delete this Log \'"|cat:$item_ul["file_name"]|cat:"\' "}    
                                              <tr>                                            
                                               <td>{$item_ul["file_name"]}</td>
                                               <td>{$item_ul["tablename"]}</td>
                                               <td>{$item_ul["upload_time"]|date_format:"%d-%b-%Y %I:%M %p"}</td>
                                               <td>{$item_ul["sync_end_time"]|date_format:"%d-%b-%Y %I:%M %p"}</td>
                                                {assign var="crst" value="crst_"|cat:$item_ul["status"]}
                                                <td> <label class="{$cronlabel[$item_ul["status"]]|lower}" title="{if $item_ul["status"] == "4"}Error : {$item_ul["error_info"]}{else}{$cronlabel[$item_ul["status"]]}{/if}">{$cronlabel[$item_ul["status"]]|lower|capitalize}</label> </td>
                                                <td><a  class="automation_log" title="{$smarty.const.delete_section}" href="companymanagement.php?dcr&s=4&activeId=0" onclick="return deleteAutomationLog('{$msg}',{$item_ul["id"]});"><span class="glyphicon glyphicon-trash"></span></a></td>   
                                             </tr>    
                                            {/foreach}   
                                            
                                        </tbody>
                                    </table>
                                </div>              
                                  
                                <div class="tab-pane" id="multi_file_upload">
                                    <form method = "post" name="frmcronsettings" id="frmcronsettings" enctype="multipart/form-data" action="companymanagement.php?s=4&activeId=0">   
                                       <div class="row">
                                           <div class="inline_radio_btn">  
                                                      <input type="radio" name="server_info_type" class="server_info" value="server_info1" id="server_info1" checked>
                                           </div>
                                           <div class="inline_radio_btn"> <strong>Server1</strong></div>
                                            <div class="inline_radio_btn">  
                                                           &nbsp; &nbsp;<input type="radio" name="server_info_type" class="server_info" value="server_info2" id="server_info2">
                                            </div>
                                            <div class="inline_radio_btn"><strong>Server2</strong></div>
                                                            
                                        </div>        
                                         <br/>           
                                       <div id="remote_serverInfo1" >
                                                <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.crawler_type}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                                <div class="inline_radio_btn">  
                                                                            <input type="radio" name="crawler_type" onclick="changeLoginType(this.value)" value="SSH - PASSWORD" {if $cronMultifile_serverInfo['crawler_type'] eq 'SSH - PASSWORD'} checked {/if}>
                                                                    </div>
                                                                    <div class="inline_radio_btn"> &nbsp;SSH - PASSWORD</div>
                                                                    <div class="inline_radio_btn">
                                                                           &nbsp; &nbsp; <input type="radio" name="crawler_type" onclick="changeLoginType(this.value)" value="SSH - KEY" {if $cronMultifile_serverInfo['crawler_type'] eq 'SSH - KEY'} checked {/if}>
                                                                    </div>
                                                                    <div class="inline_radio_btn"> &nbsp;SSH - KEY</div>
                                                                   <div class="inline_radio_btn">
                                                                        &nbsp; &nbsp; <input type="radio" name="crawler_type" onclick="changeLoginType(this.value)" value="FTP" {if $cronMultifile_serverInfo['crawler_type'] eq 'FTP'} checked {/if}>
                                                                   </div>
                                                                   <div class="inline_radio_btn"> &nbsp;FTP</div>
                                                          </div>      
                                                       </div>
                                                 </div>
                                                                   
                                                 <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.host}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                 <input  name="cron_servername1" id="cron_servername1" type="text" required value="{$cronMultifile_serverInfo['host1']}" class="form-control"/>
                                                            </div>      
                                                       </div>
                                                 </div>                    
                                                                   
                                                 <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.cron_username}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                 <input  name="server_username1" id="server_username1" type="text" required value="{$cronMultifile_serverInfo['username1']}" class="form-control"/>
                                                            </div>      
                                                       </div>
                                                 </div>
                                                            
                                                <div class="form-group">
                                                       <label class="col-sm-3 control-label cron_server_password">{if $cronMultifile_serverInfo['crawler_type'] eq 'SSH - KEY'} {$smarty.const.cron_keyfile} {else} {$smarty.const.cron_password} {/if}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                 <input {$disabled_status|default:""} class="form-control" name="server_password1" id="server_password1" {if $cronMultifile_serverInfo['crawler_type'] eq 'SSH - KEY'} type="text" {else} type = "password" {/if} required value="{$cronMultifile_serverInfo['server_password1']}"/>
                                                          </div>      
                                                       </div>
                                                 </div>            
                                                 
                                               <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.cron_server_port}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                 <input {$disabled_status|default:""} class="form-control" name="server_port1" id="server_port1" type="text" required value="{$cronMultifile_serverInfo['port1']}"/>
                                                          </div>      
                                                       </div>
                                                 </div>           
                                                  
                                              <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.cron_server_sorceFilePath}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                <input {$disabled_status|default:""} class="form-control" name="serverFilePath1" id="serverFilePath1" type="text" required value="{$cronMultifile_serverInfo['source_path1']}"/>
                                                          </div>      
                                                       </div>
                                              </div> 
                                                                      
                                        </div>               
                                              
                                        <div id="remote_serverInfo2" style="display:none;">

                                                <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.crawler_type}</label>
                                                        <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                                <div class="inline_radio_btn">  
                                                                            <input type="radio" name="crawler_type1" value="SSH - PASSWORD" onclick="changeLoginServer2(this.value)"  {if $cronMultifile_serverInfo['crawler_type1'] eq 'SSH - PASSWORD'} checked {/if}>
                                                                 </div>
                                                                 <div class="inline_radio_btn">SSH - PASSWORD</div>
                                                                 
                                                                 <div class="inline_radio_btn">  
                                                                         &nbsp; <input type="radio" name="crawler_type1" value="SSH - KEY"  onclick="changeLoginServer2(this.value)" {if $cronMultifile_serverInfo['crawler_type1'] eq 'SSH - KEY'} checked {/if}>
                                                                 </div>
                                                                 <div class="inline_radio_btn">SSH - KEY</div>

                                                                 <div class="inline_radio_btn">  
                                                                           &nbsp; <input type="radio" name="crawler_type1" value="FTP"  onclick="changeLoginServer2(this.value)" {if $cronMultifile_serverInfo['crawler_type1'] eq 'FTP'} checked {/if}>
                                                                 </div>
                                                                 <div class="inline_radio_btn">FTP</div>
                                                                
                                                            </div>      
                                                        </div>      
                                                 </div>            
                                                 <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.host}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                 <input {$disabled_status|default:""} class="form-control" name="cron_servername2" id="cron_servername2" type="text"  value="{$cronMultifile_serverInfo['host2']}"/>
                                                          </div>      
                                                       </div>
                                                 </div>                    
                                                                   
                                                 <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.cron_username}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                <input {$disabled_status|default:""} class="form-control" name="server_username2" id="server_username2" type="text"  value="{$cronMultifile_serverInfo['username2']}"/>
                                                            </div>      
                                                       </div>
                                                 </div>
                                                            
                                                <div class="form-group">
                                                       <label class="col-sm-3 control-label cron_server_password1">{if $cronMultifile_serverInfo['crawler_type1'] eq 'SSH - KEY'} {$smarty.const.cron_keyfile} {else} {$smarty.const.cron_password} {/if}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                 <input {$disabled_status|default:""} class="form-control" name="server_password2" id="server_password2" {if $cronMultifile_serverInfo['crawler_type1'] eq 'SSH - KEY'} type="text" {else} type = "password" {/if}  value="{$cronMultifile_serverInfo['server_password2']}"/>
                                                          </div>      
                                                       </div>
                                                 </div>            
                                                 
                                               <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.cron_server_port}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                <input {$disabled_status|default:""} class="form-control" name="server_port2" id="server_port2" type="text"  value="{$cronMultifile_serverInfo['port2']}"/>
                                                          </div>      
                                                       </div>
                                                 </div>           
                                                  
                                              <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.cron_server_sorceFilePath}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                <input {$disabled_status|default:""} class="form-control" name="serverFilePath2" id="serverFilePath2" type="text"  value="{$cronMultifile_serverInfo['source_path2']}"/>
                                                          </div>      
                                                       </div>
                                              </div>

                                        </div>  
                                                          
                                                          
                                          <div class="form-group">
                                                       <label class="col-sm-3 control-label">{$smarty.const.cron_destinationFilePath}</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                              <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                                                <input {$disabled_status|default:""} class="form-control" name="destinationFilePath" id="destinationFilePath" type="text" required value="{$cronMultifile_serverInfo['destination_path']}"/>
                                                          </div>      
                                                       </div>
                                         </div> 
                                                                                 
                                     
                                     <div class="row">
                                                 <div class="col-sm-9 col-sm-offset-3">                                         
                                                               <button  {$disabled_status|default:""} type="submit" class="btn btn-primary btn-sm" name="btn_MultifileCron" id="btn_MultifileCron" title="{$smarty.const.save_company}">{$smarty.const.save_company}</button>
                                                               <a href="{$smarty.const.PORTALLOCATION}admin/index.php"  class="btn btn-primary btn-sm" title="{$smarty.const.cancel}">{$smarty.const.cancel}</a>
                                                 </div>
                                    </div>
                                 </form> 
                                <br/>                 
                                    {if $multiFileCronStatus}                  
                                                      <table  class="table table-bordered mb30">
                                                          <thead>                                        
                                                                <tr>
                                                                    <th>{$smarty.const.cron_file_location}</th>
                                                                    <th>{$smarty.const.left_time}</th>
                                                                    <th>{$smarty.const.status}</th>   
                                                                    <th colspan="2">{$smarty.const.action}</th>   
                                                                </tr>
                                                          </thead>     
                                                         {foreach $multiFileCronStatus as $key=>$cron_values}
                                                            <tbody   
                                                              <tr>
                                                                   <td>{$cron_values['file_locations']}</td>                                                                                                           
                                                                   <td>{$cron_values['last_run_time']}</td>
                                                                   <td><label class="{$cron_values['status']}"><a href="javascript:void(0)" class="easyui-linkbutton {$cron_values['status']}" onclick="callPopup('companymanagement.php?s=4&viewcronlog_id={$cron_values['id']}&pop=1','Cron Logs')"> {$cron_values['status']} </a></label></td>                                                      
                                                                   <td> 
                                                                      {if $cron_values['status'] eq 'Success' || $cron_values['status'] eq 'Failed'} 
                                                                            <a href="companymanagement.php?s=4" onclick="return confirmCronRestart('{$cron_values['id']}')" id="restart_cron">
                                                                                <span class="glyphicon glyphicon-trash"> </span>
                                                                            </a>
                                                                       {else}                                                              
                                                                           -
                                                                       {/if}   
                                                                   </td>
                                                                   <td> 
                                                                       <a href="companymanagement.php?s=4" onclick="return confirmCronDelete('{$cron_values['id']}')" id="delete_cron">
                                                                           <span class="glyphicon glyphicon-trash"></span>
                                                                       </a>                        </td>
                                                               </tr>
                                                            </tbody> 
                                                          {/foreach} 
                                                       </table>   
                                                     {/if}   
                                           </div>      
                                                  
                         
                                <div class="tab-pane" id="db_import">                                    
                                    <form method = "post" name="frmcronsettings" id="frmcronsettings" enctype="multipart/form-data" action="companymanagement.php?s=4&activeId=0"> 
                                        
                                    <div class="row">
                                                        <div class="form-group">
                                                                <label class="col-sm-3 control-label" for="database_cron_host">Database Type</label>   
                                                            <div class="input-group mb15">   
                                                                    <div class="inline_radio_btn">  
                                                                        <input type="radio" name="cron_database_type" value="MySql"  checked="checked" class="cron_database_type" onblur="availableCronProcedure()">
                                                                    </div>
                                                                    <div class="inline_radio_btn">MySQL</div>

                                                                    <div class="inline_radio_btn">  
                                                                            &nbsp; <input type="radio" name="cron_database_type" value="sql" disabled class="cron_database_type" onblur="availableCronProcedure()">
                                                                    </div>
                                                                    <div class="inline_radio_btn">MsSQL</div>

                                                                    <div class="inline_radio_btn">  
                                                                              &nbsp; <input type="radio" name="cron_database_type" value="oracle" disabled class="cron_database_type" onblur="availableCronProcedure()">
                                                                    </div>
                                                                    <div class="inline_radio_btn">Oracle</div>
                                                              </div> 
                                                         </div> 
                                                         <div class="form-group">
                                                                <label class="col-sm-3 control-label">{$smarty.const.host}</label>
                                                                <div class="col-sm-9" id="dbConnectionList">
                                                                </div>
                                                        </div>   
                                                       <div id="db_ConnStrAjax"> </div>
                                                       
                                                       <div class="form-group">
                                                                 <label class="col-sm-3 control-label" for="cron_procedure_list">Select Procedure</label>
                                                                <div class="col-sm-9" id="cron_avail_procedure">
                                                                   <select name='cron_procedure_list' id='cron_procedure_list' class='width300'>
                                                                   </select>    
                                                                </div>
                                                      </div>
                                                       
                                                       <input {$disabled_status|default:""} class="input-xlarge focused"  id="selected_proc"  type="hidden"  value="{$databaseCronStatus['procedure_name']}"/>
                                                       <input {$disabled_status|default:""} class="input-xlarge focused"  id="selectDbConnId" type="hidden"  value="{$databaseCronStatus['dbImport_connId']}"/>
                                                                
                                         </div> 
                                                       
                                           <div class="row">
                                                 <div class="col-sm-9 col-sm-offset-3">                                         
                                                               <button  {$disabled_status|default:""} type="submit" class="btn btn-primary btn-sm" name="btn_DatabaseCron" id="btn_DatabaseCron" title="{$smarty.const.save_company}">{$smarty.const.save_company}</button>
                                                               <a href="{$smarty.const.PORTALLOCATION}admin/index.php"  class="btn btn-primary btn-sm" title="{$smarty.const.cancel}">{$smarty.const.cancel}</a>
                                                 </div>
                                           </div>            
                                                       
                                                       
                                        </form>
                                    </div>
                                
                                <div class="tab-pane" id="weblog_import">
                                    <form action="" method="POST" enctype="multipart/form-data" name="webLogForm" onsubmit="return isValidateWebLogForm();"> 
                                               <div class="row">      
                                                    <div class="form-group">
                                                       <label class="col-sm-3 control-label">Server Type</label>
                                                      <div class="col-sm-9">
                                                          <div class="input-group mb15">
                                                                   <div class="inline_radio_btn">  
                                                                           <input type = "radio" name = "isServer" value = "apache" checked = "checked" class ="isServer"/>   
                                                                   </div>
                                                                    <div class="inline_radio_btn"> &nbsp;Apache</div>
                                                                    <div class="inline_radio_btn">
                                                                           &nbsp; &nbsp; <input type = "radio" name = "isServer" value = "iis"  class="isServer"/>
                                                                    </div>
                                                                    <div class="inline_radio_btn"> &nbsp;IIS</div>
                                                                   
                                                          </div>      
                                                       </div>
                                                       <div class="form-group">
                                                                <label class="col-sm-3 control-label">Domain name</label>
                                                               <div class="col-sm-9">
                                                                   <div class="input-group mb15">    
                                                                       <span class="input-group-addon"><i class="fa fa-home"></i></span>  
                                                                          <input type="text" name="domain" class="form-control" id="domain" value=""  title="Note : Domain name like  http://localhost.com" />
                                                                       
                                                                   </div>
                                                               </div>
                                                       </div>
                                                       
                                                       <div class="form-group">
                                                                <label class="col-sm-3 control-label">Log directory path</label>
                                                               <div class="col-sm-9">
                                                                   <div class="input-group mb15">
                                                                      <span class="input-group-addon"><i class="fa fa-home"></i></span>                                                                       
                                                                     <input type="text" class="form-control" name="logfile"  id="logfile" required />
                                                                                      
                                                                  </div>
                                                               </div>
                                                       </div> 
                                                            
                                                       
                                                       <div class="form-group">
                                                                <label class="col-sm-3 control-label"> Choose action</label>
                                                               <div class="col-sm-9">
                                                                   <div class="input-group mb15">
                                                                        <div class="inline_radio_btn">  
                                                                               <input type = "radio" name = "isAction" value = "truncate" checked = "checked"/>   
                                                                        </div>
                                                                         <div class="inline_radio_btn"> &nbsp;{$smarty.const.weblog_truncate}</div>
                                                                         <div class="inline_radio_btn">
                                                                                &nbsp; &nbsp; <input type = "radio" name = "isAction" value = "append"  />
                                                                         </div>
                                                                         <div class="inline_radio_btn"> &nbsp;{$smarty.const.weblog_append}</label>
                                                                         </div>   
                                                                   </div>
                                                               </div>
                                                       </div>
                                                       
                                                            <div class="form-group">
                                                                <label class="col-sm-3 control-label"> {$smarty.const.weblog_table}</label>
                                                               <div class="col-sm-9">
                                                                   <div class="input-group mb15">
                                                                        <span id="weblog_table"> </span>    
                                                                   </div>
                                                               </div>
                                                            </div>
                                                                     
                                                    </div> 
                                                 </div>        
                                                 <div class="row"> 
                                                    <div class="col-sm-9 col-sm-offset-3"> 
                                                           <button type="submit" name="btn_weblog" id="btn_weblog" class="btn btn-primary btn-sm" title="Run" >{$smarty.const.submit}</button>
                                                    </div>
                                                 </div>        
                                    </form>
                                                    
                                    <h5>Logs</h5>
                                                <table  class="table table-bordered mb30">
                                                    <thead
                                                            <tr>                                                        <th>{$smarty.const.file_name}</a></th>
                                                                 <th align="center">{$smarty.const.server_type}</a></th>
                                                                <th align="center">{$smarty.const.uploaded_time}</th>   
                                                                <th align="center">{$smarty.const.parsedtime}</th>
                                                                 <th align="center">{$smarty.const.status}</th>
                                                                <th align="center">{$smarty.const.action}</th>
                                                             </tr>
                                                    </thead>        
                                                    <tbody>
                                                    {foreach from=$weblog["result"] name="varuserlist" key=key_ul item=item_ul}

                                                        {assign var="msg" value="Are you Sure Delete this Log \'"|cat:$item_ul["file_name"]|cat:"\' "}
                                                        <tr>                                                            
                                                        <td align="center">{$item_ul["file_name"]}</td>
                                                         <td align="center">{$item_ul["server_type"]}</a></td>
                                                         <td align="center">{$item_ul["uploaded_on"]|date_format:"%d-%b-%Y %I:%M %p"}</td>
                                                         <td align="center">{$item_ul["parsed_time"]|date_format:"%d-%b-%Y %I:%M %p"}</td>
                                                         {assign var="crst" value="crst_"|cat:$item_ul["status"]}
                                                         <td align="center">
                                                             <label class="{$cronlabel[$item_ul["status"]]|lower}" title="{if $item_ul["status"] == "4"}Error : {$item_ul["error_info"]}{else}{$cronlabel[$item_ul["status"]]}{/if}">{$cronlabel[$item_ul["status"]]|lower|capitalize}</label></td>

                                                         <td>
                                                             {if $item_ul["status"] eq '3'}
                                                                 <a class="weblog_log" style="margin-left:5px;" title="{$smarty.const.delete_section}" href="companymanagement.php?dweb&s=4&activeId=0" onclick="return deleteWeblog('{$msg}',{$item_ul["file_id"]});"><span class="glyphicon glyphicon-trash"></span></a>
                                                             {/if}
                                                         </td>
                                                         </tr>
                                                    {/foreach}
                                                    </tbody> 
                                                </table>
                                </div>
                             </div>   
         </div>                         
   
 
                                                    
 {literal}
     <script type="text/javascript">
         
         function crstatus(item)
                {
                      var selitem = $(item).prop("id");               
                      selitem = selitem.split("_");
                      var anch = $("#cron_an_1");
                      var href = PageLocation+"public_v1.0/automation_csv/sample_"+$(item).val()+".xls";
                      anch.html("sample_"+$(item).val()+".xls");
                      anch.prop("href",href);
               }          
                $(".server_info").click(function()
                {
                    
                    if($(this).attr("id") == "server_info2")
                           {                    
                                   $("#remote_serverInfo1").hide();
                                   $("#remote_serverInfo2").show();    
                           }
                           else if($(this).attr("id") == "server_info1")
                            {
                                   $("#remote_serverInfo1").show();
                                   $("#remote_serverInfo2").hide();        
                            } 

                });
        function confirmCronDelete(parserConn_id)    
        {
                   var mylink =$("#delete_cron").attr('href');           
                   mylink = mylink+"&delete_cron_id="+parserConn_id;
                   
                                              window.location =mylink;
                   return false;
        }

            $(function()     
             {  

                              var selectdatabaseType =  $(".cron_database_type:checked").val();
                              var selectDbConnstrId = $("#selectDbConnId").val();    
                              $.post(portalLocation+controller+"/companymanagement_Ajax.php", {"selectdatabaseType":selectdatabaseType,"selectDbConnstrId":selectDbConnstrId}, function(data){    
                                          $("#dbConnectionList").html(data);
                                          dbConnectionList();
                                     });
            });

            function  dbConnectionList()
            {
                var check_dbtypes =  $(".cron_database_type:checked").val();
                var cron_host_id =  $(".cron_host_id option:selected").val();  

                $.post(portalLocation+controller+"/companymanagement_Ajax.php", {"cron_host_id":cron_host_id,"check_dbtypes":check_dbtypes}, function(data){    
                      
                                    $("#db_ConnStrAjax").html(data);
                                        availableCronProcedure();
                                     });        
            }    

            function availableCronProcedure()
            {
               var i = 0;
                        var databaseType =  $(".cron_database_type:checked").val();
                        var database_cron_host = $("#database_cron_host").val();
                        var database_cron_username = $("#database_cron_username").val();
                        var database_cron_password = $("#database_cron_password").val();    
                        var database_cron_port = $("#database_cron_port").val();    
                        var cron_database_name = $("#cron_database_name").val();  
                        var selected_proc = $("#selected_proc").val(); 
                $('#cron_procedure_list').select2();
                
                $.post(portalLocation+controller+"/companymanagement_Ajax.php", {"databaseType":databaseType,"database_cron_host":database_cron_host,"database_cron_username":database_cron_username,"database_cron_password":database_cron_password,"database_cron_port":database_cron_port,"cron_database_name":cron_database_name,"selected_proc":selected_proc}, function(data){    
                    
                    $("#cron_procedure_list").html(data); 
                        if(i==0) 
                        {
                            availableCronProcedure();
                            i=i+1;
                        }    
                });
                
                
            }     
$("#weblog_table").html("Apache_weblog");         
$(".isServer").click(function()
{
var server = $(this).val();
    if(server == "apache")
        {
          $("#weblog_table").html("Apache_weblog");  
        }
        else
        {
          $("#weblog_table").html("IIS_weblog"); 
        }   

}) 
//Change Login type crawler
function changeLoginType(login_type)
{
    $('#server_password1').val("");
    
        if(login_type == 'SSH - KEY')
        {
            
                  $(".cron_server_password").html("Key file path");                                     
                  $('#server_password1').prop("type", "text");    
          
        }
        else
        {
          
                 $(".cron_server_password").html("Password"); 
                 $('#server_password1').prop("type", "password");    
          
        }    
            

}
   
function changeLoginServer2(login_type)   
{
    $('#server_password2').val(""); 
        if(login_type == 'SSH - KEY')
        {
                  $(".cron_server_password1").html("Key file path");                                                      
                  $('#server_password2').prop("type", "text");        
        }
        else
        {
                 $(".cron_server_password1").html("Password");                  
                 $('#server_password2').prop("type", "password");            
        } 

}
    



</script>    
 {/literal}    
{/if}
{/if}

{if isset($cronlogFileContent)}
              {$smarty.const.cron_logs}
           <div>            
                 <pre>{$cronlogFileContent}</pre>           
           </div> 
        
{/if} 
{*$casemenu 4 ends *}



{* Start page of Import From Database *}
{if $casemenu eq '12'}      
 {include 'admin/importdb.inc.company.tpl' nocache}
{/if}
{*End page of Import From Database*}


{literal}
    <script type="text/javascript">
                jQuery("#select-basic, #select-multi").select2();
                jQuery('#select-search-hide').select2({
                    minimumResultsForSearch: -1
                });  
         function changeStatus(chk,url,div){
                    chkid = chk.id;
                       
                     var divloader = $("#"+chkid).parent().siblings(".msg-loading");
                        var checked = "0"; 
                        $("."+div+" .focused").prop("disabled",true);
                        if($("#"+chkid).prop("checked")){
                            $("."+div+" .focused").removeAttr("disabled");  
                            checked = "1";    
                        }
                        divloader.removeClass("nobg");    
                        divloader.html(""); 
                        divloader.show();    
                        $.get(url+"&ra="+checked,function(data){                      
                         divloader.addClass("nobg");
                          if(data == "1"){
                           divloader.html("Success!");    
                         }else{
                             divloader.html("Failed!");
                         }
                          divloader.delay(1000).fadeOut("slow");      
                        });
             }      
             
           //Get delete confirmation      
            
             
 function confirmDelete(msg,id)
   {
       var mylink =$(".emaildel_href").prop('href');
           mylink =mylink+'&u='+id;    
                     
          $.messager.confirm('Confirmation for delete connection',msg, function(r){
                if (r)
                {
                    window.location =mylink;
                }
                else
                {
                    return false;
                }
           });
                     
   return false;                      
}

function deleteAutomationLog(msg,id)
   {
       var mylink =$(".automation_log").prop('href');
           mylink =mylink+'&c='+id;    
                     
          $.messager.confirm('Confirmation for delete connection',msg, function(r){
                if (r)
                {
                    window.location =mylink;
                }
                else
                {
                    return false;
                }
           });
                     
   return false;                      
}

function deleteWeblog(msg,id)
   {
       var mylink =$(".weblog_log").prop('href');
           mylink =mylink+'&c='+id;    
                     
          $.messager.confirm('Confirmation for delete connection',msg, function(r){
                if (r)
                {
                    window.location =mylink;
                }
                else
                {
                    return false;
                }
           });
                     
   return false;                      
}

             
             
function callPopup(uri,titleTxt)
{
    $('#window-1').window({title:titleTxt});
    $('#window-1').window("open");
    $('#window-1').window('refresh',uri);
}             
             
    </script>
{/literal}    
