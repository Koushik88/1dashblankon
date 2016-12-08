
{if isset($balance_sheet_array)}

    {if $balance_sheet_array}
        <table class="table table-bordered tile pltable" id="balancesheet" style="min-width:600px;max-width:1000px;">
            <thead>
                <tr>  
                    {foreach $balance_sheet_coll_title as $key=>$value} 
                        <th style="text-align:center !important;">{$value}</th>                                                               
                        {/foreach}   
                </tr>
            </thead>    

            <tbody> 
                {$count1=1}{$colPerRow = count($balance_sheet_coll_title)}{$count2=1}{$count3=1}{$count4=1}{$count5=1}{$count6=1}{$count7=1}{$count8=1}{$count9=1}{$count10=1}
                {foreach $balance_sheet_array as $key=>$value}
                    {$value.group = null} {$value.type = null} 
                    {foreach $value as $key1=>$value1}
                        {foreach $value1 as $key2=>$value2}
                            <tr>
                                {foreach $value2 as $key2=>$value3}
                                    {foreach $value3 as $key4=>$value4}                                                                
                                        {if is_array($value4)} 
                                            {foreach $value4 as $key5=>$value5}
                                                {if is_array($value5)} 
                                                    {*<pre>{$value5|@print_r}</pre>*}
                                                    {foreach $value5 as $key6=>$value6}
                                                        {if is_array($value6)}                                                                                                     
                                                            {foreach $value6 as $key7=>$value7}                                                                                                            
                                                                {if is_array($value7)} 
                                                                    {foreach $value7 as $key8=>$value8}
                                                                        {if is_array($value8)}
                                                                            {foreach $value8 as $key9=>$value9}
                                                                                {if is_array($value9)}
                                                                                    {foreach $value9 as $key10=>$value10}
                                                                                        {if is_array($value10)}
                                                                                            {foreach $value10 as $key11=>$value11}
                                                                                                {if is_array($value11)}

                                                                                                    {foreach $value11 as $key12=>$value12}
                                                                                                        {if is_array($value12)}
                                                                                                            {foreach $value12 as $key13=>$value13}
                                                                                                                {if is_array($value13)}
                                                                                                                    {foreach $value13 as $key14=>$value14}
                                                                                                                        {if is_array($value14)}
                                                                                                                            {foreach $value14 as $key15=>$value15}
                                                                                                                                {if is_array($value15)}
                                                                                                                                {else}
                                                                                                                                    {if $key15 eq 'value'}    
                                                                                                                                        {if $count10 mod $colPerRow eq 1}
                                                                                                                                        <tr>
                                                                                                                                        {/if}                                                                                                         
                                                                                                                                        <td {if is_numeric($value15)} style="text-align:right;"{/if}> {if is_numeric($value15)} {$value15|number_format:2:".":","} {else} {$value15} {/if}</td>

                                                                                                                                        {if $count10 mod $colPerRow eq 0}  
                                                                                                                                        </tr>
                                                                                                                                    {/if}  
                                                                                                                                    {$count10=$count10+1}
                                                                                                                                {/if}
                                                                                                                            {/if}    
                                                                                                                        {/foreach}    

                                                                                                                    {else}
                                                                                                                        {if $key14 eq 'value'}    
                                                                                                                            {if $count9 mod $colPerRow eq 1}
                                                                                                                                <tr>
                                                                                                                                {/if}                                                                                                         
                                                                                                                                <td {if is_numeric($value14)} style="text-align:right;"{/if}> {if is_numeric($value14)} {$value14|number_format:2:".":","} {else} {$value14} {/if}</td>

                                                                                                                                {if $count9 mod $colPerRow eq 0}  
                                                                                                                                </tr>
                                                                                                                            {/if}  
                                                                                                                            {$count9=$count9+1}
                                                                                                                        {/if}
                                                                                                                    {/if}
                                                                                                                {/foreach}   

                                                                                                            {else}

                                                                                                                {if $key13 eq 'value'}    
                                                                                                                    {if $count8 mod $colPerRow eq 1}
                                                                                                                        <tr>
                                                                                                                        {/if}                                                                                                         
                                                                                                                        <td {if is_numeric($value13)} style="text-align:right;"{/if}> {if is_numeric($value13)} {$value13|number_format:2:".":","} {else} {$value13} {/if}</td>

                                                                                                                        {if $count8 mod $colPerRow eq 0}  
                                                                                                                        </tr>
                                                                                                                    {/if}  
                                                                                                                    {$count8=$count8+1}
                                                                                                                {/if}
                                                                                                            {/if}    

                                                                                                        {/foreach}   

                                                                                                    {else}

                                                                                                        {if $key12 eq 'value'}    
                                                                                                            {if $count7 mod $colPerRow eq 1}
                                                                                                                <tr>
                                                                                                                {/if}                                                                                                         
                                                                                                                <td {if is_numeric($value12)} style="text-align:right;"{/if}> {if is_numeric($value12)} {$value12|number_format:2:".":","} {else} {$value12} {/if}</td>

                                                                                                                {if $count7 mod $colPerRow eq 0}  
                                                                                                                </tr>
                                                                                                            {/if}  
                                                                                                            {$count7=$count7+1}
                                                                                                        {/if}
                                                                                                    {/if} 
                                                                                                {/foreach}   

                                                                                            {else}
                                                                                                {if $key11 eq 'value'}    
                                                                                                    {if $count6 mod $colPerRow eq 1}
                                                                                                        <tr>
                                                                                                        {/if}                                                                                                         
                                                                                                        <td {if is_numeric($value11)} style="text-align:right;"{/if}> {if is_numeric($value11)} {$value11|number_format:2:".":","} {else} {$value11} {/if}</td>

                                                                                                        {if $count6 mod $colPerRow eq 0}  
                                                                                                        </tr>
                                                                                                    {/if}  
                                                                                                    {$count6=$count6+1}
                                                                                                {/if}
                                                                                            {/if}
                                                                                        {/foreach}   
                                                                                    {else}
                                                                                        {if $key10 eq 'value'}    
                                                                                            {if $count5 mod $colPerRow eq 1}
                                                                                                <tr>
                                                                                                {/if}                                                                                                         
                                                                                                <td {if is_numeric($value10)} style="text-align:right;"{/if}> {if is_numeric($value10)} {$value10|number_format:2:".":","} {else} {$value10} {/if}</td>

                                                                                                {if $count5 mod $colPerRow eq 0}  
                                                                                                </tr>
                                                                                            {/if}  
                                                                                            {$count5=$count5+1}
                                                                                        {/if}
                                                                                    {/if}                                                                                                                                                               
                                                                                {/foreach}                                                                                                                                                     
                                                                            {else}
                                                                                {if $key9 eq 'value'}    
                                                                                    {if $count4 mod $colPerRow eq 1}
                                                                                        <tr>
                                                                                        {/if}                                                                                                         
                                                                                        <td {if is_numeric($value9)} style="text-align:right;"{/if}> {if is_numeric($value9)} {$value9|number_format:2:".":","} {else} {$value9} {/if}</td>

                                                                                        {if $count4 mod $colPerRow eq 0}  
                                                                                        </tr>
                                                                                    {/if}  
                                                                                    {$count4=$count4+1}
                                                                                {/if}
                                                                            {/if}  
                                                                        {/foreach} 
                                                                    {else}
                                                                        {if  $key8 eq 'value'}    
                                                                            {if $count3 mod $colPerRow eq 1}
                                                                                <tr>
                                                                                {/if}                                                                                                         
                                                                                <td {if is_numeric($value8)} style="text-align:right;"{/if}> {if is_numeric($value8)} {$value8|number_format:2:".":","} {else} {$value8} {/if}</td>

                                                                                {if $count3 mod $colPerRow eq 0}  
                                                                                </tr>
                                                                            {/if}  
                                                                            {$count3=$count3+1}
                                                                        {/if}

                                                                    {/if}  
                                                                {/foreach}   

                                                            {else}
                                                                {if $key7 eq 'value'}    

                                                                    {if $count2 mod $colPerRow eq 1}
                                                                        <tr>
                                                                        {/if}                                                                                                         
                                                                        <td {if is_numeric($value7)} style="text-align:right;"{/if}> {if is_numeric($value7)} {$value7|number_format:2:".":","} {else} {$value7} {/if}</td>

                                                                        {if $count2 mod $colPerRow eq 0}  
                                                                        </tr>
                                                                    {/if}  
                                                                    {$count2=$count2+1}
                                                                {/if}

                                                            {/if} 
                                                        {/foreach} 

                                                    {else} 
                                                        {if $key6 eq 'value'}    

                                                            {if $count1 mod $colPerRow eq 1}
                                                                <tr>
                                                                {/if}                                                                                                         
                                                                <td {if is_numeric($value6)} style="text-align:right;"{/if}> {if is_numeric($value6)} {$value6|number_format:2:".":","} {else} {$value6} {/if}</td>

                                                                {if $count1 mod $colPerRow eq 0}  
                                                                </tr>
                                                            {/if}  
                                                            {$count1=$count1+1}
                                                        {/if}
                                                    {/if} 

                                                {/foreach} 
                                            {else}
                                                {if $key5 eq 'value'}    
                                                <td {if is_numeric($value5)} style="text-align:right;"{/if}> {if is_numeric($value5)} {$value5|number_format:2:".":","} {else} {$value5} {/if}</td>

                                            {/if}
                                        {/if}   
                                    {/foreach}   
                                {else}
                                    {if $key4 eq 'value'}    
                                        <td {if is_numeric($value4)} style="text-align:right;"{/if}> {if is_numeric($value4)} {$value4|number_format:2:".":","} {else} {$value4} {/if}</td>
                                    {/if}  
                                {/if}
                            {/foreach}    
                        {/foreach}   
                    </tr>
                {/foreach}    
            {/foreach}    
        {/foreach}    
    </tbody>

