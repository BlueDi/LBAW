<?php
include_once('../../config/init.php');
include($BASE_DIR.'/database/clients.php');




$email=$_POST['Email'];
$check=SeeIfexistsEmail($email);
if($check==true){
    $new_pass=gerarSenha();
    change_password($new_pass,$check['iduser']);
    
    
                    $message = "Your new password is the following:  ".$new_pass." try to login with it.";
                    $from = 'From: WEBSTORE HOUSE';
                    $to = $check['email'];
                    $subject = 'Password Reset';
    
                    $body = "From: WEBSTORE HOUSE \n Message:\n $message";
    
                    if (mail ($to, $subject, $body, $from)) {
							
                           
                        } else {                                                                                          
                            
                        }
    
     $redirectUrl = '../../pages/login.php';
     echo '<script type="application/javascript">window.location.href = "'.$redirectUrl.'";</script>';
    
}
?>