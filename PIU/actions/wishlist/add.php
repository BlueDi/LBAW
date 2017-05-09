<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/wishlist.php');

$productid = strip_tags($_POST['Idproduct']);
$userid = strip_tags($_POST['Iduser']);

if (CreateWhishlistEntry($userid, $productid) == true) {
    $redirectUrl = $BASE_PIU . 'pages/profile.php';
    echo '
        <script>
            window.location.href = "' . $redirectUrl . '";
        </script>
    ';
} else {

}
