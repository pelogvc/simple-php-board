<?php
function alert($txt) {
    echo "<meta charset=\"UTF-8\"><script>alert('{$txt}');</script>";
}
function go_url($url){
    echo "<script>location.href='{$url}';</script>";
    exit;
}
function is_login(){
    global $_SESSION;

    if ( isset($_SESSION['email']) )
        return true;
    else
        return false;
}
function login_check($email, $password) {

    global $conn;
    if (!isset($conn))
        return false;

    $email = mysqli_real_escape_string($conn, (strtolower(trim($email))));
    $sql = "SELECT * FROM `member` WHERE `email` = '{$email}' AND `password` = PASSWORD('{$password}')";
    $result = $conn->query($sql);
    if (!$result || $result->num_rows <= 0) {
        /*alert('아이디 또는 비밀번호를 확인하세요.');
        $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
        go_url($url);*/
        return false;
    }


    return $result->fetch_assoc();
}

/*
 * 게시판 시작
 */
function checkTableId($id) {

    global $matzib;
    $bbsauth = false;
    foreach($matzib['bbs'] as $table => $name ) {
        if ( $id == $table )
            $bbsauth = true;
    }
    if ( $bbsauth != true ) {
        alert('없는 게시판입니다.');
        exit;
    }
}
// 이미지 업로드
function checkFileName($filename) {
    //이미지 업로드 가능한 확장자 목록
    $canext = array ('jpg', 'jpeg', 'png', 'gif', 'bmp');

    $ext = explode(".", $filename);
    $ext = $ext[count($ext) - 1];
    $boolean = false;
    foreach($canext as $e) {
        if ( $ext == $e )
            $boolean = true;
    }
    if ( $boolean != true )
        return false;
    return true;
}

?>