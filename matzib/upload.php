<?php
include_once './config.php';

// 파일 확장자 감지
if ( checkFileName($_FILES['upload']['name']) == false )
    exit;

$upload_dir = './images/';
$upload_file = $upload_dir.basename($_FILES['upload']['name']);

if ( move_uploaded_file($_FILES['upload']['tmp_name'], $upload_file)) {
    echo "<script>window.parent.CKEDITOR.tools.callFunction('{$_GET['CKEditorFuncNum']}', '{$upload_file}', '이미지를 업로드하였습니다.')</script>";
}else {
    echo "<script>alert('업로드에 실패했습니다.');</script>";
}

?>