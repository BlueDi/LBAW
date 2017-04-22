<?php



function CreateCategory($name,$promopercentage,$startdate,$enddate){
    global $conn;
    $stmt = $conn->prepare("INSERT INTO category VALUES (DEFAULT, ?, ?,?)");
    $stmt->execute(array($promopercentage,$startdate,$enddate));
                   }
function GetCategoryIdByName($name){
    global $conn;
    $stmt = $conn->prepare("SELECT idcategory FROM category WHERE name=?");
    $stmt->execute(array(name));
    return $stmt->fetch()['idimage'];
}
function GetAllCategorys(){
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM category');
    $stmt->execute();
    return $stmt->fetchAll();
}
                   
?>