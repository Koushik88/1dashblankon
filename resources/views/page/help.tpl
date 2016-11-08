{*
#*******************************************************************#
#	Global Basics Inc  :: Help Page Template                    #
#********************************************************************

    Document       : About US Page Template
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : User bassed help page for analyzr
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V 
*}

<br/> <br/><br/>

<div class="contentpanel">
<!-- Administrator help form -->
{if ($smarty.session.user_type eq 1) || ($smarty.session.user_type eq 2)}
    
                <div class="pull-right">
                    <a href = "{$smarty.const.PORTALLOCATION}admin/companymanagement.php?ac&activeId=0" title="Back to Menu"> 
                        <span class="fa fa-arrow-circle-left fa-2x"></span> 
                    </a>
                </div>
                                                       
               <br/>                        
                               
             <div class="row">
                  <div class="col-md-11">
                     <!-- Nav tabs for help header -->
                                <ul class="nav nav-tabs nav-primary">
                                    <li  class="active"><a href="#automation" data-toggle="tab" title="Automation"><strong>Automation</strong></a></li>
                                            <li><a href="#plugin" data-toggle="tab" title="Plugins"><strong>Plugins</strong></a></li>
                                            <li><a href="#user" data-toggle="tab" title="Users"><strong>Users</strong></a></li>
                                            <li><a href="#reports" data-toggle="tab" title="Reports"><strong>Reports</strong></a></li>
                                            <li><a href="#template" data-toggle="tab" title="Templates"><strong>Templates</strong></a></li>
                                            <li><a href="#procedure" data-toggle="tab" title="Procedures"><strong>Procedures</strong></a></li>
                                            <li><a href="#rules" data-toggle="tab" title="Rules"><strong>Rules</strong></a></li>
                                            <li><a href="#forms" data-toggle="tab" title="Forms"><strong>Forms</strong></a></li>
                                </ul>
        
                                <!-- Tab panes -->
                                <div class="tab-content tab-content-primary mb30">
<!--Help Content for Automation -->                                    
                                    <div class="tab-pane active" id="automation">
                                        <h3>Automation</h3>                                                
                                                    <h3>Email<img src="{$smarty.const.IMAGESLOCATION}help/email1.png" width="400" height="225" border="0" alt="" align="right" style="padding:5px;"></h3>
                                                   <p>When the user click the Email option. The viewing Report is Sent to user Email account (Email Set by Administrator Create User time). External Sharing mean user can share the report with other social network (Facebook, Google plus, Linkedin). User can control this External Share.</p>
                                                                   <p>SMTP Setting for user can share the reports via the Email,so user providing company SMTP in the Analyzr, They can share reports via the Email.</p><br><br><br><br><br><br>

                                                    <hr color="#ffffff">                

                                                   <h3>Cron</h3>
                                                   <p><img src="{$smarty.const.IMAGESLOCATION}help/multifile.png" width="500" height="150" border="0" alt="" align="left"  style="padding:5px;">  Cron is a automatic procedures generate tools,it will run every 15 min in backend PERL code,If any new table is available cron will generate the modified procedures.</p>
                                                   <p> Analy<font color="#FF3300"><b>Z</b></font>r Provide sample format for single file and there are two types available in cron generation 1. Single File 2.Multiple File. Multiple File generate the procedures via SCP credentials.</p><br><br><br><br><br>				

                                                   <h3>Cron - File Management<img src="{$smarty.const.IMAGESLOCATION}help/cron-multifile.png" width="470" height="350" border="0" alt="" align="right" style="padding:5px;"></h3>	
                                                                   <p>File Management consists of 4 parts: File Import-Single File, File Import-Multi File, Database Import and Web Log Import.</p>
                                                                   <p><b>1. File Import-Single File: </b> In Single File, after uploading an excel file a suitable table name should be selected and added to the automation log. When the cron is started, it parses the records in the file and placed it in the table. </p> 
                                                                   <p><b>2. File Import-Multi File: </b> In Multi File, the files from one system can be moved to another system using different access methods and parse the files into the local system. Here, user can select anyone access type and provide the details and should save it. When the cron is started, the file gets parsed.</p> 
                                                                   <p><b>3. Database Import: </b> In Database Import, the records from one database is moved to other database. This can take place within local system or from remote system. When the cron starts, it starts parsing the records from one database to another database.</p> 
                                                                   <p><b>4. Web Log Import: </b> In Web Log Import, the logs of the particular domain that is viewed, is displayed as a report. Here, user have to select a server first. After giving the domain name and directory path, user have to select one of the two actions. They are explained below.</p>
                                                                   <p><b>I. Truncate Old Data:</b> This action deletes old datas and then inserts the new datas.</p>
                                                                   <p><b>II.Append Data:</b> This action inserts and joins the new datas along with the old datas.</p>
                                    </div><!-- tab-pane -->
