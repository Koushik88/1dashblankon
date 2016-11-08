{*
==================================================================
#   Global Basics Inc - Backend	:: Procedure Management          #
==================================================================

    Document       : Procedure Management
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Managing the Procedures, assigning the procedures for 
                     reports. 
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V               
*}

<!--Alert Notification ,Message -->
    {if isset($success)}
           <div class="alert alert-success">
               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
               <strong>{$smarty.const.procedure_saved}</strong> 
           </div>
    {/if} 
   
    {if isset($proc_error)}
     <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <strong>{$smarty.const.invalid_procedure}</strong> 
     </div>
    {/if} 
    
<!--Initiliaze Boostrap Data table CSS -->   
<link href="{$smarty.const.CSSLOCATION}style.datatables.css" rel="stylesheet">

<!--Type of Procedures for Tabs View -->
{if !isset($popup)}
 <div class="col-md-11">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs nav-primary">
                                    <li class="active">
                                        <a href="#defualt_proc" data-toggle="tab">
                                            <strong>{$smarty.const.procedures_header}</strong>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#installed_proc" data-toggle="tab">
                                            <strong>{$smarty.const.custom_proc}</strong>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#forms_proc" data-toggle="tab">
                                            <strong>{$smarty.const.form_proc}</strong>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#widget_proc" data-toggle="tab">
                                            <strong>Widget</strong>
                                        </a>
                                    </li>
                                </ul>
        
                                <!-- Tab panes -->
                                <div class="tab-content tab-content-primary mb30">
                                    <div class="tab-pane active" id="defualt_proc">
                                        <br/>
