
<!-- Shortcuts -->
<div class="block-area shortcut-area">
    <a class="shortcut tile" href="javascript:void(0)" onclick="loadActiveSocialMedia('Twitter')"
    id="shortcutTwitter" style="display:none;">
        <img src="{$smarty.const.IMAGESLOCATION}shortcuts/twitter.png" alt="">
        <small class="t-overflow">Twitter</small>
    </a>
    <a class="shortcut tile" href="javascript:void(0)" onclick="loadActiveSocialMedia('Facebook')"
    id="shortcutFacebook" style="display:none;">
        <!-- <img src="{$smarty.const.IMAGESLOCATION}shortcuts/money.png" alt=""> -->
        <i class="fa fa-facebook" style="padding-top: 5px;"></i>
        <small class="t-overflow">Facebook</small>
    </a>    
    <a class="shortcut tile" href="javascript:void(0)" onclick="loadActiveSocialMedia('Googleplus')"
    id="shortcutGoogleplus" style="display:none;">
        <!-- <img src="{$smarty.const.IMAGESLOCATION}shortcuts/calendar.png" alt=""> -->
        <i class="fa fa-google-plus" style="padding-top: 5px;"></i>
        <small class="t-overflow">Google+</small>
    </a>
    <!-- <a class="shortcut tile" href="">
        <img src="{$smarty.const.IMAGESLOCATION}shortcuts/stats.png" alt="">
        <small class="t-overflow">Statistics</small>
    </a>
    <a class="shortcut tile" href="">
        <img src="{$smarty.const.IMAGESLOCATION}shortcuts/connections.png" alt="">
        <small class="t-overflow">Connection</small>
    </a>
    <a class="shortcut tile" href="">
        <img src="{$smarty.const.IMAGESLOCATION}shortcuts/reports.png" alt="">
        <small class="t-overflow">Reports</small>
    </a> -->
    <input type="text" id="active_social_media" hidden="true">
</div>
                
<hr class="whiter" />
                
<!-- Main Widgets -->
               
