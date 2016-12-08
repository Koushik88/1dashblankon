
{if $smarty.session.expiry_msg eq '1'}
   <br/>
   <div class="row">
        <div class="col-xs-2"></div>
        <div class="alert alert-danger col-xs-8">
               Your last payment has failed. Kindly update your card details for unrestricted access
        </div>
        <div class="col-xs-2"></div>
   </div>   
{/if}



<div>
<a href="socialconnection/Google?source=gmail_up"    style="float:right;margin-right:15px;padding-top: 5px; padding-bottom: 5px;">Sign In</a>
<div class="row">
<div style="margin-left:20px;">{$email}</div>

<div class="col-md-2">
    <div style="margin-left:10px;">
          
            <div class="s-widgets">
            <div class="m-5">
                <a href="#compose-message" data-toggle="modal" class="btn btn-sm btn-block">Compose Message</a> 
            </div>

           <div class="list-group m-t-10 list-group-flat">
                <a href="{$smarty.const.CURRENTLOCATION}?labelIds=INBOX" class="list-group-item {if $labelIds eq 'INBOX'} active {/if}">Inbox<span class="badge badge-trp" id="inboxunreadCount">{$inboxunreadCount}</span></a>
                <a href="{$smarty.const.CURRENTLOCATION}?labelIds=IMPORTANT" class="list-group-item {if $labelIds eq 'IMPORTANT'} active {/if}">Important<span class="badge badge-trp" id="importantunreadCount">{$importantunreadCount}</span></a>
                <a href="{$smarty.const.CURRENTLOCATION}?labelIds=STARRED" class="list-group-item {if $labelIds eq 'STARRED'} active {/if}">Starred<span class="badge badge-trp" id="starredunreadCount">{$starredunreadCount}</span></a>
                <a href="{$smarty.const.CURRENTLOCATION}?labelIds=DRAFT" class="list-group-item {if $labelIds eq 'DRAFT'} active {/if}">Drafts<span class="badge badge-trp" id="draftunreadCount">{$draftunreadCount}</span></a>
                <a href="{$smarty.const.CURRENTLOCATION}?labelIds=SENT" class="list-group-item {if $labelIds eq 'SENT'} active {/if}">Sent Mail<span class="badge badge-trp" id="sentunreadCount">{$sentunreadCount}</span></a>
                <a href="{$smarty.const.CURRENTLOCATION}?labelIds=SPAM" class="list-group-item {if $labelIds eq 'SPAM'} active {/if}">Spam<span class="badge badge-trp" id="spamunreadCount">{$spamunreadCount}</span></a>
            </div>


            <div class="list-group list-group-flat m-t-15 table-responsive overflow" style="overflow:auto;height:400px">
                {foreach from=$listlables_name name='name' item='value' key='key'}
                <a href="{$smarty.const.CURRENTLOCATION}?labelIds={$listlables_id[$key]}" class="list-group-item {if $labelIds eq $listlables_id[$key]} active {/if}">{$listlables_name[$key]}</a>
                {/foreach}
               <!--  <a href="#" class="list-group-item"><span class="message-tag progress-bar-danger"></span>Personal</a>
                <a href="#" class="list-group-item"><span class="message-tag progress-bar-info"></span>Promotions</a>
                <a href="#" class="list-group-item"><span class="message-tag progress-bar-success"></span>Clients</a> -->
            </div>

        </div>
    </div>
</div>
    
