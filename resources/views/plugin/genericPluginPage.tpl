<div class="tile">
    <h2 class="tile-title">Connections</h2>
    <div class="tile-config dropdown" id="prtour_connections">
        <a  data-toggle="dropdown" href="" class="tooltips tile-menu" title="" data-original-title="Options"></a>
        <ul class="dropdown-menu pull-right text-right"> 
            <li><a href="#addNewPlugin" data-toggle="modal">Add New</a></li>                                        
        </ul>
    </div>
                                
    <div class="listview narrow">  
        {assign var="qb_cnt" value="0"}
        {foreach $plugins as $key=>$value}
           {if $value eq 'Quickbook' && $qb_cnt eq '0'}   
                <div class="media p-l-5">
                    <div class="pull-left">
                        <img width="15" src="{$smarty.const.IMAGESLOCATION}plugin-icon/112.png" alt="">
                    </div>
                    <div class="media-body">
                        <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('Quickbook');">QuickBooks</a>
                        <div class="pull-right">
                            <a  href="#deleteQBOCredentails" data-toggle="modal" onclick="deleteCompanyList()"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                            &nbsp;&nbsp;
                        </div>
                        <div class="clearfix"></div>
                    </div>                                        
                </div>
        {$qb_cnt = $qb_cnt+1}    
            {else if $value eq 'LinkedIn'}      
            <div class="media p-l-5">
                <div class="pull-left">
                    <img width="15" src="{$smarty.const.IMAGESLOCATION}plugin-icon/83.png" alt="">
                </div>
                <div class="media-body">
                    <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('LinkedIn');">LinkedIn Company Page</a>
                    <div class="pull-right">
                        <a href="javascript:void(0)" onclick="deletePluginConnection('LinkedIn');"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                        &nbsp;&nbsp;
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            {else if $value eq 'Twitter'}                
            <div class="media p-l-5">
                <div class="pull-left">
                    <img width="15" src="{$smarty.const.IMAGESLOCATION}plugin-icon/74.png" alt="">
                </div>
                <div class="media-body">
                    <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('Twitter');">Twitter</a>
                    <div class="pull-right">
                        <a href="javascript:void(0)" onclick="deletePluginConnection('Twitter');"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                        &nbsp;&nbsp;
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            {else if $value eq 'Gmail'}                
            <div class="media p-l-5">
                <div class="pull-left">
                    <img width="15" src="{$smarty.const.IMAGESLOCATION}plugin-icon/40.png" alt="">
                </div>
                <div class="media-body">
                    <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('Gmail');">Gmail</a>
                    <div class="pull-right">
                        <a href="javascript:void(0)" onclick="deletePluginConnection('Gmail');"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                        &nbsp;&nbsp;
                    </div>
                    <div class="clearfix"></div>               
                </div>
            </div>
            {else if $value eq 'google_analytics'}                
            <div class="media p-l-5">
                <div class="pull-left">
                    <img width="15" src="{$smarty.const.IMAGESLOCATION}plugin-icon/100.png" alt="">
                </div>
                <div class="media-body">
                    <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('google_analytics');">Google Analytics</a>
                    <div class="pull-right">
                        <a href="javascript:void(0)" onclick="deletePluginConnection('google_analytics');"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                        &nbsp;&nbsp;
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            {else if $value eq 'Facebook'}
            <div class="media p-l-5">
                <div class="pull-left">
                   <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/facebook.png" alt="" width="15px" height="15px">
                </div>
                <div class="media-body">
                    <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('Facebook');">Facebook</a>
                    <div class="pull-right">
                        <a href="javascript:void(0)" onclick="deletePluginConnection('Facebook');"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                        &nbsp;&nbsp;
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
            {else if $value eq 'Instagram'}
            <div class="media p-l-5">
                <div class="pull-left">
                   <img src="{$smarty.const.IMAGESLOCATION}plugin-icon/instagram-new.png" alt="" width="15px" height="15px">
                </div>
                <div class="media-body">
                    <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('Instagram');">Instagram</a>
                    <div class="pull-right">
                        <a href="javascript:void(0)" onclick="deletePluginConnection('Instagram');"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                        &nbsp;&nbsp;
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
            {else if $value eq 'Pinterest'}
            <div class="media p-l-5">
                <div class="pull-left">
                   <img src="{$smarty.const.IMAGESLOCATION}plugin-icon/Pinterest.svg" alt="" width="15px" height="15px">
                </div>
                <div class="media-body">
                    <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('Pinterest');">Pinterest</a>
                    <div class="pull-right">
                        <a href="javascript:void(0)" onclick="deletePluginConnection('Pinterest');"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                        &nbsp;&nbsp;
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
            {else if $value eq 'Vimeo'}
            <div class="media p-l-5">
                <div class="pull-left">
                   <img src="{$smarty.const.IMAGESLOCATION}plugin-icon/vimeo.png" alt="" width="15px" height="15px">
                </div>
                <div class="media-body">
                    <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('Vimeo');">Vimeo</a>
                    <div class="pull-right">
                        <a href="javascript:void(0)" onclick="deletePluginConnection('Vimeo');"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                        &nbsp;&nbsp;
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
            {else if $value eq 'Shopify'}
            <div class="media p-l-5">
                <div class="pull-left">
                   <img src="{$smarty.const.IMAGESLOCATION}plugin-icon/shopify-sm.png" alt="" width="16px" height="16px">
                </div>
                <div class="media-body">
                    <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('Shopify');">Shopify</a>
                    <div class="pull-right">
                        <a href="javascript:void(0)" onclick="deletePluginConnection('Shopify');"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                        &nbsp;&nbsp;
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
            {else if $value eq 'WooCommerce'}
            <div class="media p-l-5">
                <div class="pull-left">
                   <img src="{$smarty.const.IMAGESLOCATION}plugin-icon/woocommerce-sm.png" alt="" width="16px" height="16px">
                </div>
                <div class="media-body">
                    <a class="news-title" href="#addCrdentials" {*data-toggle="modal"*} onclick="updateCrderentials('WooCommerce');">WooCommerce</a>
                    <div class="pull-right">
                        <a href="javascript:void(0)" onclick="deletePluginConnection('WooCommerce');"><img width="12" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""></a>
                        &nbsp;&nbsp;
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>
            
            {/if}
          
        {/foreach} 
    </div>
