
<section id="content" class="container setheight">
<div class="block-area blockHeight">
                <div class="row m-container viewHeight">
                    <div class="col-xs-12 col-sm-6 col-md-6 setheight">
                        <div class="tile titleHeight" style="background:rgba(0,0,0,0.35);height:400px;">
                            <div id="chartDiv" class="iframe-chart">
                                <div class="block-area" id="tableBordered">                                   
                                    <div class="table-responsive overflow">
                                        <table class="table table-bordered tile">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>First Name</th>
                                                    <th>Last Name</th>
                                                    <th>Username</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1</td>
                                                    <td>Jhon </td>
                                                    <td>Makinton </td>
                                                    <td>@makinton</td>
                                                </tr>
                                                <tr>
                                                    <td>2</td>
                                                    <td>Malinda</td>
                                                    <td>Hollaway</td>
                                                    <td>@hollway</td>
                                                </tr>
                                                <tr>
                                                    <td>3</td>
                                                    <td>Wayn</td>
                                                    <td>Parnel</td>
                                                    <td>@wayne123</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>                                
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 setheight">
                        <div class="tile titleHeight" style="height:400px;">
                            <!--<h2 class="tile-title">Recent Postings</h2>-->
                            <div class="p-10 setheight">
                                <form onsubmit="loadIframe(event)">
                                    <input type="text" class="form-control input-sm" id="searchUrl" placeholder="Search url">
                                </form>
                                <iframe id="iframeUrl" class="form-control iframe-browser"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row m-container">
                    <div class="col-md-12">
                        <div class="tile text-center">
                            <div class="tile-dark p-10">
                                <div onclick="chartSelected('piechart.html',event,this)" class="pie-chart-hold pie-chart-tiny-custom" style="border:1px solid rgba(255, 255, 255, 0.3);">
                                    <span class="pie-title pie-title-customs" style="height:22px;">Income<i class="fa fa-times-circle" onclick="removeWidget(this)"></i></span><br/><br/>
                                    <div class="pie-chart-tiny" data-percent="86">
                                        <span class="percent"></span>
                                    </div>
                                </div>
                                <div onclick="chartSelected('linechart.html',event,this)" class="pie-chart-hold pie-chart-tiny-custom" style="border:1px solid rgba(255, 255, 255, 0.3);">
                                    <span class="pie-title pie-title-customs" style="height:22px;">Expenses<i class="fa fa-times-circle" onclick="removeWidget(this)"></i></span><br/><br/>
                                    <div class="pie-chart-tiny" data-percent="23">
                                        <span class="percent"></span>
                                    </div>
                                </div>
                                <div onclick="chartSelected('dynamicchart.html', event, this)" class="pie-chart-hold pie-chart-tiny-custom" style="border:1px solid rgba(255, 255, 255, 0.3);">
                                    <span class="pie-title pie-title-customs" style="height:22px;">Profit and Loss<i class="fa fa-times-circle" onclick="removeWidget(this)"></i></span><br/><br/>
                                    <div class="pie-chart-tiny" data-percent="57">
                                        <span class="percent"></span>
                                    </div>
                                </div>
                                <div onclick="chartSelected('donutchart.html', event, this)" class="pie-chart-hold pie-chart-tiny-custom" style="border:1px solid rgba(255, 255, 255, 0.3);">
                                    <span class="pie-title pie-title-customs" style="height:22px;">Balance Sheet<i class="fa fa-times-circle" onclick="removeWidget(this)"></i></span><br/><br/>
                                    <div class="pie-chart-tiny" data-percent="34">
                                        <span class="percent"></span>
                                    </div>
                                </div>
                                <!--<div onclick="chartSelected('barchart.html', event, this)" class="pie-chart-hold pie-chart-tiny-custom">
                                    <span class="pie-title pie-title-customs">Bar chart<i class="fa fa-times-circle" onclick="removeWidget(this)"></i></span>
                                    <div class="pie-chart-tiny" data-percent="81">
                                        <span class="percent"></span>
                                    </div>
                                </div>-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</section>

<script type="text/javascript">
        $(document).ready(function () {
        
            $('#searchUrl').val('https://www.bing.com/');
            $('#iframeUrl').attr('src', 'https://www.bing.com/');
            loadTable("piechart.html");
            $('.pie-chart-tiny-custom').eq(0).addClass('selected');
        });

        function loadTable(table) {

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4 && xhttp.status == 200) {
                    
                    document.getElementById("chartDiv").innerHTML = xhttp.responseText;
                }
            };
            xhttp.open("GET", table, true);
            xhttp.send();

        }
        function loadIframe(event) {
            
            $('#iframeUrl').attr('src', $('#searchUrl').val());
            event.preventDefault();
        }

        function chartSelected(chartHtml, event, el) {
            
            $('.pie-chart-tiny-custom').removeClass('selected')
            $(el).addClass("selected");
            loadTable(chartHtml);
            event.preventDefault();
        }
        function removeWidget(el) {
            
            el.closest('.pie-chart-tiny').remove()
        }
    </script>