<div class="col-md-10">
    
    {if isset($responsemesaage)}
         <div class="alert alert-success">
             <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             {$responsemesaage}
         </div>
    {/if}
   
    <div class="message-list list-container" style="border-left:1px solid rgba(255,255,255,0.15);padding-left:5px;">
             <div id="main_message">
              {if !isset($bodymessage)}
                    <header class="listview-header media">
                        <input type="checkbox" class="pull-left list-parent-check" value="" id="prtour_checkbox">  
                           
                        <ul class="list-inline pull-right m-t-5 m-b-0">
                            <li class="pagin-value hidden-xs">{$msg}-{$msgcount} {$contentof} {$totalcount}</li>
                            <li  id="display"></li>
                           {if isset($pageTokenprev) && $pageTokenprev == 23}
                            <li>
                                <a href="{$smarty.const.CURRENTLOCATION}?labelIds={$labelIds}&pageToken={$pageTokenprev}" title="Previous" >
                                    <i class="sa-list-back"></i>
                                </a>
                            </li>
                           {/if}
                           
                            {if isset($pageTokennext)}
                            <li>
                                <a id="prtour_navigator" href="{$smarty.const.CURRENTLOCATION}?labelIds={$labelIds}&pageToken={$pageTokennext}" title="Next" >
                                    <i class="sa-list-forwad"></i>
                                </a>
                            </li>
                            {/if}
                        </ul>
                       
                        <ul class="list-inline list-mass-actions pull-left">
                            <li>
                                <a data-toggle="modal" href="#compose-message" title="Create"  id="prtour_compose">
                                    {*<i class="sa-list-add"></i>*}
                                    <img  src="{$smarty.const.IMAGESLOCATION}/gmail/Compose.png" alt="">
                                </a>
                            </li>



                            <li>
                                <a href="{$smarty.server.REQUEST_URI}" title="Refresh" id="prtour_refersh">
                                    {*<i class="sa-list-refresh"></i>*}
                                    <img  src="{$smarty.const.IMAGESLOCATION}/gmail/Refresh.png" alt="">                                    
                                </a>
                            </li>
                        
                            <li class="show-on" style="display: none;">
                                <a href="#" title="Delete" onclick="checkboxvalues();">
                                    {*<i class="sa-list-delete"></i>*}
                                    <img  src="{$smarty.const.IMAGESLOCATION}/gmail/Trash.png" alt=""> 
                                </a>
                            </li>

                              <li class="show-on dropdown " style="display: none;" >
                                <a data-toggle="modal" href="#move-message" title="Move" >
                                    {*<i class="sa-list-move"></i>*}
                                    <img  src="{$smarty.const.IMAGESLOCATION}/gmail/Move.png" alt=""> 
                                </a>
                            </li>
                        </ul>

                  
                <form method="post" action="{$smarty.server.REQUEST_URI}" name="message">
                  <input type="hidden" name="_token" value="{$csrf_token}">
                  <input class="input-sm col-md-4 pull-right message-search" type="text" placeholder="Search...." name="mes" value="{$search}" id="prtour_search">
                </form>

                       
                        <div class="clearfix"></div>
                    </header>
                    {if isset($nosearch)}
                       <h3 style="text-align: center;margin: 5% 0;">{$nosearch}</h3> 
                    {/if}
                    {foreach from=$mergeArrays name='name' item='value' key='key'}

                    <div class="media">


                     <input type="checkbox" class="pull-left list-check" value="{$value['messageId']}">

                     <a class="media-body openMessage" href="{$smarty.const.CURRENTLOCATION}?msgid={$value['messageId']}&drafid={$value['draftId']}&label={$labelIds}">
                                           
                       
                           {if $smarty.get.labelIds eq 'SENT'}
                            <div class="pull-left list-title">
                                <span class="t-overflow {if $value['unreadmsg'] eq 'UNREAD'}f-bold{/if}">{$value['to']}</span>
                            </div>
                            {else}
                               <div class="pull-left list-title">
                                <span class="t-overflow {if $value['unreadmsg'] eq 'UNREAD'}f-bold{/if}">{$value['from']}</span>
                            </div>
                            {/if}
                         
                            
                           <div class="pull-right list-date" style="margin-right:20px;width: 110px;">{$value['date']|substr:0:16}</div>

                           <div class="media-body hidden-xs">
                               <span class="t-overflow">{$value['subject']}--{$value['snippet']}</span>
                           </div>

                        </a>
                    </div>
                    {/foreach}
              {/if} 
                
        {if isset($bodymessage)}
                <div id="drill_message">

                        <header class="listview-header media">                           
                      <!--   <ul class="list-inline pull-right m-t-5 m-b-0">
                            <li class="pagin-value hidden-xs">35-70</li>
                            <li>
                                <a href="" title="Previous">
                                    <i class="sa-list-back"></i>
                                </a>
                            </li>
                            <li>
                                <a href="" title="Next">
                                    <i class="sa-list-forwad"></i>
                                </a>
                            </li>
                        </ul> -->
                       
                        <ul class="list-inline list-mass-actions pull-left eml">
                            <li class="m-r-10">
                                <a href="{$smarty.const.CURRENTLOCATION}?{if $labelIds eq 'DRAFT' }draft={$labelIds}{else}labelIds={$labelIds}{/if}" >
                                    <i class="sa-list-back"></i>
                                </a>
                            </li>
                           
                            <!-- <li>
                                <a href="" title="Archive" >
                                    <i class="sa-list-archive"></i>
                                </a>
                            </li> -->
                            <li>
                               <a href="{$smarty.server.REQUEST_URI}&modifylable=SPAM" title="Spam">
                                   <!-- <i class="sa-list-spam"></i> -->
                                    {*<i class=" fa fa-info-circle fa-2x"></i>*}
                                    <img  src="{$smarty.const.IMAGESLOCATION}/gmail/Spam.png" alt=""> 
                                  
                               </a>
                           </li>
                           
                            <li>
                                <a href="{$smarty.server.REQUEST_URI}&delete=DELETE" title="Delete" onclick="return confirm('Are you sure want to delete?');">
                                   {* <i class="sa-list-delete"></i>*}
                                   <img  src="{$smarty.const.IMAGESLOCATION}/gmail/Trash.png" alt=""> 
                                </a>
                            </li>

                             <li>
                                <a data-toggle="modal" href="#move-message" title="Move" >
                                    {*<i class="sa-list-move"></i>*}
                                    <img  src="{$smarty.const.IMAGESLOCATION}/gmail/Move.png" alt="">
                                </a>
                            </li>
                            
                          {if $smarty.get.label neq 'DRAFT'}  
                            <li>
                               <a href="#reply-message" data-toggle="modal" title="Reply" >
                                   {*<i class="fa fa-reply fa-2x"></i>*}
                                   <img  src="{$smarty.const.IMAGESLOCATION}/gmail/Reply.png" alt="">
                               </a>
                            </li>
                          {/if}  
                           
                           
                          
                           
                        </ul>

                        <div class="clearfix"></div>
                    </header>
                   
                    {foreach from=$bodymessage['modelData'] name='name' item='value' key='key'}

                    {if $value['name'] eq 'Subject'}
                    <h2 class="page-title">{$value['value']}{assign var="sub" value="{$value['value']}"}</h2>{/if}{/foreach}
 
                    <div class="media message-header o-visible">
                        <img src="{$smarty.const.IMAGESLOCATION}/profile-pics/profile_mask2.png" alt="" class="pull-left" width="20">
                      <!--  <div class="pull-right dropdown m-t-10">
                            <a href="" data-toggle="dropdown" class="p-5">Options</a>
                            <ul class="dropdown-menu text-right">
                                <li><a href="#reply-message" data-toggle="modal">Reply</a></li>
                                {if $smarty.get.label eq 'SPAM'}
                                <li><a href="{$smarty.server.REQUEST_URI}&modifylable=SPAM">Not Spam</a></li>
                                {else}
                                <li><a href="{$smarty.server.REQUEST_URI}&modifylable=SPAM">Mark as Spam</a></li>
                                {/if}
                            </ul>
                        </div> -->
                      
                        <div class="media-body">{foreach from=$bodymessage['modelData'] name='name' item='value' key='key'}
                          {if $value['name'] eq 'From'}  <span class="f-bold pull-left m-b-5">{$value['value']}</span>{/if}{/foreach}
                            <div class="clearfix"></div>
                            <span class="dropdown m-t-5">
                                To{foreach from=$bodymessage['modelData'] name='name' item='value' key='key'}{if $value['name'] eq 'To'} <a href="" class="underline">{$value['value']}{assign var="to" value="{$value['value']}"}</a>
                               <!--  <input type="text" class="form-control input-sm input-transparent" id="tomsg" value="{$value['value']}"> -->

                                {/if}{/foreach}on {foreach from=$bodymessage['modelData'] name='name' item='value' key='key'}{if $value['name'] eq 'Date'}{$value['value']|substr:0:16}{/if}{/foreach}
                            </span>
                            <div class="clearfix"></div>
                            <span class="dropdown m-t-5">{foreach from=$bodymessage['modelData'] name='name' item='value' key='key'}{if $value['name'] eq 'Cc'} <a href="" class="underline">{$value['name']} {$value['value']}{assign var="cc" value="{$value['value']}"}</a> {/if}{/foreach}
                            </span>
                        </div>


                    </div>
                   
                    <div class="p-15">
                       <div class="overflow" style="overflow: auto;max-height: 500px;"> {$bodymessage['decodedMessage']} {assign var="msg" value="{$bodymessage['decodedMessage']}"}</div>
                       
                    </div>
                   
                   
                    <hr class="whiter">
                         {if $smarty.get.label eq 'DRAFT'}
                                <a href="#demo" data-toggle="modal" onclick='draftmail("{$to}","{$cc}","{$bodymessage["decodedMessage"]}")'>Send</a>

                        

                 <div class="modal fade" id="demo">
                    <div class="modal-dialog">
                        <div class="modal-content">

                          

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="test();">&times;</button>
                                <h4 class="modal-title">NEW MESSAGE</h4>
                            </div>

                             <form method="POST" action="{$smarty.server.REQUEST_URI}&send" name="mail" id="composemail" enctype="multipart/form-data">
                             <input type="hidden" name="_token" value="{$csrf_token}">
                            <div class="modal-header p-0">
                                <input type="text" class="form-control input-sm input-transparent" name="toaddr" value="{$to}" id="toaddr" placeholder="To..."  required="required">
                            </div>

                            <div class="modal-header p-0">
                                <input type="text" class="form-control input-sm input-transparent" name="ccaddr" value="{$cc}"  id="ccaddr" placeholder="Cc...">
                            </div>

                            <div class="modal-header p-0">
                                <input type="text" class="form-control input-sm input-transparent"  value="{$sub}"  name="subject" id="subject" placeholder="Subject...">
                            </div>

                            <div class="modal-header p-0">
                                <input type="file" class="form-control input-sm input-transparent" name="fileToUpload[]" multiple>
                            </div>

                            <div class="p-relative">
                                <div class="message-options">
                                    <img src="{$smarty.const.IMAGESLOCATION}icon/tile-actions.png" alt="">
                                </div>
                                <textarea class="message-editor" placeholder="Message..." name="message"  id="messages">{$bodymessage["decodedMessage"]}</textarea>
                            </div>
                            <div class="modal-footer m-0">
                                <button  type="submit" class="btn" name="send" onclick="return close_diaglog();">Send</button>
                                <button  type="submit" class="btn" name="save" onclick="return close_diaglog();">Save</button>
                            </div>
                            </form>

                        </div>
                    </div>
                </div>
            {/if}





                {if isset($attachment)}
                   <div class="p-15">
                       <p>{$attachment|count} Attachements </p>
                      {foreach from=$attachment name='name' item='value' key='key'}
                       <a class="message-attachement news tile" href="https://s3-us-west-2.amazonaws.com/1dash/gmail/{$user_email}/{$value['attachmentFilename']}">
                           <img src="{$smarty.const.IMAGESLOCATION}/filemanager/icon/doc.png" alt="">
                           <br/>
                           <small class="t-overflow">{$value['attachmentFilename']}</small>
                       </a>
                    {/foreach}
                       
                   </div>  
                   {/if}

                </div>
                {/if}   
                
                </div>  

       
       
                </div>
         </div>       
                <!-- Compose -->
                <div class="modal fade" id="compose-message">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="test();">&times;</button>
                                <h4 class="modal-title">NEW MESSAGE</h4>
                            </div>

                             <form method="POST" action="{$smarty.server.REQUEST_URI}&send" name="mail" id="composemail" enctype="multipart/form-data">
                             <input type="hidden" name="_token" value="{$csrf_token}">
                            <div class="modal-header p-0">
                                <input type="text" class="form-control input-sm input-transparent" name="toaddr" id="toaddr" placeholder="To..."  required="required">
                            </div>

                            <div class="modal-header p-0">
                                <input type="text" class="form-control input-sm input-transparent" name="ccaddr" id="ccaddr" placeholder="Cc...">
                            </div>

                            <div class="modal-header p-0">
                                <input type="text" class="form-control input-sm input-transparent" name="subject" id="subject" placeholder="Subject...">
                            </div>

                            <div class="modal-header p-0">
                                <input type="file" class="form-control input-sm input-transparent" name="fileToUpload[]" multiple>
                            </div>

                            <div class="p-relative">
                                <div class="message-options">
                                    <img src="{$smarty.const.IMAGESLOCATION}icon/tile-actions.png" alt="">
                                </div>
                                <textarea class="message-editor" placeholder="Message..." name="message" id="messages"></textarea>
                            </div>
                            <div class="modal-footer m-0">
                                <button  type="submit" class="btn" name="send" onclick="return close_diaglog();">Send</button>
                                <button  type="submit" class="btn" name="save" onclick="return close_diaglog();">Save</button>
                            </div>
                            </form>

                        </div>
                    </div>
                </div>
                <div class="modal fade" id="move-message">
                    <div class="modal-dialog">
                        <div class="modal-content">
                        <form method="POST" id="labels" action="{$smarty.server.REQUEST_URI}&movelable" name="labels" >
                          <input type="hidden" name="_token" value="{$csrf_token}">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">MOVE THE MESSAGE</h4>
                            </div>
                            <div class="modal-header p-0">
                                <select class="form-control input-sm input-transparent" name="label" onchange="checkboxvalue_modal();">
                                 {foreach from=$listlables_name name='name' item='value' key='key'}
                                <option value="{$listlables_id[$key]}">{$listlables_name[$key]}</option>
                               
                                {/foreach}
                                </select>
                            </div>

                            <div class="modal-header p-0">
                                <input type="hidden" class="form-control input-sm input-transparent" name="msgidlable" id="msgidlable" >
                            </div>
                            <div class="modal-header p-0">
                                <input type="hidden" class="form-control input-sm input-transparent" name="lable" id="lable" >
                            </div>

                            <div class="modal-footer m-0">
                                <button  type="submit" class="btn" name="send">Move</button>
                              
                            </div>

                            </form>


                        </div>
                    </div>
                </div>

                <div class="modal fade" id="reply-message">

                    <div class="modal-dialog">

                        <div class="modal-content">
                            <form method="POST" action="{$smarty.server.REQUEST_URI}&reply" name="mail" enctype="multipart/form-data">
                            <input type="hidden" name="_token" value="{$csrf_token}">
                            <div class="modal-header">

                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                                <h4 class="modal-title">NEW MESSAGE</h4>

                            </div>

                            <div class="modal-header p-0">
                             {foreach from=$bodymessage['modelData'] name='name' item='value' key='key'}   
                                {if $value['name'] eq 'From'}

                                 <input type="text" class="form-control input-sm input-transparent" value="{$value['value']|replace:'"':''}" name="toaddr"  id="toaddr1" placeholder="To..." required="required" >
                               
                                {/if}
                             {/foreach}
                            </div>

 

                            <div class="modal-header p-0">

                                <input type="text" class="form-control input-sm input-transparent" name="ccaddr" placeholder="Cc...">

                            </div>

 

                            <div class="modal-header p-0">
{foreach from=$bodymessage['modelData'] name='name' item='value' key='key'}   
                                {if $value['name'] eq 'Subject'}
                                <input type="text" class="form-control input-sm input-transparent" name="subject" value="{$value['value']}" placeholder="Subject...">
{/if}
                             {/foreach}
                            </div>
                             <div class="modal-header p-0">
                                <input type="file" class="form-control input-sm input-transparent" name="fileToUpload[]" multiple>
                            </div>

                            <div class="p-relative">

                                <div class="message-options">
                                    <img src="{$smarty.const.IMAGESLOCATION}icon/tile-actions.png" alt="">
                                </div>
                                <textarea class="message-editor" placeholder="Message..." name="message"><br/><br/><br/>
                              <br/><br/><br/>{foreach from=$bodymessage['modelData'] name='name' item='value' key='key'}   
                                {if $value['name'] eq 'From'}{$value['value']|replace:'"':''}{/if}
                                {if $value['name'] eq 'Date'}{$value['value']}{/if}
                                {/foreach}<br/><br/>{$bodymessage['decodedMessage']}
                                     
                                </textarea>
                          
                               
                             
                              
                                  
                            </div>

                            <div class="modal-footer m-0">

                                <button  type="submit" class="btn" name="send" onclick="return close_diaglog();">Send</button>

                                <button  type="submit" class="btn" name="save" onclick="return close_diaglog();">Save</button>

                            </div>

                            </form>

 

                        </div>

                    </div>

                </div>
