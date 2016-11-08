{*
#*******************************************************************#
#		Global Basics Inc :: Report search Page             #
#*******************************************************************#

    Document       : Report search Page
    Created on     : 24-06-2016
    Author         : Rubanraj S , Ponnar V
    Description    : Report search Page
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
 * 
*}

                    {assign var="inc" value="0"}
                    {assign var="itr" value="1"}
                    {assign var="ml" value="2"}
                   
{if isset($menus['0']['0']['children']['0']['href'])}   
           <ul class="nav nav-pills nav-stacked">
          {foreach from=$menus name="menusection" key=mks item=mvs}
                    {foreach from=$mvs name="menus" key=mk item=mv} 
                     <li class="parent{if $mv["sid"] eq $smarty.get.nav} active{/if}"><a href="javascript:void(0);"><i class="{$image_class[$smarty.foreach.menusection.index]}"></i> <span>{$mv["name"]}</span></a>
                            {if $mv["children"]|@count > 0}
                               <ul class="children">
                                    {foreach from=$mv["children"] name="cmenus" key=mkc item=mvc}
                                      {assign var="activemenu" value=$mvc['name']}

                                      <li {if isset($smarty.get.mid)}{if $mvc["mid"] eq $smarty.get.mid} class="active"{/if}{/if}><a href="{$mvc["href"]}" {if isset($smarty.get.mid)}{if $mvc["mid"] eq $smarty.get.mid} class="active"{/if}{/if}>{$mvc["name"]|capitalize}</a></li>

                                      {assign var="ml" value=$ml+1}
                                    {/foreach}
                                </ul>
                              {/if}
                        {assign var="itr" value=$itr + 1}
                        {assign var="inc" value=$inc + 1}
                     </li>
                    {/foreach}
              {/foreach}
              </ul>
               
{else}
    <code>&nbsp;&nbsp;<strong>No Reports & Module Found.</strong></code>
{/if}


{literal}
    <script type="text/javascript">
     jQuery('.leftmypanel .nav .parent > a').click(function() 
     {      
          var coll = jQuery(this).parents('.collapsed').length;      
            if (!coll) 
            {

                          jQuery('.leftmypanel .nav .parent-focus').each(function() {
                             jQuery(this).find('.children').slideUp('fast');
                             jQuery(this).removeClass('parent-focus');
                          });

                           var child = jQuery(this).parent().find('.children');

                       if(!child.is(':visible')) {
                          child.slideDown('fast');
                          if(!child.parent().hasClass('active'))
                             child.parent().addClass('parent-focus');
                       } else {
                          child.slideUp('fast');
                          child.parent().removeClass('parent-focus');
                       }
            }
          return false;
     });
    </script>    
{/literal}    
    