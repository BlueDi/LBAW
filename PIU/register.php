<?php include("templates/header.html");?>
<?php include("templates/login.html");?>
<?php include_once('../../config/init.php');	
	

	$User = $_POST['username'];
	$Pass = $_POST['password'];
	$Name= $_POST['name'];
	$Email = $_POST['email'];
	$Date = $_POST['date_of_birth'];
	$Image="img/profile_default.jpg";
	$Usercheck=$User;
	$cost = 5;
	
	$hash = hash("sha256", $Pass ,true);
	$bool = 0;
	
	$db1=new PDO('sqlite:DB.db');
	$stmt1 = $db1->prepare('SELECT idUser FROM Client WHERE username = :usertest LIMIT 1');
	$stmt1->bindParam(':usertest',$Usercheck);
	$stmt1->execute();
	$result1 = $stmt1->fetch();


if (empty($result1['idUser'])){	
	$stmt =$db->prepare('INSERT INTO Users(username,password,salt,nome,email,birth_date,image,admin) VALUES(:user,:pass,:salt,:name,:email,:data,:imagecoisa,:admin)');
	$stmt->bindParam(':user',$User); //mais seguro com bindparam supostamente
	$stmt->bindParam(':pass',$hash);
	$stmt->bindParam(':salt',$salt);
	$stmt->bindParam(':name',$Name);
	$stmt->bindParam(':email',$Email);
	$stmt->bindParam(':data',$Date);
	$stmt->bindParam(':imagecoisa',$Image);
	$stmt->bindParam(':admin',$bool);
	$stmt->execute();
	//readfile("index.php");
	$redirectUrl = 'index.php';

    echo '<script type="application/javascript">alert("Registration successful!"); window.location.href = "'.$redirectUrl.'";</script>';
}
else {
	$redirectUrl = 'index.php';

    echo '<script type="application/javascript">alert("Username already exists"); window.location.href = "'.$redirectUrl.'";</script>';

}
?>
<?php include("templates/footer.html");?>