<!--Help Content for Plugin -->                                    
                                    <div class="tab-pane" id="plugin">
                                        <h3><img src="{$smarty.const.IMAGESLOCATION}help/plugins1.png" width="470" height="350" border="0" alt="" align="right" style="padding:5px;">Plugins</h3>
                                                                <p> Plugins helps to view the Google Analytics , Google Big Query DB , Google GDrive , MS Skydrive , Magento Server , Web Log Import and Hadoop Hive DB in single report of Plugins. Administrator can give the Plugins credentials in company.</p> 

                                                                        <p> <b>Google Analytics</b> is a service offered by google that generates detailed statistics about the visits to a website.administators can add Google Analytics details username, password and profile ID allows you to track how people find your site credentials reports</p>  

                                                                        <p> <b>Google Big Query DB</b> offers you a fast and simple way of doing analysis over large datasets.This can be your own data, or data that someone else has shared for you. BigQuery works best for interactive analysis of very large datasets, typically using a small number of very large, append-only tables. </p> 

                                                                        <p> We have added Username, Auth key & project id allows you to tracking terabytes in size with trillions of records.</p>

                                                                        <p> <b>Google GDrive</b> is a file storage and synchronization service provided by Google, which enables user cloud storage, file sharing and collaborative editing.  Files shared publicly on Google Drive can be searched with web search engines.Google Drive is the home of Google Docs, an office suite of productivity applications, that offer collaborative editing on documents, spreadsheets, presentations, and more.</p>

                                                                        <p> <b>MS Skydrive</b> is a file hosting service that allows users to upload and sync files to a cloud storage and then access them from a Web browser or their local device. It is part of the Windows Live range of online services and allows users to keep the files private, share them with contacts, or make the files public. Publicly shared files do not require a Microsoft account to access.In addition to personal cloud storage, Microsoft offers managed business storage as OneDrive for Business.</p>

                                                                        <p> <b>Magento Server</b> allows user to generate a report about the contents they stored in the database.After the credentials are given, a csv file is generated.User should export that file into their local system.Then, the file should be parsed and can generate the reports.</p>

                                                                        <p> <b>Web Log Import</b> allows all web servers generate access log files which contain all of the requests made to the server. You can import and analyse your web server logs in Piwik! A log script lets you parse and analyze visitor server log, including IP address, URL, user agent, referrer URL and search keyword, campaign info and more.</p>

                                                                        <p> <b>Hadoop Hive DB</b> allows users to store large sets of datas in it from local system.It also allows the user to export datas from it.</p>


                                    </div><!-- tab-pane -->
<!--Help Content for Users -->                                    
                                     <div class="tab-pane" id="user">
                                          <h3>Users</h3>
                                            <h3>Action<img src="{$smarty.const.IMAGESLOCATION}help/users-1.png" width="450" height="300" border="0" alt="" align="right" style="padding:5px;"></h3>
                                            <p> <b>Edit -</b> Created users can edit in Edit User action. Administrator can edit user First name, Last name and User name, Password, Mobile Login ON/OFF mode, Email Credinatials. </p>
                                                          <p ><b>Delete - </b> Administrator can delete the user from delete user action. While administrator use delete user cant access entire functionality.</p><br><br><br><br><br><br><br><br>


                                           <h3>Add User</h3>
                                                  <img src="{$smarty.const.IMAGESLOCATION}help/users-2.png" width="400" height="350"  border="0" alt=""  align="left" style="padding:5px;">
                                                          <p> Create a new user. Administrator can assign the reports and control the moblie login from add user module. Administrator enabled reports only user can view and also the mobile login. Default mobile login in OFF mode and all fields are mandatory in add user module. </p>
                                                          <p> <b>LDAP :</b> An internal directory with LDAP authentication offers the features of an internal directory while allowing you to store and check users' passwords in LDAP only. </p>

                                                          <p>L - Represents LDAP User. </p>
                                                          <p>N - Represents Normal User. </p><br><br><br><br><br><br><br><br><br><br><br>

                                          <h3>Manage Roles<img src="{$smarty.const.IMAGESLOCATION}help/manage-roles.png" width="400" height="300"  border="0" alt=""  align="right" style="padding:5px;"></h3>
                                                          <p> Manage roles helps user to add a new role, edit a role and assign access rights. User can able to add a new role and assign an user right from the available lists. User can also edit a role by selecting a role from the drop-down and edit the name and changing the access right. </p>
                                                          <br><br><br><br><br><br><br><br><br><br><br>

                                          <h3>Assign Reports</h3>
                                                          <img src="{$smarty.const.IMAGESLOCATION}help/web-reports.png" width="550" height="350" border="0" alt="" align="left" style="padding:5px;">
                                                          <p>Administrator can assign any reports to any users. Administrator can also On/OFF the report based on the need of the users.</p>  
                                                  <p>Administrator can set the other control. Other controls have 2 options 1.Mobile 2. Custom Upload.  If administrator gives the permission mean the user can view the reports in mobile and can generate the Report from the Custom upload.</p>		
                                          <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
                                    </div><!-- tab-pane -->
