<style type="text/css">
.not-logged {
    height: 25px;
    top: -10px; right:-10px;
    background: none;
    font-size: 11px !important;
    position: absolute;
    text-align: center;
    padding: 2px 3px 3px;
    line-height: 100%;
    -webkit-animation-name: bounceIn;
    animation-name: bounceIn;
}
.ecomactive {
    background: rgba(0,0,0,0.6);
    opacity: 1;
}
#style-3::-webkit-scrollbar-track
{
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
    background-color: transparent !important;
}

#style-3::-webkit-scrollbar
{
    width: 6px;
    background-color: transparent !important;
}

#style-3::-webkit-scrollbar-thumb
{
    background-color: rgba(0,0,0,0.5);
}
</style>

<div class="block-area shortcut-area" id="loadAllEcommercePlugins">

</div>
<hr class="whiter" />
{literal}
    <script>       
        // get all social media config details
        getAllEcommerceConfig();
        function getAllEcommerceConfig(){
           $.post(portalLocation+'module/allEcommerceConfigCheck.php',{"ecommerce":"allConfig"}, function(data){
                $("#loadAllEcommercePlugins").html(data);
           }); 
        }

        // do configuration from here
        function doConfigureSocialPlugin(plugin){
            var anchor = document.createElement('a');
            if(plugin == "facebook"){
                anchor.href = "../plugin/facebook_ajax.php?source=widget";
            }
            if(plugin == "twitter"){
                anchor.href = "../plugin/twitter_ajax.php?source=widget";
            }
            if(plugin == "pinterest"){
                anchor.href = "../plugin/pinterest_ajax.php?source=widget";
            }
            if(plugin == "instagram"){
                anchor.href = "../plugin/instagram_ajax.php?source=widget";
            }
            if(plugin == "vimeo"){                
                anchor.href = "../plugin/vimeo_ajax.php?source=widget";
            }
            if(plugin == "google"){
                anchor.href = "../plugin/google_signin_ajax.php?source=widget";
            }

            document.body.appendChild(anchor);
            anchor.click();

        } 
        
    </script>
{/literal}
