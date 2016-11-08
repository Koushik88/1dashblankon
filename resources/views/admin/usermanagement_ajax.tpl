{*
==================================================================
#   Global Basics Inc - Backend	:: User Management               #
==================================================================

    Document       : User Management Template
    Created on     : 24-06-2016
    Author         : Rubanraj S
    Description    : Managing the users, assigning the users to the reports.
    Last Edited on : 24-06-2016
    Last Edited by : Rubanraj S
    
*}

<!--Ajax page for User Management - User Details -->
<script type="text/javascript" src='{$smarty.const.JSLOCATION}login.js'></script>
{if isset($userListdetails)}  
   
    <div style="max-height:700px;overflow-y:auto;overflow-x: hidden;">
        <br/>
    <div align="left" style="width:650px;border-bottom:1px solid #ccc;">
        <span style="font-size:15px;padding-left:10px;">{$smarty.const.actions}
        </span>
       
    </div><br/>
            <div align="center">
            <table style="width:600px;text-align:left;border:1px;margin:0px 10px 0px 0px;border:1px solid #ccc;">            
                       <tr> 
                           <td style="background:#E7E7E7;" class="dbimpth"><b>Edit User</b></td>                          
                           <td style="background:#E7E7E7;" class="dbimpth"><b>Web Reports</b></td>
                           <td style="background:#E7E7E7;" class="dbimpth"><b>Device Reports</b></td>
                           <td style="background:#E7E7E7;" class="dbimpth"><b>Delete User</b></td>
                       </tr>
                       
                        <tr>
                          <td class="dbimptd" >
                                <a class="plinkgenaral" href="usermanagement.php?eu&u={$userListdetails['result'][0]['id']}&c={$userListdetails['result'][0]["company_id"]}{$pagelink}&pop=1#sform" title="{$smarty.const.edit_user}">
                                <img src="{$smarty.const.IMAGESLOCATION}/buttons/edit.png" title="{$smarty.const.edit_user}" width="18" height="18"/></a>
                          </td>                         
                          
                          <td class="dbimptd">
                              <a class="plinkgenaral1" href="usermanagement.php?em&u={$userListdetails['result'][0]['id']}{$pagelink}&type=web&pop=1#smenu" title="{$smarty.const.assign_menus}" >
                              <img src="{$smarty.const.IMAGESLOCATION}/buttons/assign-menus.png" title="{$smarty.const.assign_menus}" width="18" height="18"/></a>
                          </td>
                           <td class="dbimptd">
                              <a class="plinkgenaral1" href="usermanagement.php?em&u={$userListdetails['result'][0]['id']}{$pagelink}&type=device&pop=1#smenu" title="{$smarty.const.assign_menus}" >
                              <img src="{$smarty.const.IMAGESLOCATION}/buttons/assign-menus.png" title="{$smarty.const.assign_menus}" width="18" height="18"/></a>
                          </td>
                          
                          <td class="dbimptd">
                              {assign var="delmsg" value="Are You Sure Delete this User "}
                              <a href="usermanagement.php?u={$userListdetails['result'][0]['id']}&du&c={$userListdetails['result'][0]["company_id"]}{$pagelink}" {$smarty.const.delete_user} onclick="return confirmDelete('{$delmsg|cat:" \'"|cat:$userListdetails['result'][0]['username']|cat:"\' ?"}')">
                               <img src="{$smarty.const.IMAGESLOCATION}/buttons/delete.png" title="{$smarty.const.delete_user}" width="18" height="18"/></a>              
                          </td>
                       </tr>
            </table>
            </div>            
            <br/>
    
  <!--User Last Activities -->  
            <div align="left" style="border-bottom:1px solid #ccc;padding-left:10px;">
                <span style="font-size:15px;">{$smarty.const.last_activity}</span></div><br/>
                  <div align="center">
                  <table style="width:480px;text-align:left;border:1px;margin:0px 10px 0px 0px;border:1px solid #ccc;"  >
                    <tr style="height:30px;">
                        <td style="background:#E7E7E7;width:180px;" class="brdtdConn"><b>{$smarty.const.last_login}</b></td>
                        <td style="background:#E7E7E7;width:100px;" class="brdtdConn"><b>{$smarty.const.ip_address}</b></td>
                        <td style="background:#E7E7E7;width:120px;" class="brdtdConn"><b>{$smarty.const.browser_type}</b></td>
                        <td style="background:#E7E7E7;width:80px;" class="brdtdConn"><b>{$smarty.const.normal_ldap_user}</b></td>           
                    </tr>       
                           <tr>
                               
                            {if isset($userListdetails)&& $userListdetails['result'][0]['last_login'] neq ''}
                            <td class="brdrConn">{$userListdetails['result'][0]['last_login']|date_format:'%d-%b-%Y %H:%M:%S'}</td>
                            <td class="brdrConn">{$userListdetails['result'][0]['ip']}</td>
                            <td class="brdrConn">{$userListdetails['result'][0]['browser_type']}</td>
                            <td class="brdrConn" style="text-align:center;">{if {$userListdetails['result'][0]['ldap']}}<a title="{$smarty.const.ldap_user}" href="#" style="color:#111DE7;font-weight:bold;padding:0px 5px;">&nbsp;Y&nbsp;</a>{else}<a  href="#" title="{$smarty.const.normal_user}" style="color:#295700;font-weight:bold;padding:0px 5px;">&nbsp;N&nbsp;</a>{/if}</td>
                            {else}
                                <td class="brdrConn" colspan="3" style="text-align: center;"> No Data Found.</td>
                                <td class="brdrConn" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;{if {$userListdetails['result'][0]['ldap']}}<a title="{$smarty.const.ldap_user}" href="#" style="color:#111DE7;font-weight:bold;padding:0px 5px;">&nbsp;Y&nbsp;</a>{else}<a  href="#" title="{$smarty.const.normal_user}" style="color:#295700;font-weight:bold;padding:0px 5px;">&nbsp;N&nbsp;</a>{/if}</td>
                            {/if}
                          </tr>      
                    </table>
             </div>               
            <br/>
           
           
 <!-- Enable for Mobile Login,Custom Upload -->   
        <div align="left" style="width:650px;">

                   <span style="font-size:15px;;padding-left:10px;">{$smarty.const.others}
                   <span style="padding-left:380px;">   

          </span></span>
         <div align="center" style="width:650px;border-top:1px solid #ccc;"><br/>  
        <table> 
            <tr>
            <td>     
            <table style="width:280px;text-align:left;border:1px;margin:0px 10px 0px 0px;border:1px solid #ccc;"  >
              <tr style="height:30px;"> 
                <td style="background:#E7E7E7" class="brdtdConn"><b>{$smarty.const.user_mobile_browser_login}</b></td>
                 <td style="background:#E7E7E7" class="brdtdConn">

                                                   <div class="btright" style="margin:5px 12px 10px 0px;">
                                                           <div class="loading" style="display:none;margin:4px 7px 0px 0px;width:45px;"></div>               
                                                         <div class="div-status">
                                                               <input id="chk-usermobile" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/usermanagement_ajax.php?allowmob={$userListdetails['result'][0]['id']} ');" {if isset($userdetails["result"][0]["allow_mobile"]) & $userdetails["result"][0]["allow_mobile"] eq "1"} checked="checked" {/if}  name="chk-usermobile" type="checkbox" value="1" />
                                                              <label for="chk-usermobile">Check-me</label>
                                                         </div>
                                                      </div>
                </td>
              </tr>          
            </table>
           </td>                                                     
           <td>

            <table style="width:280px;text-align:left;border:1px;margin:0px 10px 0px 0px;border:1px solid #ccc;"  >

                <tr style="height:30px;"> 
                <td style="background:#E7E7E7" class="brdtdConn"><b>{$smarty.const.user_pivot_table}</b></td>
                 <td style="background:#E7E7E7" class="brdtdConn">

                                                   <div class="btright" style="margin:5px 12px 10px 0px;">
                                                           <div class="loading" style="display:none;margin:4px 7px 0px 0px;width:45px;"></div>               
                                                         <div class="div-status">
                                                               <input id="chk-customupload" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/usermanagement_ajax.php?customupload={$userListdetails['result'][0]['id']} ');" {if isset($userdetails["result"][0]["allow_mobile"]) & $userdetails["result"][0]["custom_upload"] eq "1"} checked="checked" {/if}  name="chk-customupload" type="checkbox" value="1" />
                                                              <label for="chk-customupload">Check-me</label>
                                                         </div>
                                                      </div>
                </td>
              </tr>          
            </table>         
           </td>
         </tr>
        </table>  
               <br/> 

