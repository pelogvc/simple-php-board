<?php
include_once 'config.php';

if ( !is_login() ) {
    alert("로그인하세요.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
}

$table = $_POST['table'];
checkTableId($table);

$sql = "INSERT INTO `bbs` (table_name, subject, contents, email, date) VALUES(
        '{$table}', '{$_POST['subject']}', '{$_POST['contents']}', '{$_SESSION['email']}', now()
        )";
$result = $conn->query($sql);

go_url('./board.php?table='.$table);
?>