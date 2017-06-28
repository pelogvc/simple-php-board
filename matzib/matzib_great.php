<?php
include_once 'config.php';

if ( !is_login() ) {
    alert("로그인하세요.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
}

if ( !$_GET['no'] ) {
    alert("정상적으로 접근해주세요.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
    exit;
}

$sql = "INSERT INTO `matzib_great` VALUES(
        '{$_GET['no']}', '{$_SESSION['no']}', now()
        )";
$result = $conn->query($sql);

alert('추천되었습니다.');
go_url('./matzib_view.php?no='.$_GET['no']);
?>