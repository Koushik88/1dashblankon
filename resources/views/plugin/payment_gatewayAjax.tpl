 <script src="{$smarty.const.JSLOCATION}simplify.pay.js"></script> 
 
{if isset($modifyPlan)} 
    <div class="modal-dialog" style="width:340px;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Modify Plan</h4>
                    </div>
                    <div class="modal-body">
                            <div class="col-md-7 m-b-15">
                                        <label>Plan </label>
                                             <select id="license_code" onchange="plandetailUpdate();" style="padding-left:10px;width:100%;height:29px;background-color:transparent;border:1px solid rgba(255, 255, 255, 0.3);">
                                               <option value="1">--Select--</option>
                                                 {foreach $planInfo as $key=>$value}
                                                    <option value="{$value["license_code"]}/#$#/{$value["no_of_users"]}">{$value["license_type"]}</option>   
                                                {/foreach}    
                                            </select>
                            </div>
                                            
                            <div class="col-md-5 m-b-15">
                                <label> Additional User </label>
                                    <select id="additional_user" onchange="plandetailUpdate();" style="padding-left:10px;width:100%;height:29px;background-color:transparent;border:1px solid rgba(255, 255, 255, 0.3);">
                                        {section name=counts start=0 loop=20 step=1} 
                                            <option value="{$smarty.section.counts.index}">{$smarty.section.counts.index}</option>   
                                        {/section}    
                                    </select>    
                            </div>
                                    
                                <div>
                                    <center>
                                        <span style="font-size:16px;"> <b> &#36; <span id="total_amount"> {*{$total_amount}*}0 </span> </b> </span>
                                    </center><br/>
                                </div>
                                    
                                <div class="col-md-5 m-b-15">
                                    <div class="row"> 
                                        <div style="display:inline-block;vertical-align:top;padding-top:1px;">Do have a Coupon&nbsp;</div>
                                        <div style="display:inline-block;">
                                            <div>
                                                <input type="checkbox" style="opacity:1;" name="coupan_check" id="coupan_check">
                                            </div>    
                                        </div>
                                        
                                    </div>    
                                </div>    
                                    <div class="col-md-7 m-b-15" id="coupan_desc" style="display:none;">
                                      <label>Enter Coupon Code</label>
                                      <input type="text" class="input-sm form-control" id="coupan_code" name="coupan_code" onblur="couponValidate();">
                                      <input type="hidden" class="input-sm form-control" id="coupan_code_status" value="0">
                                </div> <br/>
                                    
                                <div id="payment-iframe col-md-12"> 
                                    <center>
                                        <iframe name="my-hosted-form" style="background-color:#ccc;"

                                                               data-sc-key="{$PUBLIC_KEY}"
                                                               data-color="#12B830"
                                                               data-operation="create.token"
                                                               height="420px"
                                                               width="100%"
                                                               data-redirect-url="{$smarty.const.PORTALLOCATION}plugin/payment_gatewayAjax.php">
                                        </iframe>
                                    </center>
                                </div> 
                    </div>
                </div>
     </div>
   
            
            <script type="text/javascript"> 
                {literal}
                  
                        function plandetailUpdate()
                        {
                            var license_code_val =  $("#license_code option:selected").val();
                            //alert(license_code_val);
                            var license_code_Array = license_code_val.split("/#$#/");
                            var license_code = license_code_Array[0];
                            
                           if(parseInt(license_code_Array[1]) < NoOfLicenceUser)
                           {
                               $("#payment-iframe").hide();
                               //alert(license_code_Array[1] +"----------- "+NoOfLicenceUser);
                               alert("You cannot modify selected plan. Kindly remove users in unser list");
                               $("#license_code option[value=1]").prop('selected', 'selected');
                               
                           }
                           else
                           {  
                            $("#payment-iframe").show();
                            //$("#license_code option:selected").prop('selected', false);
                            $("#license_code option[value='"+license_code_val+"']").attr('selected','selected');
                            var additional_user = $("#additional_user option:selected").val();
                            var coupan_code_status = $("#coupan_code_status").val();
                            var coupan_code = $("#coupan_code").val();
                                $.post(portalLocation+"plugin/payment_gatewayAjax.php", {"license_code":license_code,"additional_user":additional_user,"updatePlanDetail":"updatePlanDetail","coupan_code_status":coupan_code_status,"coupan_code":coupan_code}, function(data){    
                                 
                                    $("#total_amount").html(data);
                                });
                            }     
                        }
                       
                        $("#coupan_check").click(function()
                        {
                            if($("#coupan_check").is(':checked'))
                            {
                                $("#coupan_desc").show();
                                $("#coupan_code").val("");
                                
                            }
                            else
                            {
                                $("#coupan_desc").hide();
                                $("#coupan_code").val("");
                            }
                        });
                        
                        function couponValidate()
                        {
                                   var coupan_code = $("#coupan_code").val();
                                   $.post(portalLocation+"plugin/payment_gatewayAjax.php", {"coupan_code_validate":coupan_code}, function(data){    
                                       
                                        if(data.trim() === '0')
                                        {
                                            alert("Your Coupan is invalid!");
                                            $("#coupan_code_status").val(0);
                                        }
                                        else
                                        {
                                            $("#coupan_code_status").val(1);
                                        }
                                   });
                        }
              {/literal}            
            </script>
                   