</div>
                                
                                
<div class="modal fade" id="addNewPlugin" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Add Connections</h4>
            </div>
            <div class="modal-body">                                    
                <div class="tab-container tile media">
                    <ul class="tab pull-left tab-vertical nav nav-tabs">
                       {* <li class="active"><a href="#custom">Custom</a></li>*}
                        <li class="active"><a href="#email_cred">Google & YouTube</a></li>
                        <li><a href="#sales">Sales &amp; Finance</a></li>
                        <li><a href="#social">Social Media</a></li>
                        <li><a href="#ecommerce">Ecommerce</a></li>
                    </ul>

                    <div class="tab-content media-body">

                        {*<div class="tab-pane active" id="custom">
                            <div class="listview narrow" style="border-bottom: 1px solid rgba(255, 255, 255, 0.11) !important;">
                                <div class="media">
                                      <div class="media-body p-t-5">
                                          <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/100.png" alt="">
                                          &nbsp;&nbsp; Google Analytics
                                         <a href="#addCrdentials" data-toggle="modal" class="btn btn-sm m-r-5 pull-right" onclick="loadNewCredentialPage('google_analytics');">Add</a>
                                     </div>

                                </div>                                                                    
                            </div>    
                        </div>*}

                        <div class="tab-pane active" id="email_cred">
                            <div class="listview narrow" style="border-bottom: 1px solid rgba(255, 255, 255, 0.11) !important;">
                                <div class="media">
                                      <div class="media-body p-t-5">
                                        <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/google.png" alt="" width="16px" height="16px">
                                          &nbsp;&nbsp; Google
                                         <a href="javascript:void(0);" data-toggle="modal" class="btn btn-sm m-r-5 pull-right" onclick="addGoogleConnection('google');">Add</a>
                                     </div>

                                </div>                                                                    
                            </div>                                                       
                        </div>                                                                  
                                                                 

                        <div class="tab-pane" id="sales">
                            <div class="listview narrow" style="border-bottom: 1px solid rgba(255, 255, 255, 0.11) !important;">
                                <div class="media">
                                      <div class="media-body p-t-5">
                                        <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/112.png" alt="">
                                          &nbsp;&nbsp; QuickBooks
                                          <span class="pull-right"><ipp:connectToIntuit></ipp:connectToIntuit></span>
                                     </div>

                                </div>                                                                    
                            </div> 
                        </div>

                        <div class="tab-pane" id="social">
                            <div class="listview narrow">
                               <!-- Linkedin -->
                               <div class="media">
                                     <div class="media-body p-t-5">
                                       <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/83.png" alt="">
                                         &nbsp;&nbsp; LinkedIn Company Page
                                        <a href="javascript:void(0);" {*data-toggle="modal"*} class="btn btn-sm m-r-5 pull-right" onclick="addSocialConnections('LinkedIn');">Add</a>
                                    </div>
                               </div>
                               <!-- Linkedin End-->
                                <!-- Twitter -->                                           
                                <div class="media">
                                      <div class="media-body p-t-5">
                                        <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/74.png" alt="">
                                          &nbsp;&nbsp; Twitter
                                           <a href="javascript:void(0);" {*data-toggle="modal"*} class="btn btn-sm m-r-5 pull-right" onclick="addSocialConnections('Twitter');">Add</a>   
                                      </div>
                                </div>   
                                <!-- Twitter End -->
                                <!-- Facebook -->
                                <div class="media">
                                    <div class="media-body p-t-5">
                                        <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/facebook.png" alt="" width="16px" height="16px">&nbsp;&nbsp; Facebook
                                           <a href="javascript:void(0);" {*data-toggle="modal"*} class="btn btn-sm m-r-5 pull-right" onclick="addSocialConnections('Facebook');">Add</a>   
                                    </div>
                                </div> 
                                <!-- Facebook End-->
                                    <!-- Instagram -->
                                <div class="media">
                                    <div class="media-body p-t-5">
                                        <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/instagram-new.png" alt="" width="16px" height="16px">&nbsp;&nbsp; Instagram
                                           <a href="javascript:void(0);" {*data-toggle="modal"*} class="btn btn-sm m-r-5 pull-right" onclick="addSocialConnections('Instagram');">Add</a>   
                                    </div>
                                </div> 
                                <!-- Instagram End -->
                                <!-- Pinterest -->
                                <div class="media">
                                    <div class="media-body p-t-5">
                                        <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/Pinterest.svg" alt="" width="16px" height="16px">&nbsp;&nbsp; Pinterest
                                           <a href="javascript:void(0);" {*data-toggle="modal"*} class="btn btn-sm m-r-5 pull-right" onclick="addSocialConnections('Pinterest');">Add</a>   
                                    </div>
                                </div> 
                                <!-- Pinterest End -->
                                <!-- Vimeo -->
                                <div class="media">
                                    <div class="media-body p-t-5">
                                        <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/vimeo.png" alt="" width="16px" height="16px">&nbsp;&nbsp; Vimeo
                                           <a href="javascript:void(0);" {*data-toggle="modal"*} class="btn btn-sm m-r-5 pull-right" onclick="addSocialConnections('Vimeo');">Add</a>   
                                    </div>
                                </div>
                                <!-- Vimeo End -->
                                <!-- Add More Here... -->  

                            </div> 
                            <!-- listview narrow -->
                        </div>

                        <div class="tab-pane" id="ecommerce">
                            <div class="listview narrow">
                            <!-- Shopify -->                                           
                                <div class="media">
                                  <div class="media-body p-t-5">
                                    <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/shopify-sm.png" width="16px" height="16px">
                                      &nbsp;&nbsp; Shopify
                                    <a href="#addEcommerceCrdentials" data-toggle="modal" class="btn btn-sm m-r-5 pull-right" onclick="addEcommerceConnection('shopify');">Add</a>   
                                  </div>
                                </div>   
                                <!-- Shopify End -->
                                <!-- WooCommerce -->
                                <div class="media">
                                  <div class="media-body p-t-5">
                                    <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/woocommerce-sm.png" width="16px" height="16px">
                                      &nbsp;&nbsp; WooCommerce
                                    <a href="#addEcommerceCrdentials" data-toggle="modal" class="btn btn-sm m-r-5 pull-right" onclick="addEcommerceConnection('woocommerce');">Add</a>   
                                  </div>
                                </div>
                                <!-- WooCommerce End -->
                                <!-- BigCommerce -->
                                <div class="media">
                                  <div class="media-body p-t-5">
                                    <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/bigcommerce-sm.png" width="16px" height="16px">
                                      &nbsp;&nbsp; BigCommerce
                                    <a href="#addEcommerceCrdentials" data-toggle="modal" class="btn btn-sm m-r-5 pull-right" onclick="addEcommerceConnection('bigcommerce');">Add</a>   
                                  </div>
                                </div>
                                <!-- BigCommerce End -->
                                <!-- Amazon -->
                                <div class="media">
                                  <div class="media-body p-t-5">
                                    <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/amazon-sm.png" width="16px" height="16px">
                                      &nbsp;&nbsp; Amazon
                                    <a href="#addEcommerceCrdentials" {*data-toggle="modal"*} class="btn btn-sm m-r-5 pull-right" onclick="addEcommerceConnection('amazon');">Add</a>   
                                  </div>
                                </div>
                                <!-- Amazon End -->
                                <!-- Ebay -->
                                <div class="media">
                                  <div class="media-body p-t-5">
                                    <img class="pull-left" src="{$smarty.const.IMAGESLOCATION}plugin-icon/ebay-sm.png" width="16px" height="16px">
                                      &nbsp;&nbsp; eBay
                                    <a href="#addEcommerceCrdentials" {*data-toggle="modal"*} class="btn btn-sm m-r-5 pull-right" onclick="addEcommerceConnection('ebay');">Add</a>   
                                  </div>
                                </div>
                                <!-- Ebay End-->
                                <!-- -->
                                <!-- -->
                                
                                
                            </div>
                        </div>


                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>                                        
                             


