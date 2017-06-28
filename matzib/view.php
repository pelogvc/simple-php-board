<?php
include_once 'head.php';

$table = $_GET['table'];
checkTableId($table);

// no 왔는지 체크
if ( isset($_GET['no']) )
    $no = (int)$_GET['no'];
else
    exit;

// 조회수 증가
if( is_login() ) {
    $sql = "SELECT * FROM `bbs_view_log` WHERE `table_name` = '{$table}' AND `bbs_no` = {$no} AND `member_no` = {$_SESSION['no']}";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    if ( !$result || !$row )
        $conn->query("INSERT INTO `bbs_view_log` (table_name, bbs_no, member_no, date) VALUES ('{$table}', {$no}, {$_SESSION['no']}, now())");
}
$conn->query("UPDATE `bbs` SET `views` = `views` + 1 WHERE `no` = {$no} AND `table_name` = '{$table}'"); // 비회원도

// 게시물 조회
$sql = "SELECT a.*, b.nickname FROM `bbs` AS a, `member` AS b WHERE a.email = b.email AND a.table_name = '{$table}' AND a.no = {$no} ";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
if ( !$result || !$row ) {
    alert('삭제된 게시글입니다.');
    go_url('./board.php?table=' . $table);
    exit;
}

$idx = isset($_GET['idx'])?(int)$_GET['idx']:0;
?>
<div id="bbs">
    <h1><i class="material-icons">content_paste</i><?php echo $matzib['bbs'][$table]; ?></h1>
    <div class="article">
        <a href="./board.php?table=<?php echo $table; ?>&idx=<?php echo $idx; ?>" class="gotolist">
            <i class="material-icons">list</i>
            <span>목록으로</span>
        </a>
        <div class="header">
            <div class="info1">
                <span><b><?php echo $row['nickname']; ?></b></span>
                <span><?php echo $row['date']; ?></span>
            </div>
            <h2 class="subject"><?php echo $row['subject']; ?></h2>
            <div class="info2">
                <span>조회수 <?php echo $row['views']; ?></span>
                <span>댓글 <?php echo $row['comments']; ?></span>
            </div>
        </div>
        <div class="contents">
            <?php echo $row['contents']; ?>
        </div>
    </div>
    <div class="commentlist">
        <div class="header">
            <i class="material-icons">comment</i><span>댓글을 작성하세요.</span>
        </div>
        <form class="writecomment" method="post" action="comment.php">
            <input type="hidden" name="table" value="<?php echo $table; ?>">
            <input type="hidden" name="no" value="<?php echo $no; ?>">
            <textarea name="contents" placeholder="욕설은 안돼요." minlength="6" required></textarea>
            <input type="submit" value="댓글작성">
        </form>
        <div class="list">
            <?php
            $sql = "SELECT a.*, b.nickname FROM `bbs_comments` AS a, `member` AS b WHERE a.email = b.email AND a.table_name = '{$table}' AND a.bbs_no = {$no} ORDER BY `no` DESC ";
            $result = $conn->query($sql);
            if ( $result && $result->num_rows > 0 ) {
                while ($row = $result->fetch_assoc()) {
                    //같은 날이면 시간만 보여주기
                    if (substr($row['date'], 0, 10) == date('Y-m-d', time()))
                        $row['date'] = substr($row['date'], 11, 5);
                    //내용 html허용X + 자동 줄바꿈
                    $row['contents'] = nl2br(htmlspecialchars($row['contents']));
                    echo " <div class=\"article\">
                                <div class=\"header\">
                                    <span class=\"name\">" . $row['nickname'] . "</span>
                                    <span class=\"time\">" . $row['date'] . "</span>
                                </div>
                                <div class=\"contents\">" . $row['contents'] . "</div>
                            </div>";
                }
            } else {
                echo "<div class=\"article\">
                            <span class=\"nothing\">아무댓글도없어요<br>가장 먼저 댓글을 남겨주세요.</span>
                       </div>";
            }
            ?>
        </div>
    </div>
</div>
<?php
include_once 'tail.php';
?>