<!--Defualt Proceudre List - Using Grid View-->                                        
                                        <div class="datagrid-header-content">  
                                            <div class ="datagrid-header-content-data">
                                                Default Procedure
                                            </div>       
                                                         
                                            <div class="mypanel-body">  
                                               <div class="table-responsive">  
                                                      <table id="defaultProcTable" class="table table-bordered responsive">
                                                            <thead>
                                                                <tr style="background-color:#F9F9F9;">
                                                                    <th style="border-bottom:0px solid #ccc;">{$smarty.const.fprocedure_title}</th>
                                                                    <th style="border-bottom:0px solid #ccc;">{$smarty.const.fprocedure_name}</th>
                                                                    <th style="border-bottom:0px solid #ccc;">{$smarty.const.fprocedure_description}</th>
                                                                    <th style="border-bottom:0px solid #ccc;">{$smarty.const.proc_dashboard}</th>
                                                                    <th style="border-bottom:0px solid #ccc;">Assigned Reports</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                {foreach from=$proceduremenus name="vartemplatelist" key=key_tl item=item_tl}                                                                              
                                                                    <tr>    
                                                                        <td style="text-align: left !important;">
                                                                            {$item_tl["title"]}
                                                                        </td>
                                                                        <td style="text-align: left;">{$item_tl["name"]|replace:'analyzr_D_':''}</td>
                                                                        <td style="text-align: left;"  id="{$item_tl['procedure_id']}_edit">                                                                                                        
                                                                             <a href="javascript:void(0)" style="color:#000 !important" onclick="editProcDescModule('{$item_tl["description"]|replace:'"':""|replace:"_":" "}__{$item_tl["procedure_id"]}');" class="editProcDesc" id="editProcDesc_{$item_tl['procedure_id']}"> 
                                                                                    {$item_tl["description"]|replace:'"':""|replace:"_":" "}
                                                                             </a>                                                          
                                                                        </td>
                                                                        <td style="text-align: left;">{if $item_tl["dashboard"] eq '1'} {$smarty.const.proc_on} {else} {$smarty.const.proc_off} {/if}</td>
                                                                        <td style="text-align: center;">
                                                                            <a href="javascript:void(0);" onclick="return viewReportsList('Default','{$item_tl['procedure_id']}');">
                                                                                <span class="glyphicon glyphicon-picture"></span>
                                                                            </a>
                                                                        </td>
                                                                </tr>
                                                                {/foreach}     
                                                            </tbody>
                                                        </table>
                                                    </div>                
                                                </div>
                                            </div>                                        
                                         </div>
 <!--Defualt Proceudre List - Using Accordin View -->                                    
                                    <div class="tab-pane" id="installed_proc">
                                                      <div class="mypanel-body">
                                                         <div class="mypanel-group" id="accordion">
                                                                <div class="mypanel mypanel-default">
                                                                    <div class="mypanel-heading">
                                                                        <h4 class="mypanel-title">
                                                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                                               {$smarty.const.add_new_proc}
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapseOne" class="mypanel-collapse collapse">
                                                                        <div class="mypanel-body">
                                                                           <form method = "post" name="proclist" id="proclist" action="proceduremanagement.php">                    
                                                                     
                                                                                    <div class="col-sm-7">
                                                                                        <div class="form-group">
                                                                                         <label class="control-label" for="procedure_title">{$smarty.const.procedure_title}</label>
                                                                                             <input class="form-control" name="procedure_title" id="procedure_title" type="text" required value=""/>
                                                                                          </div>
                                                                                     </div>
                                                                                             
                                                                        
                                                                                    <div class="col-sm-7">
                                                                                        <div class="form-group">
                                                                                         <label class="control-label" for="procedure_name">{$smarty.const.avail_procname}</label><br/>
                                                                                             {if $customProcedure}
                                                                                                   <select name="procedure_name" id="procedure_name" class="width300">                                                                 
                                                                                                       {foreach $customProcedure as $key => $value}  
                                                                                                       <option value="{$value}">{$value|replace:'analyzr_I_':''}</option>
                                                                                                       {/foreach}
                                                                                                   </select> 
                                                                                              {else}
                                                                                                  <select name="procedure_name" id="procedure_name" class="width300">
                                                                                                       <option value=""> {$smarty.const.no_procedure}</option>                                      
                                                                                                   </select> 
                                                                                              {/if}  <br/>

                                                                                         </div>
                                                                                     </div>

                                                                                     <div class="col-sm-7">
                                                                                         <div class="form-group"> 
                                                                                         <label class="control-label" for="procedure_desc">{$smarty.const.company_description}</label>
                                                                                             <textarea required name="procedure_descc" cols="45" rows="5" id="procedure_desc" class="form-control"></textarea>                           
                                                                                         </div>
                                                                                     </div> 
                                                                                        
                                                                                               
                                                                                            <div class="col-sm-7">
                                                                                                <div class="form-group">  
                                                                                               <label class="control-label" for="fname">{$smarty.const.status}</label>
                                                                                                        <div class="div-status">
                                                                                                            <input id="proc_active" class="chk-status" name="proc_active" checked ="checked" type="checkbox" value="1" />
                                                                                                            <label for="proc_active">Check-me</label>
                                                                                                        </div>
                                                                                                        &nbsp; &nbsp; &nbsp;
                                                                                                     <label class="control-label" for="lname">{$smarty.const.procedure_dashboard}</label>
                                                                                                        <div class="div-status" style="margin-top:5px;">
                                                                                                                          <input id="dashboardactive" class="chk-status" name="dashboardactive" type="checkbox" value="1" />
                                                                                                                          <label for="dashboardactive">Check-me</label>
                                                                                                        </div>
                                                                                               </div>
                                                                                           </div>  

                                                                                     <div class="row">                        
                                                                                         <div class="col-sm-7" align="center">
                                                                                               <input type="hidden" value="Installed" name="procedure_type" >
                                                                                               <button type="submit" name="btns_procedure" id="btn_procedure" class="btn btn-primary btn-sm" title="{$smarty.const.add_button}" onclick="return validateProcedure()">{$smarty.const.add_button}</button>
                                                                                               <a href="{$smarty.const.PORTALLOCATION}admin/proceduremanagement.php" class="btn btn-primary btn-sm" title="{$smarty.const.cancel}" >{$smarty.const.cancel}</a>
                                                                                         </div>
                                                                                     </div> 
                                                                                         
                                                                                 <div>
                                                                                      <strong>  Note : </strong> <br/>
                                                                                        <code>
                                                                                                   <span> {$smarty.const.sqlmsg} </span><br/>
                                                                                                   <span> {$smarty.const.sqlmsg1} </span> <br/>
                                                                                                   <span> {$smarty.const.sqlmsg2} </span> 
                                                                                        </code>
                                                                                 </div>
                                                                                      
                                                                            </form> 
                                                                        </div>
                                                                    </div>
                                                                </div><!-- mypanel -->
