
<style>
    
</style>



 <!--<button type="button" id="pick">Goole Drive</button> 
<a href="{$authUrl}">Sign In</a>-->
<h4 class="page-title">{$Email} </h4>

{if $smarty.session.expiry_msg eq '1'}
   <br/>
        <div class="col-xs-2"></div>
        <div class="alert alert-danger col-xs-8">
               Your last payment has failed. Kindly update your card details for unrestricted access
        </div>
        
{/if}

{*{$getAllGoogleEvent}*}
 <!-- Add event -->
                <div class="modal fade" id="addNew-event" data-backdrop="static" data-keyboard="false" >
                     <div class="modal-dialog">
                          <div class="modal-content">
                              <form class="form-validation" role="form" method="post" action="" >
                               <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Add an Event</h4>
                               </div>
                               <div class="modal-body">
                                   
                                         <div class="form-group">
                                              <label for="eventName">Event Name</label>
                                              <input type="text" class="input-sm form-control validate[required]" required name="eventName" id="eventName" placeholder="..." autocomplete="off">
                                         </div>
                                  
                                        <div class="col-md-3 m-b-15" >
                                         <p>Start Date</p>
                            <div class="input-icon datetime-pick date-only" id="datetimepicker">
                                <input data-format="yyyy-MM-dd" readonly  type="text" id="startdate" name="startdate" class="form-control input-sm" required   value=""  />
                                <span class="add-on">
                                    <i class="sa-plus"></i>
                                </span>
                            </div>
                        </div>
                        
                        <div class="col-md-3 m-b-15">
                            <p>From</p>
                            <div class="input-icon datetime-pick time-only-12">
                                <input data-format="hh:mm" readonly id="from" type="text" name="fromTime" required class="form-control input-sm" value="" />
                                <span class="add-on">
                                    <i class="sa-plus"></i>
                                </span>
                            </div>
                        </div>
                                      
                                       <div class="col-md-3 m-b-15">
                            <p>To</p>
                            <div class="input-icon datetime-pick time-only-12">
                                <input data-format="hh:mm" readonly type="text" id="to" name="toTime" required class="form-control input-sm" value="" />
                                <span class="add-on">
                                    <i class="sa-plus"></i>
                                </span>
                            </div>
                        </div>
                                   
                                    <div class="col-md-3 m-b-15" >
                                         <p>End Date</p>
                            <div class="input-icon datetime-pick date-only" id="datetimepicker">
                                <input data-format="yyyy-MM-dd" readonly  type="text" id="enddate" name="enddate" class="form-control input-sm" required   value=""  />
                                <span class="add-on">
                                    <i class="sa-plus"></i>
                                </span>
                            </div>
                        </div>
                                        
                                      <br>
                                        
                                        <div class="form-group">
                                              <label for="location">Location</label>
                                              <input type="text" class="input-sm form-control validate[required]"  name="location" id="location" placeholder="..." autocomplete="off">
                                         </div>
                                        
                                         <div class="form-group">
                                              <label for="description">Description</label>
                                              <input type="text" class="input-sm form-control validate[required]" name="description" id="description" placeholder="..." autocomplete="off">
                                         </div>
                                      
                                        <div class="form-group">
                                              <label for="guest">Add: Guests (Add Email Id With Comma eg:example@gmail.com,ex@gmail.com)</label>
                                              <input type="email" class="input-sm form-control validate[required]" name="guest" id="guest" multiple pattern="^([\w+-.%]+@[\w-.]+\.[A-Za-z],*[\W]*)+$" placeholder="..." autocomplete="off">
                                         </div>
                                      
                                      
                                      
                                   {foreach from=$GoogleEventData name='name' item='value' key='key'}
                                       
                                       
                                           <input type="hidden" id="eventId" value="{$value['eventid']}" />
                                            <input type="hidden" id="eventTitle" value="{$value['title']}" />
                                         <input type="hidden" id="getStart" value="{$value['start']}" />
                                         <input type="hidden" id="getEnd" value="{$value['end']}"/>
                                   {/foreach}
                               </div>
                               
                               <div class="modal-footer">
                                   
                                    <input type="submit" class="btn btn-info btn-sm" name="submitadd" id="addEvent" value="Add Event" >
                                    <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">Close</button>
                               </div>
                                   </form>
                          </div>
                     </div>
                </div>
  
                <!--<div class="block-area">
                    <div class="alert alert-info alert-dismissable fade in">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        Click on a Day to add an Event.
                    </div>
                </div>-->
               
                
                <div class="col-md-8 clearfix">
                    
                    <div id="calendar" class="p-relative p-10 m-b-20">
                        <!-- Calendar Views -->
                        <ul class="calendar-actions list-inline clearfix">
                            <li class="p-r-0" id="prtour_month">
                                <a data-view="month" href="#" class="tooltips" title="Month">
                                    <i class="sa-list-month"></i>
                                </a>
                            </li>
                            <li class="p-r-0" id="prtour_week">
                                <a data-view="agendaWeek" href="#" class="tooltips" title="Week">
                                    <i class="sa-list-week"></i>
                                </a>
                            </li>
                            <li class="p-r-0" id="prtour_day">
                                <a data-view="agendaDay" href="#" class="tooltips" title="Day">
                                    <i class="sa-list-day"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>


            <!--<div class="col-md-4">
                 <h4 class="m-l-5">Upcoming Events </h4>
                 <div class="listview narrow">
                     <div class="media p-l-5">
                         
                         {foreach from=$Upcomingevent name='name' item='value' key='key'}
                         <div class="media-body">

                             <h4>{$value['title']}</h4>
                              <small class="text-muted">{$value['start']}</small><br>
                             {$value['description']}
                         </div>
                         {/foreach}
                     </div>

                 </div>
             </div>-->
