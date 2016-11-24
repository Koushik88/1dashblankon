
<!-- Chat -->
                <div class="chat" id="chatContainer">                     
                    <!-- Chat List -->
                    <div class="pull-left chat-list" id='chatProfilePanel'>
                        <div class="listview narrow" id="chatProfile">
                            
                            
                        </div>
                    </div>
                    
                    <!-- Chat Area -->
                    <div class="media-body">
                        <div class="chat-header">
                            <a class="btn btn-sm" href="javascript:void()">
                                <i class="fa fa-circle-o status m-r-5"></i> 1 Dash Chat 
                            </a>
                        </div>
                    
                        <div class="chat-body" id="msg-body">
                            
                        
                        </div>
                    
                        <div class="chat-footer media">
                            <i class="chat-list-toggle pull-left fa fa-bars"></i>
                            <i class="pull-right fa fa-arrow-circle-right" onclick="sendChatMessage();"></i> 
                            <div class="media-body">
                                <textarea class="form-control" placeholder="Type something..." id="chatContent"> </textarea>
                            </div>
                        </div>
                    </div>
                </div>
                                <input type="hidden" id="chartUserId" value="">
                                <input type="hidden" id="chartUserRandomId" value="">
                               
                                
                                
                                
                                
{literal}                                
    <script type="text/javascript">          

    $.post("chatCurrentUserList",{"currentUserList":"currentUserList"},function(data)
    { 
          $("#chatProfile").html(data);  
          autometLoadMessage();
    }); 
        
    function selectChartUser(chartUserId)
    {
        $(".chatUserInfo").css('background-color', 'rgba(0,0,0,0.85)');
        $("#chatUserInfo"+chartUserId).css('background-color', '#3A94D0');
        //$("#chatProfilePanel").removeClass("toggled");
        $("#chatContent").focus();
        $("#chartUserId").val(chartUserId); 
        $("#latchartUserId").val(chartUserId);
        $("#chartUserRandomId").val(Math.floor((Math.random() * 10000) + 1));
         autometLoadMessage();
    }
    
    function sendChatMessage()
    {
       
                var chartUserId = $("#chartUserId").val();
                var chartUserRandomId = $("#chartUserRandomId").val();
                var chatContent = $("#chatContent").val();
                var latchartUserId = $("#latchartUserId").val();
                
       
          
        if(chatContent.trim() != '')
        {                 
            if(chartUserId)
            {
                $.post("insertChatMessage",{"chartUserId":chartUserId,"chartUserRandomId":chartUserRandomId,"chatContent":chatContent},function(data)
                {    

                });
               autometLoadMessage();
            }else if(latchartUserId)
            {
                 $.post("insertChatMessage",{"chartUserId":latchartUserId,"chartUserRandomId":chartUserRandomId,"chatContent":chatContent},function(data)
                {    

                });
                autometLoadMessage();
                
            }
            else
            {
                 alert("Please Select Chat User!");
            }   
            $("#chatContent").val("");
        }
        else
        {
            alert("Please Enter Valid Message!");
        }
    }
   

     function autometLoadMessage()
     {
            var latchartUserId = $("#latchartUserId").val();
            //alert(latchartUserId);
            $.post("loadChatMessage",{"selectMsg":"selectMsg","latchartUserId":latchartUserId},function(data)
            {    
                  $("#msg-body").html(data);
            });

                 setTimeout(autometLoadMessage, 10000);
      }  


    $('#chatContent').on("keypress", function(e) {
        if (e.keyCode == 13) {
             sendChatMessage();
            return false; // prevent the button click from happening
        }

    });

    </script>
{/literal}