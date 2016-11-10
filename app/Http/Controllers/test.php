<?php
// header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Origin, Content-Type, X-CSRF-TOKEN, X-Auth-Token');
// echo app_path();

// $obj = new test1();
// echo $name . " plus this";
return view('page.index');

// echo $obj->test11();
// echo $_POST['plugin'];
exit();