<!--Help Content for Reports -->                                    
                                    <div class="tab-pane" id="reports">
                                        <h3>Reports</h3>
                                            <h3>Installed Reports<img src="{$smarty.const.IMAGESLOCATION}help/report1.jpg" border="0"   align="right" style="padding:5px;"></h3>
                                                  <p>  Administrator can create the modules based on procedures and Templetes. Created Modules are assign to the Reports. Administrator can create the Reports based on Modules. One Procedures for one modules, assigned procedures cant be assign to other modules.Here, user can create reports in any platform from the given four platforms.When user selects any one of the platforms, it displays the reports stored in it. </p><br><br><br><br><br><br><br> 

                                                   <hr color="#ffffff">

                                                  <h3>Add Reports Section</h3>
                                            <img src="{$smarty.const.IMAGESLOCATION}help/report2.png" border="0" align="left" style="padding:5px;">  
                                                    <p style="padding-left:30px;">
                                                     <b>Step 01  - </b>Enter the Module name.</p>
                                                     <p style="padding-left:30px;"> <b>Step 02  - </b>Select the Version Type.User can select any one of the versions they need.For Windows8 and Mobile versions user can choose devices first and then from devices they can select Windows8 or Mobile.</p>
                                                     <p style="padding-left:30px;"> <b>Step 03  - </b>Select the status. If User select the active mean it will display it or user select the de-active mean it will not display it.</p>
                                                     <p style="padding-left:30px;"> <b>Step 04  - </b>Select the Module Image.</p>
                                                     <p style="padding-left:30px;"> <b>Step 05  - </b>Select 'Save' to save the section and 'Cancel' to reset the fields. </p><br><br><br><br><br>

                                                   <hr color="#ffffff"><br>

                                                  <h3>Add Report<img src="{$smarty.const.IMAGESLOCATION}help/report3.png" width="450" height="350" align="right" border="0" alt="" style="padding:5px;"></h3>
                                                     <p style="padding-left:30px;">
                                                     <b>Step 01  - </b>Enter the Report name and click Next.</p>
                                                     <p style="padding-left:30px;"> <b>Step 02  - </b>Select the Platform Type. There are four types of platforms available: web, mobile, windows 8 and rest. Select any one from that.</p>
                                                                     <p style="padding-left:30px;"> <b>Step 03  - </b>Select the Section Name. Section name will be available based on the platform type selected. Then, click Next.</p> 
                                                                     <br><br><br><br><br><br><br><br><br><br><br><br><br>
                                                                     <hr color="#ffffff">
                                         <h3><img src="{$smarty.const.IMAGESLOCATION}help/report4.png" width="450" height="350" align="left" border="0" alt="" style="padding:5px;"></h3>
                                             <p style="padding-left:30px;"> <b>Step 04  - </b>Select the Template Type. There are 3 types of template available: Standard, lugin and custom. Select any one from that.</p>
                                             <p style="padding-left:30px;"> <b>Step 05  - </b>Select the number of procedures. Select one for one procedure, two for two procedure and multiple for more than two procedures. Then, templates available will be displayed according to the number of procedures selected.</p>
                                             <p style="padding-left:30px;"> <b>Step 06  - </b>Select Procedure Type and Procedure Name from the drop down boxes and click Next.</p> 
                                             <br><br><br><br><br><br><br><br><br><br><br><br><br>
                                             <hr color="#ffffff">
                                             <div class="row">
                                                 <h3><img src="{$smarty.const.IMAGESLOCATION}help/add-reports.png" width="420" height="320" align="right" border="0" alt="" style="padding:5px;"><img src="{$smarty.const.IMAGESLOCATION}help/assign-users.png" width="420" height="320"  align="left" border="0" alt="" style="padding:5px;"></h3>
                                             </div>
                                            <div class="row"> 
                                                <p style="padding-left:30px;"> <b>Step 07  - </b>Select the status. If User select 'ON' means it will display it or user select 'OFF' means it will not display it.Then, Select Link Reports to link any report to the current report. </p>
                                                <p style="padding-left:30px;"> <b>Step 08  - </b>Select the users to assign the report.Reports can be assigned to many number of users.</p>
                                                <p style="padding-left:30px;"> <b>Step 09  - </b>Select Create button.Now, report is created and added to the selected sections.</p>
                                            </div>
                                    </div><!-- tab-pane -->
