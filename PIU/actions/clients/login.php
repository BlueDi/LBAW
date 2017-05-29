<?php
include_once('../../config/init.php');
include($BASE_DIR.'/database/clients.php');
			$username=$_POST['Username'];
			$password=$_POST['Password'];

            

            if(isLoginCorrect($username,$password)==true){
                
				$_SESSION['login_user'] = $username;
                $_SESSION['iduser']= isLoginCorrect($username,$password)['iduser'];
                
                $_SESSION['admin']=isLoginCorrect($username,$password)['admin'];
                $redirectUrl = $BASE_PIU.'pages/products.php';
				echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';
                
            }
            
            else{
               
                $redirectUrl = $BASE_PIU.'pages/login.php';
				echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';
                
            }



?>
