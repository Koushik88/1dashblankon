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
.fb_manage_page_caret{
    height: 15px;
    top: 33px;
    left: 30px;
    font-size: 14px !important;
    position: absolute;
    padding: 2px 4px;
    margin: 12px 0 0 -18px;
    -webkit-animation-name: bounceIn;
    animation-name: bounceIn;
    color: rgba(255,255,255,0.5);
    cursor: pointer;
    z-index: 9999999;
}
.fb_manage_page_caret:hover{
    color: rgba(255,255,255,1);
}
.iradio_minimal.checked {
    background: rgba(59, 89, 152,0.8) !important;
    top: 15px;
    margin-right: 20px;
}
.iradio_minimal {
    border-radius: 50px !important;
    top: 15px;
    margin-right: 20px;
    position: relative;
}
.iradio_minimal:hover {
    background: rgba(59, 89, 152,0.6) !important;
}
.pagediv {
    cursor: pointer;
    padding-bottom: 10px;
    margin: 10px 0px;
    border-bottom: 1px solid rgba(238,238,238,0.3);
}
.pagediv:hover{
    cursor: pointer;
    background-color: rgba(19, 19, 19, 0.55);
}

</style>

    <div class="block-area shortcut-area">
            <span id="loadAllSocialPlugins">

            </span>
        <a class="shortcut tile" href="javascript:void(0);" id="pick">
            <img alt="" src="{$smarty.const.IMAGESLOCATION}social/googledrive.svg">
            <small class="t-overflow">Drive</small></img>
        </a> 
    </div>
        
        
        
<hr class="whiter" />


{literal}
    <script>  
        var isSocialSuccess = "{/literal}{$smarty.session.isSocialSuccess}{literal}";
        var SocialMsg = "{/literal}{$smarty.session.SocialMsg}{literal}";
        $(document).ready(function(){
            if(isSocialSuccess == "yes_display"){
                alert(SocialMsg);
                // unset session variable since you already showed message
                 $.post(portalLocation+"module/ecommerce_ajax.php", {"unsetSocial":"unset social success session"}, function(data)
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
        function fbpagesession(pageid){ 
            $("#fb_anchr").attr("href", "https://www.facebook.com/"+pageid); 
            $("#fb_anchr").attr("title", pagename);  
            var pagename = $("#"+pageid).val();
            // alert(pagename);            
            $.post(portalLocation+'plugin/facebook_oauth.php',{"pageselected":"saveSessionPageId","pageid":pageid,"pagename":pagename}, function(data){                
                    $('#manageFBPages').modal('hide');
                    alert(data);               
           });            
        }
        // get all social media config details
        getAllPluginConfig();
        function getAllPluginConfig(){
           $.post(portalLocation+'module/allPluginsConfigCheck.php',{"socailMedia":"allConfig"}, function(data){
                $("#loadAllSocialPlugins").html(data);
                //initPicker();
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

        // update recent social posts counts
        //socialMediaCounts();
        function socialMediaCounts()
        {
            $.post(portalLocation+'module/rssfeed.php',{"socailMediaCount":"socailMediaCount"}, function(data){ 

                var json_value = JSON.parse(data);
                
                if(json_value.Facebook["Count"] > 0)
                {
                    $("#fb_count").html("<i class='social-count animated'>"+json_value.Facebook["Count"]+"</i>");                    
                }
                if(json_value.Facebook["ProfileUrl"]){
                    $("#fb_anchr").attr("href", json_value.Facebook["ProfileUrl"]);
                }
                if(json_value.Twitter["Count"] > 0)
                {
                    $("#tw_count").html("<i class='social-count animated'>"+json_value.Twitter["Count"]+"</i>");                    
                }  
                if(json_value.Twitter["ProfileUrl"]){
                    $("#tw_anchr").attr("href", json_value.Twitter["ProfileUrl"]);
                }
                if(json_value.GooglePlus["Count"] > 0)
                {
                    $("#gp_count").html("<i class='social-count animated'>"+json_value.GooglePlus["Count"]+"</i>");                    
                    
                }
                if(json_value.GooglePlus["ProfileUrl"]){
                    $("#gp_anchr").attr("href", json_value.GooglePlus["ProfileUrl"]);
                }
                if(json_value.Instagram["Count"] > 0)
                {
                    $("#instagram_count").html("<i class='social-count animated'>"+json_value.Instagram["Count"]+"</i>");                    
                }   
                if(json_value.Instagram["ProfileUrl"]){
                    $("#inst_anchr").attr("href", json_value.Instagram["ProfileUrl"]);
                }
                if(json_value.Pinterest["Count"] > 0)
                {
                    $("#pin_count").html("<i class='social-count animated'>"+json_value.Pinterest["Count"]+"</i>");
                }
                if(json_value.Pinterest["ProfileUrl"]){
                    $("#pin_anchr").attr("href", json_value.Pinterest["ProfileUrl"]);
                }
                
                if(json_value.YouTube["Count"] > 0)
                {
                    $("#youtube_count").html("<i class='social-count animated'>"+json_value.YouTube["Count"]+"</i>");                    
                }
                if(json_value.YouTube["ProfileUrl"]){
                    $("#you_anchr").attr("href", json_value.YouTube["ProfileUrl"]);
                }
                if(json_value.Gmail["Count"] > 0)
                {
                    $("#gmail_count").html("<i class='social-count animated'>"+json_value.Gmail["Count"]+"</i>");
                }   
                if(json_value.Vimeo["Count"] > 0)
                {
                    $("#vimeo_count").html("<i class='social-count animated'>"+json_value.Vimeo["Count"]+"</i>");                    
                }
                if(json_value.Vimeo["ProfileUrl"]){
                    $("#vmo_anchr").attr("href", json_value.Vimeo["ProfileUrl"]);
                }
                if(json_value.Calendar["Count"] > 0)
                {
                    $("#calendar_count").html("<i class='social-count animated'>"+json_value.Calendar["Count"]+"</i>");
                }                
                 //   $("#calendar_count").html("<i class='social-count animated'>0</i>");

            });

         }

    </script>
{/literal}