<!--Help Content for Templates --> 
                                 <div class="tab-pane" id="template">
                                         <h3>Templates</h3>
                                        <h3> There are 3 types of templates those are follows: <img src="{$smarty.const.IMAGESLOCATION}help/templates.png" width="600" height="300" border="0" alt=""  align="right" style="padding:5px;"></h3>
                                                              <p>1. Web Templates<br><br>
                                                 2. Mobile Templates<br><br>
                                                 3. Windows 8 Templates<p>

                                                              <p> <b>1. Web Templates : </b>Web Templates mean those templates are only for the System(PC) users. . Here administrator user can edit the Template name and description and administrator can view the already assigned reports details.</p>
                                                              <p> <b>2. Mobile Templates : </b>Mobile Templates mean those templates are only for the mobile users. . Here administrator user can edit the Template name and description and Administrator can view the already assign the reports details.
                                                              <p> <b>3. Windows 8 Templates : </b>Windows 8 Templates mean those templates are only for the users having Windows 8 OS in their System(PC). Here administrator user can edit the Template name and description and administrator can view the already assigned reports details.</p>

                                                              <p> Each of the above type of templates has 3 sub-type of templates namely, Standard templates, Plugin templates and Custom templates.

                                                              <p> <b>Standard Templates : </b>Standard Templates mean default templates for the Reports. Here administrator user can edit the Template name and description and Administrator can view the already assign the reports details.</p><br/>
                                                              <p> <b>Plugin Templates : </b>Plugin Templates mean all third party plugin are showing as Reports. Here administrator user can edit the Template name and description and Administrator can view the already assign the reports details. Third Party Plugin mean Google Analytic, Big query..</p><br/>
                                              <p> <b>Custom Templates : </b>Custom Templates are same like the Standard Templates. That means default templates for the Reports. Here administrator user can edit the Template name and description and Administrator can view the already assign the reports details.</p><br/>

                                </div><!-- tab-pane -->    
<!--Help Content for Procedures --> 
                                 <div class="tab-pane" id="procedure">
                                          <h3>Procedures<img src="{$smarty.const.IMAGESLOCATION}help/procedures.png" width="400" height="250" border="0" alt="" align="right" style="padding:5px;"></h3>
                                        <p> <b>Default Procedures - </b>Npedia have provided some of the default procedure for Administrator user. The Procedures description only can edit by the user otherwise can’t edit anything in Procedure. Assigned Reports are showing in the List view.</p><br/>
                                         <p> <b>Installed Procedures - </b>User installed procedures helps user to create their own procedure and use it in generating the reports.The steps for creating a new procedure is shown below.</p><br/>
                                       <p> <b>Forms - </b>Forms enables user to crate a procedure for that form.Here user has to give a title to the procedure and then choose a procedure from the available procedure.Then, enter the contents about the procedures in the description box and select the column and status.Finally, select the status of the dashboard(ON/OFF) and click add.Forms will be created.</p><br/>

                                       <hr color="#ffffff">
                                       <h3>Add new Procedure<br><img src="{$smarty.const.IMAGESLOCATION}help/procedures1.png" width="400" height="250"   border="0" alt="" align="left"  style="padding:5px;"></h3>          
                                          <p style="padding-left:30px;"> <b>Step 01  - </b>Enter the Procedures title.</p>
                                          <p style="padding-left:30px;"> <b>Step 02  - </b>Select a procedure from the available procedure.</p>
                                          <p style="padding-left:30px;"> <b>Step 03  - </b>Give a description about the procedure that is to be created.</p>
                                          <p style="padding-left:30px;"> <b>Step 04  - </b>Select the status. If User select the active mean it will display it or user select the de-active mean it will not display it.</p>
                                          <p style="padding-left:30px;"> <b>Step 05  - </b>select the status of the dashboard.If User select 'ON' means it will display it or user select 'OFF' means it will not display it.</p>
                                          <p style="padding-left:30px;"> <b>Step 06  - </b>Click Add button to add the procedures to the list and cancel to reset the fields.</p> <br/><br/>
                                 <hr color="#ffffff">                          
                                 <h3><img src="{$smarty.const.IMAGESLOCATION}help/procedures2.png" width="400" height="250"  border="0" alt="" align="right"  style="padding:5px;"></h3>
                                                          <p style="padding-left:30px;"> <b>Step 07  - </b>Select Assigned tab.Here, user can view the procedures that are created already and the procedure created by him.</p>
                                                          <p style="padding-left:30px;"> <b>Step 08  - </b>User can view the contents like title, name, description, status of the dashboard by selecting the procedure.</p>
                                                          <p style="padding-left:30px;"> <b>Step 09  - </b>User can also edit the procedure by clicking the edit option in it.</p>
                                                          <p style="padding-left:30px;"> <b>Step 10  - </b>When user selects the edit option, edit menu appears in the pop-up box.User can change only the description of the procedure and save it.</p><br/><br/><br/><br/>
                                 </div><!-- tab-pane -->   
