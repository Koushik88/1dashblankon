{*
#*******************************************************************#
#	Global Basics Inc     ::  Genaral Template                  # 
#*******************************************************************#

    Document       : Genaral Template page
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Genaral template page for include CSS and JavaScript files
    Last Edited on : 24-06-2016
    Last Edited by : Rubanraj S
*}
  
 <!-- Common CSS and JavaScript files -->
<script type="text/javascript">   
    var portalLocation = "{$smarty.const.PORTALLOCATION}";
    var ImageLocation = "{$smarty.const.IMAGESLOCATION}";
    var PageLocation = "{$smarty.const.PAGELOCATION}";
    var controller = "{$smarty.const.CONTROLLERNAME}"; 
    var portalloc = "{$smarty.const.PORTALLOC}";
    var user_type= "{$smarty.session.user_type}";
</script>



 <!-- CSS -->
        <link href="{$smarty.const.CSSLOCATION}/bootstrap.min.css" rel="stylesheet">
        <link href="{$smarty.const.CSSLOCATION}/form.css" rel="stylesheet">
        <link href="{$smarty.const.CSSLOCATION}/style.css" rel="stylesheet">
        <link href="{$smarty.const.CSSLOCATION}/animate.css" rel="stylesheet">
        <link href="{$smarty.const.CSSLOCATION}/generics.css" rel="stylesheet">       
        <link href="{$smarty.const.CSSLOCATION}/font-awesome.min.css" rel="stylesheet">   
        <link href="{$smarty.const.CSSLOCATION}/calendar.css" rel="stylesheet">
        <link href="{$smarty.const.CSSLOCATION}/icons.css" rel="stylesheet">
        <link href="{$smarty.const.CSSLOCATION}/widget.css" rel="stylesheet">
        <link href="{$smarty.const.CSSLOCATION}/bootstrap-tour/bootstrap-tour.css" rel="stylesheet">
        
        
        
       
 <!-- Javascript Libraries -->
        <!-- jQuery -->
        <script src="{$smarty.const.JSLOCATION}/jquery.min.js"></script> <!-- jQuery Library -->
        <!-- Bootstrap -->
        <script src="{$smarty.const.JSLOCATION}/bootstrap.min.js"></script>
        <!--  Form Related -->
        <script src="{$smarty.const.JSLOCATION}/icheck.js"></script> <!-- Custom Checkbox + Radio -->
        <!-- All JS functions -->
        <script src="{$smarty.const.JSLOCATION}/functions.js"></script>


        
        
        <!-- Javascript Libraries -->
        <!-- jQuery -->   
        <script src="{$smarty.const.JSLOCATION}/jquery-ui.min.js"></script> <!-- jQuery UI -->
        <script src="{$smarty.const.JSLOCATION}/jquery.easing.1.3.js"></script> <!-- jQuery Easing - Requirred for Lightbox + Pie Charts-->
        <!-- Charts -->
        <script src="{$smarty.const.JSLOCATION}/charts/jquery.flot.js"></script> <!-- Flot Main -->
        <script src="{$smarty.const.JSLOCATION}/charts/jquery.flot.time.js"></script> <!-- Flot sub -->
        <script src="{$smarty.const.JSLOCATION}/charts/jquery.flot.animator.min.js"></script> <!-- Flot sub -->
        <script src="{$smarty.const.JSLOCATION}/charts/jquery.flot.resize.min.js"></script> <!-- Flot sub - for repaint when resizing the screen -->

        <script src="{$smarty.const.JSLOCATION}/sparkline.min.js"></script> <!-- Sparkline - Tiny charts -->
        <script src="{$smarty.const.JSLOCATION}/easypiechart.js"></script> <!-- EasyPieChart - Animated Pie Charts -->
        <script src="{$smarty.const.JSLOCATION}/charts.js"></script> <!-- All the above chart related functions -->
      <!-- Map -->
        <script src="{$smarty.const.JSLOCATION}/maps/jvectormap.min.js"></script> <!-- jVectorMap main library -->
        <script src="{$smarty.const.JSLOCATION}/maps/usa.js"></script> <!-- USA Map for jVectorMap -->
     <!-- UX -->
        <script src="{$smarty.const.JSLOCATION}/scroll.min.js"></script> <!-- Custom Scrollbar -->
    <!-- Other -->
        <script src="{$smarty.const.JSLOCATION}/calendar.min.js"></script> <!-- Calendar -->
        <script src="{$smarty.const.JSLOCATION}/feeds.min.js"></script> <!-- News Feeds -->
        <script src="{$smarty.const.JSLOCATION}/onload.js"></script> <!-- News Feeds -->
        <script src='{$smarty.const.JSLOCATION}/jquery.validate.js'></script>
        <script src="{$smarty.const.JSLOCATION}/editor.min.js"></script> <!-- WYSIWYG Editor -->
        <script src="{$smarty.const.JSLOCATION}/fileupload.min.js"></script> <!-- File Upload -->
        
        <link href="{$smarty.const.CSSLOCATION}/c3.css" rel="stylesheet">
        <script src="{$smarty.const.JSLOCATION}/c3.js"></script>
        <script src="{$smarty.const.JSLOCATION}/d3.v3.min.js"></script>
        <script src="{$smarty.const.JSLOCATION}/select.min.js"></script> <!-- Custom Select -->
        <script src="{$smarty.const.JSLOCATION}/toggler.min.js"></script> <!-- Custom Select -->
     
        
        <script src="{$smarty.const.JSLOCATION}/bootstrap_tour/bootstrap-tour.js"></script> 
	<script src="{$smarty.const.JSLOCATION}/bootstrap_tour/bootstrap-tour.min.js"></script> 
        <script src="{$smarty.const.JSLOCATION}/bootstrap_tour/dashboard-tour.js"></script> 
<script type="text/javascript">
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
</script>
            
        