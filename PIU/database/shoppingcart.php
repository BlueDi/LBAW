<?php
function addtoCart($iduser,$idproduct,$qty){
    global $conn;
    $stmt = $conn->prepare("INSERT INTO shoppingcart VALUES (?,?,?)");
    return $stmt->execute(array($iduser,$idproduct,$qty));

}
    function checkIfalreadyAddedtocart($iduser,$idproduct){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM shoppingcart WHERE iduser=? AND idproduct=?");
    $stmt->execute(array($iduser,$idproduct));
    return $stmt->fetch();
}
function GetWholeCart($iduser){
    global $conn;
     $stmt = $conn->prepare("SELECT * FROM shoppingcart WHERE iduser=?");
     $stmt->execute(array($iduser));
     return $stmt->fetchAll();
}

function deleteFromcart($iduser,$idproduct){
    global $conn;
    $stmt = $conn->prepare("DELETE FROM shoppingcart WHERE iduser=? AND idproduct=?");
    $stmt->execute(array($iduser,$idproduct));
}
    

function Increaseqty($iduser,$idproduct,$qty){
    global $conn;
    $stmt = $conn->prepare("UPDATE shoppingcart SET quantity=? WHERE iduser=? AND idproduct=?");
    $stmt->execute(array($qty,$iduser,$idproduct));
    return $stmt->fetch()==true;
}

?>