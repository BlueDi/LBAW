<?php
include_once('../../config/init.php');
include($BASE_DIR . 'database/category.php');

$category_name = $_POST['category'];


CreateCategory($category_name);

echo '
    <script>
        alert("Category created");
    </script>
';

$redirectUrl = '../../pages/products.php';
echo '
    <script>
        window.location.href = "' . $redirectUrl . '";
    </script>
';