<!-- List Of Assigned Procedure -->
                                                                <div class="mypanel mypanel-default">
                                                                    <div class="mypanel-heading">
                                                                        <h4 class="mypanel-title">
                                                                            <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseTwo">
                                                                               {$smarty.const.list_proc}
                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapseTwo" class="mypanel-collapse collapse in">
                                                                        <div class="mypanel-body">
                                                                            
                                                                            <div class="table-responsive">  
                                                                                    <table id="installProcTable" class="table table-bordered responsive">
                                                                                                               <thead>
                                                                                                                   <tr style="background-color:#F9F9F9;">
                                                                                                                       <th style="border-bottom:0px solid #ccc;">{$smarty.const.fprocedure_title}</th>
                                                                                                                       <th style="border-bottom:0px solid #ccc;">{$smarty.const.fprocedure_name}</th>
                                                                                                                       <th style="border-bottom:0px solid #ccc;">{$smarty.const.fprocedure_description}</th>
                                                                                                                       <th style="border-bottom:0px solid #ccc;">{$smarty.const.proc_dashboard}</th>
                                                                                                                       <th style="border-bottom:0px solid #ccc;">Assigned Reports</th>
                                                                                                                   </tr>
                                                                                                               </thead>
                                                                                                               <tbody>
                                                                                                                     {foreach from=$customprocmenus name="vartemplatelist" key=key_tl item=item_tl}                                                                              
                                                                                                                           <tr>    
                                                                                                                                   <td style="text-align: left !important;">
                                                                                                                                       {$item_tl["title"]}
                                                                                                                                   </td>
                                                                                                                                   <td style="text-align: left;">{$item_tl["name"]|replace:'analyzr_I_':''}</td>
                                                                                                                                   <td style="text-align: left;"  id="{$item_tl['procedure_id']}_edit">                                                                                                        
                                                                                                                                        <a href="javascript:void(0)" style="color:#000 !important" onclick="editProcDescModule('{$item_tl["description"]|replace:'"':""|replace:"_":" "}__{$item_tl["procedure_id"]}');" class="editProcDesc" id="editProcDesc_{$item_tl['procedure_id']}"> 
                                                                                                                                               {$item_tl["description"]|replace:'"':""|replace:"_":" "}
                                                                                                                                        </a>                                                          
                                                                                                                                   </td>
                                                                                                                                   <td style="text-align: left;">{if $item_tl["dashboard"] eq '1'} {$smarty.const.proc_on} {else} {$smarty.const.proc_off} {/if}</td>
                                                                                                                                   <td style="text-align: center;">
                                                                                                                                       <a href="javascript:void(0);" onclick="return viewReportsList('Installed','{$item_tl['procedure_id']}');">
                                                                                                                                           <span class="glyphicon glyphicon-picture"></span>
                                                                                                                                       </a>
                                                                                                                                   </td>
                                                                                                                           </tr>
                                                                                                                   {/foreach}     
                                                                                                            </tbody>
                                                                                        </table>
                                                                                </div> 
                                                                        </div>
                                                                    </div>
                                                                </div><!-- mypanel -->
                                                         </div>
                                                 </div>
                                    </div>
