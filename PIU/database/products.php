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
     return $stmt->fetchAll();
}

function selectNewProducts($number){
    global $conn;
     $stmt = $conn->prepare("SELECT product.idproduct,product.name,product.idimage,product.price,product.stock FROM product JOIN category ON product.idcategory=category.idcategory AND category.name='NEW' LIMIT ?");
     $stmt->execute(array($number));
     return $stmt->fetchAll();
}
function ChangeStock($id,$value){
     global $conn;
     $stmt = $conn->prepare("UPDATE product SET stock=? WHERE idproduct= ? ");
     $stmt->execute(array($idproduct,$value));
    
}

function getImageUrlFromProduct($id)
{    
     global $conn;
     $stmt = $conn->prepare("SELECT url FROM image JOIN product ON product.idimage=image.idimage AND product.idproduct=? LIMIT 1");
     $stmt->execute(array($id));
     return $stmt->fetch();
}

?>