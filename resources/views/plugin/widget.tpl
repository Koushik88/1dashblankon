<style>
.picker.modal-dialog-bg{
    width:100% !important;
}
.picker.modal-dialog{
    width:75% !important;
}
.picker.modal-dialog-content{
    width:100% !important;
}
</style>



{if $smarty.session.expiry_msg eq '1'}
   <br/>
        <div class="col-xs-2"></div>
        <div class="alert alert-danger col-xs-8">
               Your last payment has failed. Kindly update your card details for unrestricted access
        </div>
        
{/if}

<script src="{$smarty.const.JSLOCATION}/charts/jquery.flot.categories.js"></script> 

    {include "{$smarty.const.TEMPLATE_PATH}plugin/allplugins.tpl"  nocache}
    
            {if !isset($quickbook_error_msg)}     
                <div class="block-area shortcut-area" id="prtour_tables">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-8">
                            <div class="tile" id="export_report">
                             
                                <h2 class="tile-title" id="table_title"><b><span id="cmpInfo"></span>  <span id="lablehead">PROFIT AND LOSS</span></b> <a href="javascript:void(0)" onclick="tableExpand();"><i class="fa fa-expand fa-1" style="top:6px;padding-right:25px;float:right;"></i></a></h2> 
                                
                                <div class="tile-config dropdown">   
                                    
                                    <a data-toggle="dropdown" href="" class="tile-menu"></a>
                                    <ul class="dropdown-menu pull-right text-right" id="export_hide">
                                        <li class="export_hide_txt"><a class="tile-info-toggle" onclick="print();" href="javascript:void(0)">Print</a></li>
                                        <li class="export_hide_txt"><a  onclick="exportExcel('pdf');" href="javascript:void(0)">Export PDF</a></li>
                                        <li class="export_hide_txt"><a class="export_hide_txt" onclick="exportExcel('excel');" href="javascript:void(0)">Export Excel</a></li>
                                    </ul>
                                    
                                </div>
                                
                                
                                <div class="p10">
                                    <div class="table-responsive overflow" id="loadata_ajax" style="overflow: hidden; height: 270px !important; outline: none;" tabindex="5001"> 
                                        
                                    </div>
                                </div>
                                
                            </div>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-4" id="prtour_trend">
                            <div class="tile">
                                <h2 class="tile-title">Trends</h2>
                                <div class="tile-config dropdown">
                                    <a data-toggle="dropdown" href="" class="tile-menu"></a>
                                    <ul class="dropdown-menu pull-right text-right">
                                        <li><a href="javascript:void(0);" onclick="chartChange('line');">Line</a></li>
                                        <li><a href="javascript:void(0);" onclick="chartChange('bar');">Bar</a></li>
                                    </ul>
                                </div>
                                <div class="p-10">
                                    <div id="chart-line" class="main-chart" style="height: 250px"></div>
                                     <div id="chart-bar" class="main-chart" style="height: 250px;display:none;"></div>

                                    
                                </div>  
                            </div>
                        </div>
                    </div>


                </div>

                <!-- <hr class="whiter" /> -->

                <div class="block-area shortcut-area">
                    <div class="col-md-10">
                        <a class="tile report-legend" style="cursor:pointer" onclick="chartSelected( this,'proandloss','Profit and Loss')">
                            <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-04.png" alt="">
                            Profit and Loss
                            
                        </a>
                        
                        <a class="tile report-legend_custom" style="cursor:pointer" onclick="chartSelected(this,'Income','Income')">
                            <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-00.png" alt="">
                            Income
                            <span id="income_lable">
                               
                            </span>    
                        </a>
                        <a class="tile report-legend_custom" style="cursor:pointer" onclick="chartSelected(this,'expensess','Expenses')">
                            <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-01.png" alt="">
                            Expense
                             <span id="expensess_lable">
                               
                            </span> 
                        </a>
                            
                        <a class="tile report-legend" style="cursor:pointer" onclick="chartSelected(this,'balancesheet','Balance Sheet')">
                            <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-05.png" alt="">
                            Balance Sheet
                        </a>    
                            
                        <a class="tile report-legend_custom" style="cursor:pointer" onclick="chartSelected(this,'ardetails','AR Aging')">
                            <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-02.png" alt="">
                            Account Receivables
                              <span id="recevable_lable">
                               
                              </span> 
                        </a>
                        <a class="tile report-legend_custom" style="cursor:pointer" onclick="chartSelected(this,'apdetails','AP Aging')">
                            <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-03.png" alt="">
                            Account Payables
                               <span id="payable_lable">
                               
                               </span> 
                        </a>
                       
                       
                        <a class="tile report-legend" style="cursor:pointer" onclick="chartSelected(this,'caseflow','Cash flow')">
                            <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-06.png" alt="">
                            Cash Flow
                        </a>
                        {*<a class="tile report-legend" style="cursor:pointer" onclick="chartSelected(this,'inventory_val','Inventory valuation summary')">
                            <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-07.png" alt="">
                            Inventory
                        </a>*}
                        {*<a class="tile report-legend" href="">
                            <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-08.png" alt="">
                            Sales by Product
                        </a>*}
                        <a class="tile report-legend" style="cursor:pointer" onclick="chartSelected(this,'salesbycustomer','Sales by customer')">
                            <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-09.png" alt="">
                            Sales by Customer
                        </a>
                    </div>
                            
                    <div class="col-md-2 m-b-15 pull-right" id="prtour_period">

                                  <form action="#" method="post" name="customSelection" id="customSelection">   
                                      <select class="widgetPeriod" name="customperiod" onchange="customPeriodSelection()" id="widgetPeriod" style="padding-left:10px;width:175px;height:29px;background-color:transparent;border:1px solid rgba(255, 255, 255, 0.3);">
                                              <option value="date_macro=today&column=daily" {if $query eq  "date_macro=today&column=daily"} selected {/if}>Today</option>
                                              <option value="date_macro=thisweek&column=daily" {if $query eq  'date_macro=thisweek&column=daily'} selected {/if}>This Week</option>
                                              <option value="date_macro=thismonth&column=weekly" {if $query eq  'date_macro=thismonth&column=weekly'} selected {/if}>This Month</option>
                                              <option value="date_macro=thisquarter&column=monthly" {if $query eq  'date_macro=thisquarter&column=monthly'} selected {/if} >This Quarter</option>
                                              <option value="date_macro=thisyear&column=quarterly" {if $query eq  'date_macro=thisyear&column=quarterly'} selected {/if}>This Year</option>
                                              <option value="date_macro=yesterday&column=daily" {if $query eq  "date_macro=yesterday&column=daily"} selected {/if}>Yesterday</option>
                                              <option value="date_macro=lastweek&column=daily" {if $query eq  'date_macro=lastweek&column=daily'} selected {/if}>Last Week</option>
                                              <option value="date_macro=lastmonth&column=weekly" {if $query eq  'date_macro=lastmonth&column=weekly'} selected {/if}>Last Month</option>
                                              <option value="date_macro=lastquarter&column=monthly" {if $query eq  'date_macro=lastquarter&column=monthly'} selected {/if}>Last Quarter</option>
                                               <option value="date_macro=lastyear&column=quarterly" {if $query eq  'date_macro=lastyear&column=quarterly'} selected {/if}>Last Year</option>
                                      </select>
                                  </form>  
                      </div> 
                            
                            
        {else}
           <div class="block-area shortcut-area" id="prtour_tables">
                    <div class="tile" style="height: 300px;padding-top:100px;">
                        <center> 
                            <b style="font-size:13px;">Configure your Intuit QuickBooks Account</b><br/>
                            <a href="{$smarty.const.PORTALLOCATION}page/profile.php?mid=1334&nav=12"><b>Click here</b></a>
                        </center>   
                    </div> 
           </div>            
        {/if}            
                    {*<div class="col-md-1">
                        <a class="tile report-legend-view-by" href="">
                            <div class="view-by">
                                    View by: 
                                    <div class="each-view-by">Today</div>
                                    <div class="each-view-by">This Week</div>
                                    <div class="each-view-by">This Month</div>
                                    <div class="each-view-by">This Quarter</div>
                                    <div class="each-view-by">This Year</div>
                                    <div class="each-view-by">Yesterday</div>
                                    <div class="each-view-by">Last Week</div>
                                    <div class="each-view-by">Last Month</div>
                                    <div class="each-view-by">Last Quarter</div>
                                    <div class="each-view-by">Last Year</div>
                            </div>
                        </a>
                    </div>*}
                </div>
                <hr class="whiter" />

                <div class="block-area">
                    <div class="row">
                        
                        <div class="col-md-5" id="prtour_tasktodo"> 
                            <!-- Tasks to do -->
                                 
                                    <div class="tile">
                                            <h2 class="tile-title">Tasks to do</h2>
                                            <div class="tile-config dropdown">
                                                <a data-toggle="dropdown" href="" class="tile-menu" id="prtour_todo"></a>
                                                <ul class="dropdown-menu  pull-right text-right">
                                                    <li id="todo-add"><a href="#modalCreatTodo"  data-toggle="modal">Add New</a></li>
                                                </ul>
                                            </div>
                                            <div id="toListAjax">      
                                            </div>    
                                    </div>
                        </div>
                        
                        
            <!-- Modal Add new Todo -->	
                     <div class="modal fade" id="modalCreatTodo" tabindex="-1" role="dialog" aria-hidden="true">
                       <div class="modal-dialog">
                           <div class="modal-content">
                               <div class="modal-header">
                                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                   <h4 class="modal-title">Create To Do</h4>
                               </div>
                               <div class="modal-body">
                                   <div class="input-group">
                                       <input style="" class="form-control ng-pristine ng-valid" placeholder="" aria-describedby="basic-send" id="newtodo" type="text" required="required"><br/>

                                       <div class="col-md-12 m-b-15" >
                                       <p style="margin-top: 20px;">Reminder</p>
                                       <div class="make-switch switch-small" onclick ="yesnoCheck();">
                                           <input type="checkbox" class="form-control" >
                                       </div>
                                       </div>


                                   <div id="ifYes" style="visibility:hidden">
                                <div class="col-md-4 m-b-15" >
                                    <p>Date Picker</p>
                                    <div class="input-icon datetime-pick date-only" id="datetimepicker">
                                        <input data-format="yyyy-MM-dd"   type="text" id="date" name="date" class="form-control input-sm" required  readonly value=""  />
                                        <span class="add-on">
                                           <i class="sa-plus"></i>
                                        </span>
                                    </div>
                               </div>
                               <div class="col-md-4 m-b-15">
                                   <p>Time Picker</p>
                                   <div class="input-icon datetime-pick time-only-12">
                                       <input data-format="hh:mm:ss" id="timepicker" type="text" name="fromTime" required class="form-control input-sm" readonly value="" />
                                       <span class="add-on">
                                           <i class="sa-plus"></i>
                                       </span>
                                   </div>
                               </div>
                               </div>
                       
                                     <!--   <span class="input-group-addon btn btn-primary btn-metro" id="basic-send" onclick="createTodo();" required="" style="cursor: pointer;color: #fff;"><i class="fa fa-chevron-right"></i></span> -->
                                   </div>
                               </div>
                               <div class="modal-footer">
                                   <button type="button" class="btn btn-sm" onclick="createTodo();" id="basic-send">Submit</button>
                                   <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
                               </div>
                           </div>
                       </div>
                   </div>  
                        
                        
                        
                        <!-- Tasks to do -->
                        <div class="col-md-7" id="prtour_rssfeeds">
                            <!-- Tasks to do -->
                                <div class="tab-container tile">
                                    <div id="rssFeed-tab-view"></div>
                                        <div class="tab-content">

                                                <div class="tab-pane active overflow" id="rss-feed-value" style="overflow:auto;height:300px">

                                                </div>

                                        </div>
                                    </div>
                            </div>
                        <!-- Tasks to do -->
                        </div>
                    </div>
                </div><!-- block-area -->
                
                 <input type="hidden" id="visibleId" value="proandloss">  
                 
                 
                 
