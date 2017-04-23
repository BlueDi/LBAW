<?php

function createClient($realname, $username, $password,$email,$birthdate,$address,$nif,$admin,$phonenr) {
  global $conn;
  $stmt = $conn->prepare("INSERT INTO client VALUES (DEFAULT, ?, ?,?,?,?,?,?,?,?,?)");
  $stmt->execute(array($realname, sha1($password),$email,$birthdate,$address,$nif,true,'false',$phonenr,$username));
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

function change_username($new_username, $current_username) {
  global $conn; 

  $stmt = $conn->prepare(
    'SELECT * FROM client
    WHERE username = ?');
  $stmt->execute(array($new_username));

  $stmt = $conn->prepare('UPDATE client SET username = ? WHERE username = ?');
  $stmt->execute(array($new_username, $current_username));

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
function change_email($new_email, $current_username){
  global $conn; 
  
  $stmt = $conn->prepare(
    'UPDATE client SET email = ? 
    WHERE username = ?');
  $stmt->execute(array($new_email, $current_username));

}

function birthDate($new_date, $current_username){
  global $conn; 
  
  $stmt = $conn->prepare(
    'UPDATE client SET birthDate = ? 
    WHERE username = ?');
  $stmt->execute(array($new_date, $current_username));
}

function change_phone($new_phone, $current_username){
  global $conn; 
  
  $stmt = $conn->prepare(
    'UPDATE client SET phonenr = ? 
    WHERE username = ?');
  $stmt->execute(array($new_phone, $current_username));
}

function change_address($new_address,$current_username){
  global $conn;

  $stmt = $conn->prepare(
    'UPDATE client SET address = ?
    WHERE username = ?');
  $stmt->execute(array($new_address,$current_username));
}

?>