<!--Form Procedure for - Add new Procedure Page -->                               
                                <div class="tab-pane" id="forms_proc">
                                        <br/>
                                              <div class="datagrid-header-content">  
                                                    <div class ="datagrid-header-content-data">
                                                       Form Procedure
                                                    </div>       
                                                         
                                                       <div class="mypanel-body">   
                                                                        <form method = "post" name="proclist" id="form_proclist" action="proceduremanagement.php">                    
                                                                                    
                                                                                        <div class="col-sm-7">
                                                                                           <div class="form-group"> 
                                                                                             <label class="control-label" for="procedure_title">{$smarty.const.procedure_title}</label>
                                                                                                <input class="form-control" name="procedure_title" id="form_procedure_title" type="text" required value=""/>
                                                                                             </div>
                                                                                        </div>
                                                                                                
                                                                                            
                                                                                         <div class="col-sm-7">
                                                                                          <div class = "form-group">
                                                                                            <label class="control-label" for="procedure_name">{$smarty.const.avail_procname}</label>
                                                                                               <br/>
                                                                                                {if $formProcedure}
                                                                                                      <select name="procedure_name" id="form_procedure_name" class="width300">                                                                 
                                                                                                          {foreach $formProcedure as $key => $value}  
                                                                                                          <option value="{$value}">{$value|replace:'analyzr_F_':''}</option>
                                                                                                          {/foreach}
                                                                                                      </select> 
                                                                                                 {else}
                                                                                                     <select name="procedure_name" id="form_procedure_name" class="width300">
                                                                                                          <option value=""> {$smarty.const.no_procedure}</option>                                      
                                                                                                      </select> 
                                                                                                 {/if}  
                                                                                                 <br/>
                                                                                            </div>
                                                                                        </div>

                                                                                        <div class="col-sm-7">
                                                                                            <div class="form-group"> 
                                                                                              <label class="control-label">{$smarty.const.procedure_param}</label>
                                                                                              <br/> <select name="proc_column" id="proc_column" class="width300">
                                                                                                       {foreach $procedure_column as $key=>$proc_column}
                                                                                                              <option value="{$proc_column}">{$proc_column}</option>
                                                                                                       {/foreach}
                                                                                                   </select> 
                                                                                           </div>
                                                                                        </div>  
                                                                                                   
                                                                                        <div class="col-sm-7">
                                                                                           <div class="form-group"> 
                                                                                            <label class="control-label" for="procedure_desc">{$smarty.const.company_description}</label>
                                                                                                <textarea class = "form-control" required name="procedure_descc" cols="45" rows="5" id="form_procedure_desc"></textarea>                           
                                                                                            </div>
                                                                                        </div> 

                                                                                                
                                                                                             
                                                                                    <div class="col-sm-8">
                                                                                        <div class="form-group" >                     
                                                                                            <label class="control-label">{$smarty.const.status}</label>
                                                                                                    <div class="div-status">
                                                                                                         <input id="proc_active" class="chk-status"  checked="checked"  name="proc_active" type="checkbox" value="1" />
                                                                                                         <label for="proc_active">Check-me</label>
                                                                                                     </div>
                                                                                                 &nbsp;&nbsp;   
                                                                                            <label class="control-label">{$smarty.const.procedure_dashboard}</label>
                                                                                                     <div class="div-status">
                                                                                                         <input id="dashboardFormactive" class="chk-status"  name="dashboardactive" type="checkbox" value="1" />
                                                                                                         <label for="dashboardFormactive">Check-me</label>
                                                                                                     </div>
                                                                                      </div>
                                                                                   </div>       
                                                                             <div class="row">                        
                                                                                <div class="col-sm-7" align="center">
                                                                                      <input type="hidden" value="Forms" name="procedure_type" >
                                                                                      <button type="submit" name="btns_procedure" id="btn_forms_procedure" class="btn btn-primary btn-sm" title="{$smarty.const.add_button}" onclick="return validateformProcedure()">{$smarty.const.add_button}</button>
                                                                                      <a href="{$smarty.const.PORTALLOCATION}admin/proceduremanagement.php" class="btn btn-primary btn-sm" title="{$smarty.const.cancel}" >{$smarty.const.cancel}</a>
                                                                                </div>
                                                                            </div>
                                                                                
                                                                            </form> 
                                                                                <div class="row">
                                                                                    <strong> Note :</strong><br/>
                                                                                        <code>
                                                                                          <span> {$smarty.const.sqlmsg3} </span><br/>
                                                                                          <span> {$smarty.const.sqlmsg4} </span> <br/>
                                                                                          <span> {$smarty.const.sqlmsg5} </span> 
                                                                                        </code>
                                                                                </div>
                                                       </div>
                                              </div>
                                </div> 