<!--Rss Feed Modal -->                 
<div class="modal fade" id="add-rssfeed">
    <div class="modal-dialog">
    <div id="rssmodal"></div>
    </div>
</div>


                 
                
<script src="{$smarty.const.JSLOCATION}jquery.loader.js"></script> 
<link href="{$smarty.const.CSSLOCATION}/jquery.loader.css" rel="stylesheet">  
 
 
 <!-- Export Table -->
<script src="{$smarty.const.JSLOCATION}/export-table/tableExport.js"></script>
<script src="{$smarty.const.JSLOCATION}/export-table/jquery.base64.js"></script>
<script src="{$smarty.const.JSLOCATION}/export-table/html2canvas.js"></script>
<script src="{$smarty.const.JSLOCATION}/export-table/jspdf/libs/base64.js"></script>
<script src="{$smarty.const.JSLOCATION}/export-table/jspdf/libs/sprintf.js"></script>
<script src="{$smarty.const.JSLOCATION}/export-table/jspdf/jspdf.js"></script>  
<script src="{$smarty.const.JSLOCATION}/datetimepicker.min.js"></script>

 
 
                
<script type="text/javascript">  
    var pageToken = "{$pageToken}"; 
   
    {literal}      
      loadToDoAjax();
       
        customPeriodSelection();
        
       
    function customPeriodSelection()
    {
         chartSelected(this,'proandloss','Profit and Loss');
         
    }
       
        
        function chartSelected(el,id,headerTxt) {


                      $('body').addClass('loading').loader('show', {
                                overlay: true
                            });


                    $("#visibleId").val(id);
                    //$('.selection').removeClass('selected');
                   // $(el).addClass("selected");
                    $("#lablehead").html(headerTxt);
                    //alert(headerTxt);
                    var widgetPeriod = $("#widgetPeriod option:selected").val();

                             $.post(portalLocation+controller+"/widget_ajax.php", {"widgetPeriod":widgetPeriod,"widgetType":id}, function(data){    

                                chartAjaxLoad();
                                $("#loadata_ajax").html(data);
                                $('body').removeClass('loading').loader('hide');
                                 lablevalue();
                              });


                   // $(".pltable").hide();
                    $("#"+id).show();
                    
                               

                }
                
      function chartAjaxLoad()
      {
          
          
          $.post(portalLocation+controller+"/widget_ajax.php", {"chartLoad":"chartLoad"}, function(data){    
              
                   $("#chart-line").html(data);
                               
            });
      }


