<?php
include_once 'config.php';

if ( !is_login() ) {
    alert("로그인하세요.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
}

if ( !$_POST['matzib_title'] ) {
    alert("맛집을 검색 후 선택해주세요.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
}

$sql = "INSERT INTO `matzib` (subject, contents, email, date, matzib_title, matzib_telephone, matzib_address, matzib_roadAddress, matzib_mapx, matzib_mapy) VALUES(
        '{$_POST['subject']}', '{$_POST['contents']}', '{$_SESSION['email']}', now(), '{$_POST['matzib_title']}', '{$_POST['matzib_telephone']}', '{$_POST['matzib_address']}', '{$_POST['matzib_roadAddress']}', '{$_POST['matzib_mapx']}', '{$_POST['matzib_mapy']}'
        )";
$result = $conn->query($sql);

go_url('./matzib_list.php');
?>