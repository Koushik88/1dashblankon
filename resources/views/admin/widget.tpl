
<link href="{$smarty.const.CSSLOCATION}style.datatables.css" rel="stylesheet">
<style>
    table tr td {
    text-align: center !important;
    }
</style>
<div class="row">
    <div class="col-md-6">
        <div class="mypanel mypanel-default">
            <div class="mypanel-heading">
                <h3 class="mypanel-title">New Widget</h3>
            </div>
            <div class="mypanel-body">
                <h3 class='text-primary text-center' id='info'>EDIT Widget Enabled</h3>
                <form class="widget-form form-horizontal form-bordered" type="POST">
                    
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Widget Name</label>
                        <div class="col-sm-8">
                            <input type="text" name="widgetname" id='widgetname' placeholder="Widget Name" class="form-control" required>
                        </div>
                    </div>
                   <div class="form-group">
                        <label class="col-sm-4 control-label">Widget Type</label>
                        <div class="col-sm-8">
                            <div class="row text-center">
                                <div class="col-md-4 col-sm-6 col-xs-6">
                                    <div class="rdio rdio-primary">
                                        <input type="radio" name="widgettype" value="chart" id="chart"  checked="true">
                                        <label for="chart">
                                        <i class="fa fa-pie-chart fa-3x pull-left fa-border"></i>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-6">
                                    <div class="rdio rdio-primary">
                                        <input type="radio" name="widgettype" value="table" id="table"  >
                                        <label for="table">
                                        <i class="fa fa-table fa-3x pull-left fa-border"></i>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-6">
                                    <div class="rdio rdio-primary">
                                        <input type="radio" name="widgettype" value="tinychart" id="tinychart"  >
                                        <label for="tinychart">
                                        <i class="fa fa-line-chart fa-3x pull-left fa-border"></i>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   <div class="form-group">
                        <label class="col-sm-4 control-label">Widget Procedure</label>
                        <div class="col-sm-8">
                            <select name="procedureid" id="procedure_list" style="width: 100%;">                                                                 
                                {foreach $widgetprocedure as $key => $value}  
                                <option value="{$value}">{$value|replace:'analyzr_W_':''}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Report Type</label>
                        <div class="col-sm-8">
                            <select name="reportid" id="report_list" style="width: 100%;">   
                                {foreach $reportlist as $key=>$value}
                                <option value="{$value['reportid']}">{$value['reportname']}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Column Position</label>
                        <div class="col-sm-8">
                            <select name="columnid" id="columnlist" style="width: 100%;">                                                                 
                                <option value="0">Layout 1</option>
                                <option value="1">Layout 2</option>
                                <option value="2">Layout 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Value(Measurement)</label>
                        <div class="col-sm-8">
                            <input type="text" name="valuetype" id='valuetype' placeholder="" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Description</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" name='description' id='description' rows="5"></textarea>
                        </div>
                    </div>
                        <input type="hidden" value="" name="widgetid" id='widgetid'>
                    <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary mr5">Create</button>
                        <button type="reset" class="btn btn-default">Reset</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="mypanel mypanel-default">
            <div class="mypanel-heading">
                <h3 class="mypanel-title">Widget List</h3>
            </div>
            <div class="mypanel-body">
                <table class="table table-bordered table-responsive" id="widgettable">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Procedure</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    {*<tbody>
                        {foreach $widgetlist as $key=>$value}
                        <tr>
                            <td style='text-align: center;'>{$value['widgetname']}</td>
                            <td style='text-align: center;'>{$value['widgettype']}</td>
                            <td style='text-align: center;'>{$value['procid']}</td>
                            <td class='text-center' style='text-align: center;'>
                                <button class="btn btn-default btn-sm" onclick='editWidget({$value['wid']})'><i class="fa fa-edit"></i></button>
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>*}
                </table>
            </div>
        </div>
    </div>
</div>
<script src="{$smarty.const.JSLOCATION}dataTables.bootstrap.js"></script>
<script>
    $("#info").hide();
    jQuery('#procedure_list,#report_list,#columnlist').select2({
        
    });
    jQuery('#widgettable').DataTable(
    {
        "bProcessing": true,
        "bServerSide": true,
        "bSort" : false,
        "sAjaxSource":portalLocation+controller+'/widget_ajax.php',
        "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
            $('td:eq(3)', nRow).html("<button class='btn btn-default btn-sm' ><i class='fa fa-edit'></i></button>").click(function(){
                editWidget(aData[3]);
            });
        
        }
    });
    
    
    
    $(document).on('submit', '.widget-form', function(e) {
        $.ajax({
            url: portalLocation+controller+'/widget_ajax.php',
            type: 'POST',
            data: $(this).serialize(),
            dataType : 'json',
            success: function(response) {
                var cla = response.success ==0?'growl-danger':'growl-success';
                jQuery.gritter.add({
                        title: response.title,
                        text: response.message,
                        class_name: cla,
                        sticky: false,
                        time: ''
                    }); 
                $("#info").hide();
                $('table#widgettable').dataTable().fnDraw();
                $('.widget-form')[0].reset();
            }
        });
        e.preventDefault();
    });
    {literal}
    function editWidget(id){
        $.ajax({
            url: portalLocation+controller+'/widget_ajax.php',
            type: 'GET',
            data:{
                widgetid: id
            } ,
            dataType : 'json',
            success: function(response) {
                $("#info").show();
                $("#widgetname").val(response.widgetname);
                $("#widgetid").val(response.wid);
                $('#'+response.widgettype).attr('checked', 'checked');
                $('#procedure_list option[value="'+response.procid+'"]').attr('selected', "selected").change();
                $('#report_list option[value="'+response.reportid+'"]').attr('selected', "selected").change();
                $("textarea#description").val(response.description);
                $("#valuetype").val(response.valuetype);
                $('#columnlist option[value="'+response.layout+'"]').attr('selected', "selected").change();
            }
        });
    }
    {/literal}
    function deleteWidget(){
        //alert("sdfsdf");
    }
</script>