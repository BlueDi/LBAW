<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/shoppingcart.php');

$productid = strip_tags($_POST['Idproduct']);
$userid = $_SESSION['iduser'];

if(checkIfalreadyAddedtocart($userid,$productid) == true){
   deleteFromcart($userid,$productid);
     $redirectUrl = $BASE_PIU . 'pages/showCart.php';
    
    
}
else{

    $redirectUrl = $BASE_PIU . 'pages/showCart.php';

}
echo '
        <script>
            window.location.href = "' . $redirectUrl . '";
        </script>
    ';
?>
