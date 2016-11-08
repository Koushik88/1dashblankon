<!doctype html>
<html lang="en">
<head>
    <title>Hello World</title>
    <link rel="shortcut icon" href="/favicon.png" type="image/x-icon" />
    <meta charset="UTF-8">
    {$style}
</head>
<body>

    <div>
        <h1>Hello {$name|upper}</h1>
    </div>
    <div>
        <h1>Hello {$name1}</h1>
    </div>
    <div>
        <a href="helloworld" target="_blank">Get Developers Names!</a>
    </div>
    <div>
        <a href="/" target="_blank">MAIN PAGE</a>
    </div>
    {$smarty.session.Manigandan}
    {$smarty.const.CONS_MANI}
    {include 'page/index.tpl'}

    
</body>
</html>