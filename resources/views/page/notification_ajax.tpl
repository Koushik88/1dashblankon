
{if isset($notification)}
       
                {foreach $notification as $key=>$value}  
                  <div class="media" style="padding-left:10px;">
                      <div class="pull-left circle_img" style="background-image:url('{$smarty.const.IMAGESLOCATION}profile-pics/{$value["profilepic"]}')">
                         {* <img width="40" src="{$smarty.const.IMAGESLOCATION}profile-pics/{$value["profilepic"]}" alt="">
                          *}
                      </div>
                      <div class="media-body">
                          <small class="text-muted">{$value["first_name"]} - <i class="fa fa-clock-o"></i>&nbsp; {$value["msgtime"]} - {$value["category"]}</small><br>
                          <a class="t-overflow" href="javascript:void(0);">{$value["msg"]}</a>
                      </div>
                  </div>           
                 {/foreach} 
        </div>
{/if}
                  