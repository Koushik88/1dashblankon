
{if isset($edituser)}
    <script src="{$smarty.const.JSLOCATION}select.min.js"></script> <!-- Custom Select -->
    <div class="modal-dialog">
    <div class="modal-content" >
        <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Edit User</h4>
        </div>
            <div class="modal-body"> 
                <form name="upnew_user" method="POST" id="upnew_user"> 
                                        <div class="row">  
                                            <div class="col-md-6 m-b-15">
                                                     <label>Firstname *</label>
                                                     <input type="text" class="input-sm form-control" name="up_frstname" id="up_frstname" value="{$getUserInfo[0]["first_name"]}" required>
                                             </div>
                                             <div class="col-md-6 m-b-15">
                                                     <label>Lastname *</label>
                                                     <input type="text" class="input-sm form-control" name="up_lstname" id="up_lstname" value="{$getUserInfo[0]["last_name"]}"  required>
                                             </div>
                                        </div> 

                                        <div class="row">  
                                            <div class="col-md-6 m-b-15">
                                                     <label>Email *</label>
                                                     <input type="text" class="input-sm form-control" disabled name="up_usremail" id="up_usremail" value="{$getUserInfo[0]["email"]}"  required>
                                            </div>
                                            <div class="col-md-6 m-b-15">
                                                    <label>Role *</label>
                                                        <select id="up_role_no" style="padding-left:10px;width:275px;height:29px;background-color:transparent;border:1px solid rgba(255, 255, 255, 0.3)">
                                                           {foreach $role as $key=>$value}
                                                               <option value="{$value["id"]}" {if $getUserInfo[0]["user_role"] eq {$value["id"]}} selected {/if}>{$value["role"]}</option>   
                                                           {/foreach}    
                                                       </select>
                                            </div>
                                        </div> 

                                        <input type="hidden" id="updateuserId" value="{$getUserInfo[0]["id"]}">               
                                        <div class="modal-footer">
                                              <button type="button" class="btn btn-sm" onclick="return updateUser();">Submit</button>
                                              <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
                                        </div>
                </form>
        </div> 
    </div>  
</div>
     
{/if}       



{if isset($loadUserInfo)}
        <table class="table table-bordered tile">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Mail</th>
                            <th>Role</th>    
                            <th>Last Login</th>
                            <th>IP Address</th>    
                            <th>Action</th>    
                        </tr>
                    </thead>
                    <tbody>
                         {foreach $adminResult as $key=>$value}   
                            <tr>
                                <td>{$value["Username"]|@ucfirst}</td>
                                <td>{$value["email"]}</td>
                                <td>{$value["role"]}</td>
                                <td>{$value["last_login"]}</td>
                                <td>{$value["ip"]}</td>
                                    <td align="center">
                                        {if $value["user_type_id"] ne '1'} 
                                              <a href="#edit_user" onclick="editContent('{$value["id"]}')" data-toggle="modal"><i class="fa fa-edit fa-lg" title="Edit User"></i></a>&nbsp;&nbsp;
                                              <a href="javascript:void();" onclick="deleteUser('{$value["id"]}','{$value["email"]}','{$value["Username"]}');"><i class="fa fa-trash-o fa-lg" title="Delete User"></i></a>&nbsp;&nbsp;
                                              <a href="#reset_password" onclick="restPasswordInfo('{$value["id"]}','{$value["email"]}');" data-toggle="modal"><li class="fa fa-unlock fa-lg" title="Reset Password"></li></a>&nbsp;&nbsp;
                                           {if $value["active"] eq '1'} <a href="javascript:void(0);" onclick="changeStatus('{$value["id"]}','0','Dissable');"><i class="fa fa-times fa-lg" title="Disable"></i></a>&nbsp;&nbsp;{/if}
                                           {if $value["active"] eq '0'} <a href="javascript:void(0);" onclick="changeStatus('{$value["id"]}','1','Enable');"><i class="fa fa-arrow-circle-right fa-lg" aria-hidden="true" title="Enable"></i></a>{/if}
                                       {else} --- {/if}
                                    </td>
                            </tr>
                         {/foreach}   
                    </tbody>
            </table>
{/if}