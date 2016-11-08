{*
==================================================================
#   Global Basics Inc - Backend	::  Plugin Template              #
==================================================================

    Document       : Plugin Template
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Using this module for access cloud data and Big data. 
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}

<!-- plugin Module alert Messages-->
{if !isset($assignUser)}

    {if $status eq '2'}
            <div class="alert alert-success">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
               <strong>{$smarty.const.plugin_msg}</strong> 
           </div>
    {/if}
    
    {if isset($pluginConnMsg)}
            <div class="alert alert-success">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
               <strong>{$smarty.const.pluginConnMsg}</strong> 
           </div>
    {/if}
    
    {if $status eq 'condelete'}
         <div class="alert alert-success">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>           
             <div class="success">{$smarty.const.deletePluginmsg}</div>
         </div>
    {/if}
    
    {if $estatus eq '2'}
            <div class="alert alert-danger">
                 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>{$smarty.const.login_msg}</strong> 
            </div>
    {/if}
    {if isset($magentoerror)}
        <div class="alert alert-danger">
                 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>{$magentoerror}</strong> 
        </div>
    {/if}   
    {if $status eq '3'}
        <div class="alert alert-danger">
                 <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>{$smarty.const.server_msg}</strong> 
        </div>
    {/if}
    
    
<!--Plugin Modules -->     
            <div class="col-md-10">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs nav-primary">
                                    <li class="active">
                                        <a href="#google" data-toggle="tab">
                                            <strong>{$smarty.const.general_google_header}</strong>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#bigdata" data-toggle="tab">
                                            <strong>{$smarty.const.general_bigdata_header}</strong>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#other_plugins" data-toggle="tab">
                                            <strong>{$smarty.const.general_othel_plugin}</strong>
                                        </a>
                                    </li>
                                </ul>
        
                                <!-- Tab panes -->
                                <div class="tab-content tab-content-primary mb30">
 <!--Google Plugin Group(Google Analytics,Google Bigquery,Google Gdrive) -->                                   
                                    <div class="tab-pane active" id="google">
                                        <h5 class="nomargin"><strong>Google Plugins</strong></h5>
                                                <br/>                                        
                                                    <div class="mypanel-group" id="accordion">
                                                      <div class="mypanel mypanel-default">
                                                          <div class="mypanel-heading">
                                                              <h4 class="mypanel-title">
                                                                  <a data-toggle="collapse" data-parent="#accordion" href="#collapseGa">
                                                                      {$smarty.const.google_analytics_credentials}
                                                                  </a>
                                                              </h4>
                                                          </div>
<!--Google Analytics Plugins -->                          
                                                            <div id="collapseGa" class="mypanel-collapse collapse">
                                                              <div class="mypanel-body">
                                                                  <div class="row">  
                                                                  <form  method = "post" name="googleanalystics" id="googleanalystics" action="#" >
                                                                    <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>
                                                                    <input name="cred_key" id="cred_key" type="hidden" value="{$gasdata["cred_key"]|default:'0'}"/>
                                                                           <div align="center" style="font-size:13px;margin-bottom:10px;">
                                                                               <a style="color:red" href="http://www.google.com/analytics/" target="_blank">Click here 
                                                                               </a> to go Google Analytics console
                                                                           </div>
                                                                            <div>
                                                                                
                                                                                
                                                                            <div class="col-sm-7">    
                                                                                <div class="form-group">
                                                                                    <label class="control-label" for="ganalytics_username">{$smarty.const.gapi_username}</label>
                                                                                        <input class="form-control" name="ganalytics_username" id="ganalytics_username" type="text" required  value=""/>                                                                                    
                                                                                 </div>
                                                                            </div>    
                                                                          
                                                                            <div class="col-sm-7">             
                                                                            <div class="form-group">
                                                                                <label class="control-label" for="ganalytics_password">{$smarty.const.gapi_password}</label>
                                                                                    <input class="form-control" name="ganalytics_password" id="ganalytics_password" type="password" required value=""/>
                                                                                </div>
                                                                            </div>   
                                                                            
                                                                            <div class="col-sm-7">        
                                                                            <div class=form-group">
                                                                                <label class="control-label" for="ganalytics_profile">{$smarty.const.gprofile_id}</label>
                                                                                
                                                                                    <input class="form-control" name="ganalytics_profile" id="ganalytics_profile" type="text" required value=""/>
                                                                                </div>
                                                                            </div> 

                                                                            <input type="hidden" name="gaConId" id="gaConId" value=""> 
                                                                               
                                                                                    <div class="col-sm-9 col-sm-offset-3" style="padding:10px;">
                                                                                            <button type="submit" name="btn_gprofile" id="btn_gprofile" class="btn btn-primary btn-sm" title="{$smarty.const.save_credentials}">Submit</button>

                                                                                    </div> 
                                                                           </div>   
                                                                </form>
                                                              </div>                              
