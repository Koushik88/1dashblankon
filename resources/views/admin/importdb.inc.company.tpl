{*
==================================================================
#   Global Basics Inc - Backend	:: Company Management Template   #
==================================================================

    Document       : Company Management Template
    Created on     : 24-06-2016
    Author         : Rubanraj S, Ponnar V
    Description    : DataBase import -Add,Edit,delete And Assign connection String 
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}

{*Database Import Settings - Connection,Manage Connection Form*}
<link rel="stylesheet" type="text/css" href="{$smarty.const.CSSLOCATION}db_import.css" media="screen"/>

<div id="loader1" style="display:none;background-color: #000;position: absolute;z-index: 100;opacity:0.6;filter:alpha(opacity=50);">
                    <table style="width:1000px;height:500px;" border="1">
                        <tr>
                            <td align="center">
                                <img src="{$smarty.const.IMAGESLOCATION}loader7.gif" /><div style="font-size:18px;color:green;font-weight:bold;">
                                <marquee behavior="alternate" direction="left"></marquee></div>
                            </td>
                        </tr>
                    </table>
</div> 

 <div class="alert alert-success" id="ectConn">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong></strong> 
 </div>
 <div class="alert alert-success" id="connMsg">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong></strong> 
  </div>

 {if isset($insertSuccess)}
       <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$insertSuccess}</strong>
       </div>          
 {else if isset($delconnmsg)}            
       <div class="alert alert-success">
           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
           <strong>{$delconnmsg}</strong>
       </div>
 {/if}  
 