<div class="block-area">
    <div class="row">
        <div class="col-md-8">
            <!-- Main Chart -->
            <div class="tile">
                <h2 class="tile-title">Statistics</h2>
                <div class="tile-config dropdown">
                    <a id="prtour_statistics" data-toggle="dropdown" href="" class="tile-menu"></a>
                    <ul class="dropdown-menu pull-right text-right">
                        <li><a href="javascript:void(0)" onclick="changeGraphType('day')">Day</a></li>
                        <li><a href="javascript:void(0)" onclick="changeGraphType('week')">Week</a></li>
                        <li><a href="javascript:void(0)" onclick="changeGraphType('month')">Month</a></li>
                    </ul>
                </div>
                <div class="p-10">
                    <!-- Social media Access Token Expired -->
                    <div id="acstknExpired" style="height: 250px;position: relative;text-align: center;z-index: 99999999;padding: 15% 0px;display: none;">
                        <p id="acstknExpiredMsg"></p>
                    </div>
                    
                    
                    <!-- No Config Error -->
                    <div id="showErrorGraph" style="height: 250px;position: relative;text-align: center;z-index: 99999999;padding: 15% 0px;display: none;">
                        <p> No Socialmedia configured yet, please add connection to see graph.</p>
                    </div>
                    <!-- loader image -->
                    <div id="loader_graph" style="height: 250px;position: relative;text-align: center;    z-index: 99999999;">
                        <img src="{$smarty.const.IMAGESLOCATION}/loadinfo.gif" alt="" style="    padding: 10%;">
                    </div>
                    <!-- render graph here -->
                    <div id="line-chart1" class="main-chart" style="height: 250px;display: none;">
                    </div>
                </div>  
            </div>

            
            <!--  Recent Postings -->
            <div class="row">
                <div class="col-md-6" >
                    <div class="tile">
                        <h2 class="tile-title">Recent Postings</h2>
                        <div class="tile-config dropdown">
                            <a id="prtour_recPost" data-togglerecPost="dropdown" href="" class="tile-menu"></a>
                            <ul class="dropdown-menu animated pull-right text-right">
                                <li><a href="">Refresh</a></li>
                                <!-- <li><a href="">Settings</a></li> -->
                            </ul>
                        </div>
                        
                        <div class="listview narrow table-responsive overflow" style="max-height: 250px;overflow-y: auto;">

                        {foreach $recentPosts as $value}
                            <div class="media p-l-5">
                                <div class="pull-left">
                                    <img width="40" src={$value.user_profile_image} alt="">
                                </div>
                                <a href="{$value.id_url}" target="_balnk">
                                    <div class="media-body">
                                        <!-- twitter post -->
                                        {if $value.postType == "Twitter"}
                                        <bold class="text-muted">{$value.user_name} &nbsp;@{$value.user_screen_name}&nbsp;.&nbsp;</bold>
                                        <small class="text-muted" title="{$value.created_at_title}">{$value.created_at}</small>           
                                        <i class="fa fa-twitter pull-right" style="margin-right:12px;margin-top: 3px;color: #1da1f2;"></i>
                                        {/if}
                                        <!-- facebook post -->
                                        {if $value.postType == "Facebook"}
                                        <bold class="text-muted">{$value.user_name} &nbsp;.&nbsp;</bold><small class="text-muted" title="{$value.created_at_title}">{$value.created_at}</small>
                                        
                                        <i class="fa fa-facebook pull-right" style="margin-right:12px;margin-top: 3px;color: #3b5998;"></i>
                                        {/if}
                                        <!-- facebook post -->
                                        {if $value.postType == "Google"}
                                        <bold class="text-muted">{$value.user_name} &nbsp;.&nbsp;</bold><small class="text-muted" title="{$value.created_at_title}">{$value.created_at}</small>
                                        
                                        <i class="fa fa-google-plus pull-right" style="margin-right:12px;margin-top: 3px;color: #dd4b39;"></i>
                                        {/if}
                                        <br/>
                                        <span class="t-overflow">{$value.text}</span>
                                    </div>
                                </a>
                            </div>
                        {/foreach}   
                        {if empty($recentPosts)}                         
                            <div class="media p-5 text-center l-100">
                                <p style="margin: 10px 0px;padding: 10px 0px;">No Socialmedia configured yet, please add connection to see recent posts.</p>
                            </div>
                        {/if}
                        </div>
                    </div>
                </div>
                <!-- RSS FEEDS -->

                <div class="col-md-6">
                    <div class="tile">
                        <h2 class="tile-title">Rss feed</h2>
                        <div class="tile-config dropdown">
                            <a data-toggle="dropdown" href="" class="tile-menu"></a>
                            <ul class="dropdown-menu pull-right text-right">
                                <li id="todo-add"><a href="#add-rssfeed" data-toggle="modal">Add New</a></li>
                                <!-- <li id="todo-refresh"><a href="">Refresh</a></li>
                                <li id="todo-clear"><a href="">Clear All</a></li> -->
                            </ul>
                        </div>
                        <div class="listview narrow">                       
                        <div class="media p-l-5 table-responsive overflow" style="max-height: 250px;overflow-y: auto;" id="rss-feed">
                             <!--    <div class="pull-left">
                                    <img width="40" src="{$value['actor']['image']['url']}" alt="">
                                </div>
                                <div class="media-body">
                                    <small class="text-muted">{$value['date_string']} by {$value['actor']['displayName']}</small><br/>
                                    <a class="t-overflow" href="{$value['url']}" target="_blank">{$value['title']}</a>
                                   
                                </div> -->
                            </div>
                        </div>                 
                    </div>
                </div>
                <!-- END RSS FEEDS -->
               
            </div>
            <div class="clearfix"></div>
        </div>
        
        <div class="col-md-4">
            <!-- USA Map -->
            <div class="tile">
                <h2 class="tile-title">Direct Post</h2>
                <div class="tile-config dropdown">
                    <a id="prtour_dirPost" data-toggle="dropdown" href="" class="tile-menu"></a>
                    <ul class="dropdown-menu pull-right text-right">
                        <li><a href="">Refresh</a></li>
                        <!-- <li><a href="">Settings</a></li> -->
                    </ul>
                </div>
                
                <div style="height: 270px">
                    <div class="form-group">
                        <textarea class="form-control" rows="9" id="comment" placeholder="What's happening?"></textarea>
                        <div style="margin-top: 20px;">
                            <div class="col-xs-8 col-md-8" style="padding: 15px 15px;">
                            <span id="postToTwitterChk" style="display:none;">
                            <label class="checkbox-inline">
                                <input type="checkbox" class="postoption" value="Twitter">
                                <i class="fa fa-twitter" style="color: #1da1f2;"></i>
                            </label>
                            </span>
                            <span id="postToFbChk" style="display:none;">
                            <label class="checkbox-inline">
                                <input type="checkbox" class="postoption" value="Facebook">
                                <i class="fa fa-facebook" style="color: #3b5998;"></i>
                            </label>
                            </span>
                            </div>
                            <div class="col-xs-4 col-md-4">
                            <input type="button" name="post" class="btn btn-lg btn-primary pull-right" value="POST" id="post" onclick="postTweet()">
                            </div>
                        </div>
                        <!-- loader image -->
                       <div id="loader_post" style="height: 270px;width: 100%;position: absolute;text-align: center;z-index: 99999999;top: 26px;background: inherit;opacity: 1;display: none;">
                            <img src="{$smarty.const.IMAGESLOCATION}loadinfo.gif" alt="" style="padding: 22%;">
                        </div>
                        
                    </div>
                </div>
            </div>

            <!-- Activity -->
            <div class="tile">
                <h2 class="tile-title">Social Media activities</h2>
                <div class="tile-config dropdown">
                    <a id="prtour_socialMedia" data-toggle="dropdown" href="" class="tile-menu"></a>
                    <ul class="dropdown-menu pull-right text-right">
                        <li><a href="">Refresh</a></li>
                        <!-- <li><a href="">Settings</a></li> -->
                    </ul>
                </div>
                
                <div class="listview narrow">
                    
                    <div class="media">
                        <div class="pull-right">
                            <div class="counts">{$facebook_likes_count}</div>
                        </div>
                        <div class="media-body">
                            <h6>FACEBOOK PAGE LIKES</h6>
                        </div>
                    </div>
                    <div class="media">
                        <div class="pull-right">
                            <div class="counts">{$twitter_followers_count}</div>
                        </div>
                        <div class="media-body">
                            <h6>TWITTER FOLLOWERS</h6>
                        </div>
                    </div>
                    
                    <div class="media">
                        <div class="pull-right">
                            <div class="counts">{$googleplus_plusoners}</div>
                        </div>
                        <div class="media-body">
                            <h6>GOOGLE +1s</h6>
                        </div>
                    </div>
                    
                    <div class="media">
                        <div class="pull-right">
                            <div class="counts">-</div>
                        </div>
                        <div class="media-body">
                            <h6>YOUTUBE VIEWS</h6>
                        </div>
                    </div>
                    
                    
                    <div class="media">
                        <div class="pull-right">
                            <div class="counts">-</div>
                        </div>
                        <div class="media-body">
                            <h6>WEBSITE COMMENTS</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="modal fade" id="add-rssfeed">
    <div class="modal-dialog">
        <div class="modal-content">       

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" >&times;</button>
                <h4 class="modal-title">RSS Feed</h4>
            </div>

             <form method="POST" name="rssfeed" id="rssfeed">
            <div class="modal-header p-0">
                <input type="text" class="form-control input-sm input-transparent" name="url" id="url" placeholder="URL..." >
            </div>

            
            <div class="modal-footer m-0">
                <button  type="button" class="btn" name="send" onclick="updateUrl()">Update</button>
               
            </div>
            </form>

        </div>
    </div>