<!-- Table for File Import details -->
                  {if $filedetails}
                      <div align="left">
                          <span style="font-size:15px;padding-left:5px;">{$smarty.const.file_import}</span></div>
                      <table style="width:620px;text-align:left;border:1px;margin:5px 10px 0px 0px;border:1px solid #ccc;">            
                              <tr> 
                                  <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.file_size}</b></td>
                                  <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.filetype}</b></td>
                                  <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.total_col}</b></td>
                                  <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.total_records}</b></td> 
                                  <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.uploaded_on}</b></td> 

                              </tr>
                              {foreach $filedetails as $key=>$value}
                               <tr>
                                 <td class="dbimptd">{$value['filesize']}</td>                          
                                 <td class="dbimptd">{$value['file_type']}</td>
                                 <td class="dbimptd">{$value['total_column']}</td>                      
                                 <td class="dbimptd">{$value['total_records']}</td>                         
                                 <td class="dbimptd">{$value['uploaded_date']|date_format:'%d-%b-%Y %H:%M:%S'}</td>                         
                              </tr>
                              {/foreach}
                      </table>
                          {else}
                            <table style="width:480px;text-align:left;border:1px;margin:0px 10px 0px 0px;border:1px solid #ccc;">            
                              <tr style="height:25px;"> 
                                   <td style="background:#E7E7E7;" class="brdtdConn" colspan="5"><b>{$smarty.const.file_import}</b></td>
                               </tr>   
                               <tr> 
                                   <td colspan="5" style="text-align:center;font-size:13px;">  
                                       {$smarty.const.customuploadoff}
                                   </td>
                               </tr> 
                             </table>
                          {/if}


              <br/>

