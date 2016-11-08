{if $smarty.session.expiry_msg eq '1'}
   <br/>
        <div class="col-xs-2"></div>
        <div class="alert alert-danger col-xs-8">
               Your last payment has failed. Kindly update your card details for unrestricted access
        </div>
        
{/if}
<div class="block-area shortcut-area">
<span id="prtour_soall">&nbsp;&nbsp;</span>
{$sd}
</div>

<div class="overflow"></div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="./sd/js/ie10-viewport-bug-workaround.js"></script>

<!--Product tour -->
<script type="text/javascript">
        var prtour = "{$smarty.get.prtour}";
        var last_login = "{$smarty.session.last_login}";
    {literal} 
        
        if(prtour === '1')
        {
          productTour(csslocation);
        }   
      {/literal}    
</script>
