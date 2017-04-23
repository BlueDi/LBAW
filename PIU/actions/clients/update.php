<?php

 include_once('../../config/init.php');
 include_once($BASE_DIR .'database/clients.php');
 


            $username=$_POST['username'];
			$password=$_POST['password'];
            $email=$_POST['email'];
            $date=$_POST['bdate'];
            $address=$_POST['Address'];
            $phonenr=$_POST['Phone_Number'];


if($_POST['username']){
    change_username($username, $_SESSION['iduser']);
}
if($_POST['password']){
    change_password($password, $_SESSION['iduser']);
}
if($_POST['email']){
    change_email($email, $_SESSION['iduser']);
}
if($_POST['bdate']){
    change_birthDate($date, $_SESSION['iduser']);
}

if($_POST['Address']){
    change_address($address, $_SESSION['iduser']);
}
if($_POST['Phone_Number']){
    change_phone($phonenr, $_SESSION['iduser']);
}


                $redirectUrl = $BASE_PIU.'pages/profile.php';
				echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';
            





?>