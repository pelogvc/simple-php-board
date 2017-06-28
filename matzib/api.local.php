<?php
include_once './config.php';

/*
 * naver 지역 검색 api 를 사용하여 json type 으로 return 한다.
 * 처리는 프론트엔드에서
 */

$query = http_build_query($_POST);

$header = array(
    "X-Naver-Client-Id : _8if_MmmhMMpL1OHKKDM",
    "X-Naver-Client-Secret : bHWyrcEe5k"
);
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://openapi.naver.com/v1/search/local.json"."?".$query );
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true );
curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false );
curl_setopt($ch, CURLOPT_COOKIE, '' );
curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 300);
$g = curl_exec($ch);
curl_close($ch);

echo $g;


?>