</table>
{else}
    <center><br/><br/> <b>No data Found.</b></center>
    {/if}

{/if} 



{if isset($arReceivable)}
    {if $arReceivable}  
        <table class="table table-bordered tile pltable" id="ardetails" style="min-width:600px;max-width:1000px;">
            <thead>
                <tr>  
                    {foreach $arb_col_tile as $key=>$value} 
                        <th style="text-align:center !important;">{$value}</th>                                                               
                        {/foreach}   
                </tr>
            </thead>    

            <tbody> 
                {$count1=1}{$colPerRow = count($ar_col_tile)}{$count2=1}{$count3=1}{$count4=1}{$count5=1}{$count6=1}{$count7=1}{$count8=1}{$count9=1}{$count10=1}
                {foreach $arReceivable as $key=>$value}
                    {$value.group = null} {$value.type = null} 
                    {foreach $value as $key1=>$value1}
                        <tr>
                            {foreach $value1 as $key2=>$value2}
                                {foreach $value2 as $key3=>$value3}                                                                                      
                                    {if is_array($value3)}
                                        {foreach $value3 as $key4=>$value4} 
                                            {if is_array($value4)}
                                                {foreach $value4 as $key5=>$value5}
                                                    {if is_array($value5)}
                                                        {foreach $value5 as $key6=>$value6}  
                                                            {if is_array($value6)}
                                                            {else}
                                                                {if $key6 eq 'value'}
                                                                    {if $count1 mod $colPerRow eq 1}
                                                                    <tr>
                                                                    {/if}                                                                                                         
                                                                    <td {if is_numeric($value6)} style="text-align:right;"{/if}> {if is_numeric($value6)} {$value6|number_format:2:".":","} {else} {$value6} {/if}</td>

                                                                    {if $count1 mod $colPerRow eq 0}  
                                                                    </tr>
                                                                {/if}  
                                                                {$count1=$count1+1}
                                                            {/if}
                                                        {/if}
                                                    {/foreach} 
                                                {else}
                                                    {if $key5 eq 'value'}     
                                                    <td {if is_numeric($value5)} style="text-align:right;"{/if}> {if is_numeric($value5)} {$value5|number_format:2:".":","} {else} {$value5} {/if}</td>
                                                {/if}
                                            {/if}    
                                        {/foreach}    

                                    {else}    

                                        {if $key4 eq 'value'}     
                                            <td {if is_numeric($value4)} style="text-align:right;"{/if}> {if is_numeric($value4)} {$value4|number_format:2:".":","} {else} {$value4} {/if}</td>
                                        {/if}
                                    {/if}   
                                {/foreach}   

                            {else}
                                {if $key3 eq 'value'}     
                                    <td {if is_numeric($value3)} style="text-align:right;"{/if}> {if is_numeric($value3)} {$value3|number_format:2:".":","} {else} {$value3} {/if}</td>
                                {/if} 
                            {/if}
                        {/foreach} 

                    {/foreach}
                </tr> 
            {/foreach}    
        {/foreach}    
    </tbody>

</table>
{else}

    <center><br/><br/> <b>No data Found.</b></center>
    {/if}
{/if}



{if isset($arPayable)}
    {if $arPayable} 
        <table class="table table-bordered tile pltable" id="apdetails" style="min-width:600px;max-width:1000px;">
            <thead>
                <tr>  
                    {foreach $ar_col_tile as $key=>$value} 
                        <th style="text-align:center !important;">{$value}</th>                                                               
                        {/foreach}   
                </tr>
            </thead>    

            <tbody> 
                {$count1=1}{$colPerRow = count($ar_col_tile)}{$count2=1}{$count3=1}{$count4=1}{$count5=1}{$count6=1}{$count7=1}{$count8=1}{$count9=1}{$count10=1}
                {foreach $arPayable as $key=>$value}
                    {$value.group = null} {$value.type = null} 
                    {foreach $value as $key1=>$value1}
                        <tr>
                            {foreach $value1 as $key2=>$value2}
                                {foreach $value2 as $key3=>$value3}                                                                                      
                                    {if is_array($value3)}
                                        {foreach $value3 as $key4=>$value4} 
                                            {if $key4 eq 'value'}     
                                                <td {if is_numeric($value4)} style="text-align:right;"{/if}> {if is_numeric($value4)} {$value4|number_format:2:".":","} {else} {$value4} {/if}</td>
                                            {/if} 
                                        {/foreach}   

                                    {else}
                                        {if $key3 eq 'value'}     
                                            <td {if is_numeric($value3)} style="text-align:right;"{/if}> {if is_numeric($value3)} {$value3|number_format:2:".":","} {else} {$value3} {/if}</td>
                                        {/if} 
                                    {/if}
                                {/foreach} 

                            {/foreach}
                        </tr> 
                    {/foreach}    
                {/foreach}    
            </tbody>

        </table>  

    {else}
        <center><br/><br/> <b>No data Found.</b></center>
        {/if}


{/if}

