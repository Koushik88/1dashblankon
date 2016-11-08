
{if !isset($loginUserDetail)&& !isset($pageDetails)}

<br/><br/>
<div class="contentpanel">                        
   <div class="row">
      <div class="col-md-12">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="pull-right">
                           <a href = "{$smarty.const.PORTALLOCATION}admin/companymanagement.php?ac&activeId=0" title="Back to Menu"> 
                               <span class="fa fa-arrow-circle-left fa-2x"></span> 
                           </a>
                       </div>
                      <h3 class="mypanel-title">Users</h3>
                   </div>
                   <div class="mypanel-body" style="background: none repeat scroll 0% 0% #EAF3FC;min-height:350px;">                            
                      <div class="table-responsive">  
                       <div class="row">   
                              <div class="col-md-4">
                                <div style="border:1px solid #ccc;background:white;padding:15px 0px 10px 40px;max-height:400px;overflow-y: auto;">
                                    {foreach from = $uselDetail name=list item=namelist}
                                        <div class="login_user_view" id="{$namelist['user_name']|ucfirst}" style='height:47px;border:1px solid #ccc;border-radius:6px;padding-left:10px;display:table-cell;vertical-align:middle;cursor:pointer; width:260px;text-align:center;background-color:#E7E7E7;'>
                                            <input type="radio" {if $smarty.foreach.list.index eq '0'}checked{/if} style="display:none;" class="login_user_chk" id="{$namelist['user_name']|ucfirst}">
                                            
                                            <div style="display:inline-block;width:170px;text-align:left;"><b>{$namelist['user_name']|ucfirst}</b></div>
                                             <div style="display:inline-block;width:40px;" id="{$namelist['user_name']|ucfirst}_img" class="login_user_img">
                                              
                                             </div>
                                           
                                        </div> <br/>
                                    {/foreach}
                                </div>
                            </div>
                            <div class="col-md-8">
                                
                                 <div style="border:1px solid #ccc;background:white;padding-left:10px;max-height:400px;overflow-y: auto;" id="login_userList">
                                     
                                </div>
                            </div> 
                         </div>
                         </div>
                 </div>
            </div>
        </div>
    </div>    
</div>







<!--Remove for side panel right border using mainwrapper class-->     


<script type="text/javascript">
    var tick_icon = "{$smarty.const.EASYUI}";
{literal}
           var className = $('.mainwrapper').attr('class');
           $("."+className).removeClass(className);
           
           
           var chk_id = $(".login_user_chk:checked").attr("id");
           $("#"+chk_id+"_img").html("<img  src='"+tick_icon+"themes/icons/ok.png'> ");
           
            var username = chk_id;
            $.post(portalLocation+"page/loginUserDetail.php",{"username":username},function(data)
                     {       
                         $("#login_userList").html(data);
                     }); 
           
           
           
         $(".login_user_view").click(function()
              {    
                 
                  $(".login_user_img").html("");
                  $("#"+$(this).attr("id")+"_img").html("<img  src='"+tick_icon+"themes/icons/ok.png'> ");
                  
                    var username = $(this).attr("id"); 
                    $.post(portalLocation+"page/loginUserDetail.php",{"username":username},function(data)
                     {       
                         $("#login_userList").html(data);
                     }); 
                  
              });   
           
     function viewPageDetails(id,auto_gen_key)
     {
         $("#generalModal").modal("show");  
         var pageDetails = id;
          $.post(portalLocation+"page/loginUserDetail.php",{"pageDetails":pageDetails,"auto_gen_key":auto_gen_key},function(data)
                     { 
                        $("#generalModalContent").html(data);
                     }); 
         return false;
     }
           
           
           
           
             
           
{/literal}           
</script>
{/if}
    
{if !isset($pageDetails)}
<!-- Assign Reports by Users Popup models-->
<div class="modal fade" id="generalModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
                <div id="generalModalContent">
                    
                </div>   
            </div><!-- modal-content -->
            </div><!-- modal-dialog -->
</div><!-- modal -->
{/if}

{if isset($pageDetails)}

        <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Page View Details</h4>
        </div>
        <div class="modal-body" style="padding-left:50px;">
                <div class="row">
                    <div style="display:inline-table;font-size:15px;width:300px;"><a href="javascript:void(0);"><b>Report Name</b></a></u></div> 
                    <div style="display:inline-table;font-size:15px;"><a href="javascript:void(0)"><b>Spent Time</b></a></div>
                 </div>
            
            {foreach from=$pageDetails name=pageview item=details}
                <div class="row">
                    <div style="display:inline-table;width:300px;padding:10px 0px 0px 5px;font-weight:bold;">{$details['Name']}</div> 
                    <div style="display:inline-table;padding:10px 0px 0px 5px;font-weight:bold;">{$details['Minitus']} </div>
                </div>
            {/foreach}
        </div>
{/if}              
           




 
{if isset($loginUserDetail)}
    <h4>{$chk_user}</h4>
    <div class="table-responsive" style="padding:10px;">
        
           <table class="table table-primary mb30" style="border:1px solid #E7E7E7;">
                  <thead >
                                          <tr>
                                            <th>IP address</th>
                                            <th>Location</th>
                                            <th>Login</th>
                                            <th>Logout</th>
                                            <th>Page View</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                            {foreach from = $loginUserDetail name=list item=namelist}  
                                                <tr>
                                                    <td>{$namelist['ipaddress']}</td>
                                                    <td>{$namelist['location']}</td>
                                                    <td>{$namelist['login']}</td>
                                                    <td>{$namelist['logout']}</td>
                                                    <td align="center">
                                                        <a href="javascript:void(0);" onclick="return viewPageDetails('{$namelist["id"]}','{$namelist["auto_gen_key"]}')"><span class="fa fa-users"></span></a></td>
                                                </tr>
                                             {/foreach}   
                                         </tbody>
                                    </table>
    </div>
{/if}

