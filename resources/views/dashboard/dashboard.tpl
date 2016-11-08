<style>
   .row-stat .noborder {
  border: 0;
  margin-bottom: 20px;
}
.mypanel-icon img{
    height: 60px;
    width: 60px;
}
.mypanel-icon {
background: none;
}
.blue-widget>.mypanel-heading {
  color: #fff;
  background-color: #428bca;
  border-color: #428bca;
}
.red-widget>.mypanel-heading{
background-color: #C1392B;
border-color: #C1392B;
color: #fff;
}
.yellow-widget>.mypanel-heading{
background-color: #f2b844;
border-color: #f2b844;
color: #fff;
}
.violet-widget>.mypanel-heading{
background-color: #93047C;
border-color: #93047C;
color: #fff;
}
.green-widget>.mypanel-heading{
background-color: #24b258;
border-color: #24b258;
color: #fff;
}
.brown-widget>.mypanel-heading{
background-color: #b25824;
border-color: #b25824;
color: #fff;
}


.dashboard-calendar .btn-default{
    background-color: #fff !important;
    
}
.dashboard-calendar, .m10{
margin-bottom: 10px;
}

</style>
<div ng-app="dashboard" ng-controller="dashboardCtrl as ctrl">
    

<div class="row">
                            <div class="col-md-12 text-primary text-center">
                                        <h4>{$pageTitle}</h4> 
                            </div>
                            <div class="col-md-12">
                                <div class="msg-header">
                                    <div class="col-md-6 col-xs-6">
                                        <p class="text-muted text-left"><strong><h5><a href="javascript:void(0)">Data Available From {$date} TO {$date1}</a></h5></strong></p>
                                    </div>
                                    <div class="text-right col-md-6 col-xs-6">
                                        <button class="btn btn-white tooltips" type="button" ng-click="ctrl.open()" data-toggle="tooltip" data-original-title="Settings">
                                            <i class="fa fa-cogs"></i>
                                        </button>
                                        
                                        
                                    </div><!-- pull-right -->
                                </div>
                            </div>
                        </div>