{if isset($QZReporttile)}
    {if $QZReport}
        <table class="table table-bordered tile pltable" id="expensess" style="min-width:600px;max-width:1500px;">
            <thead>
                <tr>  
                    {foreach $QZReporttile as $key=>$value} 
                        <th style="text-align:center !important;">{$value}</th>                                                               
                        {/foreach}   
                </tr>
            </thead>    

            <tbody> 
                {$count1=1}{$colPerRow = count($QZReporttile)}{$count2=1}{$count3=1}{$count4=1}{$count5=1}{$count6=1}{$count7=1}{$count8=1}{$count9=1}{$count10=1}
                {foreach $QZReport as $key=>$value}
                    {$value.group = null} {$value.type = null} 
                    {foreach $value as $key1=>$value1}
                        {foreach $value1 as $key2=>$value2}
                            <tr>
                                {foreach $value2 as $key2=>$value3}
                                    {foreach $value3 as $key4=>$value4}                                                                
                                        {if is_array($value4)} 
                                            {foreach $value4 as $key5=>$value5}
                                                {if is_array($value5)} 
                                                    {*<pre>{$value5|@print_r}</pre>*}
                                                    {foreach $value5 as $key6=>$value6}
                                                        {if is_array($value6)}                                                                                                     
                                                            {foreach $value6 as $key7=>$value7}                                                                                                            
                                                                {if is_array($value7)} 
                                                                    {foreach $value7 as $key8=>$value8}
                                                                        {if is_array($value8)}
                                                                            {foreach $value8 as $key9=>$value9}
                                                                                {if is_array($value9)}
                                                                                    {foreach $value9 as $key10=>$value10}
                                                                                        {if is_array($value10)}
                                                                                            {foreach $value10 as $key11=>$value11}
                                                                                                {if is_array($value11)}

                                                                                                    {foreach $value11 as $key12=>$value12}
                                                                                                        {if is_array($value12)}
                                                                                                            {foreach $value12 as $key13=>$value13}
                                                                                                                {if is_array($value13)}
                                                                                                                    {foreach $value13 as $key14=>$value14}
                                                                                                                        {if is_array($value14)}
                                                                                                                            {foreach $value14 as $key15=>$value15}
                                                                                                                                {if is_array($value15)}
                                                                                                                                {else}
                                                                                                                                    {if $key15 eq 'value'}    
                                                                                                                                        {if $count10 mod $colPerRow eq 1}
                                                                                                                                        <tr>
                                                                                                                                        {/if}                                                                                                         
                                                                                                                                        <td {if is_numeric($value15)} style="text-align:right;"{/if}> {if is_numeric($value15)} {$value15|number_format:2:".":","} {else} {$value15} {/if}</td>

                                                                                                                                        {if $count10 mod $colPerRow eq 0}  
                                                                                                                                        </tr>
                                                                                                                                    {/if}  
                                                                                                                                    {$count10=$count10+1}
                                                                                                                                {/if}
                                                                                                                            {/if}    
                                                                                                                        {/foreach}    

                                                                                                                    {else}
                                                                                                                        {if $key14 eq 'value'}    
                                                                                                                            {if $count9 mod $colPerRow eq 1}
                                                                                                                                <tr>
                                                                                                                                {/if}                                                                                                         
                                                                                                                                <td {if is_numeric($value14)} style="text-align:right;"{/if}> {if is_numeric($value14)} {$value14|number_format:2:".":","} {else} {$value14} {/if}</td>

                                                                                                                                {if $count9 mod $colPerRow eq 0}  
                                                                                                                                </tr>
                                                                                                                            {/if}  
                                                                                                                            {$count9=$count9+1}
                                                                                                                        {/if}
                                                                                                                    {/if}
                                                                                                                {/foreach}   

                                                                                                            {else}

                                                                                                                {if $key13 eq 'value'}    
                                                                                                                    {if $count8 mod $colPerRow eq 1}
                                                                                                                        <tr>
                                                                                                                        {/if}                                                                                                         
                                                                                                                        <td {if is_numeric($value13)} style="text-align:right;"{/if}> {if is_numeric($value13)} {$value13|number_format:2:".":","} {else} {$value13} {/if}</td>

                                                                                                                        {if $count8 mod $colPerRow eq 0}  
                                                                                                                        </tr>
                                                                                                                    {/if}  
                                                                                                                    {$count8=$count8+1}
                                                                                                                {/if}
                                                                                                            {/if}    

                                                                                                        {/foreach}   

                                                                                                    {else}

                                                                                                        {if $key12 eq 'value'}    
                                                                                                            {if $count7 mod $colPerRow eq 1}
                                                                                                                <tr>
                                                                                                                {/if}                                                                                                         
                                                                                                                <td {if is_numeric($value12)} style="text-align:right;"{/if}> {if is_numeric($value12)} {$value12|number_format:2:".":","} {else} {$value12} {/if}</td>

                                                                                                                {if $count7 mod $colPerRow eq 0}  
                                                                                                                </tr>
                                                                                                            {/if}  
                                                                                                            {$count7=$count7+1}
                                                                                                        {/if}
                                                                                                    {/if} 
                                                                                                {/foreach}   

                                                                                            {else}
                                                                                                {if $key11 eq 'value'}    
                                                                                                    {if $count6 mod $colPerRow eq 1}
                                                                                                        <tr>
                                                                                                        {/if}                                                                                                         
                                                                                                        <td {if is_numeric($value11)} style="text-align:right;"{/if}> {if is_numeric($value11)} {$value11|number_format:2:".":","} {else} {$value11} {/if}</td>

                                                                                                        {if $count6 mod $colPerRow eq 0}  
                                                                                                        </tr>
                                                                                                    {/if}  
                                                                                                    {$count6=$count6+1}
                                                                                                {/if}
                                                                                            {/if}
                                                                                        {/foreach}   
                                                                                    {else}
                                                                                        {if $key10 eq 'value'}    
                                                                                            {if $count5 mod $colPerRow eq 1}
                                                                                                <tr>
                                                                                                {/if}                                                                                                         
                                                                                                <td {if is_numeric($value10)} style="text-align:right;"{/if}> {if is_numeric($value10)} {$value10|number_format:2:".":","} {else} {$value10} {/if}</td>

                                                                                                {if $count5 mod $colPerRow eq 0}  
                                                                                                </tr>
                                                                                            {/if}  
                                                                                            {$count5=$count5+1}
                                                                                        {/if}
                                                                                    {/if}                                                                                                                                                               
                                                                                {/foreach}                                                                                                                                                     
                                                                            {else}
                                                                                {if $key9 eq 'value'}    
                                                                                    {if $count4 mod $colPerRow eq 1}
                                                                                        <tr>
                                                                                        {/if}                                                                                                         
                                                                                        <td {if is_numeric($value9)} style="text-align:right;"{/if}> {if is_numeric($value9)} {$value9|number_format:2:".":","} {else} {$value9} {/if}</td>

                                                                                        {if $count4 mod $colPerRow eq 0}  
                                                                                        </tr>
                                                                                    {/if}  
                                                                                    {$count4=$count4+1}
                                                                                {/if}
                                                                            {/if}  
                                                                        {/foreach} 
                                                                    {else}
                                                                        {if  $key8 eq 'value'}    
                                                                            {if $count3 mod $colPerRow eq 1}
                                                                                <tr>
                                                                                {/if}                                                                                                         
                                                                                <td {if is_numeric($value8)} style="text-align:right;"{/if}> {if is_numeric($value8)} {$value8|number_format:2:".":","} {else} {$value8} {/if}</td>

                                                                                {if $count3 mod $colPerRow eq 0}  
                                                                                </tr>
                                                                            {/if}  
                                                                            {$count3=$count3+1}
                                                                        {/if}

                                                                    {/if}  
                                                                {/foreach}   

                                                            {else}
                                                                {if $key7 eq 'value'}    

                                                                    {if $count2 mod $colPerRow eq 1}
                                                                        <tr>
                                                                        {/if}                                                                                                         
                                                                        <td {if is_numeric($value7)} style="text-align:right;"{/if}> {if is_numeric($value7)} {$value7|number_format:2:".":","} {else} {$value7} {/if}</td>

                                                                        {if $count2 mod $colPerRow eq 0}  
                                                                        </tr>
                                                                    {/if}  
                                                                    {$count2=$count2+1}
                                                                {/if}

                                                            {/if} 
                                                        {/foreach} 

                                                    {else} 
                                                        {if $key6 eq 'value'}    

                                                            {if $count1 mod $colPerRow eq 1}
                                                                <tr>
                                                                {/if}                                                                                                         
                                                                <td {if is_numeric($value6)} style="text-align:right;"{/if}> {if is_numeric($value6)} {$value6|number_format:2:".":","} {else} {$value6} {/if}</td>

                                                                {if $count1 mod $colPerRow eq 0}  
                                                                </tr>
                                                            {/if}  
                                                            {$count1=$count1+1}
                                                        {/if}
                                                    {/if} 

                                                {/foreach} 
                                            {else}
                                                {if $key5 eq 'value'}    
                                                <td {if is_numeric($value5)} style="text-align:right;"{/if}> {if is_numeric($value5)} {$value5|number_format:2:".":","} {else} {$value5} {/if}</td>

                                            {/if}
                                        {/if}   
                                    {/foreach}   
                                {else}
                                    {if $key4 eq 'value'}    
                                        <td {if is_numeric($value4)} style="text-align:right;"{/if}> {if is_numeric($value4)} {$value4|number_format:2:".":","} {else} {$value4} {/if}</td>

                                    {/if}  
                                {/if}
                            {/foreach}    
                        {/foreach}   
                    </tr>
                {/foreach}    
            {/foreach}    
        {/foreach}    
    </tbody>