qbcompanyInfo();
function qbcompanyInfo()
{
    
         $.post(portalLocation+controller+"/widget_ajax.php", {"companyInfo":"companyInfo"}, function(data){    
             //alert(data);
             $("#cmpInfo").html(data);   
             swich_companyList();
         });
    
}  

    
function lablevalue()
{
    
     var period = $("#widgetPeriod option:selected").val();
     $.post(portalLocation+controller+"/widget_ajax.php", {"lableValue":"lableValue","period":period}, function(data){    

        //alert(data);
              var chartValue = JSON.parse(data);
              
              $("#income_lable").html("<i class='social-count animated'>$"+chartValue.income+"</i>");
              $("#expensess_lable").html("<i class='social-count animated'>$"+chartValue.expenses+"</i>");
              $("#recevable_lable").html("<i class='social-count animated'>$"+chartValue.arreceivable+"</i>");
              $("#payable_lable").html("<i class='social-count animated'>$"+chartValue.arpayable+"</i>");
             
         });

}  

function swich_companyList()
{
         $.post(portalLocation+controller+"/switch_qbo_companies.php", {"swich_company":"swich_company"}, function(data){    
             $("#switch_company_list").html(data);
             $("#switch_company_list_icon").show(); 
         });

}  

    
 
function exportExcel(format) {
        var visibleId =  $("#visibleId").val(); 
        var cmpInfo = $("#cmpInfo").text();
        var lablehead = $("#lablehead").text();
        $("#"+visibleId).tableExport({ type: format, escape: 'false',cmpInfo:cmpInfo,lablehead:lablehead });
  
    }