<!--Help Content for Rules -->
                                 <div class="tab-pane" id="rules">
                                    <div class="row"> 
                                            <h3>Rules<img src="{$smarty.const.IMAGESLOCATION}help/rules.png" width="500" height="250" border="0" alt="" align="right" style="padding:5px;"></h3>
                                            <p> Rules defines the rules for the columns in the reports selected. Using rule engine different types of rules can be set for different columns. Rules can be set for many number of columns according to user needs..</p>
                                    </div>
                                 </div><!-- tab-pane -->   
<!--Help Content for Forms -->                                 
                                 <div class="tab-pane" id="forms">
                                       <h3>Forms </h3>
                                            <p><img src="{$smarty.const.IMAGESLOCATION}help/forms-1.png" width="400" height="400" border="0" alt=""  align="left" style="padding:5px;">
                                            <p> <b>Step 01  - </b> Select Forms from dashboard.Forms page appears.</p>
                                            <p> <b>Step 02  - </b> Enter a name in the form name field.</p>
                                            <p> <b>Step 03  - </b> Give a suitable title in the Form Title field.</p>
                                            <p> <b>Step 04  - </b> Enter an additional title for the form, if needed.</p>
                                            <p> <b>Step 05  - </b> Select a color for the form.</p>
                                            <p> <b>Step 06  - </b> Click add button and browse a picture(logo) from the system.Similarly add various pictures(logos).Choose any pictures(logos) for the forms.</p>
                                            <p> <b>Step 07  - </b> Click add button and browse a picture(signature) from the system.Similarly add various pictures(signatures).Choose any pictures(signatures) for the forms.</p>
                                            <p> <b>Step 08  - </b> Choose a date format from the list of formats that is to be displayed in the form.</p><br><br><br><br><br><br><br>
                                            <hr color="#ffffff">
                                            <p><img src="{$smarty.const.IMAGESLOCATION}help/forms-2.png" width="400" height="350"  border="0" alt=""  align="right" style="padding:5px;">
                                            <p> <b>Step 09  - </b> Enter the contents in the text box(Box1) that is to be displayed in the form. Other text boxes(Box2 and Box3) can also be used if necessary.</p>
                                            <p> <b>Step 10  - </b> Click on the check boxes to choose a color for the text in the text box. Also, choose a border from the list of borders for the text boxes that is to be displayed in the form.</p>
                                            <p> <b>Step 11  - </b> Choose a data table(2Column or 3Column or 4column or 5column)and then choose a procedure that corresponds to the data table. (For ex: If 4Column is chosen, then select a procedure from four_column drop down box.)</p>
                                            <p> <b>Step 12  - </b> Select a chart to be displayed in the form.</p>
                                            <p> <b>Step 13  - </b> Click ‘Generate Form’ to create a form and ‘Reset’ to reset all the fields.</p>
                                            <br><br><br><br><br><br><br><br>
                                            <hr color="#ffffff">
                                            <p><img src="{$smarty.const.IMAGESLOCATION}help/forms-3.png" width="400" height="350"   border="0" alt=""  align="left" style="padding:5px;">
                                            <p> <b>Step 14  - </b> Now, user has to select the boxes in the left side and placed it in the empty boxes in the form.This is to view the form in the order the user needs.</p>
                                            <p> <b>Step 15  - </b> Select Align Elements to align the contents in the form.</p>
                                            <p> <b>Step 16  - </b> In Align Elements menu, User can align the contents to the left, center and right.User can also reduce or increase the size of the contents by selecting the resize option and also make the contents as bold or italic using the style option.</p>
                                            <br><br><br><br><br><br><br><br><br><br><br><br><br>
                                            <hr color="#ffffff">
                                            <p><img src="{$smarty.const.IMAGESLOCATION}help/forms-4.png" width="400" height="370" border="0" alt=""align="right" style="padding:5px;">
                                            <p> <b>Step 17  - </b> Now, Preview of the form is geenrated.User can select the print option to print the form.</p>
                                            <p> <b>Step 18  - </b> User can also select the Re-design or Edit button to edit the form again or select Next button also.</p>
                                            <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                                            <hr color="#ffffff">
                                            <div class="row">
                                                <p><img src="{$smarty.const.IMAGESLOCATION}help/forms-5.png" width="400" height="370" border="0" alt=""align="left" style="padding:5px;">
                                                <p> <b>Step 19  - </b> If User selects the next button means it will display the workflow page. If user click 'Yes'means a submitter form appears. Select any one of the type available in the drop down and select an user and then click Next. User can select multiple users to submit forms. </p>
                                                <p> <b>Step 20  - </b> Then, Select an Access right from the lsit availabel on the drop down and select an user. Then, click Finish.</p>
                                                <p> <b>Step 21  - </b> The report will be assigned successfully. Click 'Edit workflow' to edit the submitted forms or click 'View forms list'.</p>
                                                <p> <b>Step 22  - </b> If user clicks 'No' in the workflow, a report viewer form appears. Select any one of the type available in the drop down and select as many users or roles according to our needs. Then, click 'Finish'.</p>
                                                <p> <b>Step 23  - </b> The report will be assigned successfully. Click 'Edit workflow' to edit the submitted forms or click 'View forms list'.</p>
                                                <p> <b>Step 24  - </b> Click 'Edit workflow' button in the forms list to make changes in the workflow or click 'Edit report' button to make changes in the forms or click 'Delete report' to delete the form.</p> <br/>
                                            </div>
                                     </div><!-- tab-pane -->
                                    
                                </div><!-- tab-content -->
                                
                            </div><!-- col-md-6 -->
                 </div>   
                 
