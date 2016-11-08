{*
==================================================================
#   Global Basics Inc - Backend	:: Template Management           #
==================================================================

     Document       : Template Management
     Created on     : 24-06-2016
     Author         : Rubanraj S , Ponnar V
     Description    : Managing the templates, assigning the templates for 
                      reports. 
     Last Edited on : 24-06-2016
     Last Edited by : Rubanraj S                  
*}

{if !isset($action)}
    
        <div id="tabs" class="easyui-tabs ui-corner-all icon-color" style="width:98%;"   >
                 
                    <div title="<i class='fa fa-user fa-lg'></i> Manage Users" cache='false'  data-options="href:'usermanagement.php?mu'"  class="tab-div-panel" ></div>
                 
                 {if $smarty.session.user_type eq '1'} {* only for super admin *}
                     <div title="Manage Admin" cache='false' data-options="href:'usermanagement.php?ma'"  class="tab-div-panel"></div>
                 {/if}
                     <div title="Manage Role" cache='false' data-options="href:'usermanagement.php?mr'"  class="tab-div-panel"></div>

        </div>
{elseif isset($action) and $action eq 'ma'}
<script type="text/javascript" src="{$smarty.const.EASYUI}datagrid-detailview.js"></script>
<script type="text/javascript" src="{$smarty.const.JSLOCATION}usermanagement.js"></script>

 <div align='center' style='padding:10px;'>
    <table id="dg" class="easyui-datagrid"  style="width:98%;height:100%;position:relative;" url="usermanagement_ajax.php?action=list_user" toolbar="#toolbar" idField="id"    data-options="singleSelect:true,pagination:true,rownumbers:true,autoRowHeight:true,pageSize:20">
         <thead data-options="frozen:true">
             <tr>
                 <th field="username" width="120">Username</th>
             </tr>
          </thead>
          <thead>  
            <tr>
                <th field="email"  align="left" >Email</th>
                <th field="last_login"  align="left" >Last login</th>
                <th field="ip"   align="left" class="col">IP Address</th>
                <th field="user_type"   align="left" formatter="showUserType" class="col">User type</th>
            </tr>
        </thead>
    </table>
    {* manage Admin grid toolbar  *}
    <div id="toolbar" style="padding:10px;">
        <a href="#" class='mytooltip' title="{$smarty.const.TOOLTIP_USER_SEARCH}" ><i class="fa fa-question-circle fa-lg icon-color"></i></a>
                <span class="textbox searchbox" style="width: 172px; height: 28px;">
                    <span class="textbox-addon textbox-addon-right" style="right: 0px;">
                        <a href="javascript:void(0)" class="textbox-icon searchbox-button mysearch-button" icon-index="0" tabindex="-1" ></a>
                    </span>
                    {* id *}
                    <input id="searchAdminUser" type="text" placeholder="Search......."  class="textbox-text validatebox-text textbox-prompt mysearch-text-input" autocomplete="off" >
                </span>
        <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small"   onclick="createAdmin()"> <i class="fa fa-plus-circle fa-lg icon-color"></i>New User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small"   onclick="editUser()"><i class="fa fa-edit fa-lg icon-color"></i>Edit User</a>
        <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small"   onclick="assignModule()"><i class="fa fa-pencil-square fa-lg icon-color"></i>Assign Module</a>
        <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small"   onclick="changePassword()"><i class="fa fa-unlock fa-lg icon-color"></i>Reset Password</a>
        <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small"   onclick="{literal}javascript:$('#dg').datagrid('destroyRow'){/literal}"><i class="fa fa-trash-o fa-lg icon-color"></i>Remove User</a>
    </div>
 </div>
 
 <!--- manage admin add/edit code --->
 <!---- Create Admin Form ----->
 <div id="createAdmin" class="easyui-dialog" 
      style="width:600px;height:550px;padding:10px 20px;" 
       data-options="buttons:'#createAdmin-buttons',closed:true,modal:true,collapsible:false,minimizable:false,maximizable:false">


     <form class="form-ui" id="createAdmin_fm" method="post" novalidate >
         <div class="ftitle" >Fill Admin User Information</div>
         <div class="fitem crdiv">
             <label>First Name</label>
             <input name="firstname" class="easyui-textbox" validType="text" data-options="prompt:'Enter first name...',required:true,validType:'length[3,15]'">
         </div>
         <div class="fitem crdiv">
             <label>Last Name</label>
             <input name="lastname" class="easyui-textbox" >
         </div>
         <div class="fitem">
             <label>Username</label>
             <input name="username" id="fm_username" class="easyui-textbox" required="true" data-options="prompt:'Enter username...',required:true,validType:'length[4,15]'">
         </div>

         <div class="fitem crdiv isPwd fm_pwd">
             <label>Password</label>
             <input name="pwd" id="fm_pwd" type="password" class="easyui-textbox" required="true" >
         </div>
         <div class="fitem crdiv isPwd fm_cpwd">
             <label>Confirm Password</label>
             <input name="cpwd" type="password" class="easyui-textbox" required="true" >
         </div>
         <div class="fitem">
             <label>Email</label>
             <input name="email" class="easyui-textbox" validType="email" required="true" data-options="prompt:'Enter email...'">
         </div>
         <div class="fitem">
             <label>User Type</label>
             <span><label>Admin</label></span>
         </div>
         <div style='background: #E0ECFF; width:482px;' class='ui-widget panel window'>
             <label style='padding:2px;text-transform: capitalize;'>Assign Manage Module</label>
             <div style='width:100%;height:150px;background: #fff;border:1px solid #95B8E7;overflow-y: scroll;' align='center' class='ui-corner-all'>
                 {assign var='noOfItems' value=2}
                 <table width="95%">
                     {foreach from=$manage_module key=k item=v0}

                         {if $k mod $noOfItems eq 0}
                             <tr>
                             {/if}
                             <td> {$v0.label|capitalize} </td>
                             <td><input type="checkbox" name='module[]' class="mod" id="{$v0.admin_token|truncate:5:''}" value="{$v0.admin_token}" style='width:20px;'></td>
                                 {if $k mod $noOfItems eq $noOfItems - 1}
                             </tr>
                         {/if}    

                     {/foreach}
                 </table> 

             </div>
         </div>


     </form>
     <!--- Edit Admin form --->
     <form class="form-ui" id="editAdmin_fm" method="post" novalidate >
         <div class="ftitle" >Edit Admin User Information</div>
         <div class="fitem crdiv">
             <label>First Name</label>
             <input name="firstname" class="easyui-textbox" validType="text" data-options="prompt:'Enter first name...',required:true,validType:'length[3,15]'">
         </div>
         <div class="fitem crdiv">
             <label>Last Name</label>
             <input name="lastname" class="easyui-textbox" >
         </div>
         <div class="fitem">
             <label>Username</label>
             <input name="username" id="fm_username" class="easyui-textbox" required="true" data-options="prompt:'Enter username...',required:true,validType:'length[4,15]'">
         </div>

         <div class="fitem">
             <label>Email</label>
             <input name="email" class="easyui-textbox" validType="email" required="true" data-options="prompt:'Enter email...'">
         </div>
         <div class="fitem">
             <label>User Type</label>
             <span><label>Admin</label></span>
         </div>
         <div style='background: #E0ECFF; width:482px;' class='ui-widget panel window'>
             <label style='padding:2px;text-transform: capitalize;'>Assign Manage Module</label>
             <div style='width:100%;height:150px;background: #fff;border:1px solid #95B8E7;overflow-y: scroll;' align='center' class='ui-corner-all'>
                 {assign var='noOfItems' value=2}
                 <table width="95%">
                     {foreach from=$manage_module key=k item=v0}

                         {if $k mod $noOfItems eq 0}
                             <tr>
                             {/if}
                             <td> {$v0.label|capitalize} </td>
                             <td><input type="checkbox" name='module[]' class="mod" id="edit{$v0.admin_token|truncate:5:''}" value="{$v0.admin_token}" style='width:20px;'></td>
                                 {if $k mod $noOfItems eq $noOfItems - 1}
                             </tr>
                         {/if}    

                     {/foreach}
                 </table> 

             </div>
         </div>


     </form>

     <!---Change Password ---->
     <form class="form-ui" id="changePassword_fm" method="post" novalidate style="display:none;">
         <div class="ftitle" >Reset Password</div>
         <div class="fitem">
             <label>Usernamee</label>
             <span id="uid"></span>
         </div>
         <div class="fitem ">
             <label>Password</label>
             <input name="pwd" id="fm_pwd" type="password" class="easyui-textbox" required="true" >
         </div>
         <div class="fitem ">
             <label>Confirm Password</label>
             <input name="cpwd" type="password" class="easyui-textbox" required="true" >
         </div>

     </form>

 </div>
                 
 {* form dialog toolbar  *}                
 <div id="createAdmin-buttons" style="padding:10px;">
     <a href="javascript:void(0)" class="easyui-linkbutton c6 l-btn l-btn-small" iconCls="icon-ok" id="sau" onclick="saveUser()" style="width:90px">Save</a>
     <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small" iconCls="icon-cancel" onclick="{literal}javascript:$('#createAdmin').dialog('close'){/literal}" style="width:90px">Cancel</a>
 </div>

