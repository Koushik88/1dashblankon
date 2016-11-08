<script type="text/javascript">
        var login_id = "{$smarty.session.user_login_id}";
        var auto_gen_key = "{$smarty.session.auto_gen_key}";
        var menu_id = "{$smarty.get.mid}";
        var flag = 0;
        var login_date = "{$login_date}";
    {literal}
        
        updatePageView();
        function updatePageView()
        {
            if(menu_id)
            {
                $.post(portalLocation+"page/pageViewDetail.php",{"login_id":login_id,"auto_gen_key":auto_gen_key,"menu_id":menu_id,"flag":flag,"login_date":login_date},function(data)
                 {
                      flag = 1;
                 });    
                   
                    setTimeout(updatePageView, 10000);
             }         
        }
        
    {/literal}   
</script>
 
    