<!-- End user help Page-->
{elseif ($smarty.session.user_type eq 3)}
    
     <div class="pull-right">
                            <a href = "{$smarty.session.home_href}" title="Back to Menu"> 
                                                       <span class="fa fa-arrow-circle-left fa-2x"></span> 
                            </a>
            </div>   <br/>
            
<!--Help content for End Users Level -->

    <div class="row">
                    <div class="col-md-10">
                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs nav-primary">
                                            <li class="active"><a href="#report" data-toggle="tab" title="Report Control"><strong>Report Control</strong></a></li>
                                            <li><a href="#export" data-toggle="tab" title="Data Export & Share"><strong>Data Export & Share</strong></a></li>
                                            <li><a href="#plugins" data-toggle="tab" title="Plugins"><strong>Plugins</strong></a></li>
                                            <li><a href="#dashboard" data-toggle="tab" title="Dashboard"><strong>Dashboard</strong></a></li>
                                            <li><a href="#pivot_table" data-toggle="tab" title="Pivot Table"><strong>Pivot Table</strong></a></li>
                                            <li><a href="#rule_engine" data-toggle="tab" title="Rule Engine"><strong>Rule Engine</strong></a></li>
                                </ul>
<!--Help content for Reports control -->        
                                <!-- Tab panes -->
                                <div class="tab-content tab-content-primary mb30">                                    
                                    <div class="tab-pane active" id="report">
                                         <h3>Report Control</h3>
                                            <p>There are 3 Control in all Reports <br/>1) Sort by<br/> 2) Pagination<br/> 3)Expand/Contract<br/></p>
                                            <p> <img src="{$smarty.const.IMAGESLOCATION}help/img-reportcontrol1.png"   border="0" alt=""  align="right" style="padding:5px;">
                                            <b>Sort by </b>: While User using sort by reports are showing as desending or asending orders.</p><br><br><br><br><br><br><br><br>
                                            <hr color="#ffffff">
                                            <p> <img src="{$smarty.const.IMAGESLOCATION}help/img-reportcontrol2.png"   border="0" alt=""  align="left" style="padding:5px;">
                                            <b>Pagination :</b><br/> While User using the Pagination in the Report. It will move to Next Page. There are 10 rows available in Every page.</p><br><br><br/><br/>
                                            <hr color="#ffffff"><br>
                                            <p> <img src="{$smarty.const.IMAGESLOCATION}help/img-reportcontrol3.png"   border="0" alt=""  align="right" style="padding:5px;">
                                            <b>Expand/Contract : </b> User can expand(or)collapse  button in Charts. The charts can viewable. User's click contract button in charts. The charts are expand (or) collapse .</p><br><br>
                                    </div>
