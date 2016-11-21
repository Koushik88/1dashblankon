
<?php
  // setting up session
  /* note: This is not a secure way to store oAuth tokens. You should use a secure
  *     data sore. We use this for simplicity in this example.
  */
  //session_save_path('/tmp');
   ini_set('session.save_path',realpath(dirname($_SERVER['DOCUMENT_ROOT']) . '/../session'));
  session_start();

  define('OAUTH_CONSUMER_KEY', 'qyprd1NN1kHiN9QXEMlz0fLLvMgEKi');
  define('OAUTH_CONSUMER_SECRET', 'vBn6g62fNX3t952i5NDvholn3zkwg6nPKmdS6LZU');
  
  
  if(strlen(OAUTH_CONSUMER_KEY) < 5 OR strlen(OAUTH_CONSUMER_SECRET) < 5 ){
    echo "<h3>Set the consumer key and secret in the config.php file before you run this example</h3>";
  }
  
 ?>