<!-- Widget Procedure 
*   Created By:      Udhaya Kumar V
*   Description:     Automated Dashboard
-->
<div class="tab-pane" id="widget_proc">
    <div class="mypanel-body">
        <div class="mypanel-group" id="accordionwidget">
            <div class="mypanel mypanel-default">
                <div class="mypanel-heading">
                    <h4 class="mypanel-title">
                        <a data-toggle="collapse" data-parent="#accordionwidget" href="#collapsewidget1">
                           {$smarty.const.add_new_proc}
                        </a>
                    </h4>
                </div>
            <div id="collapsewidget1" class="mypanel-collapse collapse in">
            <div class="mypanel-body">
                <form method = "post" name="proclist" id="proclist" action="proceduremanagement.php">                    
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="form-group">
                         <label class="control-label" for="procedure_title">{$smarty.const.procedure_title}</label>
                             <input class="form-control" name="procedure_title" id="procedure_title" type="text" required value=""/>
                          </div>
                    </div>
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="form-group">
                         <label class="control-label" for="procedure_name">{$smarty.const.avail_procname}</label><br/>
                             {if $widgetProcedure}
                                   <select name="procedure_name" id="procedure_name" class="width300">                                                                 
                                       {foreach $widgetProcedure as $key => $value}  
                                       <option value="{$value}">{$value|replace:'analyzr_W_':''}</option>
                                       {/foreach}
                                   </select> 
                              {else}
                                  <select name="procedure_name" id="procedure_name" class="width300">
                                       <option value=""> {$smarty.const.no_procedure}</option>                                      
                                   </select> 
                              {/if}  <br/>

                         </div>
                    </div>
                    <div class="col-sm-8 col-sm-offset-2">
                         <div class="form-group"> 
                         <label class="control-label" for="procedure_desc">{$smarty.const.company_description}</label>
                             <textarea required name="procedure_descc" cols="45" rows="5" id="procedure_desc" class="form-control"></textarea>                           
                         </div>
                    </div> 
                    <div class="row">                        
                        <div class="col-sm-8 col-sm-offset-2" align="center">
                              <input name="proc_active" type="hidden" value="1" />
                              <input type="hidden" value="Widget" name="procedure_type" >
                              <button type="submit" name="btns_procedure" id="btn_procedure" class="btn btn-primary btn-sm" title="{$smarty.const.add_button}" onclick="return validateProcedure()">{$smarty.const.add_button}</button>
                              <a href="{$smarty.const.PORTALLOCATION}admin/proceduremanagement.php" class="btn btn-primary btn-sm" title="{$smarty.const.cancel}" >{$smarty.const.cancel}</a>
                        </div>
                    </div> 
                <div class="col-sm-8 col-sm-offset-2">
                <strong>  Note : </strong> <br/>
                <code>
                  <span> {$smarty.const.sqlmsg} </span><br/>
                  <span> 2. Procedure name should have add analyzr_W_ as prefix to display under available procedures. </span> <br/>
                  <span> 3. Go to Widget link to add new Reports for installed procedure use. </span> 
                </code>
                </div>
                </form> 
            </div>
            </div>
            </div><!-- mypanel -->
            {*<div class="mypanel mypanel-default">
                <div class="mypanel-heading">
                    <h4 class="mypanel-title">
                        <a data-toggle="collapse" data-parent="#accordionwidget" href="#collapsewidget2">
                           Available
                        </a>
                    </h4>
                </div>
            <div id="collapsewidget2" class="mypanel-collapse collapse">
            <div class="mypanel-body">
               
            </div>
            </div>
            </div><!-- mypanel -->*}
        </div>
                  
    </div>
</div>
                                                                                         
 <!--Procedure Description Value--->