<!--Google Analytics Plugins Connection List -->                                                                                            
                                                             <div class="row">                             
                                                                    {if $gacred}  
                                                                        <h5><strong>Stored Connections</strong></h5>  
                                                                             <table  class="table table-bordered mb30">
                                                                                    <thead>  
                                                                                     <tr>
                                                                                         <th>{$smarty.const.gapi_username}</a></th>
                                                                                         <th>{$smarty.const.gprofile_id}</th>
                                                                                         <th>{$smarty.const.status}</th>
                                                                                         <th>{$smarty.const.action}</th>                       
                                                                                     </tr>
                                                                                    </thead>
                                                                                <tbody>    
                                                                                {foreach from=$gacred["result"] name="varuserlist" key=key_ul item=item_ul}
                                                                                    {assign var="msg" value="Are you Sure Delete this Connection For \'"|cat:$item_ul["username"]|cat:"\' "}
                                                                                    <tr>
                                                                                     <td>{$item_ul["username"]}</td>                                                            
                                                                                     <td>{$item_ul["profile_id"]}</td>                                                             
                                                                                     <td>
                                                                                     <div align="center">
                                                                                     <div class="loading" style="display:none;margin:4px 0px 0px 5px;width:50px;"></div>
                                                                                            <div class="div-status">
                                                                                                    <input id="chk-{$item_ul["id"]}" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/pluginmanagement.php?gaenable={$item_ul["id"]}','gaenable');" {if $item_ul["active"] == "1"} checked="checked" {/if}  name="chk-{$item_ul["id"]}" type="checkbox" value="1" />
                                                                                                    <label for="chk-{$item_ul["id"]}">Check-me</label>
                                                                                            </div>
                                                                                     </div>               
                                                                                     </td>                                                            

                                                                                     <td align="center">
                                                                                         <a href="#" onclick="editConnectionGa('{$item_ul["id"]}','{$item_ul["username"]}','{$item_ul["password"]}','{$item_ul["profile_id"]}')" title="{$smarty.const.assign_hadoop_con}">
                                                                                             <span class="fa fa-edit"></span>
                                                                                         </a>

                                                                                         <a title="{$smarty.const.delete_hadoop_con}" href="pluginmanagement.php?delgacon&u=" onclick="return deleteConnection('{$msg}','{$item_ul["id"]}');" class="delgahref">
                                                                                             <span class="glyphicon glyphicon-trash"></span>
                                                                                         </a>
                                                                                        <a href="javascript:void(0);" title="Assign Users" class="assignReports" onclick="return assignPluginCreden('{$item_ul["id"]}','ga')">
                                                                                            <span class="fa fa-users"></span>
                                                                                        </a> 
                                                                                     </td>
                                                                                     </tr>
                                                                                {/foreach}
                                                                                </tbody>   
                                                                            </table> 
                                                                          {/if}
                                                              </div>
                                                             </div> 
                                                          </div>
                                                      </div><!-- mypanel -->
 <!--Google Bigquery Plugins -->                                                     

                                                      <div class="mypanel mypanel-default">
                                                          <div class="mypanel-heading">
                                                              <h4 class="mypanel-title">
                                                                  <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseBQ">
                                                                     {$smarty.const.google_big_query} 
                                                                  </a>
                                                              </h4>
                                                          </div>
                                                          <div id="collapseBQ" class="mypanel-collapse collapse">
                                                              <div class="mypanel-body">
                                                               <div class="row">   
                                                                <form method = "post" name="bigqueryapi" id="bigqueryapi" action="pluginmanagement.php?" >
                                                                            <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>
                                                                            <input name="cred_key" id="cred_key" type="hidden" value="{$bqdata["cred_key"]|default:'0'}"/>
                                                                             
                                                                                    <div class="col-sm-5">
                                                                                       <div class="form-group"> 
                                                                                        <label class="control-label" for="bigquery_username">{$smarty.const.user_name}</label>
                                                                                            <input class="form-control" name="bigquery_username" id="bigquery_username" type="text" required value=""/>
                                                                                      </div>
                                                                                    </div>
                                                                                            
                                                                                    <div class="col-sm-5">
                                                                                        <div class="form-group">
                                                                                        <label class="control-label"  for="bigquery_password">{$smarty.const.step_authentication_password}</label>
                                                                                            <input class="form-control" name="bigquery_password" id="bigquery_password" type="password" value="" {if !isset($bqdata["password"])}required{/if}/>
                                                                                        </div>
                                                                                    </div>
                                                                           
                                                                                    <div class="col-sm-5">
                                                                                        <div class="form-group"> 
                                                                                        <label class="control-label" for="bigquery_auth_key">{$smarty.const.bq_auth_key}</label>
                                                                                            <input class="form-control" name="bigquery_auth_key" id="bigquery_auth_key" type="text" required value=""/>
                                                                                        </div>
                                                                                    </div>  
                                                                                            
                                                                                   <div class="col-sm-5">
                                                                                        <div class="form-group">
                                                                                         <label class="control-label" for="bigquery_project_id">{$smarty.const.bq_project_id}</label>
                                                                                            <input class="form-control" name="bigquery_project_id" id="bigquery_project_id" type="text" required value=""/>
                                                                                           </div>
                                                                                    </div>  
                                                          
                                                                                     <div class="col-sm-5">
                                                                                      <div class="form-group">  
                                                                                        <label class="control-label" for="bigquery_dataset">{$smarty.const.bq_dataset}</label>
                                                                                            <input class="form-control" name="bigquery_dataset" id="bigquery_dataset" type="text" required value=""/>
                                                                                        </div>
                                                                                    </div> 

                                                                                     <div class="col-sm-5">
                                                                                         <div class="form-group">  
                                                                                            <label class="control-label" for="bigquery_table">{$smarty.const.bq_table}</label>
                                                                                            <input class="form-control" name="bigquery_table" id="bigquery_table" type="text" required value=""/>
                                                                                        </div>
                                                                                    </div>
                                                                                        
                                                                                  <input type="hidden" id="BQ_Conn_id" name="BQ_Conn_id" value="">

                                                                                    <div class="col-sm-10"  align="center">
                                                                                            <button type="submit" name="btn_bq_profile" id="btn_bq_profile" class="btn btn-primary btn-sm" title="{$smarty.const.save_credentials}">Submit</button>

                                                                                    </div>   
                                                                                  </form>
                                                                     </div>   