{/if}



{if isset($buyUser)}
                <div class="modal-dialog" style="width:340px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Buy Additional User</h4>
                            </div>
                            <div class="modal-body">
                                    <div class="col-md-12 m-b-15">
                                            <label> Buy Additional User </label>
                                                <select id="buy_additional_user" onchange="additionalUserCalculation();" style="padding-left:10px;width:100%;height:29px;background-color:transparent;border:1px solid rgba(255, 255, 255, 0.3);">
                                                    {section name=counts start=1 loop=20 step=1} 
                                                        <option value="{$smarty.section.counts.index}">{$smarty.section.counts.index}</option>   
                                                    {/section}    
                                                </select>    
                                    </div>
                                
                                <div>
                                    <center>
                                        <span style="font-size:16px;"> <b> &#36; <span id="buyAd_total_amount">  </span> </b> </span>
                                    </center><br/>
                                </div>      
                                 
                                    <iframe name="my-hosted-form" style="background-color:#ccc;"

                                                                                   data-sc-key="{$PUBLIC_KEY}"
                                                                                   data-color="#12B830"
                                                                                   data-operation="create.token"
                                                                                   height="420px"
                                                                                   data-redirect-url="{$smarty.const.PORTALLOCATION}plugin/payment_gatewayAjax.php?buyAdditionalUser=1">
                                    </iframe>
                            </div>
                        </div>
                </div>
                                                                                   
        {literal}                                                                                
                <script type="text/javascript">   
                    additionalUserCalculation();
                    function additionalUserCalculation()
                    {
                        var additional_user_count = $("#buy_additional_user option:selected").val(); 
                        $.post(portalLocation+"plugin/payment_gatewayAjax.php", {"buyAdUserCalculation":"buyAdUserCalculation","additional_user_count":additional_user_count}, function(data)
                         {    
                        
                                 $("#buyAd_total_amount").html(data);
                         });
                    }
                </script>
        {/literal}    
{/if}

    {if isset($invoice_data)}
     <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Latest Invoice</h4>
                    </div>
                    <div class="modal-body"> 
                     {if $invoice_data}   
                        <div>
                        <center>
                            <h4> Payment Receipt </h4>
                        </center>
                        </div>    
                        <div class="pull-right" style="padding-bottom:15px;">
                             Date: {$invoice_data["invoiceDate"]}

                        </div>
                        <hr class="whiter" style="padding-top:20px;padding-bottom:10px;">

                           <div class="row">
                                    <div class="col-md-11"> <b>Description</b> </div>   <div class="col-md-1"> <b>Total</b> </div>
                           </div>
                            <div class="row"> 
                                <div class="col-md-11"> &nbsp;&nbsp;{$invoice_data["payment"]["transactionData"]["description"]}</div> <div class="col-md-1">&nbsp;&nbsp;&#36;{$invoice_data["total"]/100} </div>
                            </div>
                            <div class="row">
                                <br/>
                              <div class="col-md-11"> <b>  Transaction details</b> </div><div class="col-md-1"></div>
                            </div>
                            <div class="row">
                               <div class="col-md-11">&nbsp;&nbsp; {$invoice_data["payment"]["card"]["name"]} &nbsp;**** **** **** {$invoice_data["payment"]["card"]["last4"]} </div><div class="col-md-1"></div>
                            </div>
                            <div class="row">
                              <div class="col-md-11"> &nbsp;&nbsp;Auth Code - {$invoice_data["payment"]["authCode"]}</div><div class="col-md-1"></div>
                            </div>  
                       {else}
                           <center>No data found.</center>
                       {/if}    
                  </div>
       </div>
    </div>
    {/if}
    