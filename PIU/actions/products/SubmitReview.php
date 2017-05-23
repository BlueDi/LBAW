<?php
include_once('../../config/init.php');
include($BASE_DIR.'/database/products.php');
include($BASE_DIR.'/database/review.php');

date_default_timezone_set('Europe/Lisbon');
$date = date('Y-m-d H:i:s', time());

$description=$_POST['description'];
$iduser=$_POST['Iduser'];
$idproduct=$_POST['Idproduct'];
$rating=$_POST['rating'];

if(addreview($iduser,$idproduct,$date,$rating,$description)==true){
    $redirectUrl = $BASE_PIU . 'pages/single.php?id='.$idproduct;
    
    
}

echo '
        <script>
            window.location.href = "' . $redirectUrl . '";
        </script>
    ';
?>