<input type="hidden" value="" id="editProcDescValues">                                                                                        
                                                                                         
                                                                                         
<!--Initialize Boostrap Data Table Js -->
<script src="{$smarty.const.JSLOCATION}dataTables.bootstrap.js"></script>
  
 <script type="text/javascript">
    {literal}
       jQuery('#defaultProcTable').DataTable(
        {
            responsive: true,
             "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]
        });
        
        jQuery('#installProcTable').DataTable(
        {
            responsive: true,
            "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]
            
        });
        
         jQuery('#procedure_name,#form_procedure_name,#proc_column').select2({
                    minimumResultsForSearch: -1
                });
                
  //Edit Procedure Description - Properties Module              
           function editProcDescModule(procValue)
           {
                $(".procDescEdit").remove();
                $(".editProcDesc").show();
                var procValues = procValue.split("__");
                $("#editProcDesc_"+procValues[1]).hide();
                $("#"+procValues[1]+"_edit").append("<table style='width:85px;' class='procDescEdit'><tr><td style='border:1px solid #ccc;background-color:#F9F9F9;width:20px;padding:2px;cursor:pointer;' title='Close'><a herf='javascript:void(0);' onclick='closeEditProcDesc()'><span class='fa fa-times-circle'></span></a></td><td style='border:1px solid #ccc;background-color:#F9F9F9;width:20px;padding:2px;cursor:pointer;' title='Save'><a herf='javascript:void(0);' onclick='editProcDesc()'><span class='fa fa-save'></span></a></td><td style='border:1px solid #ccc;background-color:#F9F9F9;width:45px;'><span><input type='text' id='newDescVal' value = '' required></span></tr></table>");                   
                $("#newDescVal").val(procValues[0]);                  
                $("#editProcDescValues").val(procValues);
                   
           }
   //Edit Proceudre Description - Close Module         
           function closeEditProcDesc()
           {
                $(".procDescEdit").hide();
                $(".editProcDesc").show();
           }  
   //Edit Procedure Description - Ajax Module        
         function editProcDesc()
         {
             var editProcDescValues = $("#editProcDescValues").val().split(","); 
             var newDescVal = $("#newDescVal").val();
             $.post(portalLocation+controller+'/proceduremanagement_Ajax.php',{"editProcDescValues":editProcDescValues[1],"newDescVal":newDescVal},function(data)
                {
                    $("#editProcDesc_"+editProcDescValues[1]).show();
                    $("#editProcDesc_"+editProcDescValues[1]).html(newDescVal);
                    var function_val = "editProcDescModule('"+newDescVal+"__"+editProcDescValues[1]+"');";
                    $("#editProcDesc_"+editProcDescValues[1]).attr("onclick",function_val);
                    $(".procDescEdit").hide();
                     
                         jQuery.gritter.add({
                                   title: 'Edit Procedure Notification!',
                                   text: 'Procedure updated successfully!',
                                   class_name: 'growl-success',
                                   image: ImageLocation +'screen.png',
                                   sticky: false,
                                   time: ''
                            }); 
                });
         }
//View assigned Reports List For Particular Procedure         
         function viewReportsList(procType,procId)
         {
              $("#assignReports").modal("show");
              $.get(portalLocation+controller+'/proceduremanagement.php',{"procType":procType,"procId":procId,"popup":"popup"},function(data)
                {
                    $("#assignReportsList").html(data)
                });
            return false;    
         }
   
    {/literal}    
 </script>
{/if} 
 
 <!--Assign Reports List for particular Procedure using Popup -->
<div class="modal fade" id="assignReports" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
                <div id="assignReportsList"></div>   
            </div><!-- modal-content -->
          </div><!-- modal-dialog -->
</div><!-- modal -->       
 
<!--Assign Reports List for particular Procedure using Popup Content Page-->
<!--Ajax Content -->
{if isset($proceduredata)}
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">{$smarty.const.assign_procedure}</h4>
              </div>
              <div class="modal-body">                 
                        <table  class="table table-info mb30 assinguser_list">
                            <thead>
                                    <tr> 
                                          <th>{$smarty.const.template_names}</th>
                                           <th>{$smarty.const.module_name}</th>
					   <th>{$smarty.const.reports_name}</th>
				    </tr>
                            </thead>
                            <tbody>
                                    {foreach from=$proceduredata["menus"] name="sectionmenus" key=ksm item=ism}
                                         <tr>
                                              <td align="left">{$ism["template_name"]}</td>  
                                              <td align="left">{$ism["section_name"]}</td>
                                              <td align="left">{$ism["menu_name"]}</td> 
                                        </tr>
                                    {/foreach}
                            </tbody>
                        </table>
              </div>        
{/if}    
