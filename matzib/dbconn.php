<?php
$servername = "localhost"; // mysql 아이피
$username = "matzib";   // mysql 유저 아이디
$password = "matzib123";   // mysql 유저 비밀번호
$db = "matzib";

@$conn = new mysqli($servername, $username, $password, $db);

if ($conn->connect_error) {
    die("접속실패: " . $conn->connect_error);
}else{
    $conn->query("SET NAMES UTF8");
}

?>