<!--Google  Bigquery Plugin Connection List-->                                                       
                                                                           <div class="row">                  
                                                                            {if $bigqueryCred}  
                                                                                <h5><strong>Stored Connections</strong></h5>  
                                                                                <table  class="table table-bordered mb30" cellpadding="2">
                                                                                <thead> 
                                                                                   <tr>
                                                                                       <th>{$smarty.const.gapi_username}</a></th>
                                                                                       <th>{$smarty.const.bq_dataset}</th>
                                                                                       <th>{$smarty.const.bq_table}</th>
                                                                                       <th>{$smarty.const.status}</th>
                                                                                       <th>{$smarty.const.action}</th>                       
                                                                                   </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                   {foreach from=$bigqueryCred["result"] name="varuserlist" key=key_ul item=item_ul}

                                                                                       {assign var="msg" value="Are you Sure Delete this Connection For \'"|cat:$item_ul["user_name"]|cat:"\' "}

                                                                                       <tr>
                                                                                        <td>{$item_ul["user_name"]}</td>                                                            
                                                                                        <td>{$item_ul["dataset"]}</td>    
                                                                                        <td>{$item_ul["table_name"]}</td>
                                                                                        <td>
                                                                                        <div>
                                                                                        <div class="loading" style="display:none;"></div>
                                                                                               <div class="div-status">
                                                                                                       <input id="chk-bq{$item_ul["id"]}" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/pluginmanagement.php?bqenable={$item_ul["id"]}','bqenable');" {if $item_ul["active"] == "1"} checked="checked" {/if}  name="chk-{$item_ul["id"]}" type="checkbox" value="1" />
                                                                                                       <label for="chk-bq{$item_ul["id"]}">Check-me</label>
                                                                                               </div>
                                                                                        </div>               
                                                                                        </td>                                                          

                                                                                        <td align="center">
                                                                                            <a href="#" onclick="editConnectionBQ('{$item_ul["id"]}','{$item_ul["user_name"]}','{$item_ul["password"]}','{$item_ul["profile_id"]}','{$item_ul["auth_key"]}','{$item_ul["dataset"]}','{$item_ul["table_name"]}')" title="{$smarty.const.assign_hadoop_con}">
                                                                                                <span class="fa fa-edit"></span>
                                                                                            </a>
                                                                                            <a  title="{$smarty.const.delete_hadoop_con}" href="pluginmanagement.php?delBQCon&u=" onclick="return deleteBQConnection('{$msg}','{$item_ul["id"]}');" class="delBQConn">
                                                                                                <span class="glyphicon glyphicon-trash"></span>
                                                                                            </a>
                                                                                            <a href="javascript:void(0);" title="Assign Users" class="assignReports" onclick="return assignPluginCreden('{$item_ul["id"]}','bigquery')">
                                                                                                 <span class="fa fa-users"></span>
                                                                                            </a> 
                                                                                        </td>
                                                                                        </tr>

                                                                                   {/foreach}
                                                                                </tbody> 
                                                                               </table> 
                                                                               {/if}        
                                                                          </div>
                                                              </div>
                                                          </div>               
                                                         
                                                      </div><!-- mypanel -->
