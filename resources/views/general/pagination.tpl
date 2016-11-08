{*
#*******************************************************************#
#		Global Basics Inc ::  Pagination Template                #
#*******************************************************************#

    Document       : Pagination Template Page
    Created on     : 24-06-2016
    Author         : Rubanraj S
    Description    : Paginate for batch level datas
    Last Edited on : 24-06-2016
    Last Edited by : Rubanraj S
*}

<div class="fg-toolbar col-md-12">
    {if $rowCounts gt 0 && $rowCounts - ($pageNum * $pageRowCount) + $pageRowCount gte 0}
    <div id="pg" class="col-md-6 text-left" style="float: left;">
        {$pagination}
    </div>  
    <div id="example_info" class="col-md-6 text-right">
        Showing {($pageNum - 1) * $pageRowCount + 1} to {if $pageNum * $pageRowCount lt $rowCounts}{$pageNum * $pageRowCount}{else}{$rowCounts}{/if} of {$rowCounts} {foreach from=$colnames name="colnames" item=cn}{*{if $smarty.foreach.colnames.index eq '1'} {$cn["item"]|replace:"_":" "|capitalize}{/if}*} {/foreach}Records
    </div>
    {/if}
</div>