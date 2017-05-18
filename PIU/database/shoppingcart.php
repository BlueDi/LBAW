<?php
function addtoCart($iduser,$idproduct,$qty){
    global $conn;
    $stmt = $conn->prepare("INSERT INTO shoppingcart VALUES (?,?,?)");
    return $stmt->execute(array($iduser,$idproduct,$qty));

}
    function checkIfalreadyAdded($iduser,$idproduct){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM shoppingcart WHERE iduser=? AND idproduct=?");
    $stmt->execute(array($iduser,$idproduct));
    return $stmt->fetch()==true;
}
function GetWholeWishlist($iduser){
    global $conn;
     $stmt = $conn->prepare("SELECT * FROM shoppingcart WHERE iduser=?");
     $stmt->execute(array($iduser));
     return $stmt->fetchAll();
}

function deleteFromWishlist($iduser,$idproduct){
    global $conn;
    $stmt = $conn->prepare("DELETE FROM wishlist WHERE iduser=? AND idproduct=?");
    $stmt->execute(array($iduser,$idproduct));
}
    

function Increaseqty($iduser,$idproduct,$qty){
    global $conn;
    $stmt = $conn->prepare("UPDATE shoppingcart SET quantity=? WHERE iduser=? AND idproduct=?");
    $stmt->execute(array($qty,$iduser,$idproduct));
    return $stmt->fetch()==true;
}

?>