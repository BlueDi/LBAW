<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/shoppingcart.php');
include_once($BASE_DIR . 'database/purchase.php');
include_once($BASE_DIR . 'database/purchaseproduct.php');
include_once($BASE_DIR . 'database/category.php');
include_once($BASE_DIR . 'database/products.php');

date_default_timezone_set('Europe/Lisbon');
$date = date('Y-m-d H:i:s', time());

$userid = $_SESSION['iduser'];
CreatePurchase($date,$userid);

$purchaseid=selectPurchase($date,$userid)['idpurchase'];

$arr=GetWholeCart($userid);

foreach($arr as $value){
    
    if (GetCategoryPromo(getProductById($value['idproduct'])['idcategory'], $date)) {
                $promo = GetCategoryPromo(getProductById($value['idproduct'])['idcategory'], $date)['promopercentage'];
                $ispromo = true;
                }

            else{
            $promo=0;
            $ispromo=false;
            }
     $pricePromo = getProductById($value['idproduct'])['price'] - (getProductById($value['idproduct'])['price'] * $promo/100);
    
     createPurchaseProduct($value['idproduct'],$purchaseid,$pricePromo,$value['quantity']);
    deleteFromcart($userid,$value['idproduct']);
}

 $redirectUrl = $BASE_PIU . 'pages/showPurchase.php?id='. $purchaseid;

echo '
        <script>
            window.location.href = "' . $redirectUrl . '";
        </script>
    ';

?>