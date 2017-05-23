<?php
function CreatePurchase($date,$iduser){
     global $conn;
    $stmt = $conn->prepare("INSERT INTO purchase VALUES (DEFAULT,?,?)");
    return $stmt->execute(array($date,$iduser));

}

?>