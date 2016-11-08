{*
==================================================================
#   Global Basics Inc - Backend	:: Module Management Template    #
==================================================================

    Document       : Module Management Template
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Managing the Module - Add New Reports
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}

<!--View Module List -->
{if $moduleList}    
       <div class="row">
            {foreach $moduleList['result'] as $key=>$modules}
                    <label  ondrop="drop('{$modules["id"]}__{$modules["name"]}')" ondragover="allowDrop(event)">
                        <div class="moduleTypeLabel" title="{$modules["name"]}">
                            <div  id="{$modules["id"]}module_img"  class="selectModuleIcon">

                            </div>
                            <br/>
                            <div class="moduleSourceContent"> 
                               <img src="{$smarty.const.IMAGESLOCATION}/userpanel/{$modules["menu_image"]}" height="25" width="25"> 
                               <input type="radio" {if $key eq '0'} checked {/if}  class="availmodules" id="{$modules["id"]}module"  name="availmodules" value="{$modules["id"]}" data-toggle="modal" data-target="#availModal" title="{$modules["name"]}">
                            </div>
                        </div>	
                    </label>
                            <input type="hidden" id="{$modules["id"]}module_active" value="{$modules["active"]}">
            {/foreach} 
       </div>
 
    {literal}
        <script type="text/javascript">
            //View Module List Section
             var defSelectType = $(".availmodules:checked").attr("id"); 
             $("#"+defSelectType+"_img").html("<img  src='"+ImageLocation+"userpanel/selectSection.png'> ");

              $(".availmodules").click(function()
               {  
                    var defSelectType = $(".availmodules:checked").attr("id");   
                    $(".selectModuleIcon").html("");
                    $("#"+defSelectType+"_img").html("<img  src='"+ImageLocation+"userpanel/selectSection.png'> ");

               });
        </script>    
    {/literal}           
            
{/if}


<!--Available Template list using Drop Down -->
{if isset($availTemplates)}
    <select id="templateList" data-placeholder="Choose One" class="width300">
       {foreach $availTemplates as $key=>$values} 
                <option value="{$values['id']}">{$values['name']}</option>
        {/foreach}    
        
        {if !$availTemplates}
                <option value="0">No Template</option>
        {/if}     
    </select>
        
{/if}


<!--View Procedure List using Drom down menu-->
{if isset($noofProcedureType)}
    {for $name = 1 to $noofProcedureType} 
        <div class="row" style="padding-left:15px;"> 
                <select id="procdureType{$name}" data-placeholder="Choose One" class="width300 procedureBox">
                    <option value="Default">Default</option>
                    <option value="Installed">User Installed</option>
                </select>&nbsp;
                <select id="procdureType{$name}_list"  data-placeholder="Choose One" class="width300 procedureAvailList">
                   {foreach $procdurelist['result'] as $key=>$value} 
                        <option value="{$value['id']}">{$value['name']|replace:"analyzr_I_":""|replace:"analyzr_D_"}</option>
                   {/foreach}  
                   {if !$procdurelist['result']}
                        <option value="0">No Procedure</option>
                   {/if}    
                </select>                                                            
        </div>
        <br/>
     {/for} 
     
     {literal}
          <script type="text/javascript">
                  // Set Proceure List
                  $(".procedureBox").change(function()
                  {
                      var selectProcTypeId  = $(this).attr("id");
                      var selectProcTypeValue = $("#"+selectProcTypeId).val();
                      $.post(portalLocation+controller+"/addReportAjax.php",{"selectProcTypeValue":selectProcTypeValue},function(data)
                       {  
                            $("#"+selectProcTypeId+"_list").html(data);
                       });
                  });             
          </script>
      {/literal}   
     
 {/if}   
 
 
 <!--Load Procedure in Ajax Module -->
 {if isset($selectProcList)}
      {foreach $selectProcList['result'] as $key=>$value} 
           <option value="{$value['id']}">{$value['name']|replace:"analyzr_I_":""|replace:"analyzr_D_"}</option>
      {/foreach}
      {if !$selectProcList['result']}
           <option value="0">No Procedure</option>
      {/if} 
 {/if}
 
<!--Assign Link Reports to Corresponding Reports --> 
{if isset($assignLinkModule)}
    <div class="row" style="padding-left:5px;">
       <div class="col-sm-6">
           <div class="form-group">
            <label class="control-label">Section</label>
                    <select id="availLinkReportModule" data-placeholder="Choose One" class="width300 availLinkReportModule">
                      {foreach $assignLinkModule['result'] as $key=>$value}
                          <option value="{$value['id']}">{$value['name']}</option>
                      {/foreach}    
                    </select>
            </div><!-- form-group -->
       </div>
        
       <div class="col-sm-6">
                 <div class="form-group">
                  <label class="control-label">Reports</label>
                       <select id="availLinkReport" data-placeholder="Choose One" class="width300">
                  </select>
                  </div><!-- form-group -->
             </div>
    </div> 
{literal}                    
    <script type='text/javascript'>        
        getLinkReportsList();        
        $("#availLinkReportModule").change(function()
        {        
            getLinkReportsList();
        
        });        
        function getLinkReportsList()
        {
            var selectLinkModuleId = $("#availLinkReportModule option:selected").val();
            $.post(portalLocation+controller+"/addReportAjax.php",{"selectLinkModuleId":selectLinkModuleId},function(data)
             {  
                   $("#availLinkReport").html(data);    
             });
        }
        
    </script>                   
{/literal}           
{/if} 


<!--Assign Link Reports to Corresponding Reports using Ajax Module-->
{if isset($linkReportList)} 
    <option value="0">No Reports</option>
   {foreach $linkReportList['menus'] as $key=>$value}
       <option value="{$value['menu_id']}">{$value['menu_name']}</option>
   {/foreach}
{/if}



<!-- Drop down initiate module--> 
{literal}
    <script type="text/javascript">
    
        jQuery("#select-basic, #select-multi").select2();
                jQuery('#templateList,#availLinkReportModule,#availLinkReport,#assignUser,#procdureType1,#procdureType2,#procdureType3,#procdureType4,#procdureType5,#procdureType1_list,#procdureType2_list,#procdureType3_list,#procdureType4_list,#procdureType5_list').select2({
                    minimumResultsForSearch: -1
                });  
              
    </script>
{/literal}   
