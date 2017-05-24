<?php
function CreatePurchase($date,$iduser){
     global $conn;
    $stmt = $conn->prepare("INSERT INTO purchase VALUES (DEFAULT,?,?)");
    return $stmt->execute(array($date,$iduser));

}

function getAllPurchases(){
     global $conn;
    $stmt = $conn->prepare("SELECT * FROM purchase");
    $stmt->execute();
    return $stmt->fetchAll();

}

function processPurchase($idpurchase,$state){
     global $conn;
    $stmt = $conn->prepare("UPDATE purchase SET state=? WHERE idpurchase=?");
     return $stmt->execute(array($state,$idpurchase));
   
    
}
?>