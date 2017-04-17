<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/clients.php');  

  if (!$_POST['Username'] || !$_POST['Realname'] || !$_POST['Password'] || !$_POST['Email'] || !$_POST['Address'] ||!$_POST['bdate']) {
    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/register.php');
    exit;
  }

  $realname = strip_tags($_POST['Realname']);
  $username = strip_tags($_POST['Username']);
  $email =  $_POST['Email'];
  $password = $_POST['Password'];
  $bdate =  $_POST['bdate'];
  $address = $_POST['Address'];

  $photo = $_FILES['photo'];
  $extension = end(explode(".", $photo["name"]));

  try {
    createClient($realname, $username, $password,$email,$bdate,$address,$nif,$admin,$phonenr);
    move_uploaded_file($photo["tmp_name"], $BASE_DIR . "images/users/" . $username . '.' . $extension); // this is dangerous
    chmod($BASE_DIR . "images/users/" . $username . '.' . $extension, 0644);
  } catch (PDOException $e) {
  
    if (strpos($e->getMessage(), 'users_pkey') !== false) {
      $_SESSION['error_messages'][] = 'Duplicate username';
      $_SESSION['field_errors']['username'] = 'Username already exists';
    }
    else $_SESSION['error_messages'][] = 'Error creating user';

    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/register.php');
    exit;
  }
  $_SESSION['success_messages'][] = 'User registered successfully';  
  header("Location: $BASE_URL");
?>