{literal}
    <script type="text/javascript">
        var url;
                
        /* Document read function to load users into grid  */
         $(function(){
             
             var fitCls = $("#tabs").width() > 650 ? true : false;
             if(fitCls === true) $(".col").css("width","250");
             
              $('#dg').datagrid({
                  view: myview,
                  height:'604px',
                  fitColumns:true,
                  nowrap:true,
                  cache:false,
                  emptyMsg: 'No Admin User',
                  url: 'usermanagement_ajax.php?action=list_user',
                  destroyUrl: 'usermanagement_ajax.php?action=rm_user'

              });

          });
          
    </script>
{/literal}

{elseif $action eq 'mu'}
    <script type="text/javascript" src="{$smarty.const.EASYUI}datagrid-detailview.js"></script>
    <script type="text/javascript" src="{$smarty.const.JSLOCATION}usermanagement.js"></script>
    <br/>
    
    <div class="ui-widget mypanel" align="center">
        <div id="muTable">
            <table id="mu"  style="width:98%;height:100%;position:relative;" url="usermanagement_ajax.php?action=list_user" toolbar="#mutoolbar" idField="id"    data-options="singleSelect:true,pagination:true,rownumbers:true,autoRowHeight:true,pageSize:20">
                <thead frozen="true">
                    <tr>
                        <th field="username" >Username</th>
                    </tr>
                </thead>       
                 <thead>
                    <tr>
                        <th field="email"  width='250' align="left">Email</th>
                        <th field="role"  width='250' align="left" >Primary role</th>
                        <th field="last_login"  align="left">Last login</th>
                        <th field="ip" width="150" align="left">IP Address</th>
                        <th field="user_status" width="150" align="left">Status</th>
                    </tr>
                </thead>
            </table>
            <div id="mutoolbar" style="padding:10px;">
                
                <a href="javascript:void(0)" class='info-popup' data-placement="top" data-html="true"   title="Search By" data-original-title="" data-container="body" data-toggle="popover"  data-content="{$smarty.const.TOOLTIP_USER_SEARCH}" ><i class="fa fa-question-circle fa-lg icon-color"></i></a>
                
                <span class="textbox searchbox" style="width: 172px; height: 28px;">
                    <span class="textbox-addon textbox-addon-right" style="right: 0px;">
                        <a href="javascript:void(0)" class="textbox-icon searchbox-button mysearch-button" icon-index="0" tabindex="-1" ></a>
                    </span>
                    {* id *}
                    <input id="searchEndUser" type="text" placeholder="Search......."  class="textbox-text validatebox-text textbox-prompt mysearch-text-input" autocomplete="off" >
                </span>
                
                <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small" data-toggle="modal" data-target="#createUser_modal" onclick="{literal}javascript:$('#createUser_form').form('clear'){/literal}"><i class="fa fa-plus-circle fa-lg icon-color"></i>New User</a>
                <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small" id="muedit" data-toggle="modal"  onclick="getRowSelected('#mu','#muedit')"><i class="fa fa-edit fa-lg icon-color"></i>Edit User</a>
                <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small" id="muresetpwd" data-toggle="modal"  onclick="getRowSelected('#mu','#muresetpwd')"><i class="fa fa-unlock fa-lg icon-color"></i>Reset Password</a>
                <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small" onclick="{literal}javascript:$('#mu').datagrid('destroyRow'){/literal}"><i class="fa fa-trash-o fa-lg icon-color"></i>Remove User</a>
                <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small" id="mudupli" data-toggle="modal"  onclick="getRowSelected('#mu','#mudupli')"><i class="fa fa-copy fa-lg icon-color"></i>Duplicate User</a>
                <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small" id="assingRights" data-toggle="modal"  onclick="getRowSelected('#mu','#assingRights')"><i class="fa fa-arrow-circle-right fa-lg icon-color"></i>Assign Rights</a>
                <div style="width:197px;display:inline-block;padding-top:7px;">&nbsp;</div> 
                    <div style="display:inline-block;">
                        <a href="javascript:void(0)" class="easyui-linkbutton l-btn l-btn-small" id="enableDisable" data-toggle="modal"  onclick="getRowSelected('#mu','#enableDisable')">
                            <i class="fa fa-arrow-circle-right fa-lg icon-color"></i>User Enable/Disable</a> 
                    </div>
            </div>
         </div> 
          {*forms *}
        
          
      <!----- Froms Started --->
                      
            <div class="modal fade " id="createUser_modal" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header datagrid-row-selected">
                          <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
                          <h4 class="modal-title text-left">Create User</h4>
                      </div>

               
                 <form id="createUser_form" >
                    <div class="mypanel mypanel-default" style="border:none;">
                                    
                                    <div class="mypanel-body">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Firstname <span class="asterisk">*</span></label> </div>
                                                    <input type="text" name="firstname" class="form-control"  rangelength='4,12' letter='true' required/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Lastname </div>
                                                    <input type="text" name="lastname" class="form-control" letteranddot='true'/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                        </div><!-- row -->
                                        
                                        <div class="row" >
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Username <span class="asterisk">*</span></label></div>
                                                    <input type="text" name="username" class="form-control" rangelength='4,12'  uniqueUser='true' required />
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Email <span class="asterisk">*</span></label></div>
                                                    <input type="email" name="email" class="form-control"  required/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            
                                        </div><!-- row -->
                                  
                                       <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Password <span class="asterisk">*</span></label></div>
                                                    <input type="password" name="password" id="password" rangelength='4,10' class="form-control" required/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Confirm Password <span class="asterisk">*</span></label></div>
                                                    <input type="password"  name="cpassword" id="cpassword" equalto='#password' class="form-control" />
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                        </div><!-- row -->
                      
                                    
                                    <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Primary Role <span class="asterisk">*</span></label></div>
                                                    <select class="primary_role width100p" id="primary_role" name="role_id"  required>
                                                        <option value="">Choose One</option>
                                                        {foreach from=$roles key=k item=v}
                                                          <option value="{$v.id}">{$v.role}</option>
                                                        {/foreach}
                                                        
                                                    </select>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group" >
                                                    <label class="control-label sm-title" >Do you want to assign additional role ?<span class="asterisk">*</span></label>
                                                    <div class="row control-group mypanel mypanel-default input-group-addon">
                                                        <div class="col-sm-1"></div>
                                                        <div    class="col-sm-4 rdio rdio-primary text-left">
                                                                <input type="radio" id="yes" value="1" name="additional_role" style="margin:0px;" required /> 
                                                                <label for="yes" >Yes</label>
                                                        </div>
                                                        <div class="col-sm-3 rdio rdio-primary">
                                                                <input type="radio" value="0" id="no" name="additional_role" style="margin:0px;" checked>
                                                                <label for="no" class="text-left">No</label>
                                                        </div>
                                                    </div>
                                                    <label id="additional_roleError" class="error"></label>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                        </div><!-- row -->
                                        
                                    <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <div style="border-bottom: 1px solid #ccc;" class="text-left">
                                                    <label class="control-label sm-title" >other Settings</label> 
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6"> 
                                                            <div class="form-group">
                                                                <label class="control-label pull-left" align="left">Mobile Login</label>
                                                                <div class="div-status pull-right" style="margin-top:4px;">
                                                                       <input id="mobile_login" checked="checked"  name="mobile_login" type="checkbox" value="1" />
                                                                       <label for="mobile_login">Check-me</label>
                                                                 </div>
                                                               </div>
                                                        </div>

                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label class="control-label pull-left" align="left">Custom Data Import</label>
                                                                <div class="div-status pull-right" style="margin-top:4px;">
                                                                       <input id="custom_upload" checked="checked"  name="custom_upload" type="checkbox" value="1" />
                                                                       <label for="custom_upload">Check-me</label>
                                                                 </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label class="control-label pull-left" align="left">Report Export</label>
                                                                <div class="div-status pull-right" style="margin-top:4px;">
                                                                       <input id="report_export" checked="checked"  name="report_export" type="checkbox" value="1" />
                                                                       <label for="report_export">Check-me</label>
                                                                 </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                </div><!-- form-group -->
                                            </div><!-- row close -->
                                            
                                        
                                    <div class="row subrole_group1" style="display: none;">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Sub Role-1</label></div>
                                                    <select class="sub_role1 width100p" id="sub_role2" data-placeholder="Choose One"  required>
                                                        <option value="">Choose One</option>
                                                        
                                                    </select>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Sub Role-2</label></div>
                                                    <select class="sub_role2 width100p" id="sub_role3" data-placeholder="Choose One"  required>
                                                        <option value="">Choose One</option>
                                                        
                                                    </select>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                    </div><!-- row -->    
                                    </div><!-- mypanel-body -->
                                  
                                    
                                    <div class="mypanel-footer">
                                        <div class="center-block">
                                            <a href="javascript:void(0)" class="btn btn-primary"  onclick="formValidate('#createUser_form')">Submit</a>
                                            <a href="javascript:void(0)" class="btn btn-danger"   onclick="{literal}javascript:$('.close').click(){/literal}">Cancel</a>
                                        </div>
                                    </div><!-- mypanel-footer -->
                    </div><!-- mypanel -->
              </form>
        
     </div>
    </div>
   </div>   
     
         <!----- Edit User ---->
         <div class="modal fade" id="muedit_modal" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header datagrid-row-selected">
                          <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
                          <h4 class="modal-title text-left">Edit User</h4>
                      </div>

                
       
              <form id="muedit_form">
                <div class="mypanel mypanel-default" style="border:none;">
                                    
                                    <div class="mypanel-body">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">First name <span class="asterisk">*</span></label></div>
                                                    <input type="text" name="firstname" class="form-control" rangelength='4,12' letter='true' required/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Last name</label></div>
                                                    <input type="text" name="lastname" class="form-control" letteranddot='true'/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                        </div><!-- row -->
                                        
                                        <div class="row" >
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Username <span class="asterisk">*</span></label></div>
                                                    <input type="text" name="username" class="form-control" disabled/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Email <span class="asterisk">*</span></label></div>
                                                    <input type="email" name="email" class="form-control"   required/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            
                                        </div><!-- row -->
                                  
                                                                          
                                    <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Primary Role <span class="asterisk">*</span></label></div>
                                                    <select class="primary_role width100p" id="eprimary_role" name="role_id" style='height:30px' required>
                                                    <option value="">Choose One</option>
                                                    {foreach from=$roles key=k item=v}
                                                          <option value="{$v.id}">{$v.role}</option>
                                                    {/foreach}
                                                    </select>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group" >
                                                    <label class="control-label sm-title" >Do you want to assign additional role ?<span class="asterisk">*</span></label>
                                                    <div class="row control-group mypanel mypanel-default input-group-addon">
                                                        <div class="col-sm-1"></div>
                                                        <div    class="col-sm-4 rdio rdio-primary text-left">
                                                                <input type="radio" id="eyes" value="1" name="additional_role" style="margin:0px;" required /> 
                                                                <label for="eyes" >Yes</label>
                                                        </div>
                                                        <div class="col-sm-3 rdio rdio-primary">
                                                                <input type="radio" value="0" id="eno" name="additional_role" style="margin:0px;" checked>
                                                                <label for="eno" class="text-left">No</label>
                                                        </div>
                                                    </div>
                                                    <label id="eadditional_roleError" class="error"></label>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                        </div><!-- row -->
                                        
                                    
                                    
                                    
                                    <div class="row subrole_group1" style="display: none;">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Sub Role-1</label></div>
                                                    <select class="sub_role1 width100p" id="esub_role2" data-placeholder="Choose One"  required>
                                                        <option value="">Choose One</option>
                                                       
                                                    </select>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Sub Role-2</label></div>
                                                    <select class="sub_role2 width100p" id="esub_role3" data-placeholder="Choose One"  required>
                                                        <option value="">Choose One</option>
                                                        
                                                    </select>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                    </div><!-- row -->    
                                    
                                    <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <div style="border-bottom:1px solid #ccc;" class="text-left">
                                                       <label class="control-label sm-title" >other Settings</label> 
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6"> 
                                                            <div class="form-group">
                                                                <label class="control-label pull-left" align="left">Mobile Login</label>
                                                                <div class="div-status pull-right" style="margin-top:4px;">
                                                                       <input id="emobile_login" checked="checked"  name="mobile_login" type="checkbox" value="1" />
                                                                       <label for="emobile_login">Check-me</label>
                                                                 </div>
                                                               </div>
                                                        </div>

                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label class="control-label pull-left" align="left">Custom Data Import</label>
                                                                <div class="div-status pull-right" style="margin-top:4px;">
                                                                       <input id="ecustom_upload" checked="checked"  name="custom_upload" type="checkbox" value="1" />
                                                                       <label for="ecustom_upload">Check-me</label>
                                                                 </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label class="control-label pull-left" align="left">Report Export</label>
                                                                <div class="div-status pull-right" style="margin-top:4px;">
                                                                       <input id="ereport_export" checked="checked"  name="report_export" type="checkbox" value="1" />
                                                                       <label for="ereport_export">Check-me</label>
                                                                 </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                </div><!-- form-group -->
                                            </div><!-- row close -->
                                            
                                    </div><!-- mypanel-body -->
                                  
                                    <input type='hidden' name='id' >
                                    <div class="mypanel-footer">
                                        <div class="center-block">
                                            <a href="javascript:void(0)" class="btn btn-primary"  onclick="formValidate('#muedit_form')" >Submit</a>
                                            <a href="javascript:void(0)" class="btn btn-danger"   onclick="{literal}javascript:$('.close').click(){/literal}">Cancel</a>
                                        </div>
                                    </div><!-- mypanel-footer -->
                          </div><!-- mypanel -->
                  </form>
        
        </div>
    </div>
   </div>
                                        
 <!-- Dupliucate User Creations -->
                                     
  <!----- Edit User ---->
         <div class="modal fade" id="mudupli_modal" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header datagrid-row-selected">
                          <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
                          <h4 class="modal-title text-left">Create User</h4>
                      </div>

                
       
            <form id="mudupli_form" method="post">
                <div class="mypanel mypanel-default" style="border:none;">
                                    
                                    <div class="mypanel-body">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">First name <span class="asterisk">*</span></label></div>
                                                    <input type="text" name="firstname" class="form-control" rangelength='4,12' letter='true' required/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Last name</label></div>
                                                    <input type="text" name="lastname" class="form-control" letteranddot='true'/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                        </div><!-- row -->
                                        
                                        <div class="row" >
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Username <span class="asterisk">*</span></label></div>
                                                    <input type="text" name="username_new" class="form-control" rangelength='4,12' uniqueUser='true' required/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Email <span class="asterisk">*</span></label></div>
                                                    <input type="email" name="email" class="form-control"   required/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            
                                        </div><!-- row -->
                                        
                                        
                                        
                                         <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Password <span class="asterisk">*</span></label></div>
                                                    <input type="password" name="npassword" id="npassword" rangelength='4,10' class="form-control" required/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Confirm Password <span class="asterisk">*</span></label></div>
                                                    <input type="password"  name="ncpassword" id="ncpassword" equalto='#npassword' class="form-control" />
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                        </div><!-- row -->
                                        
                                        
                                  
                                                                          
                                    <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Primary Role <span class="asterisk">*</span></label></div>
                                                    <select class="primary_role width100p" id="eprimary_role" name="role_id" style='height:30px' required>
                                                    <option value="">Choose One</option>
                                                    {foreach from=$roles key=k item=v}
                                                          <option value="{$v.id}">{$v.role}</option>
                                                    {/foreach}
                                                    </select>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group" >
                                                    <label class="control-label sm-title" >Do you want to assign additional role ?<span class="asterisk">*</span></label>
                                                    <div class="row control-group mypanel mypanel-default input-group-addon">
                                                        <div class="col-sm-1"></div>
                                                        <div    class="col-sm-4 rdio rdio-primary text-left">
                                                                <input type="radio" id="dueyes" value="1" name="additional_role" style="margin:0px;" required /> 
                                                                <label for="dueyes" >Yes</label>
                                                        </div>
                                                        <div class="col-sm-3 rdio rdio-primary">
                                                                <input type="radio" value="0" id="dueno" name="additional_role" style="margin:0px;" checked>
                                                                <label for="dueno" class="text-left">No</label>
                                                        </div>
                                                    </div>
                                                    <label id="eadditional_roleError" class="error"></label>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                        </div><!-- row -->
                                        
                                    
                                    
                                    
                                    <div class="row subrole_group1" style="display: none;">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Sub Role-1</label></div>
                                                    <select class="sub_role1 width100p" id="duesub_role2" data-placeholder="Choose One"  required>
                                                        <option value="">Choose One</option>
                                                       
                                                    </select>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Sub Role-2</label></div>
                                                    <select class="sub_role2 width100p" id="duesub_role3" data-placeholder="Choose One"  required>
                                                        <option value="">Choose One</option>
                                                        
                                                    </select>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                    </div><!-- row -->    
                                    
                                    <div class="row">
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <div style="border-bottom:1px solid #ccc;" class="text-left">
                                                       <label class="control-label sm-title" >other Settings</label> 
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6"> 
                                                            <div class="form-group">
                                                                <label class="control-label pull-left" align="left">Mobile Login</label>
                                                                <div class="div-status pull-right" style="margin-top:4px;">
                                                                       <input id="duemobile_login" checked="checked"  name="mobile_login" type="checkbox" value="1" />
                                                                       <label for="duemobile_login">Check-me</label>
                                                                 </div>
                                                               </div>
                                                        </div>

                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label class="control-label pull-left" align="left">Custom Data Import</label>
                                                                <div class="div-status pull-right" style="margin-top:4px;">
                                                                       <input id="duecustom_upload" checked="checked"  name="custom_upload" type="checkbox" value="1" />
                                                                       <label for="duecustom_upload">Check-me</label>
                                                                 </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <label class="control-label pull-left" align="left">Report Export</label>
                                                                <div class="div-status pull-right" style="margin-top:4px;">
                                                                       <input id="duereport_export" checked="checked"  name="report_export" type="checkbox" value="1" />
                                                                       <label for="duereport_export">Check-me</label>
                                                                 </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                </div><!-- form-group -->
                                            </div><!-- row close -->
                                            
                                    </div><!-- mypanel-body -->
                                  
                                    <input type='hidden' name='id' >
                                    <div class="mypanel-footer">
                                        <div class="center-block">
                                            <Button class="btn btn-primary">Submit</button>
                                            <a href="javascript:void(0)" class="btn btn-danger"   onclick="{literal}javascript:$('.close').click(){/literal}">Cancel</a>
                                        </div>
                                    </div><!-- mypanel-footer -->
                          </div><!-- mypanel -->
                  </form>
        
        </div>
    </div>
   </div>                               
                                        
   
                                        
                                        
 <!-- Assign Rights -->
         <div class="modal fade" id="assingRights_modal" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog">
                  <div class="modal-content">
                            <div class="modal-header datagrid-row-selected">
                                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
                                <h4 class="modal-title text-left">Assign Rights</h4>
                            </div>

                          <form method="post">   
                              <div class="mypanel mypanel-default" style="border:none;">                                    
                                <div class="mypanel-body">
                                    <div id ="userWise">      
                                    </div>      
                                </div>
                                                                                    
                                <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary btn-sm" name="btn_menulist" id="btn_userlist">{$smarty.const.save_credentials}</button>
                                        <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">{$smarty.const.cancel}</button> 
                                </div>   
                              </div>
                          </form>
                     </div>                     
                 </div>
         </div>                                         
          
                                        
        <div class="modal fade" id='muresetpwd_modal' tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog">
                  <div class="modal-content">
                      <div class="modal-header datagrid-row-selected">
                          <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
                          <h4 class="modal-title text-left">Reset Password</h4>
                      </div>
              <form id="muresetpwd_form">
                  <div class="mypanel mypanel-default" style="border:none;">
                                   
                                     <div class="mypanel-body">  
                                        <div class="row" >
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title" >Username</label></div>
                                                    <input type="text" name="username" class="form-control" disabled/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            
                                        </div><!-- row -->
                                  
                                       <div class="row">
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Password <span class="asterisk">*</span></label></div>
                                                    <input type="password" name="password" id="epassword" rangelength='4,10' class="form-control" required/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                            
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <div class="text-left"><label class="control-label sm-title">Confirm Password <span class="asterisk">*</span></label></div>
                                                    <input type="password"  name="cpassword" id="cepassword" class="form-control" equalto='#epassword'/>
                                                </div><!-- form-group -->
                                            </div><!-- col-sm-6 -->
                                        </div><!-- row -->
                      
                                      </div><!-- mypanel-body -->
                                  
                                    <input type='hidden' name='id' >
                                    <div class="mypanel-footer">
                                        <div class="center-block">
                                            <a href="javascript:void(0)" class="btn btn-primary"  onclick="formValidate('#muresetpwd_form')">Submit</a>
                                            <a href="javascript:void(0)" class="btn btn-danger"   onclick="{literal}javascript:$('.close').click(){/literal}">Cancel</a>
                                        </div>
                                    </div><!-- mypanel-footer -->
                     </div><!-- mypanel -->
                 </form>
           </div>
                                        </div>
    </div>
   <!----- Forms ended ---->
        </div>
    </div>
  </div>
    
