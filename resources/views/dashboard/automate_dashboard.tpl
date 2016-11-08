{*
#*******************************************************************#
#	       Global Basics Inc :: Generic module page             #
#*******************************************************************#

Document       : Automation Dashboard
Created on     : 24-06-2016
Author         : Ponnar V
Description    : Automation Dashboard
Last Edited on : 24-06-2016
Last Edited by : Ponnar V
* 
*}
<div class="col-md-12" ng-app="dashboard">
    <div class="row" ng-controller="MyCtrl">
        <div class="row">
            <div class="col-md-12 text-primary text-center">
                <h4>{$pageTitle}</h4> 
            </div>
            <div class="col-md-12">
                <div class="msg-header">
                    <div class="col-md-6 col-xs-12">
                        {*<p class="text-muted text-left"><strong>{$smarty.const.values}</strong></p>*}
                    </div>
                    <div class="text-right col-md-6 col-xs-12">
                        <button class="btn btn-white tooltips"  type="button" id="product-tour-minimize-maximixze" data-toggle="tooltip" ng-click="minim()" data-toggle="tooltip" data-original-title="Overall Minimize">
                            {literal}<i class="{{minimizeallicon}}"></i>{/literal}
                        </button>
                        <button class="btn btn-white tooltips" id="product-tour-period" type="button" ng-click="expand = !expand" data-toggle="tooltip" data-original-title="Period">
                            <i class="fa fa-calendar"></i>
                        </button>
                        <button class="btn btn-white tooltips" id="product-tour-settings" type="button" ng-click="settings()" data-toggle="tooltip" data-original-title="Settings">
                            <i class="fa fa-cogs"></i>
                        </button>
                        <button class="btn btn-white tooltips" id="product-tour-layout" type="button" ng-click="layout()" data-toggle="tooltip" data-original-title="Layout">
                            <i class="fa fa-th-large"></i>
                        </button>
                    </div><!-- pull-right -->
                </div>
            </div>
        </div>
        <div class="slide row" ng-show="expand" style="padding: 10px;display: none;" >
            <div  ng-init="period = '{$period}';monthParam='{$month}';qtrParam='{$qtr}';yearParam='{$year}'">
                <form action="{$smarty.server.REQUEST_URI}" method="POST">
                        <div class="col-md-8 col-md-offset-2" style="border: 1px solid #ccc; padding: 15px;border-radius: 4px;">
                            <div class="col-md-12">
                            <div class="col-md-4 col-xs-6 form-group">
                                <div class="rdio rdio-primary">
                                    <input type="radio"  ng-model="period" name="period" value="month" id="periodmonth"{*ng-checked="true"*} {*onclick="document.getElementById('monthSelect').disabled = false;"*}>
                                    <label for="periodmonth">Month</label>
                                </div>
                            </div>
                            <div class="col-md-4 col-xs-6 form-group">
                                <div class="rdio rdio-primary">
                                    <input type="radio" ng-model="period" name="period" value="quarter" id="periodquarter" ng-model="period">
                                    <label for="periodquarter">Quarter</label>
                                </div>
                            </div>
                           
                            <div class="col-md-4 col-xs-12 form-group">
                                <div class="rdio rdio-primary">
                                    <input type="radio"  ng-model="period" name="period" value="year" id="periodyear" ng-model="period"{*onclick="document.getElementById('monthSelect').disabled = true;"*}>
                                    <label for="periodyear">Year</label>
                                </div>
                            </div>
                            </div>
                           <div class="col-md-4 col-sm-6 col-xs-6">
                            <div class="form-group">
                                <label class="control-label">Month</label>
                                <select id="monthSelect" name="month" ng-model="monthParam" class="form-control input-sm" ng-disabled="{literal}period != 'month'{/literal}">
                                    <option value="01">Jan</option>
                                    <option value="02">Feb</option>
                                    <option value="03">Mar</option>
                                    <option value="04">Apr</option>
                                    <option value="05">May</option>
                                    <option value="06">Jun</option>
                                    <option value="07">Jul</option>
                                    <option value="08">Aug</option>
                                    <option value="09">Sep</option>
                                    <option value="10">Oct</option>
                                    <option value="11">Nov</option>
                                    <option value="12">Dec</option>
                                </select>
                            </div>
                            </div>
                        <div class="col-md-4 col-sm-6 col-xs-6">
                            <div class="form-group">
                                <label class="control-label">Quarter</label>
                                <select id="qtrselect" name="quarter" ng-model="qtrParam" class="form-control input-sm" ng-disabled="period != 'quarter'">
                                    <option value="06">Qtr 1</option>
                                    <option value="09">Qtr 2</option>
                                    <option value="12">Qtr 3</option>
                                    <option value="03">Qtr 4</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6 col-xs-6">
                            <div class="form-group">
                                <label class="control-label">Year</label>
                                <select name="year" ng-model="yearParam" class="dropdown-menu-sm form-control input-sm pull-right" id="yearSelect">
                                    <option value="2011">2011</option>
                                    <option value="2012">2012</option>
                                    <option value="2013">2013</option>
                                    <option value="2014">2014</option>
                                </select>
                         {*{foreach from = $data_year  item=year}*}
                                        {*<option value="{$year['data_year']}">{$year['data_year']}</option>*}
                                    {*{/foreach} *} 
                            </div>
                        </div>
                        <div class="col-md-12 col-xs-12 text-center">
                            <button type="reset" class=" mr10 btn btn-muted" value="Reset">Reset</button>
                            <input type="submit" class="btn btn-primary" value="Submit" ngClick="Submit">
                        </div>
                        </div>
                        </form>     
            </div>
        </div>
        <div class="row" id="sortable_portlets" >                    
        {foreach $widgetlist as $key => $layout} 
            <div class="col-sm-12 sortable" id="layout-part-{$key+1}" ng-class="layoutvalue['{$key}']">
                {foreach $layout as $k => $v}
                <widget-item widget-id="{$v}" widget-type ="{$widgetoption[$v]['type']}" class="portlet"></widget-item>
                {/foreach}
                <div class="portlet portlet-sortable-empty"></div>
            </div>
        {/foreach}
        </div>                   
        {literal}   
        <script type="text/ng-template" id="myModalContent.html">
        <div class="modal-dialog" style="width: 100% !important;">
        <div class="modal-content">
              <div class="modal-header">
                  <button aria-hidden="true" data-dismiss="modal" class="close" type="button" ng-click="cancel()">&times;</button>
                  <h5 class="modal-title"><i class="fa fa-comments-o"></i> {{title}}</h5>
              </div>
                <div class="modal-body" style="height: 400px;overflow-y: auto;" >
                <div class="text-center" ng-if="details.success == 1 && details.messages.length < details.count">
                    <a class="btn btn-default" href="#" role="button" ng-click="more()">Load More Messages</a>
                    <div class="clear"></div>
                </div>
                <span ng-repeat="item in details.messages | reverse" ng-if="details.success == 1">
                    
                    <div class="from-mine" ng-if="item.userid == userid">
                        <div  class="round" style="height: 50px; width: 50px; border-radius: 50%; background-color: #6BC24B; color: #fff;">
                            <div class="initial">{{item.name}}</div>
                        </div>
                            {{item.text}}
                    </div>
                    <div class="from-their" ng-if="item.userid != userid">
                        <div  class="round" style="height: 50px; width: 50px; border-radius: 50%; background-color: #915BC3; color: #fff;">
                            <div class="initial">{{item.name}}</div>
                        </div>
                            {{item.text}}
                    </div>
                    
                    <div class="clear"></div>
                </span>
                <div class="clear"></div>
                <h3 class='text-center' ng-if="details.success != 1">
                No Annotation Message Found.. 
                </h3>
            </div>
             <div class="modal-footer">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="" aria-describedby="basic-send" ng-model="typemsg">
                <span class="input-group-addon btn-primary" id="basic-send" ng-click="typemsg.length>1?send():null;" required style="cursor: pointer;background-color: #428bca!important; color: #fff;border: #428bca;">Send</span>
              </div>
            </div>
        </div>
        </div>
        </script>
        <script type="text/ng-template" id="modalChartCtrl.html">
        <div class="modal-dialog" ng-init="charttype = ctype">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button" ng-click="cancel()">&times;</button>
                <h5 class="modal-title">Chart Settings: {{title}}  - {{ctype}}</h5>
            </div>
            <div class="modal-body">
            <div class="row text-center">
                <div class="col-md-3 col-sm-6 col-xs-6">
                <h4 class="text-primary" style="border-bottom: 1px solid #ccc;">Line</h4>
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="line" id="linechart"  ng-model="charttype">
                        <label for="linechart">
                        <i class="fa fa-line-chart  fa-3x pull-left fa-border"></i>
                        </label>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                <h4 class="text-primary" style="border-bottom: 1px solid #ccc;">Bar</h4>
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="bar" id="barchart" ng-model="charttype">
                        <label for="barchart">
                        <i class="fa fa-bar-chart fa-3x pull-left fa-border"></i>
                        </label>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <h4 class="text-primary" style="border-bottom: 1px solid #ccc;">Spline</h4>
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="spline" id="spline" ng-model="charttype">
                        <label for="spline">
                        <i class="fa fa-line-chart fa-3x pull-left fa-border"></i>
                        </label>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <h4 class="text-primary" style="border-bottom: 1px solid #ccc;">Area</h4>
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="area" id="area" ng-model="charttype">
                        <label for="area">
                        <i class="fa fa-area-chart fa-3x pull-left fa-border"></i>
                        
                        </label>
                    </div>
                
                </div>
            </div>
            <hr>
            <div class="row text-center">
                <div class="col-md-3 col-sm-6 col-xs-6">
                <h4 class="text-primary" style="border-bottom: 1px solid #ccc;">Area Spline</h4>
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="area-spline" id="area-spline" ng-model="charttype">
                        <label for="area-spline">
                        <i class="fa fa-area-chart fa-3x pull-left fa-border"></i>
                        </label>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                <h4 class="text-primary" style="border-bottom: 1px solid #ccc;">Scatter</h4>
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="scatter" id="scatter" ng-model="charttype">
                        <label for="scatter">
                        <i class="fa fa-sliders fa-3x pull-left fa-border"></i>
                        </label>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <h4 class="text-primary" style="border-bottom: 1px solid #ccc;">Step</h4>
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="step" id="step" ng-model="charttype">
                        <label for="step">
                        <i class="fa fa-th-large fa-3x pull-left fa-border"></i>
                        </label>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <h4 class="text-primary" style="border-bottom: 1px solid #ccc;">Area Step</h4>
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="area-step" id="area-step" ng-model="charttype">
                        <label for="area-step">
                        <i class="fa fa-th fa-3x pull-left fa-border"></i>
                        
                        </label>
                    </div>
                
                </div>
            </div>
                <hr>
            <div class="row text-center">
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <h4 class="text-primary" style="border-bottom: 1px solid #ccc;">Pie</h4>
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="pie" id="pie" ng-model="charttype">
                        <label for="pie">
                        <i class="fa fa-pie-chart fa-3x pull-left fa-border"></i>
                        </label>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-6">
                    <h4 class="text-primary" style="border-bottom: 1px solid #ccc;">Donut</h4>
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="donut" id="donut" ng-model="charttype">
                        <label for="donut">
                        <i class="fa fa-dot-circle-o fa-3x pull-left fa-border"></i>
                        </label>
                    </div>
                </div>
            </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" ng-click="setChart()">OK</button>
                <button class="btn btn-dark" ng-click="cancel()">Cancel</button>
            </div>
        </div>
        </div>
        </script>
        {/literal}
        <script type="text/ng-template" id="settingsModal.html">
            <div class="modal-dialog" style="width: 100% !important;">
            <div class="modal-content">
                <div class="modal-header">
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button" ng-click="cancel()"><i class="fa fa-close"></i></button>
                    <h5 class="modal-title">Dashboard Settings</h5>
                </div>
                <form action="{$smarty.const.CURRENTPAGE}" method="post">
                <div class="modal-body">
                <div class="row" style="padding: 20px;">
                {literal}
                <span ng-repeat="lists in list">
                    <div class="ckbox ckbox-default col-md-4">
                        <input type="checkbox" value="{{lists.id}}" name="layout{{lists.layout}}[]" id="radio{{lists.id}}" ng-checked="selection.indexOf(lists.id) > -1" ng-click="toggleSelection(lists.id)">
                        <label for="radio{{lists.id}}">{{lists.widgetname}}</label>
                    </div>
                    <input type="hidden" name="default" value="{{defaultenable}}">
                </span>
                <hr>
                {/literal}
                </div>
                    <input type="submit" class="btn btn-primary" value="Update" ng-click="Submit" style="float: right;">
                    </form>
                    <input type="button" class="btn btn-default" value="Default Widgets" ng-click="default()">
                </div>
                
            </div>
            </div>
        </script>
        <script type="text/ng-template" id="layoutModal.html">
            <div class="modal-dialog" ng-init="layout = defaultlayout">
            <div class="modal-content">
                <div class="modal-header">
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button" ng-click="cancel()"><i class="fa fa-close"></i></button>
                    <h5 class="modal-title">Layout Settings</h5>
                </div>
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="layout1" id="layout1" ng-model="layout">
                        <label for="layout1">
                            <img src="{$smarty.const.IMAGESLOCATION}dashboard/1.jpg">
                        </label>
                    </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="layout2" id="layout2" ng-model="layout">
                        <label for="layout2">
                            <img src="{$smarty.const.IMAGESLOCATION}dashboard/2.jpg">
                        </label>
                    </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="layout3" id="layout3" ng-model="layout">
                        <label for="layout3">
                            <img src="{$smarty.const.IMAGESLOCATION}dashboard/3.jpg">
                        </label>
                    </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="layout4" id="layout4" ng-model="layout">
                        <label for="layout4">
                            <img src="{$smarty.const.IMAGESLOCATION}dashboard/4.jpg">
                        </label>
                    </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="layout5" id="layout5" ng-model="layout">
                        <label for="layout5">
                            <img src="{$smarty.const.IMAGESLOCATION}dashboard/5.jpg">
                        </label>
                    </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="layout6" id="layout6" ng-model="layout">
                        <label for="layout6">
                            <img src="{$smarty.const.IMAGESLOCATION}dashboard/6.jpg">
                        </label>
                    </div>
                    </div>
                    <div class="col-md-3 col-sm-6 col-xs-6">
                    <div class="rdio rdio-primary">
                        <input type="radio" name="radio" value="layout7" id="layout7" ng-model="layout">
                        <label for="layout7">
                            <img src="{$smarty.const.IMAGESLOCATION}dashboard/7.jpg">
                        </label>
                    </div>
                    </div>
                    </div>
                </div>
                <div class="modal-footer">
                <button class="btn btn-primary" ng-click="setLayout()">Save</button>
                <button class="btn btn-dark" ng-click="cancel()">Cancel</button>
                </div>
            </div>
            </div>
        </script>
        </div>
</div>
    


          
                    
                    
                    
                    