</table>  
{else}
    <center><br/><br/> <b>No data Found.</b></center>
    {/if}                                         

{/if}

{if isset($plTable)}
    {if $plTable} 
        <table class="table table-bordered tile pltable" id="proandloss" style="min-width:600px;max-width:1000px;">
            <thead>
                <tr>  
                    {foreach $col_tile as $key=>$value} 
                        <th style="text-align:center !important;">{$value}</th>                                                               
                        {/foreach}  
                </tr>
            </thead>  
            <tbody> 
                {$count1=1}{$colPerRow = count($col_tile)}{$count2=1}{$count3=1}{$count4=1}{$count5=1}{$count6=1}{$count7=1}
                {foreach $data_array as $key=>$value}
                    {$value.group = null} {$value.type = null} 
                    {foreach $value as $key1=>$value1}
                        {foreach $value1 as $key2=>$value2}
                            <tr>
                                {foreach $value2 as $key2=>$value3}
                                    {foreach $value3 as $key4=>$value4}                                                                
                                        {if is_array($value4)} 
                                            {foreach $value4 as $key5=>$value5}
                                                {if is_array($value5)} 

                                                    {foreach $value5 as $key6=>$value6}
                                                        {if is_array($value6)}                                                                                                     
                                                            {foreach $value6 as $key7=>$value7}                                                                                                            
                                                                {if is_array($value7)} 
                                                                    {foreach $value7 as $key8=>$value8}
                                                                        {if is_array($value8)}
                                                                            {foreach $value8 as $key9=>$value9}
                                                                                {if is_array($value9)}
                                                                                    {foreach $value9 as $key10=>$value10}
                                                                                        {if is_array($value10)}
                                                                                            {foreach $value10 as $key11=>$value11}
                                                                                                {if is_array($value11)}
                                                                                                    {foreach $value11 as $key12=>$value12}
                                                                                                        {if $value12 neq 'Data' && $value12 neq 'Section' && ($key12 neq 'id')}    
                                                                                                            {if $count7 mod $colPerRow eq 1}
                                                                                                            <tr>
                                                                                                            {/if}                                                                                                         
                                                                                                            <td {if is_numeric($value12)} style="text-align:right;"{/if}> {if is_numeric($value12)} {$value12|number_format:2:".":","} {else} {$value12} {/if}</td>

                                                                                                            {if $count7 mod $colPerRow eq 0}  
                                                                                                            </tr>
                                                                                                        {/if}  
                                                                                                        {$count7=$count7+1}
                                                                                                    {/if}
                                                                                                {/foreach}   

                                                                                            {else}
                                                                                                {if $value11 neq 'Data' && $value11 neq 'Section' && ($key11 neq 'id')}    
                                                                                                    {if $count6 mod $colPerRow eq 1}
                                                                                                        <tr>
                                                                                                        {/if}                                                                                                         
                                                                                                        <td {if is_numeric($value11)} style="text-align:right;"{/if}> {if is_numeric($value11)} {$value11|number_format:2:".":","} {else} {$value11} {/if}</td>

                                                                                                        {if $count6 mod $colPerRow eq 0}  
                                                                                                        </tr>
                                                                                                    {/if}  
                                                                                                    {$count6=$count6+1}
                                                                                                {/if}
                                                                                            {/if}
                                                                                        {/foreach}   
                                                                                    {else}
                                                                                        {if $value10 neq 'Data' && $value10 neq 'Section' && ($key10 neq 'id')}    
                                                                                            {if $count5 mod $colPerRow eq 1}
                                                                                                <tr>
                                                                                                {/if}                                                                                                         
                                                                                                <td {if is_numeric($value10)} style="text-align:right;"{/if}> {if is_numeric($value10)} {$value10|number_format:2:".":","} {else} {$value10} {/if}</td>

                                                                                                {if $count5 mod $colPerRow eq 0}  
                                                                                                </tr>
                                                                                            {/if}  
                                                                                            {$count5=$count5+1}
                                                                                        {/if}
                                                                                    {/if}                                                                                                                                                               
                                                                                {/foreach}                                                                                                                                                     
                                                                            {else}
                                                                                {if $value9 neq 'Data' && $value9 neq 'Section' && ($key9 neq 'id')}    
                                                                                    {if $count4 mod $colPerRow eq 1}
                                                                                        <tr>
                                                                                        {/if}                                                                                                         
                                                                                        <td {if is_numeric($value9)} style="text-align:right;"{/if}> {if is_numeric($value9)} {$value9|number_format:2:".":","} {else} {$value9} {/if}</td>

                                                                                        {if $count4 mod $colPerRow eq 0}  
                                                                                        </tr>
                                                                                    {/if}  
                                                                                    {$count4=$count4+1}
                                                                                {/if}
                                                                            {/if}  
                                                                        {/foreach} 
                                                                    {else}
                                                                        {if $value8 neq 'Data' && $value8 neq 'Section' && ($key8 neq 'id')}    
                                                                            {if $count3 mod $colPerRow eq 1}
                                                                                <tr>
                                                                                {/if}                                                                                                         
                                                                                <td {if is_numeric($value8)} style="text-align:right;"{/if}> {if is_numeric($value8)} {$value8|number_format:2:".":","} {else} {$value8} {/if}</td>

                                                                                {if $count3 mod $colPerRow eq 0}  
                                                                                </tr>
                                                                            {/if}  
                                                                            {$count3=$count3+1}
                                                                        {/if}

                                                                    {/if}  
                                                                {/foreach}   

                                                            {else}
                                                                {if $value7 neq 'Data' && $value7 neq 'Section' && ($key7 neq 'id')}    

                                                                    {if $count2 mod $colPerRow eq 1}
                                                                        <tr>
                                                                        {/if}                                                                                                         
                                                                        <td {if is_numeric($value7)} style="text-align:right;"{/if}> {if is_numeric($value7)} {$value7|number_format:2:".":","} {else} {$value7} {/if}</td>

                                                                        {if $count2 mod $colPerRow eq 0}  
                                                                        </tr>
                                                                    {/if}  
                                                                    {$count2=$count2+1}
                                                                {/if}

                                                            {/if} 
                                                        {/foreach} 

                                                    {else} 
                                                        {if $value6 neq 'Data' && $value6 neq 'Section' && ($key6 neq 'id')}    

                                                            {if $count1 mod $colPerRow eq 1}
                                                                <tr>
                                                                {/if}                                                                                                         
                                                                <td {if is_numeric($value6)} style="text-align:right;"{/if}> {if is_numeric($value6)} {$value6|number_format:2:".":","} {else} {$value6} {/if}</td>

                                                                {if $count1 mod $colPerRow eq 0}  
                                                                </tr>
                                                            {/if}  
                                                            {$count1=$count1+1}
                                                        {/if}
                                                    {/if} 

                                                {/foreach} 
                                            {else}
                                                {if $value5 neq 'Data' && $value5 neq 'Section'}    
                                                <td {if is_numeric($value5)} style="text-align:right;"{/if}> {if is_numeric($value5)} {$value5|number_format:2:".":","} {else} {$value5} {/if}</td>
                                            {/if}
                                        {/if}   
                                    {/foreach}   
                                {else}
                                    {if $value4 neq 'Data' && $value4 neq 'Section'}  
                                        <td {if is_numeric($value4)} style="text-align:right;"{/if}> {if is_numeric($value4)} {$value4|number_format:2:".":","} {else} {$value4} {/if}</td>
                                    {/if}  
                                {/if}
                            {/foreach}    
                        {/foreach}   
                    </tr>
                {/foreach}    
            {/foreach}    
        {/foreach}    
    </tbody>
