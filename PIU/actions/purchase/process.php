<?php 

include_once('../../config/init.php');

include_once($BASE_DIR . 'database/purchase.php');

$idpurchase=$_POST['idpurchase'];
$state='Accepted';
processPurchase($idpurchase,$state);

$redirectUrl = $BASE_PIU . 'pages/managePurchases.php';

echo '
        <script>
            window.location.href = "' . $redirectUrl . '";
        </script>
    ';
    
    ?>