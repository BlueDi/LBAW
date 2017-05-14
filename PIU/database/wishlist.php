<?php

function CreateWhishlistEntry($iduser,$idproduct){
    
global $conn;
    $stmt = $conn->prepare("INSERT INTO wishlist VALUES (?,?)");
    return $stmt->execute(array($iduser,$idproduct));

}
function checkIfalreadyAdded($iduser,$idproduct){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM wishlist WHERE iduser=? AND idproduct=?");
    $stmt->execute(array($iduser,$idproduct));
    return $stmt->fetch()==true;
}
function GetWholeWishlist($iduser){
    global $conn;
     $stmt = $conn->prepare("SELECT idproduct FROM wishlist WHERE iduser=?");
     $stmt->execute(array($iduser));
     return $stmt->fetchAll();
}

function deleteFromWishlist($iduser,$idproduct){
    global $conn;
    $stmt = $conn->prepare("DELETE FROM wishlist WHERE iduser=? AND idproduct=?");
    $stmt->execute(array($iduser,$idproduct));
}
?>