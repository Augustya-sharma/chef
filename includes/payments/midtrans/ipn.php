<?php
$access_token=$_GET['access_token'];
//TODO: add webhook for payment success
if(isset($access_token)){
    payment_success_save_detail($access_token);
}
exit();
?>
