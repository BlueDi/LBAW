<?php

function CreateWhishlistEntry($iduser,$idproduct,$url){
    
global $conn;
    $stmt = $conn->prepare("INSERT INTO wishlist VALUES (?,?,?)");
    $stmt->execute(array($iduser,$idproduct,$url));

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