<!--Help content for Data Export And Share -->                                    
                                     <div class="tab-pane" id="export">
                                         <h3>Data Export & Share</h3>
                                                <p><img src="{$smarty.const.IMAGESLOCATION}help/export-share1.png"   border="0" alt="" align="right" style="padding:5px;">
                                                <p> Data Export Options consists of 2 types : Pdf, Xls and Share consists of 3 types : GDrive Grant, SkyDrive Grant, Email.</p>    <br><br><br> 
                                                <hr color="#ffffff"><br>
                                                <p><b> Data Export </b></p>
                                                <p><img src="{$smarty.const.IMAGESLOCATION}help/export.png"   width ="150" height="100" border="0" alt="" align="left" style="padding:5px;">
                                                <p><b>Pdf :</b> When the user click the Pdf export option. The viewing Report is download as Pdf format.</p>
                                                <p><b>Xls :</b> When the user click the Xls export option. The viewing Report is download as Xls format.</p><br><br><br><br>
                                                <hr color="#ffffff"><br>
                                                <p><b> Share </b><br><img src="{$smarty.const.IMAGESLOCATION}help/share.png" width ="200" height="100"  border="0" alt="" align="right" style="padding:5px;">
                                                <p><b>GDrive Grant :</b> Click the GDrive Grant. The viewing Report is Shared to the Google Drive.</p>
                                                <p><b>SkyDrive Grant :</b> Click the SkyDrive Grant. The viewing Report is Shared to the Microsoft SkyDrive.</p>
                                                <p><b>Email :</b> When the user click the Email option. The viewing Report is Sent to user Email account(Email Set by Administrator Create User time).</p>
                                     </div>
<!--Help content for Plugins -->                                            
                                     <div class="tab-pane" id="plugins">
                                           <p> There are 5 options available in plugins. They are: Hadoop Hive Reports, Magento Order Reports, Google Analytics, Top Customer BQ and Mongo DB.   
                                            <h3>Plugins</h3>
                                                <p>It contains a list of plugins and user can select from it. Here, user can select any plugin and the information related to the selected plugin will be displayed below the image. Then, user can view the reports of the plugins by clicking the view report button. Though 5 options are available, only 4 are listed here. Magento Order Reports are explained separately. The sample report is displayed below.<br><br><br>
                                                <img src="{$smarty.const.IMAGESLOCATION}help/plugin.png" width="430" height="300" border="0" alt=""  style="padding:5px;" align="left">
                                                <img src="{$smarty.const.IMAGESLOCATION}help/plugin-1.png" width="420" height="300" border="0" alt=""  align="right"><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                                            <hr color="#ffffff"><br>
                                            <h3> <img src="{$smarty.const.IMAGESLOCATION}help/magento.png" width="700" height="350" border="0" alt=""  align="right">Magento Order Reports</h3>
                                                    <p>Magento Order Reports allows user to generate a report about the contents they stored in the database.After the credentials are given, a csv file is generated.User should export that file into their local system.Then, the file should be parsed and can generate the reports. It has 3 options. They are: 1. Parameters 2. Display 3. Date Range.</p>
                                                    <p><b> 1. Parameters :</b> This option contains several datas where user can select any data and reports are generated based on the data selected.</p>
                                            <p><b> 2. Display :</b> This option contains the columns for the data selected. The selected column is displayed along with the selected data.</p>
                                                    <p><b> 3. Date Range :</b>While User Set From Date to To Date. User can view the selected date Reports.</p><br>
                                     </div>
<!--Help content for Dashboard -->                                            
                                     <div class="tab-pane" id="dashboard">
                                         <h3> <img src="{$smarty.const.IMAGESLOCATION}help/user-dashboard2.png" width="400" height="300" border="0" alt=""  align="right">Dashboard</h3>
                                            <p> Dashboard allows to create a new dashboard, view the created dashboard. The dashboard can be viewed as single or multiple. It also allows to delete the created dashboard. The steps for creating the new dashboard is shown below.
                                                <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                                                <hr color="#ffffff"><br>    
                                                <div class="row">
                                                        <h3> <img src="{$smarty.const.IMAGESLOCATION}help/user-dashboard1.png" width="420" height="300" border="0" alt=""  style="padding:5px;" align="left">Add New Dashboard</h3>
                                                        <p> <b>Step 01 - </b> Enter a suitable title for the dashboard to be created.</b></p>
                                                                <p> <b>Step 02 - </b> Select the type of the dahsboard from the available check boxes.</b></p>
                                                                <p> <b>Step 03 - </b> Select the procedure for the selected dashboard type.</b></p>
                                                                <p> <b>Step 04 - </b> Select the source type. The source type is the chart that is to be displayed for the dahsboard.</b></p>
                                                                <p> <b>Step 05 - </b> Click Save button. Now, a dashboard is created.</b></p><br/><br/>
                                                </div>               
                                     </div>