<!--Plugins Credentials -->
<div class="modal fade" id="addCrdentials" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color:rgba(0, 0, 0, 0.99) !important;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Credentials</h4>
            </div>
                <div class="modal-body" id="loadCredentialPage">

                </div>
        </div>
    </div>
</div>    

<!--Ecommerce Plugins Credentials -->
<div class="modal fade" id="addEcommerceCrdentials" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color:rgba(0, 0, 0, 0.99) !important;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="ecom_model_title"></h4>
            </div>
            <div class="modal-body" id="loadEcommerceConnBody">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>  


<div class="modal fade" id="deleteQBOCredentails" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" style="background-color:rgba(0, 0, 0, 0.99) !important;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Delete Company</h4>
            </div>
            <div class="modal-body" id="QBOCompanyInfo" style="padding-left:30px;">
                    
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm" onclick="deleteQBOCompany('Quickbook')">Submit</button>
            </div>
        </div>
    </div>
</div>


<script src="{$smarty.const.JSLOCATION}/jquery.loader.js"></script> 
<link href="{$smarty.const.CSSLOCATION}/jquery.loader.css" rel="stylesheet"> 


{literal}
    <script type='text/javascript'>
        var isSocialSuccess = "{/literal}{$smarty.session.isSocialSuccess}{literal}";
        var SocialMsg = "{/literal}{$smarty.session.SocialMsg}{literal}";
        
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
            $.post("switchQB_company", {"swich_company":"swich_company"}, function(data){

             });
        });
        /*---------------------------------
        -----------~~~~~~~~~~~~~~~~~--------
        -----------*****************----------
        --------------------------------------*/
        function loadNewCredentialPage(pluginType)
        {

             $.post(portalLocation+"plugin/plugin_ajax.php", {"pluginType":pluginType}, function(data)
             { 
                  $("#loadCredentialPage").html(data);         
             });
        }
        /**
         * [addSocialConnections description]
         * @param {[type]} socialmedia [description]
         */
        function addSocialConnections(socialmedia){
            var anchor = document.createElement('a');
            anchor.href = "socialconnection/"+socialmedia+"?source=profile";
            document.body.appendChild(anchor);
            anchor.click();
        }  

        function addGoogleConnection(google) {
            var anchor = document.createElement('a');
            anchor.href = "../plugin/google_signin_ajax.php";
            document.body.appendChild(anchor);
            anchor.click();
        }
                
        function addLinkedIn(socialmedia){  

           var anchor = document.createElement('a');
           anchor.href = "../plugin/linkedin_ajax.php";
           document.body.appendChild(anchor);
           anchor.click();
       }
        
        
        function addEcommerceConnection(ecommerce_plugin){
            if(ecommerce_plugin == "shopify"){
                $("#ecom_model_title").html("Shopify Credentials");
                var html = `<form name="plugin_form" action="#" method="POST" id="plugin_form">  
                    <div class="p-10">                                               
                        <div class="form-group">
                            <label for="shopify_api_key">API KEY</label>
                            <input type="text" class="form-control input-sm" name="shopify_api_key" id="shopify_api_key" required="" value="">
                        </div>
                        <div class="form-group">
                            <label for="shopify_api_secret">API PASSWORD</label>
                            <input type="text" class="form-control input-sm" name="shopify_api_secret" id="shopify_api_secret" required="" value="">
                        </div>
                        <div class="form-group">
                            <label for="shopify_hostname">HOSTNAME</label>
                            <input type="text" class="form-control input-sm" name="shopify_hostname" id="shopify_hostname" required="" value="">
                        </div>
                        <button class="btn btn-sm m-t-10" onclick="return saveEcommerceConnection('shopify');">Save</button>
                    </div>
                </form>

                <a href="javascript:void(0);" class="modal-title" style="margin-top: 10px;font-size: 14px;cursor: pointer; " id="show_shopify_steps" onclick="doggle_shopify(id)">Steps to generate api credentials 
                    <i class="fa fa-angle-double-up" aria-hidden="true" id="shpy_icn"></i></a>
                <a href="https://help.shopify.com/api/guides/api-credentials#generate-private-app-credentials" target="_blank" class="pull-right">Reference</a>
                <div id="shopify_steps" style="padding: 15px;border: 1px solid rgba(255, 255, 255, 0.3);margin-top: 15px;display:none;">
                    <p>Step 1: From your Shopify admin, click Apps</p>
                    <p>Step 2: Click Private apps.</p>
                    <p>Step 3: Click Create private app.</p>
                    <p>Step 4: Enter a Title and click Save app.</p>
                    <p>Your API credentials will de displayed on screen. Your hostname is your shopify hostname(eg: abc.shopify.com). Please copy and past in this form.</p>
                </div>`;
                $("#loadEcommerceConnBody").html(html); 
            } 
            if(ecommerce_plugin == "woocommerce"){
                $("#ecom_model_title").html("WooCommerce Credentials");
                var html = `<form name="plugin_form" action="#" method="POST" id="plugin_form">  
                    <div class="p-10">                                               
                        <div class="form-group">
                            <label for="woocom_consumer_key">CONSUMER KEY</label>
                            <input type="text" class="form-control input-sm" name="woocom_consumer_key" id="woocom_consumer_key" required="" value="">
                        </div>
                        <div class="form-group">
                            <label for="woocom_consumer_secret">CONSUMER SECRET</label>
                            <input type="text" class="form-control input-sm" name="woocom_consumer_secret" id="woocom_consumer_secret" required="" value="">
                        </div>
                        <div class="form-group">
                            <label for="woocom_store_url">STORE URL</label>
                            <input type="text" class="form-control input-sm" name="woocom_store_url" id="woocom_store_url" required="" value="">
                        </div>
                        <button class="btn btn-sm m-t-10" onclick="return saveEcommerceConnection('woocommerce');">Save</button>
                    </div>
                </form>
                <a href="javascript:void(0);" class="modal-title" style="margin-top: 10px;font-size: 14px;cursor: pointer; " id="show_shopify_steps" onclick="doggle_shopify(id)">Steps to generate api credentials 
                    <i class="fa fa-angle-double-up" aria-hidden="true" id="shpy_icn"></i></a>
                <a href="https://help.shopify.com/api/guides/api-credentials#generate-private-app-credentials" target="_blank" class="pull-right">Reference</a>
                <div id="shopify_steps" style="padding: 15px;border: 1px solid rgba(255, 255, 255, 0.3);margin-top: 15px;display:none;">
                    <p>Step 1: From your woocommerce admin, click Settings</p>
                    <p>Step 2: Click API and click keys/apps.</p>
                    <p>Step 3: Click add key.</p>
                    <p>Step 4: Enter a description and give permissions as Read/Write and click generate api key.</p>
                    <p>Your API credentials will be displayed on screen. Copy 
Consumer Key & Consumer Secret and your store url is your woocommerce hostname(eg: https://woostore.com/wordpress/). Please copy and past in this form.</p>
                </div>`;
                $("#loadEcommerceConnBody").html(html);
            }
            if(ecommerce_plugin == "bigcommerce") {
                $("#ecom_model_title").html("BigCommerce Credentials");
                var html = `<form name="plugin_form" action="#" method="POST" id="plugin_form">  
                    <div class="p-10">                                               
                        <div class="form-group">
                            <label for="bigcom_username">USERNAME</label>
                            <input type="text" class="form-control input-sm" name="bigcom_username" id="bigcom_username" required="" value="">
                        </div>
                        <div class="form-group">
                            <label for="bigcom_api_path">API PATH</label>
                            <input type="text" class="form-control input-sm" name="bigcom_api_path" id="bigcom_api_path" required="" value="">
                        </div>
                        <div class="form-group">
                            <label for="bigcom_api_token">API TOKEN</label>
                            <input type="text" class="form-control input-sm" name="bigcom_api_token" id="bigcom_api_token" required="" value="">
                        </div>
                        <button class="btn btn-sm m-t-10" onclick="return saveEcommerceConnection('bigcommerce');">Save</button>
                    </div>
                </form>
                <a href="javascript:void(0);" class="modal-title" style="margin-top: 10px;font-size: 14px;cursor: pointer; " id="show_shopify_steps" onclick="doggle_shopify(id)">Steps to generate api credentials 
                    <i class="fa fa-angle-double-up" aria-hidden="true" id="shpy_icn"></i></a>
                <a href="https://help.shopify.com/api/guides/api-credentials#generate-private-app-credentials" target="_blank" class="pull-right">Reference</a>
                <div id="shopify_steps" style="padding: 15px;border: 1px solid rgba(255, 255, 255, 0.3);margin-top: 15px;display:none;">
                    <p>Step 1: Log into the store.</p>
                    <p>Step 2: Click Advanced Settings.</p>
                    <p>Step 3: Click Create a Legacy API Account.</p>
                    <p>Step 4: Type the name of the user in the Username box and save.</p>
                    <p>Your API credentials will be displayed on screen. Copy 
                        the Username & API Path & API Token and past here and click the Save button.</p>
                </div>`;
                $("#loadEcommerceConnBody").html(html);
            } 
            if(ecommerce_plugin == "amazon") {
                alert("Coming Soon!");

                $("#ecom_model_title").html("Amazon Credentials");
                var html = `<h3>Will add this plugin shortly!</h3>`;
                $("#loadEcommerceConnBody").html(html);
            } 
            if(ecommerce_plugin == "ebay") {
                alert("Coming Soon!");

                $("#ecom_model_title").html("eBay Credentials");
                var html = `<h3>Will add this plugin shortly!</h3>`;
                $("#loadEcommerceConnBody").html(html);
            }         
            
            
        }
        function doggle_shopify(id){
            if(id == "show_shopify_steps"){
                $("#shopify_steps").show();
                $("#show_shopify_steps").attr("id","hide_shopify_steps");
                $("#shpy_icn").removeClass("fa fa-angle-double-up");
                $("#shpy_icn").addClass("fa fa-angle-double-down");
            } else if(id == "hide_shopify_steps"){
                $("#shopify_steps").hide();
                $("#hide_shopify_steps").attr("id","show_shopify_steps");
                $("#shpy_icn").removeClass("fa fa-angle-double-down");
                $("#shpy_icn").addClass("fa fa-angle-double-up");
            }            
        }
        function saveEcommerceConnection(ecommerce_plugin){
            if(ecommerce_plugin == "shopify"){
                var shopify_api_key    = $("#shopify_api_key").val();
                var shopify_api_secret = $("#shopify_api_secret").val();
                var shopify_hostname   = $("#shopify_hostname").val();
                if(shopify_api_key == "" || shopify_api_key == null){
                    alert("Please enter shopify api key");
                } else if(shopify_api_secret == "" || shopify_api_secret == null){
                    alert("Please enter shopify api password");
                } else if(shopify_hostname == "" || shopify_hostname == null){
                    alert("Please enter shopify hostname");
                } else{
                    $.post(portalLocation+"module/ecommerce_ajax.php", {"ecom_post_sign":"save ecommerce credentials","ecommerce_plugin":ecommerce_plugin,"shopify_api_key":shopify_api_key,"shopify_api_secret":shopify_api_secret,"shopify_hostname":shopify_hostname}, function(data)
                     { 
                        if(data == "success"){
                            alert("Thanks! Your shopify credentials saved successfully.");
                        }        
                     });
                }               
            }
            if(ecommerce_plugin == "woocommerce"){
                var woocom_consumer_key    = $("#woocom_consumer_key").val();
                var woocom_consumer_secret = $("#woocom_consumer_secret").val();
                var woocom_store_url   = $("#woocom_store_url").val();
                if(woocom_consumer_key == "" || woocom_consumer_key == null){
                    alert("Please enter shopify api key");
                } else if(woocom_consumer_secret == "" || woocom_consumer_secret == null){
                    alert("Please enter shopify api password");
                } else if(woocom_store_url == "" || woocom_store_url == null){
                    alert("Please enter shopify hostname");
                } else{
                    $.post(portalLocation+"module/ecommerce_ajax.php", {"ecom_post_sign":"save ecommerce credentials","ecommerce_plugin":ecommerce_plugin,"woocom_consumer_key":woocom_consumer_key,"woocom_consumer_secret":woocom_consumer_secret,"woocom_store_url":woocom_store_url}, function(data)
                     { 
                        if(data == "success"){
                            alert("Thanks! Your woocommerce credentials saved successfully.");
                        }        
                     });
                }               
            }
            if(ecommerce_plugin == "bigcommerce"){
                var bigcom_username    = $("#bigcom_username").val();
                var bigcom_api_path = $("#bigcom_api_path").val();
                var bigcom_api_token   = $("#bigcom_api_token").val();
                if(bigcom_username == "" || bigcom_username == null){
                    alert("Please enter bigcommerce username");
                } else if(bigcom_api_path == "" || bigcom_api_path == null){
                    alert("Please enter bigcommerce api path");
                } else if(bigcom_api_token == "" || bigcom_api_token == null){
                    alert("Please enter bigcommerce api token");
                } else{
                    $.post(portalLocation+"module/ecommerce_ajax.php", {"ecom_post_sign":"save ecommerce credentials","ecommerce_plugin":ecommerce_plugin,"bigcom_username":bigcom_username,"bigcom_api_path":bigcom_api_path,"bigcom_api_token":bigcom_api_token}, function(data)
                     { 
                        if(data == "success"){
                            alert("Thanks! Your bigcommerce credentials saved successfully.");
                        }     
                     });
                }               
            }
        }

        function updateCrderentials(pluginType)
        {
             $.post(portalLocation+"plugin/plugin_ajax.php", {"updatepluginType":pluginType}, function(data)
             { 
                  $("#loadCredentialPage").html(data);         
             });
        }

        function deletePluginConnection(deletePluginInfo)
        {

                var msg =confirm("Are you sure you want to delete a connection?");
                if (msg == true) {
                        $.post(portalLocation+"plugin/plugin_ajax.php", {"deletePluginInfo":deletePluginInfo}, function(data)
                         { 
                             alert("Your Account has been successfully deleted.");
                             location.reload(true);
                         });
                } 


        }
        function deleteCompanyList()
        {
            $.post("loadQBOCompanyList", {"loadCompanyInfo":"loadCompanyInfo"}, function(data)
                { 
                    $("#QBOCompanyInfo").html(data);
                });
        }
        
        function deleteQBOCompany(deletePluginInfo)
        {
            
             var msg =confirm("Are you sure you want to delete a connection?");
                if (msg == true) {
                        var cmp_list_info =  $(".cmp_list:checked").val();
                        
                         $('body').addClass('loading').loader('show', {
                                overlay: true
                            });
                            
                        $.post("deleteQBOCompanyList", {"deletePluginInfo":deletePluginInfo,"cmp_list_info":cmp_list_info}, function(data)
                         { 
                            // alert(data);
                            if(data === '1')
                            {
                               alert("Cannot delete Active Company."); 
                               $('body').removeClass('loading').loader('hide');
                            }
                            else
                            {
                                 alert("Your Account has been successfully deleted.");
                                 location.reload(true);
                             }
                             
                         });
                } 
        }
        
        

    </script>
{/literal}   
   
<script type="text/javascript" src="https://appcenter.intuit.com/Content/IA/intuit.ipp.anywhere.js"></script>
 
 <script>
     var oauthredirect_url = "{$oauthredirect_url}";
     var oauthredirect_function = "{$oauthredirect_function}";
     var buildUrl = "{$buildUrl}";
     {literal}
        // Runnable uses dynamic URLs so we need to detect our current //
           // URL to set the grantUrl value   ########################### //
           /*######*/ var parser = document.createElement('a');/*#########*/
           /*######*/parser.href = document.url;/*########################*/
           // end runnable specific code snipit ##########################//
           intuit.ipp.anywhere.setup({
                   menuProxy: '',
                   grantUrl: buildUrl+'app/Http/Controllers/plugin/QBCheck/PHPSample/oauth.php?start=t&oauthredirect='+oauthredirect_url+'&oauthredirect_function='+oauthredirect_function
                   // outside runnable you can point directly to the oauth.php page
           });
    
    {/literal}   
  </script>
 
    


