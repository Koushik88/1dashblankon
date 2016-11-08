{*
#*******************************************************************#
#           Global Basics Inc -   General Export Page                     #
#*******************************************************************#

Document       : General Export/Share Page
Created on     : 24-06-2016
Author         : Rubanraj S
Description    : In this page contain Export and Share mocule
Last Edited on : 24-06-2016
Last Edited by : Rubanraj S
*
*}
<script src="{$smarty.const.JSLOCATION}c3/exportc3.js"></script>
<script src="{$smarty.const.JSLOCATION}c3/canvg.js"></script>
<script src="{$smarty.const.JSLOCATION}c3/rgbcolor.js"></script>
<i class="fa fa-share-square-o fa-2x" id="product-tour-export" style="cursor: pointer;font-size: 18px;" data-toggle="modal" data-target=".export-share-model"></i>
<div class="modal fade export-share-model text-left" tabindex="-1" role="dialog" id='export-share-model' data-backdrop="static">
    <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
              <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
              <h5 class="modal-title">Export/Share</h5>
          </div>
          <div class="modal-body">
            <ul class="nav nav-tabs nav-justified">
                <li class="active"><a data-toggle="tab" href="#tab1"><strong><i class="fa fa-share-square-o"></i>&nbsp;Export</strong></a></li>
                <li class=""><a data-toggle="tab" href="#tab2"><strong><i class="fa fa-share-alt"></i>&nbsp;Share</strong></a></li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane active">
                    <div class="row text-center">
                        <div class="col-sm-3">
                            <h5 class="bbs">Excel</h5>
                            <a href="#" onclick="exportfile('{$smarty.const.CURRENTPAGE}&{$smarty.session.drilldownparam}&e=xls','xl');"><i class="fa fa-file-excel-o fa-4x"></i></a>
                        </div>
                        <div class="col-sm-3">
                            <h5 class="bbs">PDF</h5>
                            <a href="#" onclick="exportfile('{$smarty.const.CURRENTPAGE}&{$smarty.session.drilldownparam}&e=pdf&epdf=data','pdf')"><i class="fa fa-file-pdf-o fa-4x"></i></a>
                        </div>
                        <div class="col-sm-3">
                            <h5 class="bbs">PDF with Chart</h5>
                            <a href="#" onclick="exportfile('{$smarty.const.CURRENTPAGE}&{$smarty.session.drilldownparam}&e=pdf','pdf')"><i class="fa fa-file-image-o fa-4x"></i></a>
                        </div>
                        <div class="col-sm-3">
                            <h5 class="bbs">Print</h5>
                            <a href="#" onclick="exportfile('{$smarty.const.CURRENTPAGE}&{$smarty.session.drilldownparam}&e=pdf&print=yes','print')"><i class="fa fa-print fa-4x"></i></a>
                        </div>
                        
                    </div>
                </div>
                <div id="tab2" class="tab-pane">
                    <div class="row text-center">
                        <div class="col-sm-3">
                            <h5 class="bbs">Gmail</h5>
                            <a href="#"><i class="fa fa-google fa-4x"></i></a>
                        </div>
                        <div class="col-sm-3">
                            <h5 class="bbs">Facebook</h5>
                            <a href="#"><i class="fa fa-facebook-square fa-4x"></i></a>
                        </div>
                        <div class="col-sm-3">
                            <h5 class="bbs">Twitter</h5>
                            <a href="#"><i class="fa fa-twitter-square fa-4x"></i></a>
                        </div>
                        <div class="col-sm-3">
                            <h5 class="bbs">Linked In</h5>
                            <a href="#"><i class="fa fa-linkedin-square fa-4x"></i></a>
                        </div>
                        
                    </div>
                </div>
            </div>
            </div>
    </div>
    </div>
</div>
<div style="display:none;">
    <form method="post" action="" target="_blank" id="frmexportchart">
        <input type="text" value="" name="hidchart1" id="hidchart1"/>
        <input type="text" value="" name="hidchart2" id="hidchart2"/>
        <input type="text" value="" name="hidchart3" id="hidchart3"/>
        <input type="text" value="0" name="echart1" id="echart1"/>
        <input type="text" value="0" name="echart2" id="echart2"/>
        <input type="text" value="0" name="echart3" id="echart3"/>
    </form>
</div>

