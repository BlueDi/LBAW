<?php 

include_once('../../config/init.php');

include_once($BASE_DIR . 'database/purchase.php');
include_once($BASE_DIR . 'database/clients.php');

$idpurchase=$_POST['idpurchase'];
$state='Accepted';
processPurchase($idpurchase,$state);

$redirectUrl = $BASE_PIU . 'pages/managePurchases.php';



                    $message = "Your purchase has been accepted and is going to be shipped as quick as possible \n Thank you for choosing us \n";
                    $from = 'From: webstorehouseopen@gmail.com';
                    $to = getById(selectPurchaseId($idpurchase)['iduser'])['email'];
                    $subject = 'purchase trackin';
    
                    $body = "From: WEBSTORE HOUSE \n Message:\n $message";
    
                    mail ($to, $subject, $body, $from);

echo '
        <script>
            window.location.href = "' . $redirectUrl . '";
        </script>
    ';
    
    ?>