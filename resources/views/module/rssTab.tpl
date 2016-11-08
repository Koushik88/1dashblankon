  
                       {if isset($arr)}   
                        <ul class="nav tab nav-tabs">
                            {foreach from=$arr name='name' item='value' key='key'}
                            <li><a href="#{$value['name']}" onclick='rssFeed("{$value["url"]}");'>{$value['name']}</a></li>
                                            
                            {/foreach}
                                <!--    <li class="active"><a href="#profile">Profile</a></li>
                            <li><a href="#messages23">Messages</a></li>
                            <li><a href="#settings1">Settings</a></li> -->
                        </ul>
                            
                         <div class="tile-config dropdown">
                            <a data-toggle="dropdown" href="" class="tile-menu"></a>
                            <ul class="dropdown-menu pull-right text-right">
                                <li id="todo-add"><a href="#add-rssfeed" data-toggle="modal" onclick="rssmodal();">Add New</a></li>
                               <!--  <li id="todo-edit"><a href="#add-rssfeed-delete" data-toggle="modal">Edit</a></li> -->
                               
                                <!-- <li id="todo-refresh"><a href="">Refresh</a></li>
                                <li id="todo-clear"><a href="">Clear All</a></li> -->
                            </ul>
                        </div>
                        <input type="hidden" class="form-control m-b-10" id="url" name="url" value="{$arr[0]['url']}">
                        <input type="hidden"  class="form-control m-b-10" id="name" name="name" value="{$arr[0]['name']}">

                          {/if}
                          {if isset($arr1)}
                                    <div class="modal-content">       

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" >&times;</button>
                <h4 class="modal-title">RSS Feed</h4>
            </div>
            <div class="modal-body"> 
             <form method="POST" name="rssfeed" id="rssfeed">

                
                    
                     <div class="row">
                        <div class="col-lg-5">
                         <input type="text" class="form-control input-sm " name="name1" id="name1" value="{$arr1[0]['name']}" placeholder="Name..." >
                         </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control input-sm" name="url1" id="url1" value="{$arr1[0]['url']}" placeholder="URL..." >
                        </div>
                    </div>
                     
                     <br/>
                       <div class="row">
                    
                        <div class="col-lg-5">
                         <input type="text" class="form-control input-sm " name="name2" id="name2" value="{$arr1[1]['name']}" placeholder="Name..." >
                         </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control input-sm" name="url2" id="url2"  value="{$arr1[1]['url']}" placeholder="URL..." >
                        </div>
                    
                        </div>
                    <br/>
                      
                    <div class="row">
                        <div class="col-lg-5">
                         <input type="text" class="form-control input-sm " name="name3" id="name3" value="{$arr1[2]['name']}" placeholder="Name..." >
                         </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control input-sm" name="url3" id="url3" value="{$arr1[2]['url']}" placeholder="URL..." >
                        </div>
                  </div>
                    <br/>
                      
                    <div class="row">
                        <div class="col-lg-5">
                         <input type="text" class="form-control input-sm " name="name4" id="name4" value="{$arr1[3]['name']}" placeholder="Name..." >
                         </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control input-sm" name="url4" id="url4" value="{$arr1[3]['url']}" placeholder="URL..." >
                        </div>
                   </div>

                    <br/>
                      <div class="row">
                    
                        <div class="col-lg-5">
                         <input type="text" class="form-control input-sm " name="name5" id="name5" value="{$arr1[4]['name']}" placeholder="Name..." >
                         </div>
                        <div class="col-lg-6">
                            <input type="text" class="form-control input-sm" name="url5" id="url5" value="{$arr1[4]['url']}" placeholder="URL..." >
                        </div>
                   </div>

                 
            
                <button  type="button" class="btn" name="send" onclick="updateUrl()" style="margin-top:15px;">Update</button>
                         
            </form>
        </div>
        </div>
                          {/if}
                          
                          
{if isset($arr2)} 
        <ul class="nav tab nav-tabs">  
              <li><a href="#Google" onclick=''>Google</a></li>
        </ul>
            <div class="tile-config dropdown">

              <a data-toggle="dropdown" href="" class="tile-menu"></a>

              <ul class="dropdown-menu pull-right text-right">

                  <li id="todo-add"><a href="#add-rssfeed" data-toggle="modal" onclick="rssmodal();">Add New</a></li>
              </ul>

            </div>
            <input type="hidden" class="form-control m-b-10" id="url" name="url" value="https://news.google.com/news?ned=us&topic=h&output=rss">
            <input type="hidden"  class="form-control m-b-10" id="name" name="name" value="Google">

{/if}
          