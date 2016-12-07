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
<div class="block-area" id="tabs">                   
    <div class="tab-container" style="box-shadow:0 0 5px rgba(0, 0, 0, 1.15)">
        <ul class="nav tab nav-tabs">
            <li {if $active_list eq 'quickbooks'} class="active" {/if}><a href="#quickbooks">QuickBooks</a></li>
            <li {if $active_list eq 'Bank'} class="active" {/if}><a href="#Bank">Bank</a></li>

        </ul>

        <div class="tab-content">
            <div class="tab-pane  {if $active_list eq 'quickbooks'} active {/if}" id="quickbooks">
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
                        <div class="col-md-9">
                            <a class="tile report-legend" style="cursor:pointer" onclick="chartSelected(this, 'proandloss', 'Profit and Loss')">
                                <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-04.png" alt="">
                                Profit and Loss

                            </a>

                            <a class="tile report-legend_custom" style="cursor:pointer" onclick="chartSelected(this, 'Income', 'Income')">
                                <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-00.png" alt="">
                                Income
                                <span id="income_lable">

                                </span>    
                            </a>
                            <a class="tile report-legend_custom" style="cursor:pointer" onclick="chartSelected(this, 'expensess', 'Expenses')">
                                <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-01.png" alt="">
                                Expense
                                <span id="expensess_lable">

                                </span> 
                            </a>

                            <a class="tile report-legend" style="cursor:pointer" onclick="chartSelected(this, 'balancesheet', 'Balance Sheet')">
                                <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-05.png" alt="">
                                Balance Sheet
                            </a>    

                            <a class="tile report-legend_custom" style="cursor:pointer" onclick="chartSelected(this, 'ardetails', 'AR Aging')">
                                <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-02.png" alt="">
                                Account Receivables
                                <span id="recevable_lable">

                                </span> 
                            </a>
                            <a class="tile report-legend_custom" style="cursor:pointer" onclick="chartSelected(this, 'apdetails', 'AP Aging')">
                                <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-03.png" alt="">
                                Account Payables
                                <span id="payable_lable">

                                </span> 
                            </a>


                            <a class="tile report-legend" style="cursor:pointer" onclick="chartSelected(this, 'caseflow', 'Cash flow')">
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
                            <a class="tile report-legend" style="cursor:pointer" onclick="chartSelected(this, 'salesbycustomer', 'Sales by customer')">
                                <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-09.png" alt="">
                                Sales by Customer
                            </a>
                        </div>
                        <div class="col-md-1 m-b-15">
                            {if !isset($quickbook_error_msg)}  
                                <select class="switch_company_list_icon pull-right" onchange="switchCompany_info()"  id="switch_company_list" style="padding-left:10px;width:135px;height:29px;background-color:transparent;border:1px solid rgba(255, 255, 255, 0.3);display:none;">   

                                </select>
                            {/if}
                        </div>

                        <div class="col-md-2 m-b-15 " id="prtour_period">

                            <form action="#" method="post" name="customSelection" id="customSelection">   
                                <select class="widgetPeriod" name="customperiod" onchange="customPeriodSelection()" id="widgetPeriod" style="padding-left:10px;width:155px;height:29px;background-color:transparent;border:1px solid rgba(255, 255, 255, 0.3);">
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

                </div> 
                &nbsp;
            </div>

            <div class="tab-pane {if $active_list eq 'Bank'} active {/if}" id="Bank">
                    <div class="row">
                        <div class="col-md-7"> 
                            <label><span><h5><b id="account_lable"></b></h5></span></label>
                                    <div class="tile-config dropdown">   
                                        <a data-toggle="dropdown" href="">
                                             <span class="icon" style="font-size:23px;">&#61720;</span>
                                        </a>
                                        <ul class="dropdown-menu pull-right text-right">
                                            <li class="export_hide_txt"><a class="tile-info-toggle" onclick="print_finicity();" href="javascript:void(0)">Print</a></li>
                                            <li class="export_hide_txt"><a onclick="exportExcel_finicity('pdf');" href="javascript:void(0)">Export PDF</a></li>
                                            <li class="export_hide_txt"><a  onclick="exportExcel_finicity('excel');" href="javascript:void(0)">Export Excel</a></li>
                                        </ul>

                                    </div>
                        </div>
                        <div class="col-md-2">    
                             <div class="input-icon datetime-pick date-only">
                                <input data-format="dd/MM/yyyy" type="text" id="finicity_startdate" class="form-control input-sm" />
                                <span class="add-on">
                                    <i class="sa-plus"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-md-2">    
                             <div class="input-icon datetime-pick date-only">
                                <input data-format="dd/MM/yyyy" type="text" id="finicity_enddate" class="form-control input-sm" />
                                <span class="add-on">
                                    <i class="sa-plus"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-md-1"> <button class="btn btn-sm" onclick="viewTansactionsDateRange();">Submit</button></div>
                    </div>

                    <input id="currentTransaction_customer_id" type="hidden" value="{$smarty.session.first_customer_id}">
                    <input id="currentTransaction_usr_id" type="hidden" value="{$smarty.session.current_user_id}">

                    <div class="table-responsive overflow tile" style="overflow: hidden; height: 270px !important; outline: none;" id="transaction_details" tabindex="5001">
                        <br/>
                        <table class="table table-bordered tile" style="min-width:500px;max-width:1185px;">
                            <thead>
                                <tr>  
                                    <th style="text-align:center !important;">ID</th>                                                               

                                    <th style="text-align:center !important;">Amount</th>                                                               

                                    <th style="text-align:center !important;">Status</th>                                                               

                                    <th style="text-align:center !important;">Description</th>                                                               

                                    <th style="text-align:center !important;">Type</th>                                                               

                                    <th style="text-align:center !important;">Posted Date</th>  
                                    <th style="text-align:center !important;">Created Date</th>   
                                    <th style="text-align:center !important;">Action</th>                                                                

                                </tr>
                            </thead>  
                            <tbody> 
                                <tr><td colspan="7" align="center">.................</td></tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="block-area shortcut-area">
                        <div class="col-md-9" id="customer_details">

                        </div>
                        <div class="col-md-3">
                            <div class="row">
                                <select class="finicityPeriod pull-right" name="finicityPeriod" onchange="changeFinicityAccount()" id="finicityPeriod" style="padding-left:10px;width:220px;height:29px;background-color:transparent;border:1px solid rgba(255, 255, 255, 0.3);">
                                    {foreach $finicity_list as $keys=>$values}
                                        {assign var=decoded_value value=$values["data"]|json_decode}
                                        <option value="{$decoded_value->institution_id}&#&{$decoded_value->user_id}&#&{$values["p_id"]}" {if $finicity_active_credentials['user_id'] eq $decoded_value->user_id} selected {/if}>{$decoded_value->bank_aliesname}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>        
                    </div>
                    &nbsp;
                </div> 
            </div>
        </div>
        <br/>
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
                            //swich_companyList();
                            loadToDoAjax();
                            //customPeriodSelection();
                            function customPeriodSelection()
                            {

                                chartSelected(this, 'proandloss', 'Profit and Loss');

                            }

                            function chartSelected(el, id, headerTxt) {
                                $("#visibleId").val(id);
                                //$('.selection').removeClass('selected');
                                // $(el).addClass("selected");
                                $("#lablehead").html(headerTxt);
                                //alert(headerTxt);
                                var widgetPeriod = $("#widgetPeriod option:selected").val();

                                if (widgetPeriod)
                                {

                                    $('body').addClass('loading').loader('show', {
                                        overlay: true
                                    });


                                    $.post("widget_ajax", {"widgetPeriod": widgetPeriod, "widgetType": id}, function (data) {

                                        chartAjaxLoad();
                                        $("#loadata_ajax").html(data);
                                        $('body').removeClass('loading').loader('hide');
                                        lablevalue();
                                    });
                                    $("#" + id).show();
                                }
                            }

                            function chartAjaxLoad()
                            {
                                $.post("chart_ajax", {"chartLoad": "chartLoad"}, function (data) {

                                    $("#chart-line").html(data);

                                });
                            }

                            function chartChange(chartType)
                            {
                                $.post("change_chartType", {"chartType": chartType}, function (data) {

                                    $(".main-chart").hide();
                                    $("#chart-" + chartType).show();
                                    $("#chart-" + chartType).html(data);

                                });
                            }

                            function lablevalue()
                            {

                                var period = $("#widgetPeriod option:selected").val();
                                $.post("loadValue_lable", {"lableValue": "lableValue", "period": period}, function (data) {


                                    var chartValue = JSON.parse(data);

                                    $("#income_lable").html("<i class='social-count animated'>$" + chartValue.income + "</i>");
                                    $("#expensess_lable").html("<i class='social-count animated'>$" + chartValue.expenses + "</i>");
                                    $("#recevable_lable").html("<i class='social-count animated'>$" + chartValue.arreceivable + "</i>");
                                    $("#payable_lable").html("<i class='social-count animated'>$" + chartValue.arpayable + "</i>");

                                });

                            }

                            //qbcompanyInfo();
                            function qbcompanyInfo()
                            {

                                $.post("QBCompanyInfo", {"companyInfo": "companyInfo"}, function (data) {
                                    $("#cmpInfo").html(data);
                                    swich_companyList();
                                });

                            }


                            function tableExpand()
                            {

                                var data = $("#loadata_ajax").html();
                                $("#modalWider").modal("show");
                                $("#load_table_content").html(data);
                                var table_title = $("#table_title").text();
                                $("#exp_table_title").html(table_title);

                            }


                            function print() {

                                var table_height = $(".pltable").height();
                                $(".export_report").css("height", table_height);
                                $("#loadata_ajax").css("height", table_height);
                                $(".export_hide_txt").hide();
                                var divToPrint = document.getElementById("export_report");
                                newWin = window.open("");
                                newWin.document.write(divToPrint.outerHTML);
                                $(".export_report").css("height", "270px");
                                $("#loadata_ajax").css("height", "270px");
                                $(".export_hide_txt").show();
                                newWin.print();
                                newWin.close();

                            }

                            function exportExcel(format)
                            {
                                var visibleId = $("#visibleId").val();
                                var cmpInfo = $("#cmpInfo").text();
                                var lablehead = $("#lablehead").text();
                                $("#" + visibleId).tableExport({type: format, escape: 'false', cmpInfo: cmpInfo, lablehead: lablehead});

                            }

                            function swich_companyList()
                            {

                                $.post("switchQB_company", {"swich_company": "swich_company"}, function (data) {
                                    $("#switch_company_list").html(data);
                                    $("#switch_company_list").show();
                                });

                            }

                            function loadToDoAjax()
                            {
                                var date = new Date();
                                var d = ("0" + date.getDate()).slice(-2);
                                var m = ("0" + (date.getMonth() + 1)).slice(-2);
                                var y = date.getFullYear();

                                var cldate = y + "-" + m + "-" + d;

                                var chour = addZero(date.getHours());
                                var cmin = addZero(date.getMinutes());

                                var cstime = chour + ":" + cmin;

                                $("#date").val(cldate);
                                $("#timepicker").val(cstime);

                                $.post("loadToDoList", {"loadToDo": "loadToDo"}, function (data)
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
                                if (newtodo != "")
                                {
                                    $.ajax({
                                        url: "createToDoList",
                                        method: 'POST',
                                        data: "newtodo=" + newtodo + "&datepicker=" + datepicker + "&timepicker=" + timepicker,
                                        success: function (data) {
                                            // alert(data);
                                            window.location.href = window.location.href;
                                            //$("#newtodo").val("");
                                            //$('#modalCreatTodo').modal('toggle');
                                            //loadToDoAjax();

                                        },
                                        error: function (e) {

                                            console.log(e.message);
                                        }
                                    });
                                } else
                                {
                                    alert("Enter Valid Message!");
                                }




                            }

                            function yesnoCheck() {
                                var a = $(".switch-animate").attr("class");
                                if (a == 'switch-on switch-animate') {
                                    document.getElementById('ifYes').style.visibility = 'visible';
                                } else
                                    document.getElementById('ifYes').style.visibility = 'hidden';

                            }

                            $('#newtodo').on("keypress", function (e) {
                                if (e.keyCode === 13) {
                                    createTodo();
                                    return false; // prevent the button click from happening
                                }

                            });

                            function updateToDoList(id, updateToDo) {

                                $.post("updateToDo", {"updateToDo": updateToDo, "id": id}, function (data) {

                                    loadToDoAjax();
                                });
                            }
                            function clearTodoList()
                            {
                                $.post("cleartodo", {"cleartodo": "cleartodo"}, function (data) {
                                    loadToDoAjax();
                                });
                            }

                            $('#sidebar').css('height', document.body.scrollHeight);



    </script>
{/literal} 



<!--RSS Feed Script -->
<script type="text/javascript">
    {literal}
        rssbasiconload();
        function rssbasiconload() {

            $.post("loadRssFeeds", {
                "data": "data"
            },
                    function (data) {
                        document.getElementById("rssFeed-tab-view").innerHTML = data;
                        rssbasic();
                    });
        }

        //------------------------------------------------------- 
        function rssbasic() {
            var url = document.getElementById("url").value;
            $.post('rssbasic', {
                "url": url
            },
                    function (data) {

                        document.getElementById("rss-feed-value").innerHTML = data;
                    });

        }


        function updateUrl() {

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


            $.post('updateRssFeedsUrl',
                    {
                        "insert_url1": url1,
                        "name1": name1,
                        "insert_url2": url2,
                        "name2": name2,
                        "insert_url3": url3,
                        "name3": name3,
                        "insert_url4": url4,
                        "name4": name4,
                        "insert_url5": url5,
                        "name5": name5,
                        "rss_update": "rss_update"

                    },
                    function (data) {

                        rssbasiconload();
                        $('#add-rssfeed').modal('hide');
                        document.getElementById("rss-feed").innerHTML = data;
                        rssbasiconload();
                    });

        }
        function rssFeed(url) {

            $.post('rssbasic', {
                "url": url
            },
                    function (data) {

                        document.getElementById("rss-feed-value").innerHTML = data;
                    });
        }

        function rssmodal()
        {
            $.post('rssmodal', {
                "rssmodal": "rssmodal"
            },
                    function (data) {
                        document.getElementById("rssmodal").innerHTML = data;
                    });
        }
        // call at last this social counter update
        socialMediaCounts();
        // end
    {/literal}    

</script>

<!-- Gdrive -->
<script src="{$smarty.const.JSLOCATION}/filepicker.js"></script>
{literal}
    <script>

        function initPicker() {

            var picker = new FilePicker({
                apiKey: 'AIzaSyB6wVxEFDZPE0FaOAlUzT1C07k3OL2LLjE',
                clientId: '171670376228-gkmsmv17bcdr66gfe83sjlluaoeh5311',
                buttonEl: document.getElementById('pick'),
                onSelect: function (file) {

                    window.open(file.alternateLink, '_blank');

                }


            });
        }
    </script>
{/literal}      
<script src="https://www.google.com/jsapi?key=AIzaSyB6wVxEFDZPE0FaOAlUzT1C07k3OL2LLjE"></script>
<script src="https://apis.google.com/js/client.js?onload=initPicker"></script>


<!-- Finicity Bank Modules-->

<div class="modal fade" id="bank" data-backdrop="static" data-keyboard="false" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Search Bank</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="Search">Search</label>
                    <input type="text" class="input-sm form-control validate[required]" required name="searchbyname" id="searchbyname" placeholder="..." autocomplete="off">
                    &nbsp;
                    <div id="bank_inputBox" style="display:none">
                        <input type="text" name="bank_name" id="bank_name" class="form-control input-sm" style="width:200px;"> 
                    </div>
                </div>
            </div>

            <div class="modal-footer">                                   
                <button onclick="SearchBank()" class="btn btn-info btn-sm" name="search" id="search">Search</button>
            </div>

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


<script type="text/javascript">
    var currPageServer = "{$currPageServer}";

    {literal}
        
                                var date = new Date();
                                var d = ("0" + date.getDate()).slice(-2);
                                var m = ("0" + (date.getMonth() + 1)).slice(-2);
                                var stmonth = ("0" + (date.getMonth())).slice(-2);
                                var y = date.getFullYear();
                                var enddate = d + "/" + m + "/" + y;
                                var startDate = d + "/" + stmonth + "/" + y;
                                $("#finicity_enddate").val(enddate);
                                $("#finicity_startdate").val(startDate);
        
        
        function bankSearchModal()
        {
            $('#bank').modal('show');
            $("#bank_inputBox").hide();
        }
        function SearchBank()
        {
            var searchbyname = $("#searchbyname").val();
            $('body').addClass('loading').loader('show', {
                overlay: true
            });

            $.post("InstitutionsList", {"searchbyname": searchbyname}, function (response) {
                $("#loadBankData_ajax").show();
                $("#userdata tbody").html(response);
                $('body').removeClass('loading').loader('hide');
                $("#loginform").hide();
            });

        }
        function bankLoginform(InstitutionId, InstitutionName)
        {
            $('body').addClass('loading').loader('show', {
                overlay: true
            });

            $("#bank_name").val(InstitutionName);
            $("#bank_inputBox").show();
            $.post("InstitutionsLoginForm", {"InstitutionId": InstitutionId, "InstitutionName": InstitutionName}, function (response) {
                $("#loadBankData_ajax").hide();
                $("#loginform").show();
                $("#bankloginForm").html(response);
                $('body').removeClass('loading').loader('hide');
            });
        }
        function institutionFormdataAggrication()
        {
            $('body').addClass('loading').loader('show', {
                overlay: true
            });
            var bankAliesName = $("#bank_name").val();
            $.post("saveBankAliesname", {"bankAliesName": bankAliesName}, function (response) {

            });

            $.ajax({
                type: "POST",
                crossOrigin: true,
                url: 'institutionFormdataAggrication',
                data: $("#bankloginForm").serialize(), // serializes the form's elements.
                success: function (response)
                {
                    alert(response);
                    if (response)
                    {
                        var redirect_url = currPageServer + "?selectType=Bank";
                        window.location = redirect_url;
                    }
                    $('#bank').modal('hide');
                    $('body').removeClass('loading').loader('hide');
                }
            });
        }

        loadBankDetails();
        function loadBankDetails()
        {

            var finicityPeriodInof = $("#finicityPeriod option:selected").val();
            var finicityPeriod = finicityPeriodInof.split("&#&");
            $.post("loadBankDetails", {"current_insitiution_id": finicityPeriod[0], "current_user_id": finicityPeriod[1]}, function (response) {


                if (response === '0')
                {
                    alert("Customer does not have any accounts associated with institutionId");
                } else
                {
                    $("#customer_details").html(response);

                    var first_customer_id = $("#first_customer_id").val();
                    var curr_usr_id = $("#curr_usr_id").val();
                    viewCustomerTransaction(first_customer_id, curr_usr_id);
                }


            });
        }
        function changeFinicityAccount()
        {

            var finicityPeriodInof = $("#finicityPeriod option:selected").val();
            var changePluginId = finicityPeriodInof.split("&#&");
            $.post("changeFinicityAccount", {"changePluginId": changePluginId[2]}, function (response) {

                var redirect_url = currPageServer + "?selectType=Bank";
                window.location = redirect_url;
            });
        }
        function viewCustomerTransaction(account_id, current_user_id)
        {
            var finicity_startdate = $("#finicity_startdate").val();
            var finicity_enddate = $("#finicity_enddate").val();
            
            $("#currentTransaction_customer_id").val();
            $("#currentTransaction_usr_id").val();
            
            $("#currentTransaction_customer_id").val(account_id);
            $("#currentTransaction_usr_id").val(current_user_id);
            
            
            
            $("#account_lable").html($("#" + account_id + "_account_details").attr('title'));
            $('body').addClass('loading').loader('show', {
                overlay: true
            });
            $.post("viewCustomerTransaction", {"account_id": account_id, "selected_user_id": current_user_id,"finicity_startdate":finicity_startdate,"finicity_enddate":finicity_enddate}, function (response) {
                //alert(response);
                $("#transaction_details").html(response);
                $('body').removeClass('loading').loader('hide');
            });
        }
        function viewTansactionsDateRange()
        {
            var account_id = $("#currentTransaction_customer_id").val();
            var current_user_id = $("#currentTransaction_usr_id").val();
            viewCustomerTransaction(account_id, current_user_id);
        }
        
        function print_finicity()
        {
                                var table_height = $("#transaction_details_table").height();
                                var table_height = (table_height+500+"px");
                                $("#transaction_details").css("height", table_height);
                                $("#account_lable_info").show();
                                $("#account_lable_info").html($("#account_lable").text());                               
                                var divToPrint = document.getElementById("transaction_details");
                                newWin = window.open("");
                                newWin.document.write(divToPrint.outerHTML);
                                $("#transaction_details").css("height", "270px");
                                $("#account_lable_info").hide();
                                newWin.print();
                                newWin.close();
        }
        
        function exportExcel_finicity(format)
        {   
            var cmpInfo = $("#account_lable").text();
            var lablehead = "";
            $("#transaction_details_table").tableExport({type: format, escape: 'false', cmpInfo: cmpInfo, lablehead: lablehead});
             
        }
        

    {/literal} 
</script>


