<?php



function CreateProduct($imgid,$productname,$price,$stock,$weight,$width,$height,$description,$categoryid,$brandid){
    
global $conn;
    $stmt = $conn->prepare("INSERT INTO product VALUES (DEFAULT, ?, ?,?,?,?,?,?,?,?,?)");
    $stmt->execute(array($productname, $imgid,$categoryid,$brandid,$price,$stock,$weight,$width,$height,$description));

}


function selectProductByCategory($idcategory,$number){
    global $conn;
     $stmt = $conn->prepare("SELECT * FROM product WHERE idcategory=? LIMIT ?");
     $stmt->execute(array($idcategory,$number));
}

     ?>