<?php
function CreateProduct($imgid, $productname, $price, $stock, $weight, $width, $height, $description, $categoryid, $brandid)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO product VALUES (DEFAULT, ?, ?,?,?,?,?,?,?,?,?)");
    return $stmt->execute(array($productname, $imgid, $categoryid, $brandid, $price, $stock, $weight, $width, $height, $description));
}

function selectProductByCategory($idcategory, $number)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product WHERE idcategory=? LIMIT ?");
    $stmt->execute(array($idcategory, $number));
    return $stmt->fetchAll();
}

function selectNewProducts($number)
{
    global $conn;
    $stmt = $conn->prepare("SELECT product.idproduct,product.name,product.idimage,product.price,product.stock FROM product JOIN category ON product.idcategory=category.idcategory AND category.name='NEW' LIMIT ?");
    $stmt->execute(array($number));
    return $stmt->fetchAll();
}

function ChangeStock($id, $value)
{
    global $conn;
    $stmt = $conn->prepare("UPDATE product SET stock=? WHERE idproduct= ? ");
    $stmt->execute(array($id, $value));
}

function getImageUrlFromProduct($id)
{
    global $conn;
    $stmt = $conn->prepare("SELECT url FROM image JOIN product ON product.idimage=image.idimage AND product.idproduct=? LIMIT 1");
    $stmt->execute(array($id));
    return $stmt->fetch();
}

function getProductById($id)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product WHERE idproduct= ?");
    $stmt->execute(array($id));
    return $stmt->fetch();
}

function Search($name)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product WHERE name=?");
    $stmt->execute(array($name));
    return $stmt->fetchAll();
}


function searchProducts($query) {
    // Sanitize query
    $s_query = preg_replace('/\s+(?=([^"]*"[^"]*")*[^"]*$)/', '|', $query);
    $s_query = preg_replace('/"(.*?)"/', '($1)', $s_query);
    $s_query = preg_replace('/\s+/', '&', $s_query);
    global $conn;
    $stmt = $conn->prepare("SELECT P.*, COALESCE(AVG(rating), 0) AS Rating
FROM Product P LEFT JOIN Rate R ON R.idProduct = P.idProduct, to_tsquery(?) query
WHERE query @@ P.tsv
GROUP BY P.idProduct, query
ORDER BY ts_rank(P.tsv, query) DESC");
    $stmt->execute(array($s_query));
    return $stmt->fetchAll();
}


