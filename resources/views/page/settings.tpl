{*
#*******************************************************************#
#	     Global Basics Inc  :: Settings Page Template           #
#********************************************************************

    Document       : Settings Page Template
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Settings Page Template
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V 
*}

{if isset($unCompleteToDo)}
            <div class="listview todo-list sortable">
               {if $unCompleteToDo} 
                {foreach $unCompleteToDo as $key=>$value}   
                       <div class="media">
                           <div class="checkbox m-0">
                               <label class="t-overflow unCompleteToDo" id="{$value["id"]}_unCompleteToDo">
                                     <input type="checkbox">
                                    {$value["todo"]}
                               </label>
                           </div>
                       </div>     
                 {/foreach}  
                 {else}
                     <div><br><center> List not found.</center></br></div>
                 {/if}
            </div>
            
            <div class="tile">
                <h2 class="tile-title">Completed Tasks</h2>
                <div class="tile-config dropdown">
                    <a data-toggle="dropdown" href="" class="tile-menu" id="prtour_todoclear"></a>
                    <ul class="dropdown-menu  pull-right text-right">
                        <li id="todo-add"><a href="javascript:void(0);" onclick="clearTodoList();">Clear All</a></li>
                    </ul>
                </div>
            <div class="listview todo-list sortable">
               {if $completeToDo} 
                {foreach $completeToDo as $key=>$value}    
                  <div class="media">
                      <div class="checkbox m-0 ">
                          <label class="t-overflow completeToDo" id="{$value["id"]}_completeToDo" style="text-decoration: line-through;">
                              <input type="checkbox" checked="checked">
                               {$value["todo"]}
                          </label>
                      </div>                                                
                  </div>   
                 {/foreach} 
                 {else}
                     <div><br><center> List not found.</center></br></div>
                 {/if}
            </div>
            </div>    
{/if}

    

{literal}
    <script type="text/javascript">
        
        $('input:checkbox:not([data-toggle="buttons"] input, .make-switch input), input:radio:not([data-toggle="buttons"] input)').iCheck({
		    checkboxClass: 'icheckbox_minimal',
		    radioClass: 'iradio_minimal',
		    increaseArea: '20%' // optional
	});
        
        $(".completeToDo").click(function()
        {
             var completeToDo = $(this).attr("id");
             var toDo = completeToDo.split("_");     
             updateToDoList(toDo[0],"U");
        });

        $(".unCompleteToDo").click(function()
        {
            var uncompleteToDo = $(this).attr("id");
            var toDo = uncompleteToDo.split("_");     
            updateToDoList(toDo[0],"C");
        });

        
        
  </script>   
{/literal}