</table> 
{else}
    <center><br/><br/> <b>No data Found.</b></center>
    {/if}                                      

{/if}    


{if isset($income_col_tile)}

    <table class="table table-bordered tile pltable" id="Income" style="min-width:600px;max-width:1000px;">
        <thead>
            <tr>  
                {foreach $income_col_tile as $key=>$value} 
                    <th style="text-align:center !important;">{$value}</th>                                                               
                    {/foreach}  
                    {$income_count = 0}
        <tbody> 

            {foreach $income_data as $key=>$value}
                {$value.group = null} {$value.type = null} 
                {foreach $value as $key1=>$value1}
                    {if $value1[1]["value"] eq  'Unpaid' || $value1[1]["value"] eq  'Paid'} 
                        <tr>
                            {foreach $value1 as $key2=>$value2}
                                <td {if is_numeric({$value2["value"]})} style="text-align:right;"{/if}>{if is_numeric($value2["value"])} {$value2["value"]|number_format:2:".":","} {else} {$value2["value"]} {/if}{$income_count = $income_count+1}</td>

                            {/foreach}
                        </tr> 
                    {/if}    
                {/foreach}
            {/foreach}

        </tbody>

    </thead> 
</table> 
{if $income_count eq '0'}
    <center><br/><br/> <b>No data Found.</b></center>
    {/if}     

{/if}    



{if isset($caseflow)}
    {if $caseflow} 
        <table class="table table-bordered tile pltable" id="caseflow" style="min-width:600px;max-width:1000px;">
            <thead>
                <tr>  
                    {foreach $caseflow_tile as $key=>$value} 
                        <th style="text-align:center !important;">{$value}</th>                                                               
                        {/foreach}   
                </tr>
            </thead>    

            <tbody> 
                {$count1=1}{$colPerRow = count($caseflow_tile)}{$count2=1}{$count3=1}{$count4=1}{$count5=1}{$count6=1}{$count7=1}{$count8=1}{$count9=1}{$count10=1}
                {foreach $caseflow as $key=>$value}
                    {$value.group = null} {$value.type = null} 
                    {foreach $value as $key1=>$value1}
                        <tr>
                            {foreach $value1 as $key2=>$value2}
                                {foreach $value2 as $key3=>$value3}                                                                                      
                                    {if is_array($value3)}
                                        {foreach $value3 as $key4=>$value4} 
                                            {if is_array($value4)}
                                                {foreach $value4 as $key5=>$value5}
                                                    {if is_array($value5)}
                                                        {foreach $value5 as $key6=>$value6}  
                                                            {if is_array($value6)}
                                                                {foreach $value6 as $key7=>$value7}
                                                                    {if is_array($value7)}     
                                                                        {foreach $value7 as $key8=>$value8}
                                                                            {if is_array($value8)}
                                                                                {foreach $value8 as $key9=>$value9}   
                                                                                    {if is_array($value9)}
                                                                                        {$value9}

                                                                                    {else}
                                                                                        {if $key9 eq 'value'}
                                                                                            {if $count4 mod $colPerRow eq 1}
                                                                                            <tr>
                                                                                            {/if}                                                                                                         
                                                                                            <td {if is_numeric($value9)} style="text-align:right;"{/if}> {if is_numeric($value9)} {$value9|number_format:2:".":","} {else} {$value9} {/if}</td>
                                                                                            {if $count4 mod $colPerRow eq 0}  
                                                                                            </tr>
                                                                                        {/if}  
                                                                                        {$count4=$count4+1}
                                                                                    {/if}
                                                                                {/if}

                                                                            {/foreach}
                                                                        {else}
                                                                            {if $key8 eq 'value'}
                                                                                {if $count3 mod $colPerRow eq 1}
                                                                                    <tr>
                                                                                    {/if}                                                                                                         
                                                                                    <td {if is_numeric($value8)} style="text-align:right;"{/if}> {if is_numeric($value8)} {$value8|number_format:2:".":","} {else} {$value8} {/if}</td>

                                                                                    {if $count3 mod $colPerRow eq 0}  
                                                                                    </tr>
                                                                                {/if}  
                                                                                {$count3=$count3+1}
                                                                            {/if}
                                                                        {/if}

                                                                    {/foreach}   
                                                                {else}
                                                                    {if $key7 eq 'value'}
                                                                        {if $count2 mod $colPerRow eq 1}
                                                                            <tr>
                                                                            {/if}                                                                                                         
                                                                            <td {if is_numeric($value7)} style="text-align:right;"{/if}> {if is_numeric($value7)} {$value7|number_format:2:".":","} {else} {$value7} {/if}</td>

                                                                            {if $count2 mod $colPerRow eq 0}  
                                                                            </tr>
                                                                        {/if}  
                                                                        {$count2=$count2+1}
                                                                    {/if}
                                                                {/if}
                                                            {/foreach}
                                                        {else}
                                                            {if $key6 eq 'value'}
                                                                {if $count1 mod $colPerRow eq 1}
                                                                    <tr>
                                                                    {/if}                                                                                                         
                                                                    <td {if is_numeric($value6)} style="text-align:right;"{/if}> {if is_numeric($value6)} {$value6|number_format:2:".":","} {else} {$value6} {/if}</td>

                                                                    {if $count1 mod $colPerRow eq 0}  
                                                                    </tr>
                                                                {/if}  
                                                                {$count1=$count1+1}
                                                            {/if}
                                                        {/if}
                                                    {/foreach} 
                                                {else}
                                                    {if $key5 eq 'value'}     
                                                    <td {if is_numeric($value5)} style="text-align:right;"{/if}> {if is_numeric($value5)} {$value5|number_format:2:".":","} {else} {$value5} {/if}</td>
                                                {/if}
                                            {/if}    
                                        {/foreach}    

                                    {else}    

                                        {if $key4 eq 'value'}     
                                            <td {if is_numeric($value4)} style="text-align:right;"{/if}> {if is_numeric($value4)} {$value4|number_format:2:".":","} {else} {$value4} {/if}</td>
                                        {/if}
                                    {/if}   
                                {/foreach}   

                            {else}
                                {if $key3 eq 'value'}     
                                    <td {if is_numeric($value3)} style="text-align:right;"{/if}> {if is_numeric($value3)} {$value3|number_format:2:".":","} {else} {$value3} {/if}</td>
                                {/if} 
                            {/if}
                        {/foreach} 

                    {/foreach}
                </tr> 
            {/foreach}    
        {/foreach}    
    </tbody>