<!-- Table for Database Import details -->
              {if count($dbdetails) neq '0'}  
                  <div align="left">
                      <span style="font-size:15px;padding-left:5px;">{$smarty.const.db_import}</span></div>
                     <table style="width:620px;text-align:left;border:1px;margin:5px 10px 0px 0px;border:1px solid #ccc;">                          

                              <tr>                             
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.host}</td>
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.uploaded_on}</td> 
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.total_records}</td>
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.database_type}</td>                             
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.import_db}</td>
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.import_table}</td>                              
                              </tr>
                              {foreach $dbdetails as $key=>$value}
                                   <tr>
                                    <td class="dbimptd">{$value['host']}</td>
                                    <td class="dbimptd">{$value['uploaded_date']|date_format:'%d-%b-%Y %H:%M:%S'}</td>                             
                                    <td class="dbimptd">{$value['total_records']}</td>
                                    <td class="dbimptd">{$value['source_type']}</td>
                                    <td class="dbimptd">{$value['importfrom_db']}</td>
                                    <td class="dbimptd">{$value['import_table']}</td>                      
                                  </tr>
                               {/foreach}
                    </table> 
                   {else} 
                       <table style="width:480px;text-align:left;border:1px;margin:0px 10px 0px 0px;border:1px solid #ccc;">                                         
                           <tr style="height:25px;"> 
                                   <td style="background:#E7E7E7;" class="brdtdConn" colspan="5"><b>{$smarty.const.db_import}</b></td>
                               </tr>   
                               <tr> 
                                   <td colspan="5" style="text-align:center;font-size:13px;">  
                                     {$smarty.const.db_import_msg}
                                    </td>
                              </tr>     
                   </table>
                   {/if} <br/>  
 <!-- Table for uploader tool Import details -->
              {if count($uploadtooldetails) neq '0'}  
                  <div align="left">
                      <span style="font-size:15px;padding-left:5px;">{$smarty.const.uploader_import}</span></div>
                     <table style="width:620px;text-align:left;border:1px;margin:5px 10px 0px 0px;border:1px solid #ccc;">                          

                              <tr>                             
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.upload_server}</td>
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.acc_name}</td>
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.file_name}</td>                             
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.file_size}</td>
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.uploader_upload}</td> 
                                     <td style="background:#E7E7E7;" class="dbimpth"><b>{$smarty.const.status}</td> 
                              </tr>
                              {foreach $uploadtooldetails as $key=>$value}
                                   <tr>
                                    <td class="dbimptd">{$value['server_type']}</td>                                   
                                    <td class="dbimptd">{$value['acc_name']}</td>
                                    
                                    <td class="dbimptd">{$value['file_name']}</td>
                                    <td class="dbimptd">{$value['size']} bytes</td>  
                                     <td class="dbimptd">{$value['uploaded_on']|date_format:'%d-%b-%Y %H:%M:%S'}</td> 
                                     <td class="dbimptd">{$value['status']}</td>
                                  </tr>
                               {/foreach}
                    </table> 
                   {else} 
                       <table style="width:480px;text-align:left;border:1px;margin:0px 10px 0px 0px;border:1px solid #ccc;">                                         
                           <tr style="height:25px;"> 
                                   <td style="background:#E7E7E7;" class="brdtdConn" colspan="5"><b>{$smarty.const.uploader_import}</b></td>
                               </tr>   
                               <tr> 
                                   <td colspan="5" style="text-align:center;font-size:13px;">  
                                     {$smarty.const.uploader_import_msg}
                                    </td>
                              </tr>     
                   </table>
                   {/if} <br/>                    
         </div>
        </div> 
