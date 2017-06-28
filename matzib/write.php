<?php
include_once 'head.php';

if ( !is_login() ) {
    alert("로그인하세요.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
}

$table = $_GET['table'];
checkTableId($table);

?>
<script>
    $(document).ready(function(){
        var eObj = CKEDITOR.replace( 'contents', {
              height : 400
            , filebrowserImageUploadUrl: './upload.php'
        });
    });
</script>
<div id="bbs">
    <h1><i class="material-icons">mode_edit</i><?php echo $matzib['bbs'][$table]; ?> 글쓰기</h1>
    <div class="write">
        <form action="write_ok.php" method="post">
            <input type="hidden" name="table" value="<?php echo $table; ?>">
            <input type="text" name="subject" class="subject" placeholder="글 제목을 입력하세요" minlength="10" required>
            <textarea class="contents" name="contents"></textarea>
            <input type="submit" value="글 작성">
        </form>
    </div>
</div>

<?php
include_once 'tail.php';
?>