</div> 
</div>
<form method="POST" id="Preferences" name="Preferences" action="{$smarty.server.REQUEST_URI}&multidelete" >
  <input type="hidden" name="_token" value="{$csrf_token}">
  <input type="hidden" class="form-control " value="" name="msgid" id="msgid">  
    
</form>
       
<script src="{$smarty.const.JSLOCATION}/jquery.loader.js"></script> 
<link href="{$smarty.const.CSSLOCATION}/jquery.loader.css" rel="stylesheet">

<script type="text/javascript">
     var prtour = "{$smarty.get.prtour}";
     var isSocialSuccess = "{$smarty.session.isSocialSuccess}";
     var SocialMsg = "{$smarty.session.SocialMsg}";
        
    {literal}
         $(document).ready(function(){
            if(isSocialSuccess == "yes_display"){
                alert(SocialMsg);
                // unset session variable since you already showed message
                 $.post("ecommerce_ajax", {"unsetSocial":"unset social success session"}, function(data)
                     { 
                        if(data == "success"){
                            // alert("Thanks! Your shopify credentials saved successfully."); 
                        }                               
                     });
            }    
        });
        /*---------------------------------
        -----------~~~~~~~~~~~~~~~~~--------
        -----------*****************----------
        --------------------------------------*/
            if(prtour === '1')
            {
                 productTour(csslocation);
            }  
            $(document).ready(function(){
                 $.post('gmailAjax',
                {}, function(data){    
                    var resultObj = JSON.parse(data);                   
                    // document.getElementById("inboxunreadCount").value = resultObj.inboxunreadCount;
                    $("#inboxunreadCount").html(resultObj.inboxunreadCount);
                    $("#importantunreadCount").html(resultObj.importantunreadCount);
                    $("#starredunreadCount").html(resultObj.starredunreadCount);
                    $("#sentunreadCount").html(resultObj.sentunreadCount);
                    $("#draftunreadCount").html(resultObj.draftunreadCount);
                    $("#spamunreadCount").html(resultObj.spamunreadCount);                  
                });
                
                
                
                $('.message-editor').summernote({
                    toolbar: [
                      //['style', ['style']], // no style button
                      ['style', ['bold', 'italic', 'underline', 'clear']],
                      ['fontsize', ['fontsize']],
                      ['color', ['color']],
                      ['para', ['ul', 'ol', 'paragraph']],
                      //['height', ['height']],
                      ['insert', ['picture']], // no insert buttons
                      //['table', ['table']], // no table button
                      //['help', ['help']] //no help button
                    ],
                    height: 200,
                    resizable: false
                });
               
                $('.message-options').click(function(){
                    $(this).closest('.modal').find('.note-toolbar').toggle();
                }); 
            });
           
           
        $(".openMessage").click(function()
        {
           
                $("#main_message").hide();
                $("#drill_message").show();
        });