</div>

{literal}
<script>
    $(function () {
    
                    /* BOF :: Edit User POP UP Window   */
                     $('.plinkgenaral').click(function (e) 
                     {                       
                        $.get($(this).prop("href"),function(data){
                           $("#popup_content").append(data);
                           var cheight = $("#popup_content .mainsection").height();

                            if(cheight > 500){
                                cheight = 500;

                                $("#popup_content").css({
                                    'height':'auto'
                                });    
                            }
                         });
                       
                        $("#popup_content").modal({
                              position: ["15%","25%"],
                              minWidth: 600,
                              maxWidth:600
                            });

                       return false;
                    });
                   /* EOF :: Edit User POP UP Window   */
                    
                   /*   BOF :: WEB Reports & Device Reports POP UP Windows  */
                   $('.plinkgenaral1').click(function (e) 
                   {                       
                        $.get($(this).prop("href"),function(data){
                           $("#popup_content").append(data);
                           var cheight = $("#popup_content .mainsection").height();

                            if(cheight > 580){
                                cheight = 580;

                                $("#popup_content").css({
                                    'height':cheight+"px",
                                    "overflow-y" : "scroll"
                                });    
                            }
                         });
                        $("#popup_content").modal({
                              position: ["8%","15%"],
                              minWidth: 900,
                              maxWidth:800
                            });

                       return false;
                   });
                   /*   EOF :: WEB Reports & Device Reports POP UP Windows  */
        
        
        
    });
    
</script>
{/literal}    
{/if}





{if isset($user_list)}    
     <input type="hidden" value="{$baseuserId}" name="baseuserId">
     <table  class="table table-info mb30 assinguser_list">
                    <thead>
                              <tr>
                                  <th>{$smarty.const.user_name}</th>                                                    
                                  <th>Check</th> 
                                  <th>{$smarty.const.user_name}</th>                                                  
                                  <th>Check</th> 
                              </tr>
                    </thead>
                    <tbody>
                                {$colPerRow = 2}
                                  {foreach from=$user_list["result"] name="varuserlist" key=key_ul item=item_ul}
                                           {if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 1}
                                                <tr>
                                              {/if}
                                                   <td style="border-top:0px solid #ccc;">{$item_ul["username"]}</td>                                                              
                                                   <td style="border-top:0px solid #ccc;{if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 1 } border-right:1px solid #ccc; {/if}">
                                                       <input type="radio" name="chkmenulist[]" id="chk_{$smarty.foreach.varuserlist.iteration}" {if $smarty.foreach.varuserlist.index eq '0'} checked="checked" {/if} value="{$item_ul["id"]}">
                                                   </td>
                                            {if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 0}
                                                </tr>
                                            {/if}
                                  {/foreach}                                                   
                   </tbody>                    
        </table> 
    {/if}
