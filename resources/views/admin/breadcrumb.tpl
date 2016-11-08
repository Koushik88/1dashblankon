{*
==================================================================
#  Global Basics Inc - Backend	:: Breadcrumbs Template          #
==================================================================

    Document       : Breadcrumbs Template
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Managing Breadcrumbs for admin view pages
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}

{* Breadcrumbs for admin view pages *}
<div class="media-body">
    <ul class="breadcrumb">
      <li>
         <a href="{$smarty.const.PORTALLOCATION}admin/index.php">
              <i class="fa fa-home"></i>
         </a>
      </li>
                 {foreach from=$breadcrumb name="bc" item="bi"}
                       {if !$smarty.foreach.bc.last}
                            <li>   
                                <a href="{$bi["href"]}">
                                    <span class="text-primary"> {$bi["name"]} </span>
                                </a>
                            </li>   
                        {else}
                           <li>   
                                <a href="javascript:void(0);">
                                    {$bi["name"]}
                                </a>
                           </li>  
                        {/if}
                 {/foreach}
    </ul>
</div>              
