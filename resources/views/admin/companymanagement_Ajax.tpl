{*
==================================================================
#  Global Basics Inc  - Backend	:: Company Management Template   #
==================================================================

    Document       : Company Management Template
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Managing the Company, Api and Email Settings
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}


<!-- Load database connections to comapany managemant -->
 {if isset($db_importConn)}     
    <select name="cron_host_id" id="select-search-hide1" class="width300 cron_host_id" onchange="dbConnectionList();">
      {foreach $db_importConn['data'] as $connList}  
        <option value="{$connList['id']}" {if $selectDbConnstrId eq $connList['id']} selected {/if}>{$connList['host']}</option>
      {/foreach}
    </select> 
 {/if}
 
   
{if isset($db_importConnStr)}  
     <input {$disabled_status|default:""} class="input-xlarge focused" name="database_cron_host" id="database_cron_host" type="hidden"  value="{$db_importConnStr['host']}"/>                                                                        
     <input {$disabled_status|default:""} class="input-xlarge focused" name="db_importConn_id" id="db_importConn_id" type="hidden"  value="{$db_importConnStr['id']}"/>                                                                        
           <div class="form-group">
                 <label class="col-sm-3 control-label" for="database_cron_username">{$smarty.const.cron_username}</label>
                         <div class="col-sm-9">
                             <div class="input-group mb15">
                                <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                        <input  class="form-control" name="database_cron_username" id="database_cron_username" type="text"  value="{$db_importConnStr['db_username']}" style="background-color:#E8E8E8;" readonly/>
                             </div>  
                          </div>
            </div>    

           <div class="form-group">
                 <label class="col-sm-3 control-label" for="database_cron_password">{$smarty.const.cron_password}</label>
                      <div class="col-sm-9">
                          <div class="input-group mb15">
                           <span class="input-group-addon"><i class="fa fa-home"></i></span>
                            <input {$disabled_status|default:""}  class="form-control" name="database_cron_password" id="database_cron_password"   type = "password" value="{$db_importConnStr['db_password']}" style="background-color:#E8E8E8;" readonly/>
                          </div>  
                   </div>
           </div>
                                                                
           <div class="form-group">
                 <label class="col-sm-3 control-label" for="database_cron_port">{$smarty.const.cron_server_port}</label>
                   <div class="col-sm-9">
                       <div class="input-group mb15">
                            <span class="input-group-addon"><i class="fa fa-home"></i></span>
                            <input {$disabled_status|default:""} class="form-control" name="database_cron_port" id="database_cron_port" type="text"  value="{$db_importConnStr['port']}"  style="background-color:#E8E8E8;" readonly/>
                       </div>
                   </div>
           </div>
          <div class="form-group">
                  <label class="col-sm-3 control-label" for="cron_database_name">DataBase Name</label>
                     <div class="col-sm-9">
                        <div class="input-group mb15">
                            <span class="input-group-addon"><i class="fa fa-home"></i></span>
                           <input {$disabled_status|default:""}  class="form-control" name="cron_database_name" id="cron_database_name" type="text"  value="{$db_importConnStr['schema_name']}" style="background-color:#E8E8E8;" readonly>
                        </div>     
                   </div>
          </div>
                        
    
{/if}


{literal}
    <script type="text/javascript">
                //jQuery("#select-basic, #select-multi").select2();
                jQuery('#select-search-hide1').select2({
                    minimumResultsForSearch: -1
                });
                
    </script>
{/literal}    