<div class="contentpanel">                        
   <div class="row">
      <div class="col-md-12">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                           <h3 class="mypanel-title">{$smarty.const.import_database}</h3>
                    </div>                <!-- mypanel-btns -->
                     <div class="mypanel-body">                            
                        <div class="row"> 
                            
                            <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#manage_conn" data-toggle="tab">{$smarty.const.Manage_conn}</a>
                                    </li>
                                    <li>
                                        <a href="#assign_connection" data-toggle="tab">{$smarty.const.assign_user}</a>
                                    </li>
                            </ul>
        
                                <!-- Tab panes -->
                                <div class="tab-content mb30">
                                    <div class="tab-pane active" id="manage_conn"> 
                                      <form  name="db_creden" id="db_creden">            
                                        <div style="width:100%;text-align:center;"> 
                                                 <label>{$smarty.const.choose_db}&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                                    <div class="inline_radio_btn">
                                                         <input type="radio" class="database_type" id="MySql" name = "database_type" value="MySql" checked>
                                                    </div>                                                    
                                                    <div class="inline_radio_btn"> &nbsp;MySql&nbsp;</div>
                                                    <div class="inline_radio_btn">
                                                         <input type="radio" class="database_type" id="SQLServer" name = "database_type" value="SQL Server">
                                                    </div>
                                                    <div class="inline_radio_btn"> &nbsp;MsSql&nbsp;</div>
                                                    <div class="inline_radio_btn">
                                                         <input type="radio" class="database_type" id="Oracle" name = "database_type" value="Oracle">
                                                    </div>
                                                    <div class="inline_radio_btn"> &nbsp;Oracle</div>
                                        </div>          
                                                <div class="row">
                                                     <div class="col-sm-6">
                                                         <div class="form-group">
                                                             <label class="control-label">{$smarty.const.db_name}</label>
                                                             <input type="text" name="db_name" id="db_name" type="text" {if $conList} value="{$conList['name']}" {else} value="" {/if} required class="form-control" />
                                                         </div><!-- form-group -->
                                                     </div><!-- col-sm-6 -->

                                                     <div class="col-sm-6">
                                                         <div class="form-group">
                                                             <label class="control-label">{$smarty.const.db_host}</label>
                                                             <input type="text" name="db_host" id="db_host" type="text" {if $conList} value="{$conList['host']}" {else} value="" {/if} required class="form-control" />
                                                         </div><!-- form-group -->
                                                     </div><!-- col-sm-6 -->
                                                 </div><!-- row -->
                                                 
                                                 
                                                 <div class="row">
                                                     <div class="col-sm-6">
                                                         <div class="form-group">
                                                             <label class="control-label">{$smarty.const.port}</label>
                                                             <input type="text" name="db_port" id="db_port" type="text" {if $conList} value="{$conList['port']}" {else} value="" {/if} required class="form-control" />
                                                         </div><!-- form-group -->
                                                     </div><!-- col-sm-6 -->

                                                     <div class="col-sm-6">
                                                         <div class="form-group">
                                                             <label class="control-label">{$smarty.const.username}</label>
                                                             <input type="text" name="db_username" id="db_username" type="text" {if $conList} value="{$conList['db_username']}" {else} value="" {/if} required class="form-control" />
                                                         </div><!-- form-group -->
                                                     </div><!-- col-sm-6 -->
                                                 </div><!-- row -->
                                                 
                                                 <div class="row">
                                                     <div class="col-sm-6">
                                                         <div class="form-group">
                                                             <label class="control-label">{$smarty.const.pass_word}</label>
                                                             <input name="db_password" id="db_password" type="password" value="" required  class="form-control" />
                                                         </div><!-- form-group -->
                                                     </div><!-- col-sm-6 -->

                                                     <div class="col-sm-6">
                                                         <div class="form-group">
                                                             <label class="control-label">{$smarty.const.schema_name}</label>
                                                             <input type="text" name="schema_name" id="schema_name" type="text" {if $conList} value="{$conList['schema_name']}" {else} value="" {/if} required class="form-control" />
                                                         </div><!-- form-group -->
                                                     </div><!-- col-sm-6 -->
                                                 </div><!-- row -->
                                                 
                                                 
                                              <input type="hidden" id="username" name="username" value="{$username}">
                                              <input type="hidden" id="userId" name="userId" value="{$userId}">
                                              <input type="hidden" id="activeNum" name="activeNum" value="1">                                 
                                              <input type="hidden" id="db_id" name="db_id" class="db_id" value=""> 
                                                                                            
                                                <div class="row">
                                                    <div class="col-sm-12" align="center">
                                                        <a  id="conFail" href="#" onclick="dbconConformation()" class="btn btn-primary btn-sm" title="Test Connection">Test Connection</a>      
                                                        <a  id="conSuccess" href="#" onclick="dbconConformationList()" class="btn btn-primary btn-sm" title="Save" style="display:none;">Save</a>                                    
                                                        <a  href="{$smarty.const.PORTALLOCATION}admin/companymanagement.php?s=12"  class="btn btn-primary btn-sm" title="Cancel">Cancel</a>
                                                    </div>    
                                                </div>
                                      </form>      
      
  <!--Existing Connections Form -->  
                             <br/>
                              <h5 class="mypanel-title">Stored Connections</h5>
                            <br/>
                                  <div class="table-responsive"> 
                                    {if (count($extConnection) neq '0')}     
                                         <div id="extconnection">
                                             <table class="table table-bordered mb30">
                                                 <thead> 
                                                    <tr>    
                                                        <th>{$smarty.const.db_type}</th>
                                                        <th>{$smarty.const.db_name}</th>
                                                        <th>{$smarty.const.port}</th>                              
                                                        <th>{$smarty.const.username}</th>      
                                                        <th>{$smarty.const.schema}</th>  
                                                        <th>{$smarty.const.created_on}</th> 
                                                        <th>{$smarty.const.action}</th>
                                                    </tr>
                                                 </thead> 
                                            <tbody>    
                                             {foreach $extConnection as $key=>$value}              
                                              {if is_numeric($key)}
                                              <tr>
                                                  <td>{$value['db_type']}</td>
                                                  <td>{$value['con_name']}</td>
                                                  <td>{$value['port']}</td>
                                                  <td>{$value['db_username']}</td>
                                                  <td>{$value['schema_name']}</td> 
                                                  <td>{$value['created_on']}</td>   
                                                  <td>
                                                    <a href="javascript:void(0);" onclick="existingConnection('{$value['id']}','{$value['db_type']}','{$value['con_name']}','{$value['host']}','{$value['port']}','{$value['db_username']}','{$value['schema_name']}')" title="Edit">
                                                        <span class="fa fa-edit"></span>
                                                    </a>                 
                                                    <a href="companymanagement.php?s=12"  onclick="return confirmDeleteConn('{$value['id']}')" class="delhref">
                                                         <span class="glyphicon glyphicon-trash"></span>
                                                    </a>
                                                  </td>
                                               </tr>
                                                {/if}              
                                              {/foreach}
                                            </tbody>
                                             </table>     
                                         </div>
                                     {/if}                 
                                    </div>
                                </div> 
                                                    
                                    <div class="tab-pane" id="assign_connection">
                                       <div class="table-responsive">
                                        <div id="imdb">  
                                            <table class="table table-bordered mb30">
                                                <tr>
                                                    <td  rowspan="2"  valign="top" class="dbimptablebrd">
                                                        <br/>
                                                        <div>
                                                            <input type="text" placeholder="Search User" class="form-control" value=""  id="searchUser" onkeyup="onSearchUser()"/>
                                                           
                                                            <div class="listUser listContent">
                                                                <br/>
                                                                    {foreach $total_users_list as $value name="foreachUser"}
                                                                            <label {if $value['id']|in_array:$assigned_userid}class="assigned"{else} class="unassigned"{/if} id="userLabel{$value['id']}">
                                                                               <table border="0">
                                                                                <tr>
                                                                                <td valign="top"> 
                                                                                <input type="radio"  value='{$value['id']}'  {if $smarty.foreach.foreachUser.index == 0}checked="checked" class="getUser selectedUser" {else} class="getUser"{/if}/>
                                                                                </td>
                                                                                <td>
                                                                                <span class="user" id="{$value['id']}username"><b>{$value['username']}</b></span>
                                                                                <br/>
                                                                                <div class="txtwrap">{$value['email']}</div>
                                                                                 </td>
                                                                                </tr>
                                                                                </table>
                                                                            </label>
                                                                    {/foreach}
                                                                <label id="no-user">
                                                                     <span>User not found</span>
                                                                </label>
                                                            </div>
                                                       </div> 
                                                    </td>
                                                    <td>
                                                       <div class="usageConnCount">
                                                                <div>Available connections for  
                                                                        <strong>
                                                                            <span id="selectedUsername"></span>
                                                                        </strong> user
                                                                </div>
                                                        </div>
                                                        <div class="usageConnCount" style="display:none;">                                  
                                                        <label style="background: #fff;display:none;" class="All-Connstr">All connections<br/><span id="total_conn_str"> {$smarty.cookies.total_connectionstr} </span></label>
                                                        <label style="background: #cde;display:none;" class="Assigned-Connstr">Assigned connections<br/><span id="total_assign_connstr"> 0 </span></label>
                                                        <label style="background: #edf;display:none;" class="Unassigned-Connstr">Un-Assigned connections<br/><span id="total_unassign_conn_str"> 0 </span></label>
                                                    </div>
                                                         <span style="color:#f00e0e;">Limit for each user maximum: 2 </span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top">                      
                                                       <div> 
                                                           <table class = "table table-bordered mb30">
                                                                <tr>
                                                                    <td><b>{$smarty.const.type_of_db}</b></td>
                                                                    <td><b>{$smarty.const.host}</b></td>
                                                                    <td><b>{$smarty.const.username}</b></td> 
                                                                    <td><b>{$smarty.const.schema}</b></td>
                                                                    <td><b>{$smarty.const.action}</b></td>
                                                                </tr>
                                                                    {foreach $connectionstr_result as $value}
                                                                       <tr id='{$value['id']}' class="unassignedConnstr">
                                                                            <td>{$value['db_type']}</td>
                                                                            <td>{$value['con_name']}</td>                                                                       
                                                                            <td>{$value['db_username']}</td> 
                                                                            <td>
                                                                                {$value['schema_name']}
                                                                                <input type="hidden" value='{$value['schema_name']}' id="{$value['id']|cat:'schema'}"/>
                                                                            </td>
                                                                           <td class="brdrConn action" id="{$value['id']|cat:'span'}" onclick=getConnstrId({$value['id']}) >
                                                                               <label class="tick2" title="Un-Assigned"><span style="display:none;">Un-Assigned</span></label>
                                                                           </td>
                                                                        </tr> 
                                                                    {/foreach}
                                                            </table>
                                                       </div> 
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                       </div>                     
                                    </div>
                                </div>
                        </div>
                     </div>
         </div>
      </div>
   </div>
