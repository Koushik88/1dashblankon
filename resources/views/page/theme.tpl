 {*<a id="settings" href="#changeSkin" data-toggle="modal">
                <i class="fa fa-gear"></i> 
                Change Skin
 </a>
 *}               <div class="modal fade" id="changeSkin" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title">Change Template Skin</h4></div>
                                <div class="modal-body">
                                    <div class="row template-skins">
                                       <div class="row">
                                        <a data-skin="skin-blur-shaded"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-shaded');"><img src="{$smarty.const.IMAGESLOCATION}/body/blue-shaded.jpg" alt=""></a>
                                        <a data-skin="skin-blur-violate"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-violate');"><img src="{$smarty.const.IMAGESLOCATION}/body/violate.jpg" alt=""></a>
                                        <a data-skin="skin-blur-lights"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-lights');"><img src="{$smarty.const.IMAGESLOCATION}/body/lights.jpg" alt=""></a>
                                        <a data-skin="skin-blur-city"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-city');"><img src="{$smarty.const.IMAGESLOCATION}/body/city.jpg" alt=""></a>
                                        <a data-skin="skin-blur-greenish"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-greenish');"><img src="{$smarty.const.IMAGESLOCATION}/body/greenish.jpg" alt=""></a>
                                        <a data-skin="skin-blur-night"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-night');"><img src="{$smarty.const.IMAGESLOCATION}/body/night.jpg" alt=""></a>
                                       </div>    
                                      <div class="row">  
                                        <a data-skin="skin-blur-blue"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-blue');"><img src="{$smarty.const.IMAGESLOCATION}/body/blue.jpg" alt=""></a>
                                        <a data-skin="skin-blur-sunny"   class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-sunny');"><img src="{$smarty.const.IMAGESLOCATION}/body/sunny.jpg" alt=""></a>
                                        <a data-skin="skin-cloth" class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-cloth');"><img src="{$smarty.const.IMAGESLOCATION}/body/cloth.jpg" alt=""></a>
                                        <a data-skin="skin-tectile"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-tectile');"><img src="{$smarty.const.IMAGESLOCATION}/body/tectile.jpg" alt=""></a>
                                        <a data-skin="skin-blur-chrome"   class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-chrome');"><img src="{$smarty.const.IMAGESLOCATION}/body/chrome.jpg" alt=""></a>
                                        <a data-skin="skin-blur-ocean"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-ocean');"><img src="{$smarty.const.IMAGESLOCATION}/body/ocean.jpg" alt=""></a>
                                      </div>  
                                     <div class="row">  
                                        <a data-skin="skin-blur-sunset"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-sunset');"><img src="{$smarty.const.IMAGESLOCATION}/body/sunset.jpg" alt=""></a>
                                        <a data-skin="skin-blur-yellow"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-yellow');"><img src="{$smarty.const.IMAGESLOCATION}/body/yellow.jpg" alt=""></a>
                                        <a data-skin="skin-blur-kiwi"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-kiwi');"><img src="{$smarty.const.IMAGESLOCATION}/body/kiwi.jpg" alt=""></a>
                                        <a data-skin="skin-blur-nexus"  class="col-sm-2 col-xs-4" href="javascript:void(0);" onclick="changeTheme('skin-blur-nexus');"><img src="{$smarty.const.IMAGESLOCATION}/body/nexus.jpg" alt=""></a>
                                     </div>
                                     </div>
                                </div>
                        </div>
                    </div>
</div>

{literal}                                     
    <script typ="text/javascript">
       $( ".template-skins > .row > a" ).click(function(e) {
            e.preventDefault();
            var bodyId = e.currentTarget.getAttribute("data-skin");
            $("body").attr('id', bodyId);
            $(".modal").modal("hide");
        });

     function changeTheme(themeId)
        {
             $.post(portalLocation+"page/settings.php", {"themeId":themeId}, function(data){    
                
              });
        }

    </script>
{/literal}  
                                          
                                          