<!--Help content for Pivot Table -->                                            
                                     <div class="tab-pane" id="pivot_table">
                                         <p> Pivot Table consists of 2 types. They are: <br/>1. Pivot File <br/>2. Pivot Database.</p>
                                                <h3><img src="{$smarty.const.IMAGESLOCATION}help/pivot1.png" width="400" height="300" border="0" alt=""  align="right">Pivot File</h3>
                                                <p> In Pivot File, user can import files in local, GDrive and SkyDrive. The file imported details will be listed in the pivot file. a user can import maximum of 3 files.</p> 
                                                <p><b> Format for Importing a File</b></p>
                                                <p> 1. File type  : xls, xlsx, csv.</p>
                                                <p> 2. File size  : Maximum 20MB per file.</p>
                                                <p> 3. Format of date column should be: Year-month-date(2012-12-31).</p>
                                                <p> 4. First row should be a header name.</p>
                                                <p> 5. Header row after first row should be proper value.</p>
                                                <p> 6. Singe Sheet only allowed to import.</p>
                                                <p> 7. Maximum column 256 allowed per file.</p>
                                                <p> 8. Header Example : company_id, company_name, company_address.</p><br>
                                                <hr color="#ffffff"><br>
                                                <h3> <img src="{$smarty.const.IMAGESLOCATION}help/pivot3.png" width="450" height="300" border="0" alt=""  align="left" style="padding:5px;">Pivot Database</h3>
                                                <p> In Pivot Database, user can view the records in the database. They can select a table; choose a column name, datatype and index. Then, they have to click Start Import. Now, the records are imported in the database.</p>
                                                <p><b> Step 01 - </b>Select Pivot File or Pivot Database from Pivot Table.</p>
                                                <p><b> Step 02 - </b>Click View Report in the Pivot File or Pivot Database.</p>
                                                <p><b> Step 03 - </b>Now, the Report is opened. Select the Show counts, option and different types of templates available in the list to view different kinds of reports.</p>
                                                <p><b> Step 04 - </b>Select the columns by dragging a specific column and drop it in the selected columns area.</p>

                                                <br><br><br><br><br>
                                                <hr color="#ffffff"><br>
                                                <h3> <img src="{$smarty.const.IMAGESLOCATION}help/pivot2.png" width="450" height="300" border="0" alt=""  align="right">Steps for Viewing a Report in Pivot File & Pivot Database</h3>

                                                <p><b> Step 05 - </b>Select Print button to print the report and Export button to download the report in PDF.</p>
                                                <p><b> Step 06 - </b>Select back to view the home page of Pivot File and Pivot Database.</p>
                                                <h3> Steps for Deleting a Report</h3>
                                                <p><b> Step 01 - </b>Select Pivot File or Pivot Database from Pivot Table.</p>
                                                <p><b> Step 02 - </b>Select Delete Report in the Pivot File or Pivot Database.</p>
                                                <p><b> Step 03 - </b>Select Ok to delete the record from the pop-up menu appeared and Select Cancel to cancel the process.</p>
                                     </div>
<!--Help content for Rule Engine -->                                            
                                     <div class="tab-pane" id="rule_engine">
                                         <h3> Rule Engine</h3>
                                            <p> Rule engine defines the rules for the columns in the reports selected. Using rule engine different types of rules can be set for different columns. It consists of 2 types: single rule and multi rule.</p>
                                            <p> The rules can be set by the administrator. Users can edit the rule according to them. Users can also change the column by dragging another column and drop it in the existing column. The rules can be applied or hide using apply/hide rules button.
                                           <div class="row">
                                                    <h3> 
                                                        <img src="{$smarty.const.IMAGESLOCATION}help/multi-rule1.png" width="450" height="350" border="0" alt=""  align="left">
                                                        <img src="{$smarty.const.IMAGESLOCATION}help/multi-rule.png" width="450" height="350" border="0" alt=""  align="right">
                                                    </h3>
                                           </div>
                                     </div>
                                </div>
               </div>
    </div>
{/if}
</div>
<!--Remove Class for Mainwrapper-->
{literal}
    <script type="text/javascript">
           var className = $('.mainwrapper').attr('class');
           $("."+className).removeClass(className);
    </script>
{/literal}