<div class="row row-stat">
                            <div class="col-md-4">
                                <div class="mypanel blue-widget noborder">
                                    <div class="mypanel-heading noborder">
                                        <div class="mypanel-icon"><img src="{$smarty.const.IMAGESLOCATION}customer/nz.png"></div>
                                        <div class="media-body">
                                            <h5 class="md-title nomargin">Applicant Count</h5>
                                            <h1 class="mt5">{$project1ApplCount['Total']}</h1>
                                        </div><!-- media-body -->
                                        <hr>
                                        <div class="clearfix mt20">
                                            <div class="pull-left">
                                                <h5 class="md-title nomargin">Service Fees</h5>
                                                <h4 class="nomargin">{if $project1ServiceFee['Total']} {$project1ServiceFee['Total']} {else} 0 {/if}</h4>
                                            </div>
                                            <div class="pull-right">
                                                <h5 class="md-title nomargin">Branches</h5>
                                                <h4 class="nomargin">{$project1Branch['Total']}</h4>
                                            </div>
                                        </div>
                                        
                                    </div><!-- mypanel-body -->
                                </div><!-- mypanel -->
                            </div><!-- col-md-4 -->
                            
                            <div class="col-md-4">
                                <div class="mypanel red-widget noborder">
                                    <div class="mypanel-heading noborder">
                                        <div class="mypanel-icon"><img src="{$smarty.const.IMAGESLOCATION}customer/auw.png"></div>
                                        <div class="media-body">
                                            <h5 class="md-title nomargin">Applicant Count</h5>
                                            <h1 class="mt5">{$project2ApplCount['Total']}</h1>
                                        </div><!-- media-body -->
                                        <hr>
                                        <div class="clearfix mt20">
                                            <div class="pull-left">
                                                <h5 class="md-title nomargin">Service Fees</h5>
                                                <h4 class="nomargin">{if $project2ServiceFee['Total']} {$project2ServiceFee['Total']} {else} 0 {/if}</h4>
                                            </div>
                                            <div class="pull-right">
                                                <h5 class="md-title nomargin">Branches</h5>
                                                <h4 class="nomargin">{$project2Branch['Total']}</h4>
                                            </div>
                                        </div>
                                        
                                    </div><!-- mypanel-body -->
                                </div><!-- mypanel -->
                            </div><!-- col-md-4 -->
                            
                            <div class="col-md-4">
                                <div class="mypanel yellow-widget noborder">
                                    <div class="mypanel-heading noborder">
                                        <div class="mypanel-icon"><img src="{$smarty.const.IMAGESLOCATION}customer/et.png"></div>
                                        <div class="media-body">
                                            <h5 class="md-title nomargin">Applicant Count</h5>
                                            <h1 class="mt5">{$project3ApplCount['Total']}</h1>
                                        </div><!-- media-body -->
                                        <hr>
                                        <div class="clearfix mt20">
                                            <div class="pull-left">
                                                <h5 class="md-title nomargin">Service Fees</h5>
                                                <h4 class="nomargin">{if $project3ServiceFee['Total']} {$project3ServiceFee['Total']} {else} 0 {/if}</h4>
                                            </div>
                                            <div class="pull-right">
                                                <h5 class="md-title nomargin">Branches</h5>
                                                <h4 class="nomargin">{$project3Branch['Total']}</h4>
                                            </div>
                                        </div>
                                        
                                    </div><!-- mypanel-body -->
                                </div><!-- mypanel -->
                            </div><!-- col-md-4 -->
                            
                            <div class="col-md-4">
                                <div class="mypanel green-widget noborder">
                                    <div class="mypanel-heading noborder">
                                        <div class="mypanel-icon"><img src="{$smarty.const.IMAGESLOCATION}customer/vfw.png"></div>
                                        <div class="media-body">
                                            <h5 class="md-title nomargin">Applicant Count</h5>
                                            <h1 class="mt5">{$project4ApplCount['Total']}</h1>
                                        </div><!-- media-body -->
                                        <hr>
                                        <div class="clearfix mt20">
                                            <div class="pull-left">
                                                <h5 class="md-title nomargin">Service Fees</h5>
                                                <h4 class="nomargin">{if $project4ServiceFee['Total']}{$project4ServiceFee['Total']}{else} 0 {/if}</h4>
                                            </div>
                                            <div class="pull-right">
                                                <h5 class="md-title nomargin">Branches</h5>
                                                <h4 class="nomargin">{$project4Branch['Total']}</h4>
                                            </div>
                                        </div>
                                        
                                    </div><!-- mypanel-body -->
                                </div><!-- mypanel -->
                            </div><!-- col-md-4 -->
                            
                            <div class="col-md-4">
                                <div class="mypanel violet-widget noborder">
                                    <div class="mypanel-heading noborder">
                                        <div class="mypanel-icon"><img src="{$smarty.const.IMAGESLOCATION}customer/ng.png"></div>
                                        <div class="media-body">
                                            <h5 class="md-title nomargin">Applicant Count</h5>
                                            <h1 class="mt5">{$project5ApplCount['Total']}</h1>
                                        </div><!-- media-body -->
                                        <hr>
                                        <div class="clearfix mt20">
                                            <div class="pull-left">
                                                <h5 class="md-title nomargin">Service Fees</h5>
                                                <h4 class="nomargin">{if $project5ServiceFee['Total']} {$project5ServiceFee['Total']} {else} 0 {/if}</h4>
                                            </div>
                                            <div class="pull-right">
                                                <h5 class="md-title nomargin">Branches</h5>
                                                <h4 class="nomargin">{$project5Branch['Total']}</h4>
                                            </div>
                                        </div>
                                        
                                    </div><!-- mypanel-body -->
                                </div><!-- mypanel -->
                            </div><!-- col-md-4 -->
                            
                            <div class="col-md-4">
                                <div class="mypanel brown-widget noborder">
                                    <div class="mypanel-heading noborder">
                                        <div class="mypanel-icon"><img src="{$smarty.const.IMAGESLOCATION}customer/si.png"></div>
                                        <div class="media-body">
                                            <h5 class="md-title nomargin">Applicant Count</h5>
                                            <h1 class="mt5">{$project6ApplCount['Total']}</h1>
                                        </div><!-- media-body -->
                                        <hr>
                                        <div class="clearfix mt20">
                                            <div class="pull-left">
                                                <h5 class="md-title nomargin">Service Fees</h5>
                                                <h4 class="nomargin">{if $project6ServiceFee['Total']} {$project6ServiceFee['Total']} {else} 0 {/if}</h4>
                                            </div>
                                            <div class="pull-right">
                                                <h5 class="md-title nomargin">Branches</h5>
                                                <h4 class="nomargin">{$project6Branch['Total']}</h4>
                                            </div>
                                        </div>
                                        
                                    </div><!-- mypanel-body -->
                                </div><!-- mypanel -->
                            </div><!-- col-md-4 -->
                        </div><!-- row -->