</div>

 <input type="hidden" value="" id="connTimeOut">
                            
{literal}
    
   <script>
        $(function ()
            {
               //Get selected user
                $('.getUser').click(function()
                {
                    $('.selectedUser').removeAttr('checked').removeClass('selectedUser');
                    $(this).addClass('selectedUser').prop('checked','checked');
                    getListofConnection($(this).val());
                    
                });
                 getListofConnection($('.selectedUser').val());
                 
                
                $('.showAll').click(function()
                {
                    $('.assigned').show();
                    $('.unassigned').show();
                    
                });
                $('.showAssigned').click(function()
                {
                    $('.assigned').show();
                    $('.unassigned').hide();
                    
                });
                $('.showUnassigned').click(function()
                {
                    $('.unassigned').show();
                    $('.assigned').hide();
                    
                });
       
         $('.All-Connstr').click(function()
                {
                    $('.assignedConnstr').show();
                    $('.unassignedConnstr').show();
                    
                });
                $('.Assigned-Connstr').click(function()
                {
                    $('.assignedConnstr').show();
                    $('.unassignedConnstr').hide();
                    
                });
                $('.Unassigned-Connstr').click(function()
                {
                    $('.unassignedConnstr').show();
                    $('.assignedConnstr').hide();
                    
                });
              
            
            });
