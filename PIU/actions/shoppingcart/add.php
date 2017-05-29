<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/shoppingcart.php');

$productid = strip_tags($_POST['id']);
$userid = $_SESSION['iduser'];
$qty=1;
$url=$_POST['redirect'];
if(checkIfalreadyAddedtocart($userid,$productid) == true){
    $qty2=checkIfalreadyAddedtocart($userid,$productid)['quantity']+1;
    Increaseqty($userid,$productid,$qty2);
     $redirectUrl = $BASE_PIU . 'pages/'.$url;
    
    
}
else{
if (addtoCart($userid, $productid,$qty) == true) {
    $redirectUrl = $BASE_PIU . 'pages/'.$url;
    
} 
}
echo '
        <script>
            window.location.href = "' . $redirectUrl . '";
        </script>
    ';
?>
