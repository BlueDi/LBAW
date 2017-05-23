<?php
function CreateCategory($name)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO category VALUES (DEFAULT, ?, ?, ?,?)");
    return $stmt->execute(array($name, 0, NULL, NULL));
}

function GetCategoryIdByName($name)
{
    global $conn;
    $stmt = $conn->prepare("SELECT idcategory FROM category WHERE name=?");
    $stmt->execute(array($name));
    return $stmt->fetch()['idimage'];
}

function GetAllCategorys()
{
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM category ORDER by idcategory ASC');
    $stmt->execute();
    return $stmt->fetchAll();
}

function GetFirstXCategorys($number)
{
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM category ORDER by idcategory ASC LIMIT ?');
    $stmt->execute(array($number));
    return $stmt->fetchAll();
}

function GetCategoryById($id)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM category WHERE idcategory=?");
    $stmt->execute(array($id));
    return $stmt->fetch();
}

function GetCategoryPromo($id, $curr_date)
{
    global $conn;
    $stmt = $conn->prepare('select * from category where idcategory=? and startdate <= ? and enddate >= ?');
    $stmt->execute(array($id, $curr_date, $curr_date));
    return $stmt->fetch();

}

function changePromo($id,$percentage,$startdate,$enddate){
    global $conn;
    $stmt = $conn->prepare('UPDATE category SET startdate=?,enddate=?,promopercentage=? WHERE idcategory=?');
    $stmt->execute(array($startdate, $enddate,$percentage,$id));
    
}