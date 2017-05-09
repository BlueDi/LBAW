<?php

function CreateImage($imgname,$url){
    global $conn;
    $stmt = $conn->prepare("INSERT INTO image VALUES (DEFAULT, ?, ?)");
    $stmt->execute(array($imgname,$url));
                   }
function GetImageId($imgname){
    global $conn;
    $stmt = $conn->prepare("SELECT idimage FROM image WHERE name=?");
    $stmt->execute(array($imgname));
    return $stmt->fetch()['idimage'];
}
                   
?>