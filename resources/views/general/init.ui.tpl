{*
#*******************************************************************#
#		Global Basics Inc ::  Index  Page                   #
#*******************************************************************#

    Document       : Index page
    Created on     : 24-06-2016
    Author         : Rubanraj S
    Description    : Index Page - Templates contains for header,footer,general   
    Last Edited on : 24-06-2016
    Last Edited by : Rubanraj S
*}

<div id="window-1" class="easyui-window windows-1" title="title-1" data-options="modal:true,closed:true, collapsible:false,minimizable:false,maximizable:true" ></div>
<div id="window-2" class="easyui-window windows-2" title="title-2" data-options="modal:true,closed:true,collapsible:false,minimizable:false,maximizable:true" ></div>
<div id="window-3" class="easyui-window windows-3" title="title-3" data-options="modal:true,closed:true,collapsible:false,minimizable:false,maximizable:true" ></div>


{*   CSS :: JQUERY EASYUI   *}
<link href="{$smarty.const.EASYUI}themes/icon.css" type="text/css" rel="stylesheet">
<link href="{$smarty.const.EASYUI}themes/gray/easyui.css" type="text/css" rel="stylesheet">
{*   JS :: JQUERY EASYUI   *}
<script src="{$smarty.const.EASYUI}jquery.easyui.min.js"></script>

<script type='text/javascript'>
{literal}
   function myAlert(title, message,icon){
       $.messager.alert(title,message,icon);
   }
   function myConfirm(title, question){
       $.messager.confirm(title, question, function(r){
           if (r){
               alert('confirmed: '+r);
           }
       });
   }
   function myLoading(){
       var win = $.messager.progress({
                title:'Please wait',
                msg:'Loading data...'
       });
       setTimeout(function(){
            $.messager.progress('close');
       },5000);
   }
   
  
{/literal}
</script>