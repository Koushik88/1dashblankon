<style>
.zEWidget-launcher
{
    margin:0 !important;
    padding-right:5px !important;
}
</style>


<!-- Notification Drawer -->
<div id="notifications" class="tile drawer animated" style="margin-left:10px;">
    <div class="listview narrow">
        <div class="media">
            <a href="">&nbsp;&nbsp;Notification</a>
            <span class="drawer-close">&times;</span>
        </div>
        
        
            <div class="overflow" id="load_ajaxnotify" style="height: 254px">
                
            </div>
       
                
           {*<div class="media text-center whiter l-100">
                <a href=""><small>VIEW ALL</small></a>
            </div>*}
    </div>
</div>
    
    
  
    
<!--Help Page -->
        <div class="modal fade" id="help" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title">Contact Us</h4>
                                        </div>
                                        <div class="modal-body"> 
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                         <label for="name">Name</label>
                                                         <input type="text" class="form-control input-sm" id="full_name" name="full_name" placeholder="">
                                                    </div>
                                                    <div class="form-group">
                                                         <label for="email">Email</label>
                                                         <input type="text" class="form-control input-sm" id="email" name="email" placeholder="">
                                                    </div>
                                                    <div class="form-group">                                                        
                                                         <label for="Support">Support</label>
                                                         <select class="form-control input-sm m-b-10">
                                                             <option value="Support">Tech Support</option>
                                                             <option value="Billing">Billing</option>
                                                             <option value="Sales">Sales</option>
                                                             <option value="Partnerships">Partnerships</option>
                                                             <option value="Other">Others</option>
                                                         </select>
                                                    </div>
                                                     <div class="form-group">
                                                         <label for="Message">Message</label>
                                                         <textarea class="form-control overflow" rows="6" placeholder="" tabindex="5003" style="overflow: hidden; outline: none;"></textarea>
                                                     </div>
                                                         <button type="submit" disabled class="btn btn-sm m-t-10">Submit</button>
                                                 </div>
                                                
                                                <div class="col-md-1"></div>
                                                <div class="col-md-4">
                                                   <div class="form-group"> 
                                                       <span> <b> SmallbusinessDIY Inc.</b></span><br/>
                                                       <span> Gilbert, AZ 85234</span><br/>
                                                       <span>San Carlos, CA 94070</span><br/>
                                                   </div>  <br/><br/>
                                                    <div class="form-group">
                                                        <span> <b>Sales</b></span><br/>
                                                        <span> sales@1dash.com</span>
                                                    </div><br/><br/>
                                                   <div class="form-group">
                                                        <span> <b>Support</b></span><br/>
                                                        <span> support@1dash.com</span>
                                                    </div>
                                                   
                                                </div>  
                                                
                                        </div>
                                    </div>
                            </div>
        </div>
    </div>
    
    
{literal}   
   <!-- Start of 1dashhelp Zendesk Widget script -->
            <script>/*<![CDATA[*/window.zEmbed||function(e,t){var n,o,d,i,s,a=[],r=document.createElement("iframe");window.zEmbed=function(){a.push(arguments)},window.zE=window.zE||window.zEmbed,r.src="javascript:false",r.title="",r.role="presentation",(r.frameElement||r).style.cssText="display: none",d=document.getElementsByTagName("script"),d=d[d.length-1],d.parentNode.insertBefore(r,d),i=r.contentWindow,s=i.document;try{o=s}catch(e){n=document.domain,r.src='javascript:var d=document.open();d.domain="'+n+'";void(0);',o=s}o.open()._l=function(){var o=this.createElement("script");n&&(this.domain=n),o.id="js-iframe-async",o.src=e,this.t=+new Date,this.zendeskHost=t,this.zEQueue=a,this.body.appendChild(o)},o.write('<body onload="document._l();">'),o.close()}("//assets.zendesk.com/embeddable_framework/main.js","1dashhelp.zendesk.com");
/*]]>*/</script>
<!-- End of 1dashhelp Zendesk Widget script -->
      
    <script type="text/javascript">   
        getNotification();
        
       function getNotification()
       {
        
                 $.post('loadNotifications',{"viewNotification":"viewNotification"},function(data)
                   { 
                        $("#load_ajaxnotify").html(data); 
                        getNotificationCount();
                             
                   });
                   
                    setTimeout(getNotification, 600000);
        }
        
        function getNotificationCount()
        {
                  $.post('getNotificationsCount',{"viewNotificationCount":"viewNotificationCount"},function(data)
                   { 
                       if(data > 0)
                       {
                             $("#notify-n-count").html("<i class='n-count animated'>"+data+"</i>"); 
                        }     
                   });
        }
    </script>
           
{/literal}