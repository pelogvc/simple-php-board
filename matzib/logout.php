<?php
include_once './config.php';
if ( is_login() ) {
    unset($_SESSION['email']);
}
//$url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
//go_url($url);
go_url('./index.php');
?>