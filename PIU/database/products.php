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

function selectProducts($number){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product  ORDER BY idproduct ASC LIMIT ?");
    $stmt->execute(array($number));
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

function Search($query) {
    $s_query = preg_replace('/\s+(?=([^"]*"[^"]*")*[^"]*$)/', '|', $query);
    $s_query = preg_replace('/"(.*?)"/', '($1)', $s_query);
    $s_query = preg_replace('/\s+/', '&', $s_query);

    global $conn;
    $stmt = $conn->prepare("
      SELECT *
      FROM product
      WHERE search @@ to_tsquery(?)
      LIMIT 10;
    ");
    $stmt->execute(array($s_query));
    return $stmt->fetchAll();
}

function searchProducts($query) {
    $s_query = preg_replace('/\s+(?=([^"]*"[^"]*")*[^"]*$)/', '|', $query);
    $s_query = preg_replace('/"(.*?)"/', '($1)', $s_query);
    $s_query = preg_replace('/\s+/', '&', $s_query);

    global $conn;
    $stmt = $conn->prepare("
      SELECT P.*, COALESCE(AVG(rating), 0) AS Rating
      FROM product P LEFT JOIN review R ON R.idproduct = P.idproduct, to_tsquery(?) query
      WHERE query @@ P.tsv
      GROUP BY P.idproduct, query
      ORDER BY ts_rank(P.tsv, query) DESC
    ");
    $stmt->execute(array($s_query));
    return $stmt->fetchAll();
}