<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->

    <div class="col-md-4">
        <header class="upcoming-events-header">
            <div class="ue-title">Upcoming Events</div>
            <div class="clearfix"></div>
        </header>

{foreach from=$Upcomingevent name='name' item='value' key='key'}
    {if $key is even}
        
        
          <div class="each-events dark-bg">
            <div class="event-title"><span class="icon"></span>&nbsp; {$value['title']}</div>
            <div class="event-desc-container">
                <div class="event-desc">{$value['description']}</div>
                <div class="clearfix"></div>
                <div class="event-date">Created: {$value['start']}</div>
                  <div class="clearfix"></div>
            </div>
        </div>
    {else}
           <div class="each-events">
            <div class="event-title"><span class="icon"></span>&nbsp; {$value['title']}</div>
            <div class="event-desc-container">
                <div class="event-desc">{$value['description']}</div>
                <div class="clearfix"></div>
                <div class="event-date">Created: {$value['start']}</div>
                  <div class="clearfix"></div>
            </div>
        </div>
    {/if}
      
       {/foreach}  
       
                    
    </div>           
                
<!-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -->
                <!-- Edit Event -->
              <div class="modal fade" id="editNew-event">
                     <div class="modal-dialog">
                          <div class="modal-content">
                              <form class="form-validation" role="form" method="post" action="" name="demo">
                               <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="modalTitle">Edit an Event</h4>
                               </div>
                                  <div class="modal-body" id="modalBody">
                                      
                                   <input type="hidden" class="input-sm form-control validate[required]"  name="editeventId" id="editeventId" value="" >    
                                       <div class="form-group">
                                              <label for="eventName">Event Name</label>
                                              <input type="text" class="input-sm form-control validate[required]" name="editeventName" id="editeventName" value="" autocomplete="off">
                                         </div>
                                      
                                      
                                      <div class="col-md-3 m-b-15" >
                                         <p>Start Date</p>
                            <div class="input-icon datetime-pick date-only" id="datetimepicker">
                                <input data-format="yyyy-MM-dd"   type="text" id="estartdate" name="estartdate" class="form-control input-sm" required  value=""  readonly />
                                <span class="add-on">
                                    <i class="sa-plus"></i>
                                </span>
                            </div>
                        </div>
                                      
                                      
                                       <div class="col-md-3 m-b-15">
                            <p>From</p>
                            <div class="input-icon datetime-pick time-only-12">
                                <input data-format="hh:mm" id="efrom" type="text" name="efromTime" required class="form-control input-sm"  readonly value=""/>
                                <span class="add-on">
                                    <i class="sa-plus"></i>
                                </span>
                            </div>
                        </div>
                                      
                                       <div class="col-md-3 m-b-15">
                            <p>To</p>
                            <div class="input-icon datetime-pick time-only-12">
                                <input data-format="hh:mm" type="text" id="eto" name="etoTime" required class="form-control input-sm" readonly />
                                <span class="add-on">
                                    <i class="sa-plus"></i>
                                </span>
                            </div>
                        </div>
                                   
                                     
                                      <div class="col-md-3 m-b-15" >
                                         <p>End Date</p>
                            <div class="input-icon datetime-pick date-only" id="datetimepicker">
                                <input data-format="yyyy-MM-dd"   type="text" id="eenddate" name="eenddate" class="form-control input-sm" required  value=""  readonly />
                                <span class="add-on">
                                    <i class="sa-plus"></i>
                                </span>
                            </div>
                        </div>
                                        
                                      <br>
                                        
                                        <div class="form-group">
                                              <label for="location">Location</label>
                                              <input type="text" class="input-sm form-control validate[required]"  name="Eventlocation" id="Eventlocation" placeholder="..." autocomplete="off">
                                         </div>
                                        
                                         <div class="form-group">
                                              <label for="description">Description</label>
                                              <input type="text" class="input-sm form-control validate[required]" name="Eventdescription" id="Eventdescription" placeholder="..." autocomplete="off">
                                         </div>
                                      
                                      
                                      
                                        <!--<div class="form-group">
                                              <label for="guest">Add: Guests(Add Email Id With Comma eg:example@gmail.com,ex@gmail.com)</label>
                                              <input type="text" class="input-sm form-control validate[required]" name="editguest" id="editguest" placeholder="..." autocomplete="off">
                                         </div>-->
                                      
                                        
                                        
                                        </div>  
                                       <div class="modal-footer">
                                    <input type="submit" class="btn btn-info btn-sm" name="submitedit" id="editEvent" value="Update" >
                                    <button type="button" class="btn btn-info btn-sm" data-dismiss="modal" id="close">Close</button>
                                       </div>
                                      
                                      
                                
                              </form>
                          </div>
                     </div>
              </div>
                
             
                <!-- Modal Resize alert -->
                <div class="modal fade" id="editEvent">
                     <div class="modal-dialog">
                          <div class="modal-content">
                               <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" >Edit Event</h4>
                               </div>
                               <div class="modal-body" >
                                    <div id="eventInfo"></div>
                               </div>
                               
                               <div class="modal-footer">
                                    <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">Okay</button>
                                    <button type="button" class="btn btn-info btn-sm" id="editCancel" data-dismiss="modal">Cancel</button>
                               </div>
                          </div>
                     </div>
                </div>
                
                
                  <div id="generalModalContent"></div>  
                
             <!--<img width="12" class="closeon" id="deleteEvent" height="12" src="{$smarty.const.IMAGESLOCATION}icon/delete.png" alt=""> -->                  
            <script src="{$smarty.const.JSLOCATION}/datetimepicker.min.js"></script>    
     <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.3/moment.min.js"></script>
            
     <script type="text/javascript">
        // var GoogleEventList = '{$GoogleEventList}';
      //  var obj={};
         
         var getAllGoogleEvent='{$getAllGoogleEvent}';
           //console.log(getAllGoogleEvent);
         var Srrc='{$smarty.const.IMAGESLOCATION}';
     
     
         {literal}
            
            $(document).ready(function() {
              
                var date = new Date();
                var d=("0" + date.getDate()).slice(-2);
                var m=("0" + (date.getMonth() + 1)).slice(-2);
                var y = date.getFullYear();                
              //  console.log(getAllGoogleEvent);
                var trimjson=getAllGoogleEvent.replace(/\n/g,"");
               // console.log(trimjson);
                var trimjson1=getAllGoogleEvent.replace(/\s/g," ");
                 console.log('trimjson1');
                console.log(trimjson1);
                
               var jsonall = jQuery.parseJSON(trimjson1.replace(/\n/g, "<br />"));
               
               function refreshevent(json){
              $('#calendar').fullCalendar( 'refetchEvents',json ); 
                location.reload(true);  
               } 
                
               $('#calendar').fullCalendar({
  eventClick:  function(event, jsEvent, view) {
     console.log(event);
                       var editeventName = event.title;
                      var editeventId = event.eventid;
                        var description = event.description;
                         var location = event.location;
                        var EditSdate=event.start;
                        var EditEdate=event.end;
                         var d1 = EditSdate;
                         var d2 = EditEdate;
                         
                         var str="'"+EditEdate+"'";
                        
                        console.log(str);
                         
                        var dateAr = str.split(" ");
                        console.log(dateAr);
                        
                      var dateHash = { Jan : 1, Feb: 2, Mar: 3, Apr: 4,May: 5,Jun: 6,Jul: 7,Aug: 8,Sep: 9,Oct: 10,Nov: 11,Dec: 12};

                 var mon = dateHash[dateAr[1]];
                   console.log(mon);
                        
                        var enddate=dateAr[3]+'-'+mon+'-'+dateAr[2]; 
                         
                         
                         
                         var attendess=event.attendees;
                         //console.log(attendess);
                         
                      var dd=d1.getDate();
                      var mm=d1.getMonth()+1;
                      var yy=d1.getFullYear();
                     var shour = d1.getHours();
                     var smin = d1.getMinutes();
                     var ssec = d1.getSeconds();
  
                    var ehour = d2.getHours();
                    var emin = d2.getMinutes();
                   var esec = d2.getSeconds();
                   
                  
        
        dd = addZero(dd);
  mm = addZero(mm);
  
  shour = addZero(shour);
  ehour = addZero(ehour);
  
  smin = addZero(smin);
  emin = addZero(emin);
                   


  
                   var newdate=yy+"-"+mm+"-"+dd;   
                    var stime=shour+":"+smin;   
                      var etime=ehour+":"+emin;
                      
                 
                     
                      var modal = $(this)
  modal.find('.modal-title').text('New message to ' )
  modal.find('.modal-body input').val(event.title)
                 //$('#editeventName input:text').val(event.title);   
                 
                 
                 
                 $("#editeventName").val(editeventName);
                  $("#editeventId").val(editeventId);
                  $("#Eventdescription").val(description);
                  $("#Eventlocation").val(location);
                    $("#estartdate").val(newdate);
                     $("#eenddate").val(enddate);
                      $("#efrom").val(stime);
                       $("#eto").val(etime);
                   $("#editguest").val(attendess);
                   
                   
                   $(document).on('click', '#editEvent',function(e) {
                          var estart= $("#estartdate").val(); 
                           console.log(estart);
                           var eend=  $("#eenddate").val();
                           console.log(eend);                           
                           
                           if(estart > eend){            
        alert("Incorrect enddate");     
        return false;    
        }
                           
                      
                           
                       });


                   
                   
                   
                                   
                    $('#editNew-event').modal();
                    return false;
                },
                   
             eventRender: function(event, element) {
                 
                element.find('.fc-event-inner').html("<span class='closeon' id='deleteEvent' style='float:right;' ><img width='12'  height='12' src='"+Srrc+"icon/delete.png' alt=''></span>"+event.title);
              
                  //element.append( "<span class='closeon' id='deleteEvent'><img width='12'  height='12' src='"+Srrc+"icon/delete.png' alt=''></span>" );
                                   
            element.find(".closeon").click(function() {
                //event.preventDefault();
                var eventId=event.eventid;                
                deleteEvent(eventId);                
                 $('#calendar').fullCalendar('removeEvents',event.eventid);
                 return false;
                
            });
            
             var ntoday = new Date().getTime();
            if (!event.end){
                if (event.start.getTime() < ntoday){
                    element.addClass("past");
                    element.children().addClass("past");
                }
            } else {
                if (event.end.getTime() < ntoday){
                    element.addClass("past");
                    element.children().addClass("past");
                }
            }
            
        },           
                    header: {
                         center: 'title',
                         left: 'prev, next'
                         //right: 'month,agendaWeek,agendaDay'
                    },
                    disableDragging: true,
                    disableResizing:true,
                    selectable: true,
                    selectHelper: true,
                    editable: true,  
                    events:jsonall ,
                               
                  /*  events:function () {
                        
                        getevent();     
                    },*/
               
                    select: function(start, end, allDay) {
                       // alert('tttt');
                        $('#addNew-event').modal('show');   
                        $('#addNew-event input:text').val('');
                        $('#getStart').val(start);
                        $('#getEnd').val(end);
                      
         
         var clickdate= moment(start).format();
         d1 = clickdate.substr(0, 10).split("-");
         stdate = d1[0] + "-" + d1[1] + "-" + d1[2];
         eddate = d1[0] + "-" + d1[1] + "-" + d1[2];
        
                        var d = new Date();
var month = d.getMonth()+1;
var day = d.getDate();
var year = d.getFullYear();

var shours=d.getHours();
var smin=d.getMinutes();

var ehours=d.getHours()+1;
var emin=d.getMinutes();

shours = addZero(shours);
  ehours = addZero(ehours);
  
  smin = addZero(smin);
  emin = addZero(emin);



 var cdate=year+"-"+month+"-"+day;   
   var cstime=shours+":"+smin;   
    var cetime=ehours+":"+emin;
   
        $("#startdate").val(stdate);
        $("#from").val(cstime);
        $("#to").val(cetime);
        // $("#date").val(cldate);
        
        $("#enddate").val(eddate);
     
             $('#addEvent').on('click', function(e) {
         
          var Sdate=   $("#startdate").val();
          console.log(Sdate);
          
            var Edate=   $("#enddate").val();
          console.log(Edate);
     if(Sdate > Edate){
            
        alert("Incoorect end date");     
        return false;    
        }
        
    });
        /* $(document).on('click', '#addEvent',function(e) {
             
                   
             var eventName = $("#eventName").val();  
             
             console.log(eventName);
              var Sdate=   $("#startdate").val();
          console.log(Sdate);
          
            var Edate=   $("#enddate").val();
          console.log(Edate);
     
        if (eventName == ""){            
            alert('Event name required');             
              return false;  
        }else if(Sdate > Edate){
            
        alert("Incorrect enddate");     
        return false;    
        }
        else{ 
        alert('Your Event has been added');
        
          $("#addNew-event").modal('hide');
    }
    }); */
        


        
       
    
                      /*  $( "#addEvent" ).one( 'click', function(){
                              alert( 'Your Event has been added' );
                              $("#addNew-event").modal('hide');
                               
                        });*/
                        
                    }
                    /*eventResize: function(event,dayDelta,minuteDelta,revertFunc) {
                        $('#editEvent').modal('show');
                         
                        var info =
                            "The end date of " + event.title + "has been moved " +
                            dayDelta + " days and " +
                            minuteDelta + " minutes."
                        ;
                        
                        $('#eventInfo').html(info);
                
                
                        $('#editEvent #editCancel').click(function(){
                             revertFunc();
                        }) 
                    }*/
                });
                
                $('body').on('click', '#addEvent', function(){
                 
                    var eventForm =  $(this).closest('.modal').find('.form-validation');
                     eventForm.validationEngine('validate');
                    
   // });   
                     if (!(eventForm).find('.formErrorContent')[0]) {
                          
                          //Event Name
                          var eventName = $('#eventTitle').val();
                          var eventid = $('#eventId').val();
                          
                          //Render Event
                          $('#calendar').fullCalendar('renderEvent',{
                               title: eventName,  
                               eventid:eventid, 
                               start: $('#getStart').val(),
                               end:  $('#getEnd').val(),
                               allDay: true,
                          },true ); //Stick the event
                          
                          
                        
                          
                          $('#addNew-event form')[0].reset()
                          $('#addNew-event').modal('hide');
                          
                                                 
                     } 
                   
                     
                });
                
               
                
            });    
            
            //Calendar views
            $('body').on('click', '.calendar-actions > li > a', function(e){
                e.preventDefault();
                var dataView = $(this).attr('data-view');
                $('#calendar').fullCalendar('changeView', dataView);
                
                //Custom scrollbar
                var overflowRegular, overflowInvisible = false;
                overflowRegular = $('.overflow').niceScroll();     
            });
            
    function deleteEvent(eventid)
    {     
         var deleteEvent = eventid;
           //alert(deleteEvent);
           
            var msg =confirm("Are you sure you want to delete?");
            if (msg == true) {
                
            $.post(portalLocation+"module/calendar_deleteajax.php", {"deleteEvent":deleteEvent}, function(data){    
                  //alert(data);     
             location.reload(true);
            });
        }else{
            
           alert(''); 
            
        }
    }
    
      function addZero(number) {
    if (number < 10) {
      return "0" + number.toString();
    } else {
      return number.toString();
    }
  }
    
    /*function getevent(){
        
        
            
    $.post(portalLocation+'module/calendar_getevent.php',{"getEvent":"getEvent"},function(data)
      { 
//alert('fetch');

alert(data);
  
   
   //var trimjson=data.replace(/\n/g,"");
                //console.log(trimjson);
   //var trimjson1=data.replace(/\s/g," ");
    console.log(data);
   //console.log(trimjson1);
   
   //var eventarr= jQuery.parseJSON(data.replace(/\n/g, "<br />"));
   
    var eventarr= jQuery.parseJSON(data);
    console.log('eventarr');
    console.log(eventarr);
    // console.log('event');
    // console.log(data);

      });
      
    }*/
    
    
    
		$(function () {
		
		var d = new Date();
var month = d.getMonth()+1;
var day = d.getDate();
var year = d.getFullYear();

//var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();

 var cdate=year+"-"+month+"-"+day;
  
   var cstime=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
   
    $("#date").val(cdate);
    $("#from").val(cstime);
		
		});
		
    
            {/literal}
       </script>
    


	<script src="{$smarty.const.JSLOCATION}/filepicker.js"></script>
	<script>
		function initPicker() {
                    
                   
			var picker = new FilePicker({
				apiKey: 'AIzaSyDnoJI_isv6iLHQgHrOOza43iIp01Ev8UU',
				clientId:'563616653325-g5it2qslm1p7ajedj39p3ia44h5hgthg',
				buttonEl: document.getElementById('pick'),
				onSelect: function(file) {
					//console.log(file);                                        
                                       window.open(file.alternateLink, '_blank'); 
				}
                                
                             
			});	
		}
	</script>
	
	<script src="https://www.google.com/jsapi?key=AIzaSyDnoJI_isv6iLHQgHrOOza43iIp01Ev8UU"></script>
	<script src="https://apis.google.com/js/client.js?onload=initPicker"></script>
        
    
    <script type="text/javascript">            
            $("#addNew-event").scroll(function () {
                 $(".bootstrap-datetimepicker-widget").css("display","none");
            });

             $("#editNew-event").scroll(function () {
                 $(".bootstrap-datetimepicker-widget").css("display","none");
            });
    </script>
    
    
<!--Product tour -->
<script type="text/javascript">
        var prtour = "{$smarty.get.prtour}";
        var last_login = "{$smarty.session.last_login}";
    {literal} 
        
        if(prtour === '1')
            {
                 productTour(csslocation);
            } 
            
      {/literal}    
</script>
    