<?php
include_once('../../config/init.php');
include($BASE_DIR.'/database/products.php');
include($BASE_DIR.'/database/review.php');


$ddate=$_POST['date'];
$iduser=$_POST['Iduser'];
$idproduct=$_POST['Idproduct'];


if(deleteReview($iduser,$idproduct,$ddate)==true){
    $redirectUrl = $BASE_PIU . 'pages/single.php?id='.$idproduct;
    
    
}

echo '
        <script>
            window.location.href = "' . $redirectUrl . '";
        </script>
    ';
?>