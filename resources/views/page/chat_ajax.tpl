{if isset($chartUserList)}
{foreach $chartUserList as $key=>$value}
    <div class="media chatUserInfo" {if $value['id'] eq $latestChatUser} style="background-color:#3A94D0;cursor:pointer;"{else} style='cursor:pointer;'{/if} id="chatUserInfo{$value['id']}" onclick="selectChartUser('{$value['id']}');">
        <div class="pull-left circle_img" style="margin-left:10px;background-image:url('{$smarty.const.IMAGESLOCATION}profile-pics/{$value['profilepic']}')"> </div>
            <div class="media-body p-t-5">
                {$value['full_name']}
            </div>
    </div>
{/foreach}  
 <input type="hidden" id="latchartUserId" value="{$latestChatUser}">
{/if}


    {if isset($loadmsg)}
      {foreach $loadmsg as $key=>$value} 
       {if $smarty.session.userId eq $value["user_one"]}   
           <div class="media pull-right" style="width:51%">
               <div class="pull-right circle_img" style="background-image:url('{$smarty.const.IMAGESLOCATION}profile-pics/{$value['profilepic']}')"> </div>
                <div class="media-body">
                   {$value["reply"]}
                    <small>Me</small>
                </div>
            </div><br/><br/>
        {else}
            <div class="media pull-left" style="width:51%">
                <div class="pull-left circle_img" style="background-image:url('{$smarty.const.IMAGESLOCATION}profile-pics/{$value['profilepic']}')"></div>
                <div class="media-body">
                   {$value["reply"]}
                    <small>{$value["first_name"]}</small>
                </div>
            </div><br/><br/>
        {/if}
        
      {/foreach}     
    {/if}    