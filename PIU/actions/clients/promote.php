<?php
include_once('../../config/init.php');
 include('../../database/clients.php');

$idpromote=$_POST['idpromote'];
if(getById($idpromote)['admin']=='true'){
    $bool='false';
}
else{
    $bool='true';
}

promoteAdmin($idpromote,$bool);

             
                $redirectUrl = '../../pages/manageClients.php';
				echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';
?>