<br/>
<div class="row">
            <div class="col-md-12">
                                <div class="mypanel green-widget">
                                  <div class="mypanel-body" style='border:2px solid #ccc;box-shadow: 10px 10px 5px #888888;'>
                                    <div class="row">
                                      <div class="col-md-7">
                                          <h5 class="lg-title"><b><a href='javascript:void(0)'>Top 5 Service Fee Branches</a></b></h5>
                                        <p class="mb15"></p>
                                        <div id="bar-chart"></div>
                                      </div><!-- col-md-7 -->
                                      <div class="col-md-5">
                                          <h5 class="lg-title"><b><a href='javascript:void(0);'>Top 5 Applicant Count Branches</a></b></h5>
                                        <p class="mb15"></p>
                                        
                                        <span class="sublabel">{$TopApllicant[0]['BranchName']} -  {$TopApllicant[0]['Total']}</span>
                                        <div class="progress progress-xs progress-metro">
                                          <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 90%"></div>
                                        </div><!-- progress -->
                                        
                                        <span class="sublabel">{$TopApllicant[1]['BranchName']} -  {$TopApllicant[1]['Total']}</span>
                                        <div class="progress progress-xs progress-metro">
                                          <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 70%"></div>
                                        </div><!-- progress -->
                                        
                                        <span class="sublabel">{$TopApllicant[2]['BranchName']} -  {$TopApllicant[2]['Total']}</span>
                                        <div class="progress progress-xs progress-metro">
                                          <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 60%"></div>
                                        </div><!-- progress -->
                                        
                                        
                                        <span class="sublabel">{$TopApllicant[3]['BranchName']} -  {$TopApllicant[3]['Total']}</span>
                                        <div class="progress progress-xs progress-metro">
                                          <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 50%"></div>
                                        </div><!-- progress -->
                                        
                                        <span class="sublabel">{$TopApllicant[4]['BranchName']} -  {$TopApllicant[4]['Total']}</span>
                                        <div class="progress progress-xs progress-metro">
                                          <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"></div>
                                        </div><!-- progress -->
                                        
                                        
                                      </div><!-- col-md-5 -->
                                    </div><!-- row -->
                                  </div><!-- mypanel-body -->
                                </div><!-- mypanel -->
                            </div>
                            
</div><!-- row -->

{assign var="chartId" value=""}
{assign var="chartVal" value=""}


{foreach from=$TopServiceFee name=br_name item=list}
    {assign var="chart" value=$chart|cat:"&#&"|cat:{$list['BranchName']}} 
    {assign var="chartVal" value=$chartVal|cat:"&#&"|cat:{$list['Total']}}
{/foreach}


<input type="hidden" id="chartId" value="{$chart}"/>
<input type="hidden" id="value1" value="{$chartVal}"/>



<script type="text/ng-template" id="Model_Handler.html">
    <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
              <button aria-hidden="true" data-dismiss="modal" class="close" type="button" ng-click="cancel()">&times;</button>
              <h5 class="modal-title">Settings</h5>
          </div>
          <div class="modal-body">
            <div class="row dashboard-calendar" ng-controller="periodCtrl" ng-init="from = '{$formdate}';to='{$todate}';">
                <form action="{$smarty.server.REQUEST_URI}" method="POST">
                    <div class="col-md-6">
                        From
                        <div class="input-group m10" ng-controller="CalendarControl">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                            <input type="text"  class="form-control" name="from" ng-click="open($event)" datepicker-popup="yyyy-MM-dd" ng-model="from" 
                            is-open="opened"  datepicker-options="dateOptions" date-disabled="disabled(date, mode)" ng-required="true" close-text="Close" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        To
                        <div class="input-group m10" ng-controller="CalendarControl">
                            <span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                            <input type="text" class="form-control" name="to" ng-click="open($event)" datepicker-popup="yyyy-MM-dd" ng-model="to" 
                            is-open="opened"  datepicker-options="dateOptions" date-disabled="disabled(date, mode)" ng-required="true" close-text="Close" />
                        </div>
                    </div>
                    
                    <div class="col-md-12 col-xs-12 text-center">
                        <br/>
                        <button type="reset" class=" mr10 btn btn-muted" value="Reset">Reset</button>
                        <input type="submit" class="btn btn-primary" value="Submit" ngClick="Submit">
                    </div>
                </form>  
            </div>
    </div>
    </div>
    
</script>  
</div>
<script>
    
                                var chartId = $("#chartId").val();
                                chartId = chartId.substr(3);
                                chartId = chartId.split("&#&");
                                var value1 = $("#value1").val();
                                value1 = value1.substr(3);
                                value1 = value1.split("&#&");
                                var chart_value1 = [];
                                chart_value1.push('Service Fees');
                                
                                
    for (var j = 0; j < chartId.length; j++)
    {
            chart_value1.push(parseFloat(value1[j]));
            
    }
   var chart = c3.generate({
        bindto: '#bar-chart',
        data: {
        columns: [
             chart_value1
            
        ],
        type: 'bar'
        },
        bar: {
            width: {
                ratio: 0.5 // this makes bar width 50% of length between ticks
            }
        },
        color:{
            pattern:['#2ca02c']
        },
        axis: {
        x: {
            type: 'category',
            categories: chartId
        }
    }
}); 
</script>
    
