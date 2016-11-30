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