<!--Google Gdrive Plugins Module -->
                                                      <div class="mypanel mypanel-default">
                                                          <div class="mypanel-heading">
                                                              <h4 class="mypanel-title">
                                                                  <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseGdrive">
                                                                       {$smarty.const.grdive_credentials} 
                                                                  </a>
                                                                    <div class="pull-right">
                                                                          <div class="div-status">
                                                                             <input id="chk-gdrive" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/pluginmanagement.php?gdrive','gdrive');" {if $gddata["active"] == "1"} checked="checked" {/if}  name="chk-gdrive" type="checkbox" value="1" />
                                                                             <label for="chk-gdrive">Check-me</label>
                                                                          </div>
                                                                    </div>
                                                              </h4>
                                                          </div>
                                                          <div id="collapseGdrive" class="mypanel-collapse collapse">
                                                              <div class="mypanel-body">
                                                                  <form  method = "post" name="gdriveapi" id="gdriveapi" action="#" >
                                                                        <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>
                                                                        <input name="cred_key" id="cred_key" type="hidden" value="{$gddata["cred_key"]|default:'0'}"/>
                                                                        
                                                                          <div align="center"><a style="color:red"href="https://code.google.com/apis/console/" target="_blank">Click here </a> to go Gdrive api console</div>
                                                                           <div class="row">
                                                                               
                                                                            <div class="col-sm-5">
                                                                                <div class="form-group">
                                                                                <label class="control-label" for="gd_clientid">{$smarty.const.client_id}</label>
                                                                                    <input class="form-control" name="gd_clientid" id="gd_clientid" type="text" required value="{$gddata["miscdata"]["gd_clientid"]|default:''}"/>
                                                                                </div>
                                                                            </div>
                                                                                
                                                                            <div class="col-sm-5">
                                                                                <div class="form-group">  
                                                                                <label class="control-label" for="gd_clientsecret">{$smarty.const.client_secret}</label>
                                                                                    <input class="form-control" name="gd_clientsecret" id="gd_clientsecret" type="text" required value="{$gddata["miscdata"]["gd_clientsecret"]|default:''}"/>
                                                                                </div>
                                                                            </div>
                                                                                
                                                                             <div class="col-sm-5">
                                                                                 <div class="form-group">  
                                                                                <label class="control-label" for="gd_redirecturi">{$smarty.const.redirect_uri}</label>
                                                                                    <input class="form-control" name="gd_redirecturi" id="gd_redirecturi" type="text" required value="{$gddata["miscdata"]["gd_redirecturi"]|default:''}"/>
                                                                                </div> 
                                                                             </div>  
                                                                                
                                                                             <div class="col-sm-5">
                                                                                <div class="form-group"> 
                                                                                <label class="control-label" for="gd_scope">{$smarty.const.scope}</label>
                                                                               <input class="form-control" name="gd_scope" id="gd_scope" type="text" required value="{$gddata["miscdata"]["gd_scope"]|default:''}"/>
                                                                             </div>
                                                                             </div>
                                                                             
                                                                             <div class="col-sm-5">
                                                                               <div class="form-group">
                                                                                <label class="control-label" for="gd_token">{$smarty.const.oauth_token}</label>
                                                                                    <input class="form-control" name="gd_token" id="gd_token" type="text" required value="{$gddata["miscdata"]["gd_token"]|default:''}"/>
                                                                             </div>
                                                                             </div>
                                                                             
                                                                             
                                                                             <div class="col-sm-5">
                                                                               <div class="form-group">  
                                                                                <label class="control-label" for="gd_token">{$smarty.const.api_key}</label>
                                                                                    <input class="form-control" name="api_key" id="api_key" type="text" required value="{$gddata["miscdata"]["api_key"]|default:''}"/>
                                                                             </div>
                                                                             </div>
                                                                            
                                                                           <div class="row">     
                                                                            <div class="col-sm-10" align="center">
                                                                                    <button type="submit" name="btn_gdprofile" id="btn_fbprofile" class="btn btn-primary btn-sm" title="{$smarty.const.save_credentials}">Submit</button>
                                                                            </div>      
                                                                            </div>
                                                                           </div>
                                                                    </form>
                                                              </div>
                                                          </div>
                                                      </div><!-- mypanel -->                                    
                                                  </div><!-- mypanel-group -->
                                    </div><!-- tab-pane -->
                                    
<!--Big Data plugins Group(Haddop Hive,Mongo DB) -->                                  
                                    <div class="tab-pane" id="bigdata">
                                        <h5 class="nomargin"><strong>BigData Plugins</strong></h5>
                                        <br/>
                                        <div class="mypanel-group" id="accordion2">
<!--Big data - Hadoop Plugins Module -->                                            
                                                    <div class="mypanel mypanel-default">
                                                        <div class="mypanel-heading">
                                                            <h4 class="mypanel-title">
                                                                <a data-toggle="collapse" data-parent="#accordion2" href="#collapseHadoop">
                                                                  {$smarty.const.hadoophive}
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseHadoop" class="mypanel-collapse collapse">
                                                            <div class="mypanel-body">
                                                               <div class="row"> 
                                                                <form method = "post" name="hadoop-creden" id="hadoop-creden" action="#" >                                            
                                                                           <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>                                                
                                                                                                                              
                                                                           <div class="col-sm-5">
                                                                               <div class="form-group">  
                                                                                <label class="control-label" for="nickname">{$smarty.const.hadoop_name}</label>
                                                                                 <input class="form-control" name="nickname" id="nickname" type="text" required value=""/>
                                                                                </div>
                                                                            </div>
                                                                                
                                                                            <div class="col-sm-5">
                                                                                <div class="form-group">
                                                                                <label class="control-label" for="hostname">{$smarty.const.haddop_host}</label>
                                                                                    <input class="form-control" name="hostname" id="hostname" type="text" required value=""/>
                                                                                </div>
                                                                            </div>
                                                                                
                                                                                
                                                                            <div class="col-sm-5">
                                                                               <div class="form-group"> 
                                                                                <label class="control-label" for="portno">{$smarty.const.hadoop_port}</label>                                                                                
                                                                                    <input class="form-control" name="portno" id="portno" type="text" required value=""/>
                                                                                </div>
                                                                            </div>   
                                                                                    
                                                                             <div class="col-sm-5">
                                                                               <div class="form-group">  
                                                                                <label class="control-label" for="tablename">{$smarty.const.haddop_table}</label>
                                                                                    <input class="form-control" name="tablename" id="tablename" type="text" required value=""/>
                                                                                </div> 
                                                                             </div> 
                                                                           
                                                                           <div class="row">         
                                                                              <input type="hidden" id="hadoopconId" name="hadoopconId" value="">    
                                                                            <div class="col-sm-10" align="center">
                                                                                    <button type="submit" name="btn_hadoopcreden" id="btn_hadoopcreden" class="btn btn-primary btn-sm" title="{$smarty.const.save_credentials}"  onclick="return credenValidation();">Submit</button>
                                                                            </div>
                                                                           </div>  
                                                                    </form>
                                                            </div>
