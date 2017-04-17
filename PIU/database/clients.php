<?php
  
  function createClient($realname, $username, $password,$email,$birthdate,$address,$nif,$admin,$phonenr) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO client VALUES (DEFAULT, ?, ?,?,?,?,?,?,?,?,?)");
    $stmt->execute(array($realname, sha1($password),$email,$birthdate,$address,$nif,true,$admin,$phonenr,$username));
  }

  function isLoginCorrect($username, $password) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM client
                            WHERE username = ? AND password = ?");
    $stmt->execute(array($username, sha1($password)));
    return $stmt->fetch()==true;
  }

    function changeActiveStatus($iduser,$bool){
         global $conn;
    $stmt = $conn->prepare("UPDATE client
                            SET active = ?
                            WHERE iduser = ? ");
    $stmt->execute(array($bool, iduser));
    }
?>