</table>
{else}
    <center><br/><br/> <b>No data Found.</b></center>
    {/if}     

{/if}




{if isset($inventory_val_tile)}
    {if $inventory_val} 
        <table class="table table-bordered tile pltable" id="inventory_val" style="min-width:600px;max-width:1000px;">
            <thead>
                <tr>  
                    {foreach $inventory_val_tile as $key=>$value} 
                        <th style="text-align:center !important;">{$value}</th>                                                               
                        {/foreach}   
                </tr>
            </thead>    

            <tbody> 
                {$count1=1}{$colPerRow = count($inventory_val_tile)}{$count2=1}{$count3=1}{$count4=1}{$count5=1}{$count6=1}{$count7=1}{$count8=1}{$count9=1}{$count10=1}
                {foreach $inventory_val as $key=>$value}
                    {$value.group = null} {$value.type = null} 
                    {foreach $value as $key1=>$value1}
                        <tr>
                            {foreach $value1 as $key2=>$value2}
                                {foreach $value2 as $key3=>$value3}                                                                                      
                                    {if is_array($value3)}
                                        {foreach $value3 as $key4=>$value4} 
                                            {if is_array($value4)}
                                                {foreach $value4 as $key5=>$value5}
                                                    {if is_array($value5)}
                                                        {foreach $value5 as $key6=>$value6}  
                                                            {if is_array($value6)}
                                                                {foreach $value6 as $key7=>$value7}
                                                                    {if is_array($value7)}     
                                                                        {foreach $value7 as $key8=>$value8}
                                                                            {if is_array($value8)}
                                                                                {foreach $value8 as $key9=>$value9}   
                                                                                    {if is_array($value9)}
                                                                                        {$value9}

                                                                                    {else}
                                                                                        {if $key9 eq 'value'}
                                                                                            {if $count4 mod $colPerRow eq 1}
                                                                                            <tr>
                                                                                            {/if}                                                                                                         
                                                                                            <td {if is_numeric($value9)} style="text-align:right;"{/if}> {if is_numeric($value9)} {$value9|number_format:2:".":","} {else} {$value9} {/if}</td>
                                                                                            {if $count4 mod $colPerRow eq 0}  
                                                                                            </tr>
                                                                                        {/if}  
                                                                                        {$count4=$count4+1}
                                                                                    {/if}
                                                                                {/if}

                                                                            {/foreach}
                                                                        {else}
                                                                            {if $key8 eq 'value'}
                                                                                {if $count3 mod $colPerRow eq 1}
                                                                                    <tr>
                                                                                    {/if}                                                                                                         
                                                                                    <td {if is_numeric($value8)} style="text-align:right;"{/if}> {if is_numeric($value8)} {$value8|number_format:2:".":","} {else} {$value8} {/if}</td>

                                                                                    {if $count3 mod $colPerRow eq 0}  
                                                                                    </tr>
                                                                                {/if}  
                                                                                {$count3=$count3+1}
                                                                            {/if}
                                                                        {/if}

                                                                    {/foreach}   
                                                                {else}
                                                                    {if $key7 eq 'value'}
                                                                        {if $count2 mod $colPerRow eq 1}
                                                                            <tr>
                                                                            {/if}                                                                                                         
                                                                            <td {if is_numeric($value7)} style="text-align:right;"{/if}> {if is_numeric($value7)} {$value7|number_format:2:".":","} {else} {$value7} {/if}</td>

                                                                            {if $count2 mod $colPerRow eq 0}  
                                                                            </tr>
                                                                        {/if}  
                                                                        {$count2=$count2+1}
                                                                    {/if}
                                                                {/if}
                                                            {/foreach}
                                                        {else}
                                                            {if $key6 eq 'value'}
                                                                {if $count1 mod $colPerRow eq 1}
                                                                    <tr>
                                                                    {/if}                                                                                                         
                                                                    <td {if is_numeric($value6)} style="text-align:right;"{/if}> {if is_numeric($value6)} {$value6|number_format:2:".":","} {else} {$value6} {/if}</td>

                                                                    {if $count1 mod $colPerRow eq 0}  
                                                                    </tr>
                                                                {/if}  
                                                                {$count1=$count1+1}
                                                            {/if}
                                                        {/if}
                                                    {/foreach} 
                                                {else}
                                                    {if $key5 eq 'value'}     
                                                    <td {if is_numeric($value5)} style="text-align:right;"{/if}> {if is_numeric($value5)} {$value5|number_format:2:".":","} {else} {$value5} {/if}</td>
                                                {/if}
                                            {/if}    
                                        {/foreach}    

                                    {else}    

                                        {if $key4 eq 'value'}     
                                            <td {if is_numeric($value4)} style="text-align:right;"{/if}> {if is_numeric($value4)} {$value4|number_format:2:".":","} {else} {$value4} {/if}</td>
                                        {/if}
                                    {/if}   
                                {/foreach}   

                            {else}
                                {if $key3 eq 'value'}     
                                    <td {if is_numeric($value3)} style="text-align:right;"{/if}> {if is_numeric($value3)} {$value3|number_format:2:".":","} {else} {$value3} {/if}</td>
                                {/if} 
                            {/if}
                        {/foreach} 

                    {/foreach}
                </tr> 
            {/foreach}    
        {/foreach}    
    </tbody>

</table>

{else}
    <center><br/><br/> <b>No data Found.</b></center>
    {/if}  

{/if}