$(".cppDatabase").click(function()
{  
    $(".cppDatabase").removeClass("selectedDb");
    $(this).addClass("selectedDb");  
         var divid = $(this).prop('id'); 
             $(".dbdetails").hide();
             $("#"+divid+'db').show();
             
    
}); 
                
  //Assign/unassign connection String 
     function getListofConnection(user)
     {
        
          $(".assigned").css("background","white");
          $(".unassigned").css("background","white");
          $("#userLabel"+user).css("background-color","#F9DDAE");
           
         var username = $("#"+user+"username").text();             
         $("#selectedUsername").html("<span id='selectedUserame'>"+username+"</span>");
         
        $("label.tick1").addClass('tick2').removeClass('tick1');
        $("label.tick2").prop('title','Click to Assign').html("<span class='no-display'>Un-Assigned</span>"); 
            
         $.ajax({
                  url:'companymanagement.php?s=12',
                  type:'POST',
                  data:{"btn":'listConnectionstr','userid':user},
                  success:listedSuccess,
                  error:function(XMLHttpRequest, textStatus, errorThrown){},
                   completed:function(data,textstatus){alert("completed ===> "+textstatus);}
                });
     }
     var listedSuccess = function getListedConnection(data,textstatus)
     {
        
        var dataObj = jQuery.parseJSON(data);
       
        var userid = dataObj.userid;
       
        var arrayConnectstr = dataObj.connectstr;
        var total_assigned_constr = arrayConnectstr.length;
        $("#total_assign_connstr").html(total_assigned_constr);
        var unassigned_connstr = dataObj.total_connstr - total_assigned_constr;
        $("#total_unassign_conn_str").html(unassigned_connstr);
        
        //user left side panel update
            if(total_assigned_constr > 0)
            {
               $("#userLabel"+userid).prop('class','').addClass('assigned');
                   
            }
            else
            {
              $("#userLabel"+userid).prop('class','').addClass('unassigned'); 
                 
            }
        
        $('.assignedConnstr').addClass('unassignedConnstr').removeClass('assignedConnstr');
        
       if(arrayConnectstr.length > 0)
       {
           
            for(i=0;i<arrayConnectstr.length;i++)
            {
                $("#"+arrayConnectstr[i]).prop('class','').addClass('assignedConnstr');                    
                $("#"+arrayConnectstr[i]+"span").html("<label class='tick1' title='Click to Un-Assign'><span style='color:green;display:none;'>Assigned</span></label>");

            }
       }
       else
       {  
                $('.assignedConnstr').addClass("unassignedConnstr").removeClass("assignedConnstr");
            
       }
        
      
     }
     function getConnstrId(connstrid)
     {
         
         var ActionValue = $("#"+connstrid+"span").text().trim();
         var userid      = $(".selectedUser").val();
         var total_assigned_connstr = $(".Assigned-Connstr>span").text();
         var schema = $("#"+connstrid+"schema").val();
            
         if($(".selectedUser").prop('checked'))
         {     
            
            if(total_assigned_connstr < '2' || ActionValue === 'Assigned')
            {
                        if(ActionValue == 'Assigned')
                        {
                            var confMsg = 'unassign';
                        }
                        else
                        {
                            var confMsg = 'assign';
                        }
                        
                        $.messager.confirm("Confirmation for "+confMsg+ " schema", "Are you sure to " +confMsg+" "+schema+" schema?", function(r){
                            if (r){
                                  $.ajax({
                                        url:'companymanagement.php?s=12',
                                        type:'POST',
                                        data:{"btn":'allowConnPrivilege',"userid":userid,"connstrid":connstrid,"action":ActionValue},
                                        success:function(data)
                                                {
                                   
                                    var dataObj = jQuery.parseJSON(data);
                                    
                                    var userid  = dataObj.userid;
                                    
                                    var arrayConnectstr = dataObj.connectstr;
                                    var total_assigned_constr = arrayConnectstr.length;
                                   
                                   var total_users = $('.showAll > span').text();
                                   var assigned_users_count = dataObj.assigned_users_count;
                                   var unassigned_users_count = total_users - assigned_users_count;
                                      $('.showAssigned >span').html("<span>"+assigned_users_count+"</span>");
                                      $('.showUnassigned >span').html("<span>"+unassigned_users_count+"</span>");
                                   
                                    //user left side panel update
                                        if(total_assigned_constr > 0)
                                        {
                                           $("#userLabel"+userid).prop('class','').addClass('assigned');
                                        }
                                        else
                                        {
                                          $("#userLabel"+userid).prop('class','').addClass('unassigned'); 
                                          
                                        }
                                        
                                    $("#total_assign_connstr").html(total_assigned_constr);
                                    var unassigned_connstr = dataObj.total_connstr - total_assigned_constr;
                                    $("#total_unassign_conn_str").html(unassigned_connstr);
                                    
                                    
                                    if(ActionValue === "Un-Assigned")
                                    {
                                        $("#"+connstrid+"span").html("<label class='tick1' title='Click to Un-Assign'><span style='color:green;display:none;'>Assigned</span></label>");
                                        $("#"+connstrid).prop('class','').addClass('assignedConnstr');
                                    }
                                    else if(ActionValue === "Assigned")
                                    {
                                        $("#"+connstrid+"span").html("<label class='tick2' title='Click to Assign'><span style='color:red;display:none;'>Un-Assigned</span></label>");
                                        $("#"+connstrid).prop('class','').addClass('unassignedConnstr');
                                    }
                                   },
                                error:function(XMLHttpRequest, textStatus, errorThrown){}
                     
                     
                                 });
                              
                            }
                            else
                            {
                                 return false;
                            }
                        });
                
               return false; 
             
             }
             else
             {
                      $.messager.alert('Alert connection limit exceeds!','Exceeded the connection string assign limit. <br/>Please any one connection string unassign then only you can assign.','');
             }
                 
         }
         else
         {
              
                 $.messager.alert('Alert for assign connection!','Please select any one of the listed users!','');
                
         }
       
     }
    //Search for user list     
     function onSearchUser()
     {
        var searchWord = $("#searchUser").val();
        var searchWordLength = searchWord.length;
        
        if(searchWordLength > 0)
        {
            $("#searchUser").addClass('searchIcon');
            $.ajax({
                  url:'companymanagement.php?s=12',
                  type:'POST',
                  data:{"btn":'searchUser','searchChar':searchWord},
                  success:function(data)
                  {
                     var dataObj = jQuery.parseJSON(data);
                     if(dataObj.userids.length > 0)
                     {
                         $('.assigned').hide();
                         $('.unassigned').hide();
                          $("#no-user").hide();
                         for(i=0;i<dataObj.userids.length;i++)
                         {
                            
                             $("#userLabel"+dataObj.userids[i]['id']).show();
                         }
                     }
                     else
                     {
                         $('.assigned').hide();
                         $('.unassigned').hide();
                         $("#no-user").show();
                     }
                      $("#searchUser").removeClass('searchIcon');
                     
                  },
                  error:function(XMLHttpRequest, textStatus, errorThrown){},
                  completed:function(data,textstatus){alert("completed ===> "+textstatus);}
                });
        }
        else
        {
            $('.assigned').show();
            $('.unassigned').show(); 
            $("#no-user").hide();
        }
     }
  $(document).ready(function() {

                        $("#connMsg").hide();
                        $("#ectConn").hide(); // Show content for current tab
                        $("#success").hide();              
});     

