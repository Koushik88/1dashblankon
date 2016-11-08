{*
#*******************************************************************#
#		Global Basics Inc ::  Index  Page                   #
#*******************************************************************#

    Document       : Index page
    Created on     : 24-06-2016
    Author         : Ponnar V
    Description    : Index Page - Templates contains for header,footer,general   
    Last Edited on : 24-06-2016
    Last Edited by : Ponnar V
*}

<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie9"><![endif]-->
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <meta name="format-detection" content="telephone=no">
        <meta charset="UTF-8">
        <meta name="csrf-token" content="{$csrf_token}">
        <meta name="description" content="Violate Responsive Admin Template">
        <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">
        <link rel="shortcut icon" href="{$smarty.const.IMAGESLOCATION}/favicon.png" type="image/x-icon" /> 
        <title>{$smarty.const.title}{$pageTitle nocache}</title>
        {include 'general/css-js-general.tpl' nocache}
        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
 <body {if $smarty.session.temeId} id="{$smarty.session.temeId}" {else} id="skin-blur-shaded" {/if}>
   
{*{include 'general/header.tpl' nocache}*}
{include 'general/content-general.tpl' menus=$menus|default:0 nocache}


    {* uipackage element initialize template *}
   <!-- {include 'general/init.ui.tpl' nocache}
    {include 'page/pageViewDetail.tpl' nocache} -->


{*{include 'general/footer.tpl' nocache}*}
</body>
</html>
