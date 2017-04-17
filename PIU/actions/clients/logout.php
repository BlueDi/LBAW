<?php
  include_once($BASE_DIR .'/config/init.php');
  
  session_destroy();
  
  header('Location: ' . $BASE_URL);
?>
