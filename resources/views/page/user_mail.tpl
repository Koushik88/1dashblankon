{if isset($post_data["resetPassword"])}
    <html>
        <body>
            <div>
                <div>
                    <table width='600' align='left' border='0' cellspacing='0' cellpadding='0' style='width:600px;'>
                        <tbody>
                            <tr>
                                <td colspan='2' style='margin:0;'>
                                    <div><div><span style='font-size:12.8px'>Hi,</span><br></div><div>
                                            <br></div><div> Your Password has been Changed.</div>
                                        <div>Password :{$post_data["reset_pswd"]} </div>
                                        <div><br></div>
                                        <br style='font-size:12.8px'>
                                        <span style='font-size:12.8px'>Thank you,</span>
                                        <br style='font-size:12.8px'>
                                        <span style='font-size:12.8px'>1Dash&trade; Team</span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br>
        </body>
    </html>
{/if}

{if isset($post_data["forgotPasswordEmail"])}
    <html>
        <body>

            <div>
                <div>
                    <table width='600' align='left' border='0' cellspacing='0' cellpadding='0' style='width:600px;'>
                        <tbody><tr>
                                <td colspan='2' style='margin:0;'>
                                    <div style='padding:10px 0 0 0;'><font face='trebuchet ms,Arial,Helvetica,sans-serif' size='4' ><span style='font-size:24px;font-weight:normal;'>Dear {$post_data["username"]},</span></font></div>
                                    <div style='margin-top:0;margin-bottom:0;padding:0;'><span style='font-size:17px;'>This email was sent in response to your request for a&nbsp;password&nbsp;reset.</span></div>
                                    <ol style='margin-top:14pt;margin-bottom:14pt;'>
                                        <font face='trebuchet ms,Arial,Helvetica,sans-serif' size='2' color='#545454'><span style='font-size:14px;'>
                                            <li style='margin-left:15px;'><a href="{$post_data["link"]}" target='_blank'><font color='#1B90EA'>Reset your&nbsp;password&nbsp;by clicking on this link</font></a>&nbsp;or by copying and pasting the one below:<br>

                                                <a href="{$post_data["link"]}" target='_blank'>{$post_data["link"]}</a><br/><br/>

                                            </li>
                                    </ol>
                                    <div style='margin-top:0;margin-bottom:0;'><font face='trebuchet ms,Arial,Helvetica,sans-serif' size='2' color='#545454'><span style='font-size:14px;'>If you did not request a&nbsp;password&nbsp;reset, please contact <a href='mailto:support@1dash.com' target='_blank'>support@1dash.com</a><br>

                                        </span></font></div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan='2' style='margin:0;'><span style='font-size:17px;'><br>

                                        Thanks for choosing us,&nbsp;</span></font><br>

                                    <span style='font-weight:bold'>1dash Team</span><br>

                                </td>
                            </tr>
                        </tbody></table>
                    </font>
                </div>
            </div>

            <br>
        </body>
    </html>
{/if}

{if isset($post_data["adduser"])}
    <html>
        <body>
            <div><div><span style='font-size:12.8px'>Hi,{$post_data["username"]}</span><br></div><div>
                    <br></div><div>Welcome to 1Dash&trade;. You can access your dashboards using the below credentials.</div>
                <div><br>URL :<a href='{$post_data["link"]}' target='_blank' style='font-size:14px'>{$post_data["link"]}</a></div>
                <div>Username : {$post_data["email"]}</div><div>Password : {$post_data["password"]} </div>
                <div><br></div>
                <div>Kindly change your password upon signing in as new user.<br>
                    <br style='font-size:12.8px'>
                    <span style='font-size:12.8px'>Thank you,</span>
                    <br style='font-size:12.8px'>
                    <span style='font-size:12.8px'>1Dash&trade; Team</span>
                </div>
            </div>
            <br>
        </body>
    </html>


{/if}

{if isset($post_data["deleteuser"])}
    <html>
        <body>
            <div><span style='font-size:12.8px'><br></span></div>
            <div>
                <span style='font-size:12.8px'>Hi,{$post_data["del_username"]}</span>
                <br style='font-size:12.8px'><br style='font-size:12.8px'>Your account with 1Dash&trade; has been deleted.</div><div><br></div><div>Kindly visit <a href='https://1dashhelp.zendesk.com/' target='_blank'>https://1dashhelp.zendesk.com/</a> for any queries or to submit a support ticket by sending an email to <a href='mailto:support@1dash.com'>support@1dash.com</a></div><div><br style='font-size:12.8px'>
                <span style='font-size:12.8px'>Thank you,</span>
                <br style='font-size:12.8px'>
                <span style='font-size:12.8px'>1Dash&trade; Team</span>
                <br></div>
            <div><br></div>
            <div><br></div>
        </body>
    </html>
{/if}