//Edit Existing connection list
function existingConnection(id,type,conname,host,port,username,schemaname)
  {
        $(".database_type").prop('checked',false);           
            $("#db_id").val(id);
            var db_type=type.replace(" ","");
            $("#"+db_type).val(type).prop("checked", true);  
            $("#db_host").val(host);
            $("#db_name").val(conname);    
            $("#db_port") .val(port); 
            $("#db_username").val(username);  
            $("#schema_name").val(schemaname);   
             parent.$.modal.close();
  }
function confirmDeleteConn(id)
   {
       var mylink =$(".delhref").prop('href');
           mylink =mylink+'&activeId=0&connId='+id;    
                     
          $.messager.confirm('Confirmation for delete connection','Deletes the selected connection.\n Are you sure to continue?', function(r){
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

//Database import - check connection levels  
function  dbconConformation()
      {   
          $("#success").remove();
          var databaseTypes= $('input[class=database_type]:radio:checked').val();            
          var hostName=$("#db_host").val();           
          var port=$("#db_port").val();
          var userName=$("#db_username").val();  
          var password=$("#db_password").val();          
          var schemaName = $("#schema_name").val();    
          var dbname =$("#db_name").val();    
          
          
             if ($.trim(dbname).length == 0)
             {    
                       
                  $.messager.alert('Alert for test connection','Please Enter valid connection name!','');
                  return false;
                       
             }
            else if ($.trim(hostName).length == 0)
             {    
                 
                  $.messager.alert('Alert for test connection','Please Enter valid host name!','');
                  return false;     
                       
             }
            else if($.trim(port).length == 0)
              {
                  $.messager.alert('Alert for test connection','Please Enter valid port!','');
                  return false;     
                 
               }
             else if($.trim(userName).length == 0)
              {
                  
                  $.messager.alert('Alert for test connection','Please Enter valid username!','');
                  return false;
               }
             else if($.trim(password).length == 0)
              {
                     
                  $.messager.alert('Alert for test connection','Please Enter valid password!','');
                  return false;
              }
            
             else if($.trim(schemaName).length == 0)
              {
                    
                  $.messager.alert('Alert for test connection','Please Enter valid schemaname!','');
                  return false;   
              }     
              else{                   
                  
                    $("#loader1").show();
                    $("#connTimeOut").val(0);
                     setTimeout(function(){ 
                     
                             $.post(portalLocation+controller+"/companymanagement_Ajax.php", {"databaseTypes":databaseTypes,"db_name":dbname,"hostName":hostName,"port":port,"userName":userName,"password":password,"schemaName":schemaName}, function(data){    
                 
                      if(data == 1)
                          {
                                $("#testcon").hide();
                                $("#db_name").prop('readonly','readonly');
                                $("#db_host").prop('readonly','readonly');          
                                $("#db_port").prop('readonly','readonly');
                                $("#db_username").prop('readonly','readonly');  
                                $("#db_password").prop('readonly','readonly');
                                $("#schema_name").prop('readonly','readonly');   
                                $("#database_type").prop('disabled',true);     
                                $("#connMsg").show().html("Connection Tested Successfully!");
                                $("#loader1").fadeOut();                               
                                $("#connMsg").fadeOut(15000); 
                                $("#conFail").hide(); 
                                $("#saveCon").show();    
                                $("#conSuccess").show();  
                                $("#extCon").hide();    
                          
                          }
                          else
                          {
                               $("#connMsg").show().html(data);
                               $("#loader1").fadeOut();
                               $("#connMsg").css('color','red');
                               $("#connMsg").fadeOut(15000);
                               $("#conFail").show();    
                               $("#conSuccess").hide();
                          
                           }    
                            $("#connTimeOut").val(1);
                              
                           });
                            
                        var connTimeOut = $("#connTimeOut").val();
                                if(connTimeOut == '0')
                                 {
                                    $("#loader1").fadeOut();
                                    $("#connMsg").show().html("Connetion Time Out.Contact Administrator!");
                                    $("#connMsg").css('color','red');
                                    $("#connMsg").fadeOut(15000);
                                 }
                        }, 30000);
                    
                    
                               
             }
      } 
 //Database import - check connection levels
 function dbconConformationList()
      {
          var winlink = portalLocation+controller+'/companymanagement.php?s=12';
          var connId  = $("#db_id").val();
          var updateConn = $("#updateCon").val();             
          var username = $("#username").val();
          var userId = $("#userId").val();  
          var active = $("#activeNum").val();
                 
          var databaseType = $('input[class=database_type]:radio:checked').val();  
          var hostName=$("#db_host").val();           
          var port=$("#db_port").val();
          var db_userName=$("#db_username").val();  
          var password=$("#db_password").val(); 
          var schemaName = $("#schema_name").val();
          var dbname = $("#db_name").val();    
            
            if ($.trim(hostName).length == 0)
             {                                    
               alert('Please Enter valid host name!');                    
             }
            else if($.trim(port).length == 0)
              {
                 alert('Please Enter valid Port!');          
              }
             else if($.trim(db_userName).length == 0)
              {
                 alert('Please Enter valid UserName!');          
              }
             else if($.trim(password).length == 0)
              {
                 alert('Please Enter valid Password!');          
              }
                           
              else{
                  
                  $("#connMsg").hide();                 
                  
                     
                                $("#loader1").show();
                                 if(connId.length =='')
                                   {
                                      $.post(portalLocation+controller+"/importData.php", {"databaseType":databaseType,"db_name":dbname,"hostName":hostName,"port":port,"db_userName":db_userName,"password":password,"schemaName":schemaName,"username":username,"userId":userId,"active":active}, function(data){    
                                 
                                        if(data !='0')
                                        { 
                                           window.location =winlink+'&aconn';
                                           $("#loader1").fadeOut(); 
                                        }
                                            else{
                                                 $("#ectConn").show().html("Connetion string already exists !");
                                                      $("#loader1").fadeOut();
                                                      $("#ectConn").fadeOut(15000);  
                                                        
                                                }

                                      });
                                   }
                                   else
                                       {
                                        $.post(portalLocation+controller+"/importData.php", {"databaseType":databaseType,"db_name":dbname,"hostName":hostName,"port":port,"db_userName":db_userName,"password":password,"schemaName":schemaName,"active":active,"connId":connId}, function(data){    
                                          
                                        if(data !='0')
                                        { 
                                          window.location =winlink+'&econn';
                                           $("#loader1").fadeOut(); 
                                        }
                                            else{
                                                    $("#ectConn").show().html("Connetion string already exists !");
                                                       $("#loader1").fadeOut();
                                                      $("#ectConn").fadeOut(15000);                                                          
                                                    
                                                       
                                                }

                                      });
                                     }
                               
                       }
  } 

    
    </script>
{/literal}

                            
