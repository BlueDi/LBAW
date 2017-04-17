<?php
include_once('../../config/init.php');
include("../../database/clients.php");
			$username=$_POST['Username'];
			$password=$_POST['Password'];

            

            if(isLoginCorrect($username,$password)){
                
				$_SESSION['login_user'] = $username;
                echo'<script language="javascript">';
				echo 'alert("Correct username and/or password.")';
                echo '</script>';
                $redirectUrl = '../../products.php';
				echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';
                
            }
            
            else{
                echo'<script language="javascript">';
				echo 'alert("inCorrect username and/or password.")';
				echo '</script>';
                $redirectUrl = 'products.php';
				echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';
                
            }


			/*$stmt =$db->prepare('SELECT password,idUser FROM client WHERE username = :user LIMIT 1');
			$stmt->bindParam(':user', $username);
			$stmt->execute();
			$chiclas = $stmt->fetch();
			$pwdhash= crypt($password,$chiclas['salt']);
			
			
			// Hashing the password with its hash as the salt returns the same hash
			if($pwdhash == $chiclas['password']){
				$_SESSION['id_user']=$chiclas['idUser'];
				$_SESSION['login_user'] = $username;            	// store the username
				echo'<script language="javascript">';
				echo 'alert("Correct username and/or password.")';
				echo '</script>';
				$redirectUrl = 'profile.php';
				echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';
				//header("location: index.php"); // Redirecting To Other Page
			} else {
				$error = "Username or Password is invalid";
				echo'<script language="javascript">';
				echo 'alert("Incorrect username and/or password.")';
				echo '</script>';
				$redirectUrl = 'index.php';
				echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';
 			}
		}
*/


?>
