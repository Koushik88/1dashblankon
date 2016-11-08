{*
#*******************************************************************#
#		COMPANY -  Global Basics Inc                 	    #
#*******************************************************************#

    Document       : AboutUs Template Page
    Created on     : 24-06-2016
    Author         : Rubanraj S,Ponnar V
    Description    : View for product details and company details 
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}

<br/><br/>
<!--About Us template Page for basic information-->
<div class="contentpanel">                        
   <div class="row">
      <div class="col-md-12">
         <div class="mypanel mypanel-default">
                   <div class="mypanel-heading">
                       <div class="pull-right">
                           <a href = "{$smarty.const.PORTALLOCATION}admin/companymanagement.php?ac&activeId=0" title="Back to Menu"> 
                               <span class="fa fa-arrow-circle-left fa-2x"></span> 
                           </a>
                       </div>
                      <h3 class="mypanel-title">About Us</h3>
                   </div>
                   <div class="mypanel-body" style="background: none repeat scroll 0% 0% #EAF3FC;">                            
                        <div class="row">   
                                    <div class="col-md-6">           
                                         <div class="box-content-header">
                                                 <div>
                                                       <h4>ANALYTICS & BI</h4>
                                                 </div>
                                                 <div  class="box-content-img">
                                                         <img  src="{$smarty.const.IMAGESLOCATION}help/embedded_easy-to-integrate1.png.png"  align="left" style="width: 228px;height: 108px;">
                                                         Analy<font color=red><b>Z</b></font>r is a multi-user next generation data analysis and visualization product which can be used to analyze large to very large data sets and has a template based approach. The Product can be integrated with external or internal data sources, including support for Popular Cloud data servers, Google Big Data Engine and social frameworks such as Facebook, Twitter etc... We also support mobile device integration and view reports on iPad and popluar Android smart phones.
                                                 </div>
                                         </div>                               
                                    </div>
                                                         
                                    <div class="col-md-6">
                                        <div class="box-content-header">
                                                <div>
                                                        <h4>CLOUD INTEGRATION</h4>
                                                </div>
                                                <div class="box-content-img">
                                                         <img alt="CLOUD INTEGRATION"  src="{$smarty.const.IMAGESLOCATION}help/embedded_saas1.png"  align="right" style="width: 228px;height: 108px;">
                                                         Our Analytics and reporting products are tightly integrated with Google's AppSpot Cloud with Big Data Support. The product can be customized and integrated with your business data regardless of where it is deployed. We also work with Amazon's EC2/S3 intergration and services.
                                                         
                                                </div>
                                        </div>
                                <!-- /BOX -->
                                </div>                     
                                                         
                        </div>
<!-- Company Contact informations -->

                        <div class="row"> 
                            <br/>
                            <div>
                                <div>
                                        <h4>Contact</h4>
                                </div>
                                    <div class="col-md-6">
                                        <div class="box-content-header">  
                                            <h2>TVS infotech LTD</h2>
                                                   <div class="list-group">
                                                            <li class="list-group-item basic-alert">ASV Chandilya Towers, 7th Floor, #5/397,</li>
                                                            <li class="list-group-item confirm-dialog">Rajiv Gandhi Salai (OMR), Okkiyam Thoraipakkam,</li>
                                                            <li class="list-group-item multiple-buttons">Chennai-600 096, Tamil Nadu. India. </li>
                                                            <li class="list-group-item multiple-dialogs">Tel: +91 (44)-49098874</li>
                                                            <a class="list-group-item programmatic-close" href="{$contact_website}" target="_blank" title="{$contact_website}">Website:  {$contact_website}    </a>
                                                   </div>
                                        </div>
                                    </div>            
                                                
                                    <div class="col-md-6">
                                     <div class="box-content-header">
                                                    <div  class="box-content-header-img">
                                                          <h2>TVSi Visivo - Version 4.0</h2>
                                                    </div>
                                                    <div align="center">
                                                        <br><br>
                                                     <img alt="NPEDIA TECHNOLOGIES"  src="{$smarty.const.IMAGESLOCATION}help/logo.png">
                                                          <br><br>
                                                    </div>
                                      </div>
                                  </div>        
                        </div>                                 
                   </div>
         </div>
        </div>
   </div>
</div>    
</div>
                                                          
<!--Remove for side panel right border using mainwrapper class-->     

{literal}
    <script type="text/javascript">
           var className = $('.mainwrapper').attr('class');
           $("."+className).removeClass(className);
    </script>
{/literal}
    
                                            
                                            
                                            
                                            
                                            
                                            
                                            