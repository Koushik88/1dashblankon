{*
==================================================================
#   Global Basics Inc - Backend	::  Rule Engine Template         #
==================================================================

    Document       : Company Management Template
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Managing the template for Set rules in report Wise
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}

<!--Initialize boostrap datatables CSS -->
<link href="{$smarty.const.CSSLOCATION}style.datatables.css" rel="stylesheet">

<!--View report list - Assigned  for rule properties  by reports level-->
{if !isset($popup)}
        <div class="col-md-11">
                <div class="datagrid-header-content">
                     <div class="datagrid-header-content-data">    
                                    <div style="float:left;">
                                      Rule Engine                     
                                    </div>
                                    <div class="pull-right" style="margin-top:-4px;">
                                        <a href="javascript:void(0);" class="btn btn-primary btn-xs" title="Add Report" onclick="addNewRule();">Add Rule</a> 
                                    </div>    
                      </div> 

                    <div class="mypanel-body" style="margin-top:-18px;">
                      <div class="table-responsive">  
                          <table id="rulesList" class="table table-bordered responsive">
                              <thead>
                                 <tr style="background-color:#F9F9F9;">
                                        <th style="border-bottom:0px solid #ccc;">Report Name</th>
                                        <th style="border-bottom:0px solid #ccc;">Procedure Name</th>
                                        <th style="border-bottom:0px solid #ccc;">Edit Rule</th>
                                 </tr>
                              </thead>
                               <tbody>
                                        {foreach $ruleReportList["data"] as $key=>$report} 
                                             <tr>
                                                     <td style="text-align: left !important;">{$report["Report_Name"]}</td>
                                                     <td style="text-align: left;">{$report["Procedure_Name"]|replace:"analyzr_I_":""|replace:"analyzr_D_":""}</td>
                                                     <td style="text-align: center;">
                                                         <a href="javascript:void(0);" onclick="viewEditRule('{$report['reportId']}');">
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
     
<!--Boostrap Js initialization -->                       
<script src="{$smarty.const.JSLOCATION}dataTables.bootstrap.js"></script>   

<script type="text/javascript">
    
    var notifyMsg = "{$Msg}";
    
{literal}
 
        jQuery('#rulesList').DataTable({
                    responsive: true,
                    "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]
                });
 // Add new rule notification               
 function addNewRule()
   {
        $.messager.alert('Alert for new rule','Contact \'TVS Infotech \' to create Rules!','');
   } 
   
 //Load data for edit rule properties in column level  
  function viewEditRule(menuId)
  {
    $("#generalModal").modal("show");
     
      $.get(portalLocation+controller+"/ruleengine.php",{"menuId":menuId,"popup":"popup"},function(data)
      {
          $("#generalModalContent").html(data);
      });
        
  }
  
//notifiction alerts  
 if(notifyMsg.length > 0)
   {
       jQuery.gritter.add(
         {
              title: 'Update Ruleset notification!',
              text: 'Ruleset report updated successfully!',
              class_name: 'growl-success',
              image: ImageLocation+'screen.png',
              sticky: false,
              time: ''
          });
   }
{/literal}
 </script>
{/if}

<!-- Edit Rule Popup-->
<div class="modal fade" id="generalModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog" style='width:730px;'>
            <div class="modal-content">
                <div id="generalModalContent">                    
                </div>   
            </div><!-- modal-content -->
          </div><!-- modal-dialog -->
</div><!-- modal -->

