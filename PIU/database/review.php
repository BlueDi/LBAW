<?php 

function addreview($iduser,$idproduct,$date,$rating,$description){
    global $conn;
    $stmt = $conn->prepare("INSERT INTO review VALUES (?,?,?,?,?)");
    return $stmt->execute(array($iduser,$idproduct,$date,$rating,$description));

}

function getReviewsofaProduct($idproduct){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM review WHERE idproduct=?");
    $stmt->execute(array($idproduct));
    return $stmt->fetchAll();
}

function getReviewsofaUser($iduser){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM review WHERE iduser=?");
    $stmt->execute(array($iduser));
    return $stmt->fetchAll();
}

function getAreview($iduser,$idproduct,$date){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM review WHERE iduser=? AND idproduct=? AND date=?");
    $stmt->execute(array($iduser,$idproduct,$date));
    return $stmt->fetch();
}

function deleteReview($iduser,$idproduct,$date){
    global $conn;
    $stmt = $conn->prepare("DELETE FROM review WHERE iduser=? AND idproduct=? AND date=?");
    return $stmt->execute(array($iduser,$idproduct,$date));
}
    
?>