function print() {
    //var visibleId =  $("#visibleId").val();  
    $(".export_hide_txt").hide();
    var divToPrint = document.getElementById("export_report");
    newWin = window.open("");
    newWin.document.write(divToPrint.outerHTML);
    newWin.print();
    newWin.close();
    $(".export_hide_txt").show();

}  

function chartChange(chartType)
{
     $.post(portalLocation+controller+"/widget_ajax.php", {"chartType":chartType}, function(data){    
   
         $(".main-chart").hide(); 
         $("#chart-"+chartType).show();
         $("#chart-"+chartType).html(data);

     });
}


function loadToDoAjax()
{
               var date = new Date();
               var d=("0" + date.getDate()).slice(-2);
               var m=("0" + (date.getMonth() + 1)).slice(-2);
               var y = date.getFullYear();

               var cldate = y + "-" + m + "-" + d;
              
               var chour = addZero(date.getHours());
               var cmin = addZero(date.getMinutes());
              
               var cstime= chour+":"+cmin;
              
                $("#date").val(cldate);
                $("#timepicker").val(cstime);
    
                $.post(portalLocation+"page/settings.php", {"loadToDo":"loadToDo"}, function(data)
                   { 
                        $("#toListAjax").html(data);
                  });
}
function addZero(number) {
    if (number < 10) {
      return "0" + number.toString();
    } else {
      return number.toString();
    }
  }