<!--Hadoop Plugins Connection List -->                                    
                                                  <div class="row">                
                                                                {if $hadoopcred}
                                                                    <h5><strong>Stored Connections</strong></h5>  
                                                                     <table  class="table table-bordered mb30">
                                                                                <thead>
                                                                                           <tr>
                                                                                               <th>{$smarty.const.hadoop_name}</th>
                                                                                               <th>{$smarty.const.port}</th>                                                            
                                                                                               <th>{$smarty.const.haddop_table}</th>
                                                                                               <th>{$smarty.const.status}</th>                                                                                               
                                                                                               <th>{$smarty.const.action}</th>                       
                                                                                           </tr>
                                                                                </thead>            
                                                                                <tbody>
                                                                                    {foreach from=$hadoopcred["result"] name="varuserlist" key=key_ul item=item_ul}

                                                                                        {assign var="msg" value="Are you Sure Delete this Connection For \'"|cat:$item_ul["hadoop_name"]|cat:"\' "}

                                                                                        <tr>
                                                                                         <td>{$item_ul["hadoop_name"]}</td>
                                                                                         <td>{$item_ul["port"]}</td>
                                                                                         <td>{$item_ul["table_name"]}</td>                                                             
                                                                                         <td>
                                                                                         <div align="center">
                                                                                         <div class="loading" style="display:none;margin:4px 0px 0px 5px;width:50px;"></div>
                                                                                                <div class="div-status">
                                                                                                        <input id="chk-{$item_ul["id"]}" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/pluginmanagement.php?hadoopenable={$item_ul["id"]}','hadoopenable');" {if $item_ul["active"] == "1"} checked="checked" {/if}  name="chk-{$item_ul["id"]}" type="checkbox" value="1" />
                                                                                                        <label for="chk-{$item_ul["id"]}">Check-me</label>
                                                                                                </div>
                                                                                         </div>               
                                                                                         </td>
                                                                                         <td align="center"> 
                                                                                             <a href="javascript:void(0);" onclick="editHadoopConnection('{$item_ul["id"]}','{$item_ul["host"]}','{$item_ul["port"]}','{$item_ul["table_name"]}','{$item_ul["hadoop_name"]}')" title="{$smarty.const.assign_hadoop_con}">
                                                                                                 <span class="fa fa-edit"></span>
                                                                                             </a>

                                                                                             <a style="margin-left:5px;" title="{$smarty.const.delete_hadoop_con}" href="pluginmanagement.php?dhcon&u=" onclick="return deleteHadoopConnection('{$msg}','{$item_ul["id"]}');" class="delHadoopConn">
                                                                                                 <span class="glyphicon glyphicon-trash"></span>    
                                                                                             </a>
                                                                                                 
                                                                                             <a href="javascript:void(0);" title="Assign Users" class="assignReports" onclick="return assignPluginCreden('{$item_ul["id"]}','hadoop')">
                                                                                                        <span class="fa fa-users"></span>
                                                                                             </a>
                                                                                         </td>
                                                                                         </tr>

                                                                                    {/foreach}
                                                                                </tbody>
                                                                                </table> 
                                                                        {/if}                     
                                                            </div>                  
                                                        </div>
                                                    </div><!-- mypanel -->
                                                    </div> 
