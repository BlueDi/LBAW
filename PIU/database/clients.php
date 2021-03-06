<?php

function createClient($realname, $username, $password,$email,$birthdate,$address,$nif,$admin,$phonenr) {
  global $conn;
  $stmt = $conn->prepare("INSERT INTO client VALUES (DEFAULT, ?, ?,?,?,?,?,?,?,?,?)");
  return $stmt->execute(array($realname, sha1($password),$email,$birthdate,$address,$nif,true,'false',$phonenr,$username));
}

function isLoginCorrect($username, $password) {
  global $conn;
  $stmt = $conn->prepare("SELECT *
    FROM client
    WHERE username = ? AND password = ? AND active=true");
  $stmt->execute(array($username, sha1($password)));
  return $stmt->fetch();
}

function getAllClients(){
    global $conn;
    $stmt = $conn->prepare("SELECT *
    FROM client");
    $stmt->execute();
    return $stmt->fetchAll();
    
}
function getById($iduser){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM client WHERE iduser=?");
    $stmt->execute(array($iduser));
    return $stmt->fetch();
    
}
function promoteAdmin($iduser,$bool){
 global $conn;
 $stmt = $conn->prepare("UPDATE client
  SET admin = ?
  WHERE iduser = ?");
 $stmt->execute(array($bool, $iduser));
}

function changeActiveStatus($iduser,$bool){
 global $conn;
 $stmt = $conn->prepare("UPDATE client
  SET active = ?
  WHERE iduser = ?");
 $stmt->execute(array($bool, $iduser));
}

function change_username($new_username, $current_id) {
  global $conn; 

  $stmt = $conn->prepare(
    'UPDATE client SET username = ?
    WHERE iduser = ?');
  $stmt->execute(array($new_username, $current_id));

}

function change_password($new_password, $current_id) {
  global $conn; 

  $stmt = $conn->prepare(
    'UPDATE client SET password = ?
    WHERE iduser = ?');
  $stmt->execute(array(sha1($new_password), $current_id));

}


function get_email($id_client){
  global $coon;

  $stmt = $coon->prepare(
    "SELECT email FROM client WHERE
    idUser = ?");
  $stmt->execute(array($id_client));
  return $stmt->fetch()['email'];
}

//$Session_GET[login_username]
function change_email($new_email, $current_id){
  global $conn; 
  
  $stmt = $conn->prepare(
    'UPDATE client SET email = ? 
    WHERE iduser = ?');
  $stmt->execute(array($new_email, $current_id));

}

function change_birthDate($new_date, $current_id){
  global $conn; 
  
  $stmt = $conn->prepare(
    'UPDATE client SET birthDate = ? 
    WHERE iduser= ?');
  $stmt->execute(array($new_date, $current_id));
}

function change_phone($new_phone, $current_id){
  global $conn; 
  
  $stmt = $conn->prepare(
    'UPDATE client SET phonenr = ? 
    WHERE iduser = ?');
  $stmt->execute(array($new_phone, $current_id));
}

function change_address($new_address,$current_id){
  global $conn;

  $stmt = $conn->prepare(
    'UPDATE client SET address = ?
    WHERE iduser = ?');
  $stmt->execute(array($new_address,$current_id));
}

function SeeIfexistsEmail($email){
    global $conn;
    $stmt = $conn->prepare(
    'SELECT * FROM client
    WHERE email = ?');
    $stmt->execute(array($email));
    return $stmt->fetch(); 
}


function gerarSenha($tamanho=9, $forca=8) {
	$vogais = 'aeiou';
	$consoantes = 'bdghjkmnpqrstvwxyz';
	if ($forca >= 1) {
		$consoantes .= 'BDGHJKLMNPQRSTVWXYZ';
	}
	if ($forca >= 2) {
		$vogais .= "AEIOU";
	}
	if ($forca >= 4) {
		$consoantes .= '123456789';
	}
	if ($forca >= 8 ) {
		$vogais .= '@#$%';
	}
 
	$senha = '';
	$alt = time() % 2;
	for ($i = 0; $i < $tamanho; $i++) {
		if ($alt == 1) {
			$senha .= $consoantes[(rand() % strlen($consoantes))];
			$alt = 0;
		} else {
			$senha .= $vogais[(rand() % strlen($vogais))];
			$alt = 1;
		}
	}
	return $senha;
}

?>