<!-- Edit Rule Popup content-->
{if isset($ruleReportColumnList)}
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h5 class="modal-title">Edit Rule</h5>
    </div>
     <div class="modal-body">
         <div class="table-responsive">
           <form name="input" action="" method="POST">
           <input id="selectedReport" name="reportId" type="hidden" value='{$reportId}'/>
           <table style="border:1px solid #ccc;width:700px;text-align:center;">                                    
                                   <thead>
                                       <tr style="height:35px;background-color:#F9F9F9;border-bottom:1px solid #ccc;">
                                                <th style="text-align:center;">
                                                    Column
                                                </th>
                                                <th style="text-align:center;">
                                                    Operator
                                                </th>

                                                <th style="text-align:center;">
                                                    Type
                                                </th>

                                                <th style="text-align:center;">
                                                    Values
                                                </th>

                                                <th style="text-align:center;">
                                                    Join Operator
                                                </th>

                                            </tr>
                                </thead>
                                <tbody>
                                  
                                        {foreach $data as $key=>$value}
                                          <tr>  
                                               <td style="padding:15px 5px 10px 5px;width:150px;">
                                                     <input type="text"  name="columnNameHeader[]"  style="background-color:#e9e9e9;width:130px;" value="{$value['column_name']}" readonly/>
                                                     <input type="hidden"  name="columnName[]"  value="{$value['column_value']}" />
                                                     <input type="hidden"  name="ruleId[]"   value="{$value['id']}" />
                                                    
                                               </td>
                                               <td style="padding:15px 5px 10px 5px;width:150px;">
                                                   <select style="width:150px;height:25px;" name="fOperator[]" onchange="getOperator(this.value);"> 
                                                       {foreach $ruleOperatorslist['data'] as $keys => $list} 
                                                           <option value="{$value['column_name']|replace:' ':'_'}###{$list['opValue']}" {if $list['opValue'] eq $value['operator_value']} selected {/if}>{$list['opText']}</option>
                                                       {/foreach}    
                                                   </select>
                                               </td>
                                               <td style="padding:15px 5px 10px 5px;width:80px;">
                                                   <select  name="jColumnType[]"  style="width:60px;height:25px;">
                                                       <option value="int" {if $value["column_type"] eq 'int'} selected {/if}>Int</option>
                                                       <option value="string" {if $value["column_type"] eq 'string'}selected {/if}>String</option>
                                                   </select>
                                                   
                                               </td>
                                               <td style="padding:15px 5px 10px 5px;width:150px;">
                                                    <div class="row">
                                                        <input  id="{$value['column_name']|replace:' ':'_'}_udf1" name="{$value['column_name']|replace:' ':'_'}_udf1"   value="{$value['udf1']}" style="width:80px;text-align:center;"/>

                                                     {if (isset($value['operator_value']) && ($value['operator_value']) == 'BETWEEN')}
                                                          <input  id="{$value['column_name']|replace:' ':'_'}_udf2" name="{$value['column_name']|replace:' ':'_'}_udf2" value="{$value['udf2']}" style="width:80px;" />
                                                     {else}
                                                          <input  id="{$value['column_name']|replace:' ':'_'}_udf2" name="{$value['column_name']|replace:' ':'_'}_udf2"  value="{$value['udf2']}"  style="width:80px;display:none;" disabled>
                                                     {/if}    
                                                    </div> 
                                               </td>
                                                <td style="padding:15px 5px 10px 5px;width:80px;">
                                                         {if (count($data)-1) neq $key}
                                                               <select name="jOperator[]" placeholder="Select logical operator..." style="width:60px;height:25px;">
                                                                   <option {if $value['join_operator'] eq 'AND'} selected {/if}>AND</option> 
                                                                   <option {if $value['join_operator'] eq 'OR'} selected {/if}>OR</option>
                                                               </select>
                                                           {else} 
                                                               N/A  
                                                           {/if}    
                                                </td>
                                           </tr> 
                                        {/foreach}
                                        <tr>
                                            <td colspan="5" style="padding:10px;">
                                                <div>
                                                    <button type="submit" class="btn btn-primary btn-xs" id="submitButton">Submit</button>
                                                    
                                                </div>
                                            </td> 
                                        </tr>
                                </tbody>
           </table>   
           </form>                             
         </div>     
     </div>
                            
                                        
{literal}                                     
<script type="text/javascript">
 //Enable/Disable input box for Selection bassed operator
    function getOperator(data) {
               
                                        var values = data; 
                                        var partsArray = values.split('###');
                                        var columnName = partsArray[0];
                                        values = partsArray[1];

                                        if(values == 'BETWEEN')
                                        {
                                            $("#"+columnName+"_udf2").show();
                                            $("#"+columnName+"_udf2").removeAttr('disabled');
                                        }
                                        else
                                        {
                                            $("#"+columnName+"_udf2").hide();
                                            $("#"+columnName+"_udf2").prop('disabled', 'disabled');
                                        }

                                }

 </script>    
 {/literal}                             
 {/if}