{if isset($sales_customer)}
    {if $sales_customer} 
        <table class="table table-bordered tile pltable" id="salesbycustomer" style="min-width:600px;max-width:1000px;">
            <thead>
                <tr>  
                    {foreach $sales_customer_tile as $key=>$value} 
                        <th style="text-align:center !important;">{$value}</th>                                                               
                        {/foreach}   
                </tr>
            </thead>    

            <tbody> 
                {$count1=1}{$colPerRow = count($sales_customer_tile)}{$count2=1}{$count3=1}{$count4=1}{$count5=1}{$count6=1}{$count7=1}{$count8=1}{$count9=1}{$count10=1}
                {foreach $sales_customer as $key=>$value}
                    {$value.group = null} {$value.type = null} 
                    {foreach $value as $key1=>$value1}
                        <tr>
                            {foreach $value1 as $key2=>$value2}
                                {foreach $value2 as $key3=>$value3}                                                                                      
                                    {if is_array($value3)}
                                        {foreach $value3 as $key4=>$value4} 
                                            {if is_array($value4)}
                                                {foreach $value4 as $key5=>$value5}
                                                    {if is_array($value5)}
                                                        {foreach $value5 as $key6=>$value6}  
                                                            {if is_array($value6)}
                                                                {foreach $value6 as $key7=>$value7}
                                                                    {if is_array($value7)}     
                                                                        {foreach $value7 as $key8=>$value8}
                                                                            {if is_array($value8)}
                                                                                {foreach $value8 as $key9=>$value9}   
                                                                                    {if is_array($value9)}
                                                                                        {$value9}

                                                                                    {else}
                                                                                        {if $key9 eq 'value'}
                                                                                            {if $count4 mod $colPerRow eq 1}
                                                                                            <tr>
                                                                                            {/if}                                                                                                         
                                                                                            <td {if is_numeric($value9)} style="text-align:right;"{/if}> {if is_numeric($value9)} {$value9|number_format:2:".":","} {else} {$value9} {/if}</td>
                                                                                            {if $count4 mod $colPerRow eq 0}  
                                                                                            </tr>
                                                                                        {/if}  
                                                                                        {$count4=$count4+1}
                                                                                    {/if}
                                                                                {/if}

                                                                            {/foreach}
                                                                        {else}
                                                                            {if $key8 eq 'value'}
                                                                                {if $count3 mod $colPerRow eq 1}
                                                                                    <tr>
                                                                                    {/if}                                                                                                         
                                                                                    <td {if is_numeric($value8)} style="text-align:right;"{/if}> {if is_numeric($value8)} {$value8|number_format:2:".":","} {else} {$value8} {/if}</td>

                                                                                    {if $count3 mod $colPerRow eq 0}  
                                                                                    </tr>
                                                                                {/if}  
                                                                                {$count3=$count3+1}
                                                                            {/if}
                                                                        {/if}

                                                                    {/foreach}   
                                                                {else}
                                                                    {if $key7 eq 'value'}
                                                                        {if $count2 mod $colPerRow eq 1}
                                                                            <tr>
                                                                            {/if}                                                                                                         
                                                                            <td {if is_numeric($value7)} style="text-align:right;"{/if}> {if is_numeric($value7)} {$value7|number_format:2:".":","} {else} {$value7} {/if}</td>

                                                                            {if $count2 mod $colPerRow eq 0}  
                                                                            </tr>
                                                                        {/if}  
                                                                        {$count2=$count2+1}
                                                                    {/if}
                                                                {/if}
                                                            {/foreach}
                                                        {else}
                                                            {if $key6 eq 'value'}
                                                                {if $count1 mod $colPerRow eq 1}
                                                                    <tr>
                                                                    {/if}                                                                                                         
                                                                    <td {if is_numeric($value6)} style="text-align:right;"{/if}> {if is_numeric($value6)} {$value6|number_format:2:".":","} {else} {$value6} {/if}</td>

                                                                    {if $count1 mod $colPerRow eq 0}  
                                                                    </tr>
                                                                {/if}  
                                                                {$count1=$count1+1}
                                                            {/if}
                                                        {/if}
                                                    {/foreach} 
                                                {else}
                                                    {if $key5 eq 'value'}     
                                                    <td {if is_numeric($value5)} style="text-align:right;"{/if}> {if is_numeric($value5)} {$value5|number_format:2:".":","} {else} {$value5} {/if}</td>
                                                {/if}
                                            {/if}    
                                        {/foreach}    

                                    {else}    

                                        {if $key4 eq 'value'}     
                                            <td {if is_numeric($value4)} style="text-align:right;"{/if}> {if is_numeric($value4)} {$value4|number_format:2:".":","} {else} {$value4} {/if}</td>
                                        {/if}
                                    {/if}   
                                {/foreach}   

                            {else}
                                {if $key3 eq 'value'}     
                                    <td {if is_numeric($value3)} style="text-align:right;"{/if}> {if is_numeric($value3)} {$value3|number_format:2:".":","} {else} {$value3} {/if}</td>
                                {/if} 
                            {/if}
                        {/foreach} 

                    {/foreach}
                </tr> 
            {/foreach}    
        {/foreach}    
    </tbody>

</table>
{else}
    <center><br/><br/> <b>No data Found.</b></center>
    {/if}  


{/if}




{if isset($chartValue)}

    {if $chartType eq 'line'}  

        {if !$chartHeader}
            <center>   No chart found. </center>
            {else}    
            <script type="text/javascript">

                var chartValue = '{$chartValue}';
                var chartHeader = '{$chartHeader}';

                {literal}
                    /* --------------------------------------------------------
                     Flot Charts
                     -----------------------------------------------------------*/

                    //Line Chart
                    $(function () {
                        chartValue = JSON.parse(chartValue);
                        if ($('#chart-line')[0]) {
                            $.plot('#chart-line', [{data: chartValue, label: chartHeader}],
                                    {
                                        series: {
                                            lines: {
                                                show: true,
                                                lineWidth: 1,
                                                fill: 0.25,
                                            },

                                            color: 'rgba(255,255,255,0.8)',
                                            shadowSize: 0,
                                            points: {
                                                show: true,
                                            }
                                        },

                                        yaxis: {
                                            tickColor: 'rgba(255,255,255,0.15)',
                                            tickDecimals: 0,
                                            font: {
                                                lineHeight: 13,
                                                style: "normal",
                                                color: "rgba(255,255,255,0.8)",
                                            },
                                            shadowSize: 0,
                                        },
                                        xaxis: {
                                            mode: "categories",
                                            tickColor: 'rgba(255,255,255,0)',
                                            tickDecimals: 0,
                                            font: {
                                                lineHeight: 13,
                                                style: "normal",
                                                color: "rgba(255,255,255,0.8)",
                                            }
                                        },
                                        grid: {
                                            borderWidth: 1,
                                            borderColor: 'rgba(255,255,255,0.25)',
                                            labelMargin: 10,
                                            hoverable: true,
                                            clickable: true,
                                            mouseActiveRadius: 6,
                                        },
                                        legend: {
                                            show: false
                                        }
                                    });

                            $("#chart-line").bind("plothover", function (event, pos, item) {
                                if (item) {
                                    var x = item.datapoint[0].toFixed(2),
                                            y = item.datapoint[1].toFixed(2);
                                    $("#linechart-tooltip").html(item.series.label + " of " + chartValue[Math.ceil(x)][0] + " = " + Math.ceil(y)).css({top: item.pageY + 5, left: item.pageX + 5}).fadeIn(200);
                                } else {
                                    $("#linechart-tooltip").hide();
                                }
                            });

                            $("<div id='linechart-tooltip' class='chart-tooltip'></div>").appendTo("body");
                        }

                    });
                {/literal}        
            </script>
        {/if}  


    {else}

        {if !$chartHeader}
            <center>   No chart found. </center>
            {else}    
            <script type="text/javascript">

                var chartValue = '{$chartValue}';
                var chartHeader = '{$chartHeader}';

                {literal}

                    if ($("#chart-bar")[0]) {
                        chartValue = JSON.parse(chartValue);

                        var yaxisValue = new Array();
                        var xaxisValue = new Array();

                        for (var i = 0; i < chartValue.length; i++)
                        {
                            yaxisValue[i] = new Array();
                            xaxisValue[i] = new Array();

                            yaxisValue[i][0] = i;
                            yaxisValue[i][1] = chartValue[i][1];

                            xaxisValue[i][0] = i;
                            xaxisValue[i][1] = chartValue[i][0];
                        }

                        var data1 = yaxisValue;
                        var barData = new Array();

                        barData.push({
                            data: data1,
                            label: chartHeader,
                            bars: {
                                show: true,
                                barWidth: 0.5,
                                order: 1,
                                fill: 1,
                                lineWidth: 0,
                                fillColor: 'rgba(255,255,255,0.6)'
                            }
                        });


                        //Display graph
                        $.plot($("#chart-bar"), barData, {

                            grid: {
                                borderWidth: 1,
                                borderColor: 'rgba(255,255,255,0.25)',
                                show: true,
                                hoverable: true,
                                clickable: true,
                            },

                            yaxis: {
                                tickColor: 'rgba(255,255,255,0.15)',
                                tickDecimals: 0,

                                font: {
                                    lineHeight: 13,
                                    style: "normal",
                                    color: "rgba(255,255,255,0.8)",
                                },
                                shadowSize: 0,
                            },

                            xaxis: {
                                tickColor: 'rgba(255,255,255,0)',
                                tickDecimals: 0,
                                ticks: xaxisValue,
                                font: {
                                    lineHeight: 13,
                                    style: "normal",
                                    color: "rgba(255,255,255,0.8)",
                                },
                                shadowSize: 0,
                            },

                            legend: true,
                            tooltip: true,
                            tooltipOpts: {
                                content: "<b>%x</b> = <span>%y</span>",
                                defaultTheme: false
                            }

                        });

                        $("#chart-bar").bind("plothover", function (event, pos, item) {
                            if (item) {
                                var x = item.datapoint[0].toFixed(2),
                                        y = item.datapoint[1].toFixed(2);
                                $("#barchart-tooltip").html(item.series.label + " of " + xaxisValue[Math.ceil(x)][1] + " = " + y).css({top: item.pageY + 5, left: item.pageX + 5}).fadeIn(200);
                            } else {
                                $("#barchart-tooltip").hide();
                            }
                        });

                        $("<div id='barchart-tooltip' class='chart-tooltip'></div>").appendTo("body");

                    }

                {/literal}        
            </script>

        {/if}
    {/if}
{/if}    



