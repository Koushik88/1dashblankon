{*
#*******************************************************************#
#        Global Basics Inc   ::  Index  Page                 #
#*******************************************************************#

    Document       : Index page
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Index Page - Login Page
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}

<section id="login">

                <div class="alert alert-info alert-dismissable" style="display:none;width:500px;" id="pswresethdr">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <span id="pswresetmsg"></span>
                </div>

                    {if $errors|@count > 0}
                        <div class="alert alert-info alert-dismissable" style="width:500px;">
                          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <span> {if isset($errors["error_email"])}{$errors["error_email"]}{/if}
                                 {if isset($errors["error_passwd"])}{$errors["error_passwd"]}{/if}
                                 {if isset($errors["error_login"])}{$errors["error_login"]}{/if}
                                 {if isset($errors["timedOut"])}{$errors["timedOut"]}{/if}
                            </span>
                       </div>
                    {/if}

                <header>
                    {*<h1>1 DASH</h1>*}
                    <img src="{$smarty.const.PAGELOCATION}logo/1DashFinal_WhiteOption_155.png">
                    {*<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu risus. Curabitur commodo lorem fringilla enim feugiat commodo sed ac lacus.</p>*}
                </header>


            <!-- Login -->
            <form class="box tile animated active" id="box-login" action="doLogin" method="post" name="frm_login">
                <input type="hidden" name="_token" value="{$csrf_token}">
                <h2 class="m-t-0 m-b-15">Login</h2>
                <input type="text" class="login-control m-b-10" placeholder="Email" accesskey="e" name="username" required="required">
                <input type="password" class="login-control" placeholder="Password" accesskey="p"  name="passwd" required="required">
                <div class="checkbox m-b-20">

                </div>
                <button class="btn btn-sm m-r-5" name="btn_login">Sign In</button>

                <small>
                    {*<a class="box-switcher" data-switch="box-register" href="">Don't have an Account?</a> or*}
                    <a class="box-switcher" data-switch="box-reset" href="">Forgot Password?</a>
                </small>
            </form>

            <!-- Register -->
            <form class="box animated tile" id="box-register">
                <h2 class="m-t-0 m-b-15">Register</h2>
                <input type="text" class="login-control m-b-10" placeholder="Full Name">
                <input type="text" class="login-control m-b-10" placeholder="User Name">
                <input type="email" class="login-control m-b-10" placeholder="Email Address">
                <input type="password" class="login-control m-b-10" placeholder="Password">
                <input type="password" class="login-control m-b-20" placeholder="Confirm Password">

                <button class="btn btn-sm m-r-5">Register</button>

                <small><a class="box-switcher" data-switch="box-login" href="">Already have an Account?</a></small>
            </form>

            <!-- Forgot Password -->
            <div class="box animated tile" id="box-reset">
                <h2 class="m-t-0 m-b-15">Reset Password</h2>
               {* <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu risus. Curabitur commodo lorem fringilla enim feugiat commodo sed ac lacus.</p>
               *} <input type="email" class="login-control m-b-20" placeholder="Email Address" required="required" name="user_email" id="user_email">

                <button class="btn btn-sm m-r-5" onclick="return forgot_password();">Reset Password</button>

                <small><a class="box-switcher" data-switch="box-login" href="">Already have an Account?</a></small>
           </div>
        </section>




 <script type="text/javascript">

     var pageurl = "{$smarty.const.PAGELOCATION}";

     {literal}
        function forgot_password()
        {

            var username = $("#user_email").val();
            if(username.length == '0')
            {
                alert("Enter valid username or email");
            }
            else
            {

                var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
                var usertype = re.test(username);

$.post(portalLocation+controller+'/forgot_password.php',{"usertype":usertype,"username":username},function(data)
                {
                   $("#pswresethdr").show();
                   if(data == '0')
                   {
                        $("#pswresetmsg").html("Username or email does not exit");
                   }
                   else
                   {
                       $("#pswresetmsg").html("Email sent successfully");
                        setTimeout(function(){ document.location.href=pageurl; }, 3000);
                   }

                });


            }
        }
        {/literal}


 </script> 