</div>
 
<script src="{$smarty.const.JSLOCATION}/charts/jquery.flot.categories.js"></script>               
         
<script type="text/javascript">
    // global variables
     
    var prtour = "{$smarty.get.prtour}";
  {literal}    
    var isFbConf = "{/literal}{$isFbConf}{literal}";
    var isTwitterConf = "{/literal}{$isTwitterConf}{literal}";
    var isGooglePlsConf = "{/literal}{$isGooglePlsConf}{literal}";
    
    /*
    *
    *
    * // chart
    * 
    */
   $(document).ready(function() {
      
    if(prtour === '1')
    {
      productTour();
    }   
    
      
        // set default active_social_media as twitter on load
        $("#active_social_media").val("Twitter");
        $("#loader_graph").show();
        // set disabled=true to all the non-config social media
        if(isFbConf != "no"){
            $('#shortcutFacebook').show();
            // document.getElementById("shortcutFacebook").disabled=true;
            document.getElementById("postToFbChk").style.display = "inline-block";            
        }
        if(isTwitterConf != "no"){
            $('#shortcutTwitter').show();
            // document.getElementById("shortcutTwitter").disabled=true;
            document.getElementById("postToTwitterChk").style.display = "inline-block";             
        }
        if(isGooglePlsConf != "no"){
            $('#shortcutGoogleplus').show();        
        }

        // load graph default
        if(isTwitterConf == "yes"){
            // call twitter analytical report as default
            var activeSocialMedia = $("#active_social_media").val();
            $.post(portalLocation+'module/twitterAnalytics.php',
                {
                     "Twitter_Graph_type":"day"
                },
                function(data){
                    loadGraph(JSON.parse(data),"Twitter");
            });
        } else if(isFbConf == "yes"){
            // call facebook analytical report as default
            $.post(portalLocation+'module/facebookAnalytics.php',
                {
                     "Twitter_Graph_type":"day"
                },
                function(data){
                    loadGraph(JSON.parse(data),"Facebook");
            });
        }else if(isGooglePlsConf == "yes"){
            $.post(portalLocation+'module/googleplus.php',
            {
                 "Twitter_Graph_type":"day"
            },
            function(data){

                loadGraph(JSON.parse(data),"Google+");
                console.log((data));
            });
        } else{
            $("#loader_graph").hide();
            $("#showErrorGraph").show();
        }

        //------------------~~~~~~~~~~~~~~~--------------------  
        // RSS FEEDS  
        $.get(portalLocation+'module/rssfeed.php',
        function(data){     
            document.getElementById("rss-feed").innerHTML=data;
        });       
        //   

       // console.log("twitter_followers_count: "+{/literal}{$twitter_followers_count}{literal});
        // var twitter_followers_count = {/literal}{$twitter_followers_count}{literal};
        // if(twitter_followers_count == "-"){
        //     $('#post').prop('disabled', true);
        // }
     });

   // load activeSocialMedia by user selection
    function loadActiveSocialMedia(active){
        $("#loader_graph").show();
        $("#line-chart1").hide();
        $("#showErrorGraph").hide();
        $("#acstknExpired").hide();

        $("#active_social_media").val(active);
        // load twitter graph
        if(active == "Twitter"){
            if(isTwitterConf == "yes"){
                $.post(portalLocation+'module/twitterAnalytics.php',
                {
                     "Twitter_Graph_type":"day"
                },
                function(data){
                    loadGraph(JSON.parse(data),active);
                });
            } else if(isTwitterConf != "no"){
                $("#loader_graph").hide();
                $("#acstknExpired").show();
                // alert(isTwitterConf);
                document.getElementById("acstknExpiredMsg").innerHTML=isTwitterConf;
            }            
        }
        // load facebook graph
        if(active == "Facebook"){
            if(isFbConf == "yes"){
               $.post(portalLocation+'module/facebookAnalytics.php',
                {
                     "Twitter_Graph_type":"day"
                },
                function(data){
                    loadGraph(JSON.parse(data),active);
                }); 
           } else if(isFbConf != "no"){
                alert(isFbConf);
           }
            
        }
        if(active == "Googleplus"){
            if(isGooglePlsConf == "yes"){
                $.post(portalLocation+'module/googleplus.php',
                {
                     "Twitter_Graph_type":"day"
                },
                function(data){

                    loadGraph(JSON.parse(data),"Googleplus");
                });
            }else if(isGooglePlsConf != "no"){
                alert(isGooglePlsConf);
            }
        }

        if(active == "Instagram"){
            
        }
        
        if(active == "Youtube"){
            
        }
    }
    /*
    *
    * change graph accordingly by type & active social media
    * 
     */
    function changeGraphType(graphType){
        $("#loader_graph").show();
        $("#line-chart1").hide();
        $("#showErrorGraph").hide();
        $("#acstknExpired").hide();

        var active = $("#active_social_media").val();
        // alert(active);
        
        // load twitter graph
        if(active == "Twitter"){
            $.post(portalLocation+'module/twitterAnalytics.php',
            {
                 "Twitter_Graph_type":graphType
            },
            function(data){
                loadGraph(JSON.parse(data),active);
            });
        }
        // load facebook graph
        if(active == "Facebook"){
            $.post(portalLocation+'module/facebookAnalytics.php',
            {
                 "Twitter_Graph_type":graphType
            },
            function(data){
                loadGraph(JSON.parse(data),active);
            });
        }
        // load google+ graph
        if(active == "Googleplus"){
            $.post(portalLocation+'module/googleplus.php',
            {
                 "Twitter_Graph_type":graphType
            },
            function(data){

                loadGraph(JSON.parse(data),active);
            });
        }



    }

    function loadGraph(val,activeSocialMedia) {        
        // show graph & hide loader image
        $("#loader_graph").hide();
        $("#line-chart1").show();
        $("#showErrorGraph").hide();
        $("#acstknExpired").hide();

         console.log(activeSocialMedia);
        if ($('#line-chart1')[0]) {
            $.plot('#line-chart1', [{data:val,label:activeSocialMedia}],
            {
                series: {
                    lines: {
                        show: true,
                        lineWidth: 1,
                        fill: 0.25,
                    },

                    color: 'rgba(255,255,255,0.8)',
                    shadowSize: 0,
                    points: {
                        show: true,
                    }
                },

                yaxis: {
                    tickColor: 'rgba(255,255,255,0.15)',
                    tickDecimals: 0,
                    font :{
                        lineHeight: 13,
                        style: "normal",
                        color: "rgba(255,255,255,0.8)",
                    },
                    shadowSize: 0,
                },
                xaxis: {
                    mode: "categories",                   
                    tickColor: 'rgba(255,255,255,0)',
                    tickDecimals: 0,
                    font :{
                        lineHeight: 13,
                        style: "normal",
                        color: "rgba(255,255,255,0.8)",
                    }
                },
                grid: {
                    borderWidth: 1,
                    borderColor: 'rgba(255,255,255,0.25)',
                    labelMargin:10,
                    hoverable: true,
                    clickable: true,
                    mouseActiveRadius:6,
                },
                legend: {
                    show: true
                }
            });

            $("#line-chart1").bind("plothover", function (event, pos, item) {
                if (item) {
                    var x = item.datapoint[0].toFixed(2),
                        y = item.datapoint[1].toFixed(2);
                    $("#linechart-tooltip").html(item.series.label + " of " + Math.ceil(x) + " = " + Math.ceil(y)).css({top: item.pageY+5, left: item.pageX+5}).fadeIn(200);
                }
                else {
                    $("#linechart-tooltip").hide();
                }
            });

            $("<div id='linechart-tooltip' class='chart-tooltip'></div>").appendTo("body");
        }
    }

    
    /*
    *
    * POST to TWITTER & FACEBOOK
    * 
     */
    function postTweet(){
        $("#loader_post").show();
        var status = $('#comment').val();
        var checkedValue = [];
        i = 0;
        $('input[class="postoption"]:checked').each(function() {
               checkedValue[i] = $( this ).val();
               i++;
        });
        
        if(checkedValue.length == 0){
            alert("Please select atleast one media to post.");
            $("#loader_post").hide();
        }else if(status == "") {
            alert("Please enter your status to post");  
            $("#loader_post").hide();          
        } else{
            var reload = "";
            for(var i=0; i<checkedValue.length; i++){
                if(checkedValue[i] == "Twitter"){
                    if(isTwitterConf == "yes"){
                        // post to twitter
                        $.post(portalLocation+'module/postTweet.php',
                        {
                             "tweetStatus":status
                        },
                        function(data){
                            if(data == "success"){
                                // location.reload();
                                reload = "success";
                            } else{
                                alert("failed to post twitter.");
                            }
                       });
                    } else{
                        alert(isTwitterConf+" and this status not posting to your twitter wall.")
                    }
                }
                if(checkedValue[i] == "Facebook"){
                    if(isFbConf == "yes"){
                    // post to facebook
                        $.post(portalLocation+'module/postFacebook.php',
                        {
                             "facebookStatus":status
                        },
                        function(data){
                            if(data == "success"){
                                // location.reload();
                                reload = "success";
                            } else{
                                alert("failed to post facebook.");
                            }
                       });
                    }else{
                        alert(isFbConf+" and this status not posting to your facebook wall.")
                    }
                }
                // add more 
            }
            $("#loader_post").hide();
            location.reload();
            // if(reload == "success"){
            //     alert(reload);
            //     location.reload();
            // }


        }

    }

    /*
    *
    * Update RSS Feed URl
     */
    function updateUrl(){
        var url = document.getElementById("url").value;
            $.post(portalLocation+'module/rssfeed.php',
            {
                 "insert_url":url
            },
            function(data){                
                $('#add-rssfeed').modal('hide');
                document.getElementById("rss-feed").innerHTML=data;
            });
       
    }
    
   {/literal} 
</script>
