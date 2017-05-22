<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/shoppingcart.php');

$productid = strip_tags($_POST['id']);
$userid = $_SESSION['iduser'];
$qty=1;
$url=$_POST['url'];
if(checkIfalreadyAddedtocart($userid,$productid) == true){
    $qty2=checkIfalreadyAddedtocart($userid,$productid)['quantity']+1;
    Increaseqty($userid,$productid,$qty2);
     $redirectUrl = $BASE_PIU . 'pages/single.php?id='.$productid;
    
    
}
else{
if (addtoCart($userid, $productid,$qty) == true) {
    $redirectUrl = $BASE_PIU . 'pages/single.php?id='.$productid;
    
} 
}
echo '
        <script>
            window.location.href = "' . $redirectUrl . '";
        </script>
    ';
?>
