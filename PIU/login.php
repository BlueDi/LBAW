<?php include("templates/header.html");?>
<?php include("templates/login.html");?>
<?php 

			$username=$_POST['user'];
			$password=$_POST['pass'];
			$stmt =$db->prepare('SELECT password,idUser FROM client WHERE username = :user LIMIT 1');
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
	
?>


<?php include("templates/footer.html");?>
