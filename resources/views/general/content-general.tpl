{*
#*******************************************************************#
#	Global Basics Inc ::  Genaral Template                          #
#*******************************************************************#

    Document       : Genaral Template page
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Genaral template page for include all common templates 
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}


{assign var="isshowleft" value=$isshowleft|default:true}
    {assign var="mainsectionid" value="one-column"}
    {assign var="mainadminclass" value=""}
    {if isset($smarty.session.user_type) && $smarty.session.user_type  != "3"}
        {assign var="mainadminclass" value=" sadmin"}
    {/if}    
  
    
{if isset($smarty.session.user_type)}                                            
        <header id="header" class="media" style="margin-top:0px;">
            <a href="" id="menu-toggle"></a> 
            <a class="logo pull-left" href="javascript:void(0);"><img src="{$smarty.const.PAGELOCATION}logo/1DashFinal_WhiteOption_155.png"></a>
            
            <div class="media-body">
                <div class="media" id="top-menu">
                    <div class="pull-left tm-icon">
                        <a  id="prtour_profile" href="profile">
                            <img src="{$smarty.const.IMAGESLOCATION}icon/icon-02.png" style="padding-top:10px;">
                            {*<i class="sa-profile-img"></i>*}
                            {*<i class="n-count animated"></i>*}
                            <span>&nbsp;Profile</span>
                        </a>
                    </div>
                    <div class="pull-left tm-icon">
                        <a id="prtour_notification" data-drawer="notifications" class="drawer-toggle" href="">
                            <img src="{$smarty.const.IMAGESLOCATION}icon/icon-01.png" style="padding-top:10px;">
                            {*<i class="sa-notify-img"></i>*}
                             <span id="notify-n-count"></span>
                            <span>&nbsp;Notifications</span>
                        </a>
                    </div>
                            
                        {if $smarty.session.user_type eq '1'}        
                                <div class="pull-left tm-icon">
                                    <a id="prtour_admin" data-drawer="" class="" href="{$smarty.const.PORTALLOCATION}page/admin.php?mid=1337&nav=12">
                                        <img src="{$smarty.const.IMAGESLOCATION}icon/admin-white.png" style="padding-top:10px;">
                                        <span>&nbsp;Admin</span>
                                    </a>
                                </div>  
                        {/if}    
                    
                    
                    <div class="pull-left tm-icon">        
                       <a id="prtour_theme" href="#changeSkin" data-toggle="modal">
                           <img src="{$smarty.const.IMAGESLOCATION}shortcuts/settings.png" style="padding-top:10px;" width="26" height="36">
                            <span>&nbsp;Theme</span>
                       </a> 
                     </div> 
                            
                    <div class="pull-left tm-icon">        
                       <a onclick="productTour('{$smarty.const.CSSLOCATION}');" href="javascript:void(0);">
                           <img src="{$smarty.const.IMAGESLOCATION}shortcuts/tour.png" style="padding-top:10px;" width="26" height="36">
                            <span style="font-weight:normal !important;font-size:12px !important;">Product Tour&nbsp;&nbsp;&nbsp;</span>
                       </a> 
                    </div> 
                            
                    <div class="media-body pull-left">
                        <!-- <input type="text" class="main-search"> -->
                        <div class="g-search" id="prtour_goolesearch">
                            <script>
                              (function() {
                                var cx = '017776142222451159515:qyyej9x5g7c';
                                var gcse = document.createElement('script');
                                gcse.type = 'text/javascript';
                                gcse.async = true;
                                gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
                                var s = document.getElementsByTagName('script')[0];
                                s.parentNode.insertBefore(gcse, s);
                              })();
                            </script>
                            <gcse:search></gcse:search>
                        </div>
                    </div>   
                            
                            
                            
                    <div class="pull-right" id="time">
                             {* <a a href="#help"  data-toggle="modal" title="Support"> 
                                <img src="{$smarty.const.IMAGESLOCATION}icon/support-white.png">
                               
                            </a>
                               *}
                            <span id="hours"></span>
                           {* :
                            <span id="min"></span>
                            :
                            <span id="sec"></span>*}
                            <span> &nbsp;&nbsp;&nbsp;&nbsp;<a  id="prtour_logout" href="logout"><i class="fa fa-sign-out" title= "Logout" aria-hidden="true"></i> <span class="sr-only"></span></a> </span>
                        
                    </div>
                            <div class="media-body pull-right" style="padding-top:11px !important;"><span style="font-size:17px !important;">{$smarty.session.name|ucfirst} &nbsp;&nbsp;&nbsp;</span></div>
                     
                    
                    
                    {*<div class="media-body">
                        <input type="text" class="main-search">
                    </div>*}
                </div>
            </div>
        </header>
                 <div class="clearfix"></div>

