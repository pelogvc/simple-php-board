<?php
include_once './config.php';

if ( !is_login() ) {
    alert("로그인하세요.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
}

$table = $_POST['table'];
checkTableId($table);

if ( isset($_POST['no']) )
    $no = (int)$_POST['no'];
else
    exit;

$sql = "SELECT * FROM `bbs` WHERE table_name = '{$table}' AND no = {$no} ";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
if ( !$result || !$row ) {
    alert('삭제된 게시글입니다.');
    go_url('./board.php?table=' . $table);
    exit;
}

$sql = "INSERT INTO `bbs_comments` (table_name, bbs_no, contents, email, date) VALUES(
        '{$table}', '{$no}', '{$_POST['contents']}', '{$_SESSION['email']}', now()
        )";
$result = $conn->query($sql);

$conn->query("UPDATE `bbs` SET `comments` = `comments` + 1 WHERE `no` = {$no} AND `table_name` = '{$table}'");

go_url('./view.php?table='.$table."&no=".$no);
?>