{literal}
    <script type="text/javascript">
        var url;
         /* Document read function to load users into grid  */
         $(function(){
             var fitCls = $("#tabs").width() > 650 ? true : false;
             //if(fitCls === true) $(".col").css("width","250");
             
              $('#mu').datagrid({
                  view: myview,
                  height:'604px',
                  fitColumns:fitCls,
                  nowrap:true,
                  cache:false,
                  emptyMsg: 'No User',
                  url: 'usermanagement_ajax.php?action=list_enduser',
                  destroyUrl: 'usermanagement_ajax.php?action=rm_user'

              });
                                      
      }); 
     
    </script>
{/literal}

{elseif $action eq 'mr'}
     <script type="text/javascript" src="{$smarty.const.JSLOCATION}usermanagement.js"></script>
    <br/>
    <div style="width:99%;" align="center"> 
     <div class="row" style="width:95%">
          <div class="col-sm-6">
                <div class="mypanel mypanel-default">
                    <div class="mypanel-heading">
                        <div class="mypanel-btns">
                            <a href="javascript:void(0)" class="mypanel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                            <a href="javascript:void(0)" class="mypanel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                        </div><!-- panel-btns -->
                        <h3 class="mypanel-title text-left">Add Primary Role</h3>
                    </div>
                    <div class="mypanel-body">
                        <form name="addPrimaryRole" id="addPrimaryRole" action="#" method="post">
                                <div class="table">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                     <div class="text-left"><label class="control-label sm-title">Role <span class="asterisk">*</span></label></div>
                                                     <input type="text" name="primary_role" id="primary_role" rangelength='2,15' letter="true" uniquePrimaryRole="true" class="form-control" required/>
                                            </div><!-- form-group -->
                                        </div> 
                                    </div>
                                     <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group" >
                                                <div class="text-left"><label class="control-label sm-title" >Access right for forms<span class="asterisk">*</span></label></div>
                                                <div class="row control-group mypanel mypanel-default input-group-addon">
                                                    {foreach $user_access_right as $key=>$accessRight}
                                                        <div    class="col-sm-4 rdio rdio-primary text-left">
                                                                <input type="radio" id="role-{$accessRight['id']}" value="{$accessRight['id']}" name="access_right_type"  required /> 
                                                                <label for="role-{$accessRight['id']}" >{$accessRight['access_right']} </label>
                                                        </div>
                                                    {/foreach}
                                                    
                                                </div>
                                                <label id="access_right_typeError" class="error"></label>
                                             </div><!-- form-group -->
                                        </div>
                                     </div><!-- close row-->
                                 </div><!--close table-->
                               </form>
                         </div><!--close panel body-->
                         <div class="mypanel-footer">
                            <div class="center-block">
                                <a href="javascript:void(0)" class="btn btn-primary submit"  onclick="validateFormManageRole('#addPrimaryRole')">Submit</a>
                                <!--<img alt="" src="{$smarty.const.LOADERLOCATION}loader29.gif" class="loader hide">-->
                            </div>
                         </div><!-- mypanel-footer -->
                    </div><!--close panel -->
                </div><!-- close column-->
            
            <div class="col-sm-6">
                <div class="mypanel mypanel-default">
                    <div class="mypanel-heading">
                        <div class="mypanel-btns" >
                            <a href="javascript:void(0)" class="mypanel-minimize tooltips" data-toggle="tooltip" title="Minimize Panel"><i class="fa fa-minus"></i></a>
                            <a href="javascript:void(0)" class="mypanel-close tooltips" data-toggle="tooltip" title="Close Panel"><i class="fa fa-times"></i></a>
                        </div><!-- panel-btns -->
                        <h3 class="mypanel-title text-left">Edit Primary Role</h3>
                    </div>
                    <div class="mypanel-body" style="padding: 0px !important;">
                            <div id='epr'></div>
                            <input type="hidden" class="odata" id="odata" value=""/>
                            <input type="hidden" class="nddata" id="ndata" value=""/>
                            <!--<table id="epr"    >
                                <thead>
                                    <tr>
                                        <<th field="id" width="12%" formatter="formatAction">Action</th>
                                        <th field="primary_role" width="44%" editor="text">Role</th>
                                        <th {literal}data-options="width:'44%',titel:'access right name',field:'access_right_name', formatter:function(value,row){ return row.access_right_name; },editor:{type:'combobox',options:{ valueField:'access_right_id',textField:'access_right_name',data:[{'accesss_right_id':'1','access_right_name':'Approver'},{'accesss_right_id':'2','access_right_name':'Submitter'},{'accesss_right_id':'3','access_right_name':'Both'}],multiple:false,editable:false,required:true}}"{/literal}>Access Right</th>
                                    </tr>
                                </thead>
                            </table>-->
                            <div id="eprtoolbar" style="padding:10px;">
                                <a href="javascript:void(0)" class='info-popup' data-placement="top" data-html="true"   title="Search By" data-original-title="" data-container="body" data-toggle="popover"  data-content="{$smarty.const.TOOLTIP_PR_SEARCH}" ><i class="fa fa-question-circle fa-lg icon-color"></i></a>
                                {literal}<script type='text/javascript'>$(function(){ $('.info-popup').popover(); });</script>{/literal}
                                <span class="textbox searchbox" style="width: 172px; height: 28px;">
                                    <span class="textbox-addon textbox-addon-right" style="right: 0px;">
                                        <a href="javascript:void(0)" class="textbox-icon searchbox-button mysearch-button" icon-index="0" tabindex="-1" ></a>
                                    </span>
                                    {* id *}
                                    <input id="searchPrimaryRole" type="text" placeholder="Search......."  class="textbox-text validatebox-text textbox-prompt mysearch-text-input" autocomplete="off" >
                                </span>
                                
                            </div>
                    </div><!-- panel -->
          </div><!-- close column-->
       </div> <!--- close row --->
       
    </div>
    
{/if}