{if $isshowleft}  
{if isset($smarty.session.token) && isset($smarty.session.user_type)}
                  {assign var="inc" value="0"}
                  {assign var="itr" value="1"}
                  {assign var="ml" value="2"}
                  
{if isset($menus['0']['0']['children']['0']['href'])}                          
        <!-- Sidebar -->
{*<aside id="sidebar">
   <!-- Side Menu -->                              
            <ul class="list-unstyled side-menu">
             {foreach from=$menus name="menusection" key=mks item=mvs}
                       {foreach from=$mvs name="menus" key=mk item=mv} 
                       {if $mv["sid"] neq '12'}         
                            <li class="{if $mv["sid"] eq $smarty.get.nav} active{/if}"><a a class="sa-side-home" href=""> <span class="menu-item">{$mv["name"]}</span></a>
                                   {if $mv["children"]|@count > 0}
                                      <ul class="list-unstyled menu-item">
                                           {foreach from=$mv["children"] name="cmenus" key=mkc item=mvc}
                                             {assign var="activemenu" value=$mvc['name']}
                                                 <li {if isset($smarty.get.mid)}{if $mvc["mid"] eq $smarty.get.mid} class="active"{/if}{/if}><a href="{$mvc["href"]}" {if isset($smarty.get.mid)}{if $mvc["mid"] eq $smarty.get.mid} class="active"{/if}{/if}>{$mvc["name"]|ucfirst}</a></li>
                                             {assign var="ml" value=$ml+1}
                                           {/foreach}
                                       </ul>
                                     {/if}
                               {assign var="itr" value=$itr + 1}
                               {assign var="inc" value=$inc + 1}
                            </li>
                        {/if}
                       {/foreach}
                 {/foreach}
              </ul>         
   </aside>*}       
   
<!-- Sidebar -->
        <aside id="sidebar">
           <!-- Side Menu -->    
        {foreach from=$menus name="menusection" key=mks item=mvs}
            {foreach from=$mvs name="menus" key=mk item=mv} 
                    {if $mv["sid"] neq '12'}         
                        {if $mv["children"]|@count > 0}
                            <ul class="list-unstyled side-menu">
                                {foreach from=$mv["children"] name="cmenus" key=mkc item=mvc}
                                    {assign var="activemenu" value=$mvc['name']}
                                        <li class="{if $mvc["mid"] eq $smarty.get.mid}active{/if}"><a id="prtour_{$mvc["mid"]}" class="{$mvc["report_icon"]}" href="{$mvc["href"]}"> <span class="menu-item">{$mvc["name"]}</span></a>
                                    {assign var="ml" value=$ml+1}
                                {/foreach}
                            </ul>
                        {/if}
                        {assign var="itr" value=$itr + 1}
                        {assign var="inc" value=$inc + 1}

                    {/if}
                {/foreach}
        {/foreach}                                
        </aside>   
{/if} 

{elseif isset($smarty.session.token)}
    
{/if}  

    <section id="content" class="container">
       <!-- Breadcrumb -->
           {*<ol class="breadcrumb hidden-xs">
               <li><a href="#">Home</a></li>
               <li><a href="#">Library</a></li>
               <li class="active">Data</li>
           </ol> *}               
       <h4 class="page-title">{$bc1}</h4> 

            {include 'page/theme.tpl' nocache}
            {include 'page/notification.tpl' nocache}
            {include $page|cat:".tpl" nocache}
            {include 'page/chat.tpl' nocache}

    </section>      
{/if}    


{else}

   {include $page|cat:".tpl" nocache}

{/if}
    


{*<script language=JavaScript> var message="Function Disabled!"; function clickIE4(){ if (event.button==2){ alert(message); return false; } } function clickNS4(e){ if (document.layers||document.getElementById&&!document.all){ if (e.which==2||e.which==3){ alert(message); return false; } } } if (document.layers){ document.captureEvents(Event.MOUSEDOWN); document.onmousedown=clickNS4; } else if (document.all&&!document.getElementById){ document.onmousedown=clickIE4; } document.oncontextmenu=new Function("alert(message);return false") </script>*}