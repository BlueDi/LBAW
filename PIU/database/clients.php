<?php
  
  function createclient($realname, $username, $password,$email,$birthdate,$address,$nif,$active,$admin,$phonenr) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO client VALUES (?, ?, ?)");
    $stmt->execute(array($realname, sha1($password),$email,$birthdate,$address,$nif,$active,$admin,$phonenr,$username));
  }

  function isLoginCorrect($username, $password) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM client
                            WHERE username = ? AND password = ?");
    $stmt->execute(array($username, sha1($password)));
    return $stmt->fetch() == true;
  }
?>
