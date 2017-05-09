<?php
function CreateBrand($name,$email){
    global $conn;
    $stmt = $conn->prepare("INSERT INTO category VALUES (DEFAULT, ?, ?)");
    $stmt->execute(array($name,$email));
                   }
function GetBrandIdByName($name){
    global $conn;
    $stmt = $conn->prepare("SELECT idbrand FROM brand WHERE name=?");
    $stmt->execute(array(name));
    return $stmt->fetch()['idbrand'];
}
function GetAllBrands(){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM brand");
    $stmt->execute();
    return $stmt->fetchAll();
}
                   
?>