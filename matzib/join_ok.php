<?php
include_once 'head.php';


// 로그인체크
if ( is_login() ) {
    //alert("이미 로그인 중 입니다.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
}

$sql = "SELECT * FROM `member` WHERE `email` = '{$_POST['email']}'";
$result = $conn->query($sql);
if ( $result->num_rows > 0) { //가입여부
    alert("이미 있는 회원입니다.");
    go_url("./join.php");
    exit;
}
$sql = "INSERT INTO `member` (email, password, name, nickname) VALUES ('{$_POST['email']}', PASSWORD('{$_POST['password']}'), '{$_POST['name']}', '{$_POST['nickname']}')";
$result = $conn->query($sql);
?>
<div class="join">
    <h1><i class="material-icons">content_copy</i>회원가입 완료</h1>
    <div class="ok">
        <i class="material-icons">person_add</i>
        <span><?php echo $_POST['name']; ?>님, 회원가입이 완료되었습니다.</span>
        <span class="t">저희 사이트는 무료로 이용하실 수 있습니다.</span>
    </div>
</div>
