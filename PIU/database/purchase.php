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
function selectPurchase($date,$iduser){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM purchase WHERE checkoutdate=? AND iduser=?");
    $stmt->execute(array($date,$iduser));
    return $stmt->fetch();
}
function selectPurchaseId($idpurchase){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM purchase WHERE idpurchase=?");
    $stmt->execute(array($idpurchase));
    return $stmt->fetch();
}


function showallPurchasesUser($iduser){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM purchase WHERE iduser=?");
    $stmt->execute(array($iduser));
    return $stmt->fetchAll();
}
?>