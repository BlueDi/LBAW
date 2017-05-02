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
function GetFirstXCategorys($number){
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM category ORDER by idcategory ASC LIMIT ?');
    $stmt->execute(array($number));
    return $stmt->fetchAll();
}

function GetCategoryById($id){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM category WHERE idcategory=?");
    $stmt->execute(array($id));
    return $stmt->fetch();
}
?>