<!-- Big Data - MongoDB Plugin Module -->
                                                    <div class="mypanel mypanel-default">
                                                        <div class="mypanel-heading">
                                                            <h4 class="mypanel-title">
                                                                <a data-toggle="collapse" class="collapsed" data-parent="#accordion2" href="#collapseMongo">
                                                                   {$smarty.const.mongoDb}
                                                                </a>
                                                            </h4>
                                                        </div>
                                                        <div id="collapseMongo" class="mypanel-collapse collapse">
                                                            <div class="mypanel-body">
                                                                <form method = "post" name="mongoDb-creden" id="mongoDb-creden" action="#" >  
                                                                        <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>
                                                                        <input name="cred_key" id="cred_key" type="hidden" value="{$mongoDBdata["cred_key"]|default:'0'}"/>
                                                                    
                                                                       <div class="row">
                                                                            <div class="col-sm-5">
                                                                              <div class="form-group">  
                                                                                <label class="control-label" for="mongoDbName">{$smarty.const.name}</label>
                                                                                    <input class="form-control" name="mongoDbName" id="mongoDbName" type="text" required value=""/>
                                                                                </div>
                                                                            </div>   
                                                                                
                                                                           <div class="col-sm-5">
                                                                              <div class="form-group"> 
                                                                                <label class="control-label" for="mongoDbUrl">{$smarty.const.mongoDb_url}</label>                                                                               
                                                                                    <input class="form-control" name="mongoDbUrl" id="mongoDbUrl" type="text" required value=""/>
                                                                                </div>
                                                                            </div>
                                                                                    
                                                                            <div class="col-sm-5">
                                                                                <div class="form-group">  
                                                                                <label class="control-label" for="mongo_database">{$smarty.const.mongoDB_database}</label>
                                                                                    <input class="form-control" name="mongo_database" id="mongo_database" type="text" required value=""/>
                                                                                </div>
                                                                            </div>
                                                                                    
                                                                            <div class="col-sm-5">
                                                                                <div class="form-group">  
                                                                                <label class="control-label" for="mongoDb_collection">{$smarty.const.mongoDB_collection}</label>
                                                                                    <input class="form-control" name="mongoDb_collection" id="mongoDb_collection" type="text" required value=""/>
                                                                                </div>
                                                                            </div>    
                                                                       </div>
                                                                                    
                                                                        <div class="row">             
                                                                           <input type="hidden" id="mongo_Conn_id" name="mongo_Conn_id" value="">  
                                                                            <div class="col-sm-10" align="center">
                                                                                    <button type="submit" name="btn_mangocreden" id="btn_mangocreden" class="btn btn-primary btn-sm" title="{$smarty.const.save_credentials}">Submit</button>
                                                                            </div>
                                                                        </div>
                                                                            
 <!--Mongo DB Plugin Connection List -->                                                                           
                                                                       <div class="row">     
                                                                          {if $mongocred}  
                                                                            <h5>Stored Connections</h5>  
                                                                                 <table  class="table table-bordered mb30">
                                                                                     <thead>
                                                                                        <tr>
                                                                                            <th align="center">{$smarty.const.name}</th>                                                            
                                                                                            <th align="center">{$smarty.const.mango_db}</th>                                                            
                                                                                            <th align="center">{$smarty.const.mango_collection}</th>
                                                                                            <th align="status">{$smarty.const.status}</th>                                                           
                                                                                            <th align="center">{$smarty.const.action}</th>                       
                                                                                        </tr>
                                                                                     </thead>   
                                                                                     <tbody>
                                                                                        {foreach from=$mongocred["result"] name="varuserlist" key=key_ul item=item_ul}

                                                                                            {assign var="msg" value="Are you Sure Delete this Connection For \'"|cat:$item_ul["url"]|cat:"\' "}

                                                                                            <tr>
                                                                                             <td>{$item_ul["name"]}</td>
                                                                                             <input type="hidden" value='{$item_ul["url"]}' id="{$item_ul["id"]|cat:'plugin'}"/>
                                                                                             <td>{$item_ul["mango_database"]}</td>
                                                                                             <td>{$item_ul["members"]}</td>                                                             
                                                                                             <td>
                                                                                             <div align="center">
                                                                                             <div class="loading" style="display:none;margin:4px 0px 0px 5px;width:50px;"></div>
                                                                                                    <div class="div-status">
                                                                                                            <input id="chk-{$item_ul["id"]}" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/pluginmanagement.php?mongoenable={$item_ul["id"]}','mongoenable');" {if $item_ul["active"] == "1"} checked="checked" {/if}  name="chk-{$item_ul["id"]}" type="checkbox" value="1" />
                                                                                                            <label for="chk-{$item_ul["id"]}">Check-me</label>
                                                                                                    </div>
                                                                                             </div>               
                                                                                             </td>

                                                                                             <td align="center">
                                                                                                 <a href="javascript:void(0);" onclick="editMongoConnection('{$item_ul["id"]}','{$item_ul["name"]}','{$item_ul["url"]}','{$item_ul["mango_database"]}','{$item_ul["members"]}')" title="{$smarty.const.assign_hadoop_con}">
                                                                                                     <span class="fa fa-edit"></span>
                                                                                                 </a>
                                                                                                 <a  title="{$smarty.const.delete_hadoop_con}" href="pluginmanagement.php?delMoncon&u=" onclick="return deleteMongoConnection('{$msg}','{$item_ul["id"]}');" class="delMongoConn">
                                                                                                     <span class="glyphicon glyphicon-trash"></span>
                                                                                                 </a>
                                                                                                 <a href="javascript:void(0);" title="Assign Users" class="assignReports" onclick="return assignPluginCreden('{$item_ul["id"]}','mongoDB')">
                                                                                                     <span class="fa fa-users"></span>
                                                                                                </a>    
                                                                                                 
                                                                                             </td>
                                                                                             </tr>
                                                                                        {/foreach}
                                                                                        </tbody>  
                                                                                    </table> 
                                                                                {/if}
                                                                       </div>  
                                                                   </form>                 
                                                            </div>
                                                        </div>
                                                    </div><!-- mypanel -->
                                             </div>      
                                    </div><!-- tab-pane -->
<!--Others Plugin Group -->                                    
                                  
                                    <div class="tab-pane" id="other_plugins">
                                        <h5 class="nomargin"><strong>Other Plugins</strong></h5>
                                        <br/>
                                         <div class="mypanel-group" id="accordion3">
<!--Ms SkyDrive Plugin Modules-->                                             
                                            <div class="mypanel mypanel-default">
                                                <div class="mypanel-heading">
                                                    <h4 class="mypanel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion3" href="#collapseSkydrive">
                                                           MS Skydrive
                                                        </a>
                                                       <div class="pull-right"> 
                                                            <div class="div-status">
                                                                 <input id="chk-skydrive" class="chk-status" onchange="changeStatus(this,'{$smarty.const.PORTALLOCATION}admin/pluginmanagement.php?skydrive','skydrive');" {if $skydrive["active"] == "1"} checked="checked" {/if}  name="chk-skydrive" type="checkbox" value="1" />
                                                                 <label for="chk-skydrive">Check-me</label>
                                                            </div>
                                                       </div>      
                                                    </h4>
                                                </div>
                                                <div id="collapseSkydrive" class="mypanel-collapse collapse">
                                                    <div class="mypanel-body">
                                                           <form  method = "post" name="skydrive" id="skydrive" action="#" >
                                                                <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>
                                                                <input name="cred_key" id="cred_key" type="hidden" value="{$skydata["cred_key"]|default:'0'}"/>
                                                               
                                                                <div align="center" style="font-size:13px;margin-bottom:10px;">
                                                                    <a style="color:red" href="https://manage.dev.live.com/Applications/Index" target="_blank">Click here </a> to go Skydrive api console
                                                                </div>
                                                                
                                                                    <div class="col-sm-7">
                                                                      <div class="form-group">  
                                                                        <label class="control-label" for="sky_clientid">{$smarty.const.client_id}</label>
                                                                            <input class="form-control" name="sky_clientid" id="sky_clientid" type="text" required value="{$skydata["miscdata"]["sky_clientid"]|default:''}"/>
                                                                        </div>
                                                                    </div>
                                                                        
                                                                    <div class="col-sm-7">
                                                                       <div class="form-group"> 
                                                                        <label class="control-label" for="sky_clientsecret">{$smarty.const.client_secret}</label>
                                                                            <input class="form-control" name="sky_clientsecret" id="sky_clientsecret" type="text" required value="{$skydata["miscdata"]["sky_clientsecret"]|default:''}"/>
                                                                        </div>
                                                                    </div>   
                                                                        
                                                                     <div class="col-sm-7">
                                                                       <div class="form-group">  
                                                                        <label class="control-label" for="sky_redirecturi">{$smarty.const.redirect_uri}</label>
                                                                            <input class="form-control" name="sky_redirecturi" id="sky_redirecturi" type="text" required value="{$skydata["miscdata"]["sky_redirecturi"]|default:''}"/>
                                                                        </div> 
                                                                     </div> 
                                                                        
                                                                         
                                                                 <div class="row">                    
                                                                                <div class="col-sm-7" align="center">
                                                                                        <button type="submit" name="btn_skyprofile" id="btn_skyprofile" class="btn btn-primary btn-sm" title="{$smarty.const.save_credentials}">Submit</button>
                                                                                </div>
                                                                 </div>
                                                         </form>
                                                    </div>
                                                </div>
                                            </div><!-- mypanel -->
