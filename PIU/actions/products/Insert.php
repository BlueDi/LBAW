<?php
include_once('../../config/init.php');
include($BASE_DIR.'/database/clients.php');

include('../images/upload.php');			



            
            echo'<script language="javascript">';
				echo 'alert("Correct username and/or password.")';
                echo '</script>';
                $redirectUrl = '../../pages/products.php';
				echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';
?>