function createTodo()
{
            var newtodo = $("#newtodo").val();
            var datepicker = $("#date").val();
            var timepicker = $("#timepicker").val();
              if(newtodo != "")   
              {  
                $.ajax({
                        url: portalLocation+"page/settings.php",
                        headers: {
                            'page-token': pageToken,
                        },
                        method: 'POST',                    
                        data : "newtodo="+newtodo+"&datepicker="+datepicker+"&timepicker="+timepicker,
                        success: function(data){
                           // alert(data);
                         window.location.href=window.location.href;
                            //$("#newtodo").val("");
                            //$('#modalCreatTodo').modal('toggle');
                            //loadToDoAjax();
                          
                        },
                            error: function(e) {
                                  
                                  console.log(e.message);
                        }
                });
            } 
            else
             {
                 alert("Enter Valid Message!");
             }
                
               
               
               
}

function yesnoCheck() {
    var a=$(".switch-animate").attr("class");
       if (a == 'switch-on switch-animate') {
       document.getElementById('ifYes').style.visibility = 'visible';
   }
   else document.getElementById('ifYes').style.visibility = 'hidden';

}

$('#newtodo').on("keypress", function(e) {
        if (e.keyCode === 13) {
             createTodo();
            return false; // prevent the button click from happening
        }
        
    });
$('#sidebar').css('height',document.body.scrollHeight);

{/literal} 
</script>  


<!--Product tour -->
<script type="text/javascript">
        var prtour = "{$smarty.get.prtour}";
        var last_login = "{$smarty.session.last_login}";
    {literal} 
        
        if(prtour === '1' || last_login === '')
        {
          productTour(csslocation);
        }   
      {/literal}    
</script>