<!-- Magento Server Plugin Modules -->
                                            <div class="mypanel mypanel-default">
                                                <div class="mypanel-heading">
                                                    <h4 class="mypanel-title">
                                                        <a data-toggle="collapse" class="collapsed" data-parent="#accordion3" href="#collapseMagento">
                                                           {$smarty.const.magento_creden}
                                                        </a>
                                                    </h4>
                                                </div>
                                                <div id="collapseMagento" class="mypanel-collapse collapse">
                                                    <div class="mypanel-body">
                                                        <form  method = "post" name="magento" id="magento" action="#" >
                                                                <input name="company_id" id="company_id" type="hidden" value="{$companydetails["result"][0]["id"]|default:'0'}"/>
                                                                <input name="cred_key" id="cred_key" type="hidden" value="{$magentodata["cred_key"]|default:'0'}"/>
                                                                
                                                                <div class="row">       
                                                                    
                                                                    <div class="col-sm-7">
                                                                        <div class="form-group">
                                                                        <label class="control-label" for="magento_username">{$smarty.const.magento_username}</label>
                                                                            <input class="form-control" name="magento_username" id="magento_username" type="text" required value="{$magentodata["username"]}"/>
                                                                        </div>
                                                                    </div>
                                                                        
                                                                    <div class="col-sm-7">
                                                                        <div class="form-group">
                                                                        <label class="control-label" for="magento_password">{$smarty.const.magento_password}</label>
                                                                            <input class="form-control" name="magento_password" id="magento_password" type="text" required value="{$magentodata["decrypt_password"]}"/>
                                                                        </div>
                                                                    </div>    
                                                                     
                                                                    <div class="col-sm-7">
                                                                        <div class="form-group">
                                                                        <label class="control-label" for="magento_uri">{$smarty.const.magento_Path}</label>
                                                                            <input class="form-control" name="magento_uri" id="magento_uri" type="text" required value="{$magentodata["miscdata"]["magento_uri"]|default:''}"/>
                                                                        </div> 
                                                                     </div> 
                                                                        
                                                                </div>
                                                                        
                                                               <div class="row">        
                                                                    <div class="col-sm-7" align="center"> 
                                                                            <button type="submit" name="btn_magentoprofile" id="btn_magentoprofile" class="btn btn-primary btn-sm" title="{$smarty.const.save_credentials}" {if isset($mobileuser)}disabled{/if}>{$smarty.const.run_now}</button>
                                                                    </div>
                                                              </div>
                                                             </form>
                                                    </div>
                                                </div>
                                              </div><!-- mypanel -->
                                             </div>
                                            </div><!-- tab-pane -->
                                </div><!-- tab-content -->                   
              </div><!-- col-md-6 -->
                            
                            
<script type="text/javascript">
               {literal}
                   
// Crdential Enable/Disable Funtion Using Ajax loader                          
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
//Google Analytics Edit Connection Module                
                function editConnectionGa(id,username,password,profile_id)
                {
                    $("#gaConId").val(id);
                     $("#ganalytics_username").val(username);
                      $("#ganalytics_password").val(password);
                      $("#ganalytics_profile").val(profile_id);
                } 
 // Google Analytics Edit Connection Module               
                 function deleteConnection(msg,connid)
                    {   
                        
                        var dellink =$(".delgahref").prop('href');
                         dellink = dellink + ''+connid;    
                     
                        $.messager.confirm('Confirmation for delete connection',msg, function(r){
                              if (r)
                              {
                                  window.location =dellink;
                              }
                              else
                              {
                                  return false;
                              }
                         });
                    
                        return false;
                    } 
//Plugins Connection Assigned for user wise Module                    
               function assignPluginCreden(connId,plugin_type)
               {
                   $("#assignPlugin").modal("show");
                   $.get(portalLocation+controller+'/pluginmanagement.php',{"plugin_type":plugin_type,"connId":connId,"popup":"popup"},function(data)
                    { 
                        $("#assignUserModule").html(data);
                    });
                  return false;
               }
