<?php
include_once('../../config/init.php');
include($BASE_DIR . 'database/category.php');

$categoryid = $_POST['category'];
$promo_percentage = $_POST['percentage'];
$start_date = $_POST['startdate'];
$end_date = $_POST['enddate'];

changePromo($categoryid, $promo_percentage, $start_date, $end_date);


$redirectUrl = '../../pages/products.php';
echo '
    <script>
        window.location.href = "' . $redirectUrl . '";
    </script>
';