{if isset($realemId_Array)}
    {if $realemId_Array}

        {foreach $realemId_Array as $key=>$value}
            <option value="{$pid_Array[$key]}" {if $smarty.session.active_company_pid eq $pid_Array[$key]} selected="selected" {/if}>{$value}</option>
        {/foreach}

    {else}
        No companies found.
    {/if}

    <script type="text/javascript">
        {literal} 
        function switchCompany_info(changeCompanyId)
        {
            var changeCompanyId = $("#switch_company_list option:selected").val();
            $.post("ChangeQBOList", {"changeCompanyId": changeCompanyId}, function (data) {
                window.location.href = window.location.href;
            });
        }
        {/literal}
    </script>
{/if}



{if isset($Institution)}

    {foreach $Institution as $key=>$value}  
        <tr>
            <td>{$value["name"]}</td>
            <td>{$value["accountTypeDescription"]}</td>
            <td><a href=# onclick="bankLoginform('{$value["id"]}', '{$value["name"]}')">Login</a></td>
        </tr>
    {/foreach}   

{/if}   

{if isset($getloginformDatas)}
    {foreach $getloginformDatas as $key=>$value}
        {if $getloginformDatas[$key]['mask'] eq 'true'}
            <div class="form-group">
                <label>
                    {$getloginformDatas[$key]['description']}
                    <input type="password" class="form-control input-sm" name="loginForm[{$key}][value]" autocomplete="off">
                </label>
            </div>
            <input type="hidden" name="loginForm[{$key}][id]" value="{$getloginformDatas[$key]['id']}">
            <input type="hidden" name="loginForm[{$key}][name]" value="{$getloginformDatas[$key]['name']}">
        {else}

            <div class="form-group">
                <label>
                    {$getloginformDatas[$key]['description']}
                    <input type="text" class="form-control input-sm" name="loginForm[{$key}][value]" autocomplete="off">
                </label>
            </div>

            <input type="hidden" name="loginForm[{$key}][id]" value="{$getloginformDatas[$key]['id']}">
            <input type="hidden" name="loginForm[{$key}][name]" value="{$getloginformDatas[$key]['name']}">

        {/if}

    {/foreach}
    <div class="modal-footer">
        <input type="button" class="btn btn-sm" value="Login" onclick="return institutionFormdataAggrication();">
    </div>

{/if}



{if isset($customer_data)}
    {foreach $customer_data as $key=>$value}

        {if $value["type"] eq 'savings' || $value["type"] eq 'checking' || $value["type"] eq 'unknown'} 
            <a onclick="viewCustomerTransaction('{$value["id"]}', '{$current_user_id}')" id="{$value["id"]}_account_details" class="tile report-legend_custom" style="cursor:pointer" title="{$value["name"]}">
                <span class="icon" style="font-size:23px;">&#61817;</span>
                Savings & Checking 
                <i class="social-count animated">{$value["balance"]}</i> 

            </a>
        {elseif $value["type"] eq 'investment' || $value["type"] eq 'cd'}                

            <a onclick="viewCustomerTransaction('{$value["id"]}', '{$current_user_id}')" id="{$value["id"]}_account_details" class="tile report-legend_custom" style="cursor:pointer" title="{$value["name"]}">
                <span class="icon" style="font-size:23px;">&#61872;</span>
                Investment accounts
                <i class="social-count animated">{$value["balance"]}</i>


            </a>
        {elseif $value["type"] eq 'creditCard' || $value["type"] eq 'lineOfCredit'}     
            <a onclick="viewCustomerTransaction('{$value["id"]}', '{$current_user_id}')" id="{$value["id"]}_account_details" class="tile report-legend_custom" style="cursor:pointer" title="{$value["name"]}">
                <span class="icon" style="font-size:23px;">&#61938;</span>
                Credit accounts 
                <i class="social-count animated">{$value["balance"]}</i>

            </a>
        {elseif  $value["type"] eq 'mortgage' || $value["type"] eq 'loan'}     
            <a onclick="viewCustomerTransaction('{$value["id"]}', '{$current_user_id}')" id="{$value["id"]}_account_details" class="tile report-legend_custom" style="cursor:pointer" title="{$value["name"]}">
                <img src="{$smarty.const.IMAGESLOCATION}icons-new/graph-01.png" alt="">
                Loans
                <i class="social-count animated">{$value["balance"]}</i>

            </a>
        {elseif $value["type"] eq 'moneyMarket'}         
            <a onclick="viewCustomerTransaction('{$value["id"]}', '{$current_user_id}')" id="{$value["id"]}_account_details" class="tile report-legend_custom" style="cursor:pointer" title="{$value["name"]}">
                <span class="icon" style="font-size:23px;">&#61889;</span>
                Market account
                <i class="social-count animated">{$value["balance"]}</i>

            </a>
        {/if}    
    {/foreach}
    <input id="first_customer_id" type="hidden" value="{$smarty.session.first_customer_id}">
    <input id="curr_usr_id" type="hidden" value="{$smarty.session.current_user_id}">
{/if}

{if isset($transactions)}
    <b><label style="display:none;" id="account_lable_info"></label></b>
    <table class="table table-bordered tile" style="min-width:500px;max-width:1185px;" id="transaction_details_table">
        <thead>
            <tr>  
                <th style="text-align:center !important;">ID</th>  
                <th style="text-align:center !important;">Amount</th>
                <th style="text-align:center !important;">Status</th>
                <th style="text-align:center !important;">Description</th>
                <th style="text-align:center !important;">Type</th>
                <th style="text-align:center !important;">Posted Date</th>  
                <th style="text-align:center !important;">Created Date</th>   

            </tr>
        </thead> 
        {if $transactions}    
            <tbody> 
                {foreach $transactions as $key=>$value} 
                    <tr> 
                        <td>{$value["id"]}</td> 
                        <td>{$value["amount"]}</td>
                        <td>{$value["status"]}</td>
                        <td>{$value["description"]}</td>
                        <td>{$value["type"]}</td>
                        <td>{$value["postedDate"]|date_format:"%d/%m/%Y %r"}</td>
                        <td>{$value["createdDate"]|date_format:"%d/%m/%Y %r"}</td>                
                    </tr>
                {/foreach} 
            </tbody>
        {else}
            <tbody> 
                <tr><td colspan="7" align="center"> Transactions not found.</td></tr>
                </body>
        {/if}    
    </table>
{/if}