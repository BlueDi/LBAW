<?php
include_once('../../config/init.php');
include($BASE_DIR . 'database/clients.php');
include('../images/upload.php');

$imgid = GetImageId($_FILES["fileToUpload"]["name"]);
$productname = $_POST['ProductName'];
$price = $_POST['Price'];
$stock = $_POST['Stock'];
$weight = $_POST['Weight'];
$width = $_POST['Width'];
$height = $_POST['Height'];
$description = $_POST['Description'];
$categoryid = $_POST['category'];
$brandid = $_POST['brand'];

CreateProduct($imgid, $productname, $price, $stock, $weight, $width, $height, $description, $categoryid, $brandid);
echo '
    <script>
        alert("Product created");
    </script>
';

$redirectUrl = '../../pages/products.php';
echo '
    <script>
        window.location.href = "' . $redirectUrl . '";
    </script>
';
