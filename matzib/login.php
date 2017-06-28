<?php
include_once './config.php';
if ( !isset($_POST['email']) || !isset($_POST['password']) ){
    go_url('./index.php');
}
$email = $_POST['email'];
$password = $_POST['password'];

$row = login_check($email, $password);
if ( $row ) { // 로그인 성공
    $_SESSION['email'] = $row['email'];
    $_SESSION['name'] = $row['name'];
    $_SESSION['nickname'] = $row['nickname'];
    $_SESSION['no'] = $row['no'];
} else {
    alert('아이디 또는 비밀번호를 확인하세요.');
}
$url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
//$url = './index.php';
go_url($url);

?>