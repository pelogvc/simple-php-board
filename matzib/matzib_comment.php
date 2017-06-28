<?php
include_once './config.php';

if ( !is_login() ) {
    alert("로그인하세요.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
}

if ( isset($_POST['no']) )
    $no = (int)$_POST['no'];
else
    exit;

$sql = "SELECT * FROM `matzib` WHERE no = {$no} ";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
if ( !$result || !$row ) {
    alert('삭제된 게시글입니다.');
    go_url('./matzib_list.php');
    exit;
}

$sql = "INSERT INTO `matzib_comments` (matzib_no, contents, email, date) VALUES(
        '{$no}', '{$_POST['contents']}', '{$_SESSION['email']}', now()
        )";
$result = $conn->query($sql);

$conn->query("UPDATE `matzib` SET `comments` = `comments` + 1 WHERE `no` = {$no}");

go_url('./matzib_view.php?no='.$no);
?>