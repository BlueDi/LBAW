<?php
include_once('../../config/init.php');
include($BASE_DIR . 'database/category.php');

$category_name = $_POST['category'];
$promo_percentage = $_POST['promo_percentage'];
$start_date = $_POST['start_date'];
$end_date = $_POST['end_date'];

CreateCategory($category_name, $promo_percentage, $start_date, $end_date);

echo '
    <script>
        alert("Category created");
    </script>
';

$redirectUrl = '../../pages/products.php';
echo '
    <script>
        window.location.href = "' . $redirectUrl . '";
    </script>
';