<!--RSS Feed Script -->
<script type="text/javascript">
    {literal}
    rssbasiconload();
    function rssbasiconload(){
        $.post(portalLocation+'module/rssfeed.php',{
            "data":"data"
        },
        function(data){

           //alert(data);
           document.getElementById("rssFeed-tab-view").innerHTML=data;
           rssbasic();
        });  
    }
        //------------------------------------------------------- 
        function rssbasic(){ 
        var url= document.getElementById("url").value;
         $.post(portalLocation+'module/rssfeed.php',{
                "url":url
            },
        function(data){

           document.getElementById("rss-feed-value").innerHTML=data;
        }); 

    }
    
    
     function updateUrl(){

        var url1 = document.getElementById("url1").value;
        var name1 = document.getElementById("name1").value;

        var url2 = document.getElementById("url2").value;
        var name2 = document.getElementById("name2").value;

        var url3 = document.getElementById("url3").value;
        var name3 = document.getElementById("name3").value;

        var url4 = document.getElementById("url4").value;
        var name4 = document.getElementById("name4").value;

        var url5 = document.getElementById("url5").value;
        var name5 = document.getElementById("name5").value;


            $.post(portalLocation+'module/rssfeed.php',
            {
                 "insert_url1":url1,
                 "name1":name1,
                 "insert_url2":url2,
                 "name2":name2,
                 "insert_url3":url3,
                 "name3":name3,
                 "insert_url4":url4,
                 "name4":name4,
                 "insert_url5":url5,
                 "name5":name5,
                 "rss_update":"rss_update"

            },
            function(data){   
           
             rssbasiconload();            
                $('#add-rssfeed').modal('hide');
                document.getElementById("rss-feed").innerHTML=data;
               rssbasiconload();
            });
       
    }
    function rssFeed(url){
        
            $.post(portalLocation+'module/rssfeed.php',{
                "url":url
            },
        function(data){

           document.getElementById("rss-feed-value").innerHTML=data;
        }); 
    }
    
       function rssmodal(){
            //alert("sdfsd");
          
                $.post(portalLocation+'module/rssfeed.php',{
                "rssmodal":"rssmodal"
            },
        function(data){
           
          document.getElementById("rssmodal").innerHTML=data;
        }); 
    }
  

  
    socialMediaCounts();
        
    
    
 {/literal}    
</script>


<!-- Gdrive -->
<script src="{$smarty.const.JSLOCATION}/filepicker.js"></script>
    {literal}
            <script>

                    function initPicker() {
                        
                            var picker = new FilePicker({
                                    apiKey: 'AIzaSyB6wVxEFDZPE0FaOAlUzT1C07k3OL2LLjE',
                                    clientId:'171670376228-gkmsmv17bcdr66gfe83sjlluaoeh5311',
                                    buttonEl: document.getElementById('pick'),
                                    onSelect: function(file) {
                                        
                                        window.open(file.alternateLink, '_blank'); 

                                    }


                            });	
                    }
            </script>
      {/literal}      
<script src="https://www.google.com/jsapi?key=AIzaSyB6wVxEFDZPE0FaOAlUzT1C07k3OL2LLjE"></script>
<script src="https://apis.google.com/js/client.js?onload=initPicker"></script>


{literal}
    <script type="text/javascript">
        function tableExpand()
        {
          
           var data = $("#loadata_ajax").html();
           $("#modalWider").modal("show"); 
           $("#load_table_content").html(data);
           var table_title = $("#table_title").text();
           $("#exp_table_title").html(table_title);
           
        }
         $("#modalCreatTodo").scroll(function () {
                 $(".bootstrap-datetimepicker-widget").css("display","none");
        });
    </script>
{/literal}


<div class="modal fade" id="modalWider"   tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="exp_table_title"></h4>
                </div>
                <div class="modal-body overflow" id="load_table_content" style="height:450px;width:100%">

                </div>
            </div>
        </div>
</div>




<!---Finicity-->

<div class="modal fade" id="bank" data-backdrop="static" data-keyboard="false" >
                     <div class="modal-dialog">
                         <div class="modal-content">
                             
                              <form class="form-validation" role="form" id="form_id" name="form_id" method="post" action="" >
                                  
                                    <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title">Search Bank</h4>
                                      </div>
                                 <div class="modal-body">
                                         <div class="form-group">
                                              <label for="Search">Search</label>
                                              <input type="text" class="input-sm form-control validate[required]" required name="searchbyname" id="searchbyname" placeholder="...">
                                         </div>
                                   </div>
                             
                                    <div class="modal-footer">                                   
                                    <input type="button" class="btn btn-info btn-sm" name="search" id="search"  value="Search" >
                                        </div>
                              </form>
       <div class="table-responsive overflow" id="loadBankData_ajax" style="overflow: hidden; height: 270px !important; outline: none;" tabindex="5001"> 
             
    <table id="userdata" class="table table-bordered tile pltable" tabindex="5003" style="overflow: hidden; outline: none; border-right: 4px solid rgba(255,255,255,.8);" border="0">
    <thead>
        <th style="min-width: 175px !important;">Name</th>
        <th style="min-width: 275px !important;">Account Type Description</th>
        <th style="min-width: 50px !important;">Action</th>
       
    </thead>
    <tbody>
        </tbody>