function checkboxvalues() {
      if(!confirm("Are you sure want to delete?")) {
        return false;
    }
    else{
  
     var msgids= [];
        $('.checked :input:checkbox').each(function () {
          
            msgids.push($(this).val());

           
      
  });

      document.getElementById("msgid").value = msgids;

     document.getElementById("Preferences").submit();
}
   
    
 }
 function checkboxvalue_modal() {
       var single_msg_id = getUrlVars()["msgid"];

      

      if(typeof single_msg_id == "undefined" || single_msg_id == null){
                  
                   var msgid= [];
                   $('.checked :input:checkbox').each(function () {
                      
                        msgid.push($(this).val());

                       
                  
              });
                 
                  document.getElementById("msgidlable").value = msgid;
        }
   
    
 else{
    var label = getUrlVars()["label"];
    document.getElementById("msgidlable").value = single_msg_id;
    document.getElementById("lable").value = label;


 } 
}
 function getUrlVars() {

var vars = {};
var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
vars[key] = value;
});
return vars;
}
function test(){
 
    var toaddr=$("#toaddr").val();
    var ccaddr=$("#ccaddr").val();
    var subj=$("#subject").val();
    var  text_editor = $(".note-editable > p").text();
    if(toaddr != '' || ccaddr != '' || subj !='' || text_editor!=''){
       if(text_editor == '' || toaddr == '')
     {
        text_editor = "          ";
      
     }
     var msg =  $("#messages").val(text_editor);
   

     document.getElementById("composemail").submit();
    }

   

}
function draftmail(cc,message,to){
//alert("fsafsad");
  // alert(to);
   //alert(cc);
   //alert(message);


}

function close_diaglog(){
//alert("dsfsd");
    var toaddr=$('#toaddr').val();
    var toaddr=toaddr.trim();
      
    var toaddr1=$('#toaddr1').val();
    var toaddr1=toaddr1.trim();
        if(toaddr){
               $('body').addClass('loading').loader('show', {
                                              overlay: true
                                          });
                                          return true;
        }
        

        if(toaddr1){
               $('body').addClass('loading').loader('show', {
                                              overlay: true
                                          });
                return true;
            }

}




/*setTimeout(function(){
  window.location.reload(1);
}, 300000);
*/

$("#showReply").click(function(){
        $("#welcomeDiv").toggle();
    });
$('#sidebar').css('height',document.body.scrollHeight);
{/literal}
</script>
    