//Google Bigquery Edit Connection Module               
               function editConnectionBQ(id,username,password,profile_id,auth_key,dataset,table_name)
                {
                     $("#BQ_Conn_id").val(id);
                     $("#bigquery_username").val(username);
                     $("#bigquery_password").val(password);
                     $("#bigquery_project_id").val(profile_id);
                     $("#bigquery_auth_key").val(auth_key);
                     $("#bigquery_dataset").val(dataset);   
                     $("#bigquery_table").val(table_name);       

                } 
//Google Biquery Delete Connection Module                                       
                function deleteBQConnection(msg,connid)
                {
                    var dellink =$(".delBQConn").prop('href');
                         dellink = dellink + ''+connid;    
                     
                        $.messager.confirm('Confirmation for delete connection',msg, function(r){
                              if (r)
                              {
                                  window.location =dellink;
                              }
                              else
                              {
                                  return false;
                              }
                         });
                    
                        return false;
                }
//Big Data Edit Connection Module                
                function editHadoopConnection(id,host,port,tablename,name)
                    {
                      $("#hostname").val(host);
                      $("#portno").val(port);
                      $("#tablename").val(tablename);
                      $("#hadoopconId").val(id);
                      $("#nickname").val(name);
                    }
                    
//Big Data - Hadoop Delete Connection Module                    
                  function deleteHadoopConnection(msg,connid)
                        {   
                            
                                var dellink =$(".delHadoopConn").prop('href');
                                dellink = dellink + ''+connid;    

                               $.messager.confirm('Confirmation for delete connection',msg, function(r){
                                     if (r)
                                     {
                                         window.location =dellink;
                                     }
                                     else
                                     {
                                         return false;
                                     }
                                });

                               return false;
                        }
// Big Data - Mongo DB Edit Connection Module                                                       
             function editMongoConnection(id,name,url,database,members)
                    {

                      $("#mongo_Conn_id").val(id); 
                      $("#mongoDbUrl").val(url);
                      $("#mongo_database").val(database);
                      $("#mongoDb_collection").val(members); 
                      $("#mongoDbName").val(name); 

                    }     
 // Big Data - Mongo DB Delete Connection module                   
            function deleteMongoConnection(msg,connid)
            {
                  var dellink =$(".delMongoConn").prop('href');
                                dellink = dellink + ''+connid;    

                               $.messager.confirm('Confirmation for delete connection',msg, function(r){
                                     if (r)
                                     {
                                         window.location =dellink;
                                     }
                                     else
                                     {
                                         return false;
                                     }
                                });

                               return false;
             }
               {/literal}
     </script>            
{/if}           
   
            
<!--Assign User by Plugin Credentials Module -->
<div class="modal fade" id="assignPlugin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
                <div id="assignUserModule"></div>   
            </div><!-- modal-content -->
            </form>
          </div><!-- modal-dialog -->
</div><!-- modal -->       
            
<!--Ajax Content -->

{if isset($assignUser)}
 <!-- Assign Plugin Credentials by Users Content Modules-->
<form method = "post" name="frmmenulist" id="frmmenulist" action="pluginmanagement.php{if isset($smarty.get.s)}?s={$smarty.get.s}{/if}">    
<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{$smarty.const.assign_forms_user}</h4>
              </div>
              <div class="modal-body">                 
                      
                    <div  class ="userWise">                         
                        <table  class="table table-info mb30 assinguser_list">
                                                <thead>
                                                          <tr>
                                                              <th>{$smarty.const.user_name}</th> 
                                                              <th>{$smarty.const.enable}  </th> 
                                                              <th>{$smarty.const.user_name}</th>                                                  
                                                              <th>{$smarty.const.enable}  </th> 
                                                          </tr>
                                                </thead>
                                                <tbody>
                                                            {$colPerRow = 2}

                                                              {foreach from=$userList name="varuserlist" key=key_ul item=item_ul}

                                                                       {if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 1}
                                                                           <tr>
                                                                          {/if}
                                                                               <td style="border-top:0px solid #ccc;">{$item_ul["username"]}</td>  
                                                                               <td style="border-top:0px solid #ccc;{if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 1 } border-right:1px solid #ccc; {/if}">
                                                                                   <input type="checkbox" name="chkrolelist[]" id="chk_{$smarty.foreach.varuserlist.iteration}" {if in_array($item_ul["id"],$assignUser["result"])} checked="checked" class="case" {/if} value="{$item_ul["id"]}" />
                                                                               </td>
                                                                       {if $smarty.foreach.varuserlist.iteration mod $colPerRow eq 0}
                                                                           </tr>
                                                                        {/if}
                                                              {/foreach}                                                   
                                                </tbody>                    
                            </table> 
                       </div>                                   
                                       
              </div>
                  
                        <input type="hidden" name="connId" value="{$connId}" />
                        <input type="hidden" name="plugin_type" value="{$plugin_type}" />
                  
              <div class="modal-footer">
                <button type="submit" class="btn btn-primary btn-sm" name="btn_userList" id="btn_userList">{$smarty.const.save_credentials}</button>
                <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">{$smarty.const.cancel}</button> 
              </div>
 </form>  
 <!--Initiate Drop Down Menu Script-->             
    <script type="text/javascript">
    {literal}
       jQuery('#assignUserList').select2(
        {
           minimumResultsForSearch: -1
        });
     {/literal}    
   </script> 
{/if}
            