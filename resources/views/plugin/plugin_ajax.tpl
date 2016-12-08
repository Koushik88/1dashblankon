
    {if (isset($pluginType)) && $pluginType eq 'Quickbook'}
            <form name="plugin_form" action="#" method="POST" id="plugin_form">  
                <div class="p-10">                                               
                     <div class="form-group">
                         <label for="accessToken">Access Token</label>
                         <input type="text" class="form-control input-sm" name="accessToken" required value="{if isset($result)}{$result[0]["value"]}{/if}">
                     </div>
                     <div class="form-group">
                          <label for="accessSecret">Access Secret</label>
                         <input type="text" class="form-control input-sm" name="accessSecret" required value="{if isset($result)}{$result[1]["value"]}{/if}">
                     </div>
                     <div class="form-group">
                          <label for="consumerKey">Consumer Key</label>
                          <input type="text" class="form-control input-sm" name="consumerKey" required value="{if isset($result)}{$result[2]["value"]}{/if}">
                     </div>    
                    <div class="form-group">
                         <label for="consumerSecret">Consumer Secret</label>
                         <input type="text" class="form-control input-sm" name="consumerSecret" required value="{if isset($result)}{$result[3]["value"]}{/if}">
                     </div>
                    <div class="form-group">
                         <label for="companyId">Company ID</label>
                         <input type="text" class="form-control input-sm" name="companyId" required  value="{if isset($result)}{$result[4]["value"]}{/if}">
                     </div>
                     <button type="submit" class="btn btn-sm m-t-10" onclick="return savePluginCredentials('{$pluginType}');">Save</button>
                 </div>
            </form>  
    {/if}
    
    
    {if (isset($pluginType)) && $pluginType eq 'Twitter'}
         <form name="plugin_form" action="#" method="POST" id="plugin_form">  
                <div class="p-10">                                               
                     <div class="form-group">
                         <label for="twUsername">Username</label>
                         <input type="text" class="form-control input-sm" name="twUsername" required value="{if isset($result)}{$result[0]["value"]}{/if}">
                     </div>
                     <div class="form-group">
                          <label for="twpswd">Password</label>
                         <input type="password" class="form-control input-sm" name="twpswd" required value="{if isset($result)}{$result[1]["value"]}{/if}">
                     </div>
                     <button type="submit" class="btn btn-sm m-t-10" onclick="return savePluginCredentials('{$pluginType}');">Save</button>
                 </div>
            </form>          
    {/if}
    
     {if (isset($pluginType)) && $pluginType eq 'LinkedIn'}
         <form name="plugin_form" action="#" method="POST" id="plugin_form">  
                <div class="p-10">                                               
                     <div class="form-group">
                         <label for="linkedinUsername">Username</label>
                         <input type="text" class="form-control input-sm" name="linkedinUsername" required value="{if isset($result)}{$result[0]["value"]}{/if}">
                     </div>
                     <div class="form-group">
                          <label for="linkedinpswd">Password</label>
                         <input type="password" class="form-control input-sm" name="linkedinpswd" required value="{if isset($result)}{$result[1]["value"]}{/if}">
                     </div>
                     <button type="submit" class="btn btn-sm m-t-10" onclick="return savePluginCredentials('{$pluginType}');">Save</button>
                 </div>
            </form>          
     {/if}
     
       {if (isset($pluginType)) && $pluginType eq 'Gmail'}
         <form name="plugin_form" action="#" method="POST" id="plugin_form">  
                <div class="p-10">                                               
                     <div class="form-group">
                         <label for="gmailUsername">Username</label>
                         <input type="text" class="form-control input-sm" name="gmailUsername" required value="{if isset($result)}{$result[0]["value"]}{/if}">
                     </div>
                     <div class="form-group">
                          <label for="gmailpswd">Password</label>
                         <input type="password" class="form-control input-sm" name="gmailpswd" required value="{if isset($result)}{$result[1]["value"]}{/if}">
                     </div>
                     <button type="submit" class="btn btn-sm m-t-10" onclick="return savePluginCredentials('{$pluginType}');">Save</button>
                 </div>
            </form>          
     {/if}
      
     {if (isset($pluginType)) && $pluginType eq 'google_analytics'}
         <form name="plugin_form" action="#" method="POST" id="plugin_form">  
                <div class="p-10">                                               
                     <div class="form-group">
                         <label for="gaUsername">Username</label>
                         <input type="text" class="form-control input-sm" name="gaUsername" required value="{if isset($result)}{$result[0]["value"]}{/if}">
                     </div>
                     <div class="form-group">
                          <label for="gapswd">Password</label>
                         <input type="password" class="form-control input-sm" name="gapswd" required value="{if isset($result)}{$result[1]["value"]}{/if}">
                     </div>
                     <button type="submit" class="btn btn-sm m-t-10" onclick="return savePluginCredentials('{$pluginType}');">Save</button>
                 </div>
           </form>          
     {/if}
    
     
    {if isset($qbcompanyInfo)}   
           {foreach $qbcompanyInfo["cmp_info"] as $key=>$value}
               <div style="vertical-align:text-top;">
                   <div style="display:inline-block;"> <input type="radio" style="opacity:1;" {if $key eq '0'} checked="checked" {/if} class="cmp_list" name="cmp_list" value="{$value}##$$##{$qbcompanyInfo['pid'][$key]}##$$##{$qbcompanyInfo['realmId'][$key]}"> </div>
                   <div style="display:inline-block;padding-top:2px;"> &nbsp;{$value} </div>
               </div>
           {/foreach}
    {/if}
     
     
    
{literal}  
    <script type="text/javascript">
        function savePluginCredentials(pluginType)
        { 
               if($("form").valid()){
                       var postData = $("#plugin_form").serializeArray();
                        $.post(portalLocation+"plugin/plugin_ajax.php", {"saveCredentials":postData,"pluginName":pluginType}, function(data)
                        {                         
                        });

                         $("#addNewPlugin").modal('hide');
                         $('#addCrdentials').modal('toggle');
               }
               //  $(".error").css("color", "red");
                 location.reload(true);
            return false;    
        }        
    </script>
{/literal}