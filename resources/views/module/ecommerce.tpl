<script src="{$smarty.const.JSLOCATION}/charts/jquery.flot.categories.js"></script> 
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
{$html}
</div>
<hr class="whiter" />
    
{if !isset($quickbook_error_msg)}     
  <div class="block-area shortcut-area">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="tile">                             
          <h2 class="tile-title">
            <b>
              <span id="cmpInfo"></span>
              <span id="lablehead">Customers</span>
            </b>
          </h2>
          {*<div class="tile-config dropdown">
            <a data-toggle="dropdown" href="" class="tile-menu"></a>
            <ul class="dropdown-menu pull-right text-right">
              <li>
                <a class="tile-info-toggle" onclick="print();" href="javascript:void(0)">Print</a>
              </li>
              <li>
                <a onclick="exportExcel('pdf');" href="javascript:void(0)">Export PDF</a>
              </li>
              <li>
                <a onclick="exportExcel('excel');" href="javascript:void(0)">Export Excel</a>
              </li>
            </ul>
          </div>*}
          <div class="p10">
            <div class="table-responsive overflow" id="loadata_ajax" style="overflow: hidden; height: 270px !important; outline: none;" tabindex="5001"></div>
          </div>
        </div>
      </div>
      {*<div class="col-xs-12 col-sm-12 col-md-4">
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
      </div>*}
    </div>
  </div>
  <!-- <hr class="whiter" /> -->

  <div class="block-area shortcut-area">
    <div class="col-md-10">
      <a class="tile report-legend" id="prtour_customer" style="cursor:pointer" onclick="chartSelected('customers','Customers')">
          <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-04.png" alt="">
          Customers                          
      </a> 
      <a class="tile report-legend_custom" id="prtour_order" style="cursor:pointer" onclick="chartSelected('orders','Orders')">
          <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-01.png" alt="">
          Orders
           <span id="expensess_lable"></span> 
      </a>     
      <a class="tile report-legend_custom" style="cursor:pointer;display: none;" onclick="chartSelected('refunds','Refunds')" id="refunds_widget">
          <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-00.png" alt="">
          Refunds
          <span id="income_lable"></span>    
      </a>             
      {*<a class="tile report-legend" style="cursor:pointer" onclick="chartSelected(this,'balancesheet','Fulfillments')">
          <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-05.png" alt="">
          Fulfillments
      </a>
      <a class="tile report-legend_custom" style="cursor:pointer" onclick="chartSelected(this,'ardetails','Refunds')">
          <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-02.png" alt="">
          Refunds
          <span id="recevable_lable"></span> 
      </a>*}
    </div>                            
    <div class="col-md-2 m-b-15 pull-right">
      <form action="#" method="post" name="customSelection" id="customSelection">   
        <select class="widgetPeriod" name="customperiod" onchange="customPeriodSelection()" 
          id="widgetPeriod" style="padding-left:10px;width:175px;height:29px;background-color:transparent;border:1px solid rgba(255, 255, 255, 0.3);">
          {*<option value="date_macro=today&column=daily" {if $query eq  "date_macro=today&column=daily"} selected {/if}>Today</option>*}
          <option value="thisweek" {if $query eq  'thisweek'} selected {/if}>Last 7 days</option>
          <option value="thismonth" {if $query eq  'thismonth'} selected {/if} selected="true">Last 30 days</option>
          <option value="last60days" {if $query eq  'last60days'} selected {/if} >Last 60 days</option>
          <option value="last90days" {if $query eq  'last90days'} selected {/if}>Last 90 days</option>          
        </select>
      </form>  
    </div>                 
{else}
    <div class="block-area shortcut-area">
      <div class="tile" style="height: 300px;padding-top:100px;">
          <center> 
              <b style="font-size:13px;">Configure your Intuit QuickBooks Account</b><br/>
              <a href="{$smarty.const.PORTALLOCATION}page/profile.php?mid=1334&nav=12"><b>Click here</b></a>
          </center>   
      </div> 
    </div>            
{/if} 
  </div>                             
  <input type="hidden" id="active_plugin" value="shopify">  
  <input type="hidden" id="active_report_type" value="customers">
  <!-- Order Details Model -->                 
  <div class="modal fade" id="oder_details_model">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true" >&times;</button>
              <h4 class="modal-title" id="order_model_title"></h4>
            </div>
            <div class="modal-body">
              <!-- loader image -->
              <div id="loader_graph" style="height: 100px;position: relative;text-align: center;    z-index: 99999999;">
                  <img src="{$smarty.const.IMAGESLOCATION}/loadinfo.gif" alt="" style="    padding: 4%;">
              </div>
              <div id="oder_details_body"></div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-sm" data-dismiss="modal">Close</button>
            </div>
         </div>        
      </div>
  </div>              
                
                
