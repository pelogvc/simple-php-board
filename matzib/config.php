<?php
session_start();
ini_set('date.timezone', 'Asia/Seoul');

include_once './dbconn.php';
include_once './func.php';

$matzib = array( "title" => "MATZIB(맛집)"
                , "logo" => "<img src='./image/logo.png' style='margin-top:30px;display:block'>"
);

$matzib['bbs'] = array(
      "free"        =>  "자유게시판"
    , "qna"         => "질문답변게시판"
)
?>