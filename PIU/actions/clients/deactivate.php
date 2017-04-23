<?php
include_once('../../config/init.php');
include('../../database/clients.php');

$id=$_POST['id'];
if(getById($id)['active']=='true'){
    $bool='false';
}
else{
    $bool='true';
}
changeActiveStatus($id,$bool);

                echo'<script language="javascript">';
                if($bool=='false')
				echo 'alert("User was deactivated")';
                else
                echo 'alert("User was activated")';
                echo '</script>';
                $redirectUrl = '../../pages/manageClients.php';
				echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';

?>