<script src="{$smarty.const.JSLOCATION}/jquery.loader.js"></script> 
<link href="{$smarty.const.CSSLOCATION}/jquery.loader.css" rel="stylesheet"> 
<!-- Export Table -->
<script src="{$smarty.const.JSLOCATION}/export-table/tableExport.js"></script>
<script src="{$smarty.const.JSLOCATION}/export-table/jquery.base64.js"></script>
<script src="{$smarty.const.JSLOCATION}/export-table/html2canvas.js"></script>
<script src="{$smarty.const.JSLOCATION}/export-table/jspdf/libs/base64.js"></script>
<script src="{$smarty.const.JSLOCATION}/export-table/jspdf/libs/sprintf.js"></script>
<script src="{$smarty.const.JSLOCATION}/export-table/jspdf/jspdf.js"></script>  
<script src="{$smarty.const.JSLOCATION}/datetimepicker.min.js"></script> 
{literal}               
<script type="text/javascript">
$(document).ready(function() {  
  $('body').addClass('loading').loader('show', {overlay: true});
  /*
  *
  * Load default Shopify -> Customers Data
  */  
  var plugin = $("#active_plugin").val();
  var report_type = $("#active_report_type").val(); 
  $.post("ecommerce_ajax", {"plugin":plugin,"report_type":report_type,"period":"thismonth"}, function(data){
    $("#loadata_ajax").html(data);
    $('body').removeClass('loading').loader('hide');
  });  
}); 
/*
* Load table data on ecommerce plugin onchange
* switch between ecommerce plugins
*/ 
function changeEcommerce(id){
    // alert(id);
    $(".shortcut.tile").removeClass("ecomactive");
    $("#"+id).addClass("ecomactive");
    $("#active_plugin").val(id); 
    var widgetPeriod = $("#widgetPeriod option:selected").val();
    var report_type = $("#active_report_type").val(); 
    // if(id == "shopify"){
    //   $("#refunds_widget").hide();
    // }
    // if(id == "woocommerce"){
    //   $("#refunds_widget").show();
    // }
    
    $('body').addClass('loading').loader('show', {overlay: true});    
    /*
    * Load for selected plugin -> report_type Data for widgetPeriod
    */
    $.post("ecommerce_ajax", {"plugin":id,"report_type":report_type,"period":widgetPeriod}, function(data){ 
      // console.log(data);
      $("#loadata_ajax").html(data);
      $('body').removeClass('loading').loader('hide');
    });
}
/*
* Load table data on report type onchange
*/       
function chartSelected(report_type,headerTxt) {
  $('body').addClass('loading').loader('show', {overlay: true});
  $("#lablehead").html(headerTxt);
  $("#loadata_ajax").html('');
  var widgetPeriod = $("#widgetPeriod option:selected").val();
  var plugin = $("#active_plugin").val();
  $("#active_report_type").val(report_type); 
  /*
  * Load default plugin -> report_type Data for widgetPeriod
  */  
  $.post("ecommerce_ajax", {"plugin":plugin,"report_type":report_type,"period":widgetPeriod}, function(data){ 
    // console.log(data);
    $("#loadata_ajax").html(data);
    $('body').removeClass('loading').loader('hide');
  });  
}
/*
* Get Order details Fulfillments, Refunds, Transactions
*/
function getOrderdetails(report_type,order_id){
  $("#order_model_title").html(report_type.toUpperCase());
  var plugin = $("#active_plugin").val();
  $("#oder_details_body").html('');
  $("#loader_graph").show();
  $.post("ecommerce_ajax", {"plugin":plugin,"report_type":report_type,"oder_details":"oder_details","order_id":order_id}, function(data){      
      $("#oder_details_body").html(data);     
      $("#loader_graph").hide(); 
  }); 
}
/*
* Load table datas while date range onchange
*/   
function customPeriodSelection(){
  var widgetPeriod = $("#widgetPeriod option:selected").val();
  $('body').addClass('loading').loader('show', {overlay: true});
  var plugin = $("#active_plugin").val();
  var report_type = $("#active_report_type").val(); 
  $("#loadata_ajax").html('');
  /*
  * Load default plugin -> report_type Data for widgetPeriod
  */  
  $.post("ecommerce_ajax", {"plugin":plugin,"report_type":report_type,"period":widgetPeriod}, function(data){ 
    // console.log(data);
    $("#loadata_ajax").html(data);
    $('body').removeClass('loading').loader('hide');
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
    
 
function exportExcel(format) {
    var visibleId =  $("#visibleId").val(); 
    $("#"+visibleId).tableExport({ type: format, escape: 'false' });
}

function print() {
    var visibleId =  $("#visibleId").val();             
    var divToPrint = document.getElementById(visibleId);
    newWin = window.open("");
    newWin.document.write(divToPrint.outerHTML);
    newWin.print();
    newWin.close();

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
  var cstime=date.getHours()+":"+date.getMinutes()+":"+date.getSeconds();

  $("#date").val(cldate);
  $("#timepicker").val(cstime);

  $.post(portalLocation+"page/settings.php", {"loadToDo":"loadToDo"}, function(data)
     { 
          $("#toListAjax").html(data);
    });
}


function yesnoCheck() {
    var a=$(".switch-animate").attr("class");
       if (a == 'switch-on switch-animate') {
       document.getElementById('ifYes').style.visibility = 'visible';
   }
   else document.getElementById('ifYes').style.visibility = 'hidden';

}


$('#sidebar').css('height',document.body.scrollHeight);

{/literal} 
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