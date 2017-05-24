<?php

function createPurchaseProduct($idproduct, $idpurchase,$price,$quantity) {
  global $conn;
  $stmt = $conn->prepare("INSERT INTO purchaseproduct VALUES (?, ?,?,?)");
  return $stmt->execute(array($idproduct, $idpurchase,$price,$quantity));
}
  
function getallfrom1Purchase($idpurchase){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM purchaseproduct WHERE idpurchase=?");
    $stmt->execute(array($idpurchase));
    return $stmt->fetchAll();
}

?>    