</table>
       </div>
                             
                             <div class="tile p-15">
                             
                             <div id="loginform" >
                                 
                                 <form role="form" name="bankloginForm" id="bankloginForm" method="post" action="">
                                     
                                     
                                 </form>
                                
                             </div>    
                             </div>
                             
                             
                             
                             
                         </div>
                     </div>
   </div>
{literal}
    <script type="text/javascript">
        $("#bankbtn").on('click', function() {    
          $('#bank').modal('show'); 
        });
        
        
    $("#search").click(function() {          
         var Search=$("#searchbyname").val();
       SearchBank(Search);
         
     });
    
  
    
    function SearchBank(searchdata){
     
         var searchbyname = searchdata;
          $.post(portalLocation+"/module/banklist.php", {"searchbyname":searchbyname}, function(data){    
                  
        var response = jQuery.parseJSON(data); 
        console.log(response);
         
          var trHTML = '';
          
          trHTML='';
            for(var f=0;f<response.length;f++) {

              var url=portalLocation+"/module/user_login.php?institutionId="+response[f]['id'];

              var login='Login';
              trHTML +='<tr><td>'+response[f]['name']+'</td><td>'+response[f]['accountTypeDescription']+'</td><td><a href=# onclick=Loginform("'+url+'");  >'+login+'</a></td></tr>';

              $(trHTML).appendTo("#userdata tbody");     
                }
            
        });
        
    }
    
    
    
function Loginform(url){
        var strx   = url.split('=');    
    
   var institutionId=strx[1];
       
    $("#loadBankData_ajax").hide();          
     
    $.get(portalLocation+"/module/user_login.php", {"institutionId":institutionId}, function(data){
       
        console.log('data');        
        console.log(data);        
          var formdata = jQuery.parseJSON(data);           
           console.log(formdata);           
           var form='';           
          for(var i=0;i<formdata.length;i++) {
                          
              console.log(formdata[i]['mask']);
          // form +='<label>'+formdata[i]['description']+'<input type=text name=loginForm["'+i+'"][value] ></label><br><input type=hidden name=loginForm["'+i+'"][id] value="'+formdata[i]['id']+'"><input type=hidden name=loginForm["'+i+'"][name] value="'+formdata[i]['name']+'">';   
           if(formdata[i]['mask'] =='true'){
               form +='<div class=form-group><label>'+formdata[i]['description']+'<input type=password class=form-control input-sm name=loginForm["'+i+'"][value] ></label></div><input type=hidden name=loginForm["'+i+'"][id] value="'+formdata[i]['id']+'"><input type=hidden name=loginForm["'+i+'"][name] value="'+formdata[i]['name']+'">';   
           }else{
               form +='<div class=form-group><label>'+formdata[i]['description']+'<input type=text class=form-control input-sm name=loginForm["'+i+'"][value] ></label></div><input type=hidden name=loginForm["'+i+'"][id] value="'+formdata[i]['id']+'"><input type=hidden name=loginForm["'+i+'"][name] value="'+formdata[i]['name']+'">';   
           }
                           
          }  
           form +='<br><input type=submit class=btn btn-sm m-t-10 value=Login> <button type="button" class="btn btn-info btn-sm" id="close" data-dismiss="modal">Close</button>';
             $(form).appendTo("#bankloginForm"); 
         
    });
    
       
        
    }
    
      $(".close").click(function() { 
         $("#userdata tbody").empty();    
        // alert('test'); 
      $("#bankloginForm").empty();   
      
          
    });
    
    
    $("#close").click(function() { 
        
        
         $("#userdata tbody").empty();    
         //alert('test'); 
      $("#bankloginForm").empty();   
      
          
    });
        
    </script>
{/literal}    