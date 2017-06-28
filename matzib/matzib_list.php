<?php
include_once 'head.php';

$idx = isset($_GET['idx'])?$_GET['idx']:0;
?>
<div id="bbs">
    <?php
    if ( isset($_GET['search']) )
        echo "<h1><i class=\"material-icons\">search</i>맛집 {$_GET['search']} 검색결과</h1>";
    else
        echo "<h1><i class=\"material-icons\">content_paste</i>맛집 게시판</h1>";
    ?>
    <div class="matziblist">
        <?php
            
            // 검색 결과 보여주기
            if ( isset($_GET['search']) ) {
                $sql = "SELECT a.*, b.nickname FROM `matzib` AS a, `member` AS b WHERE a.email = b.email AND (a.subject LIKE '%{$_GET['search']}%' OR a.matzib_title LIKE '%{$_GET['search']}%' ) ORDER BY a.no DESC LIMIT {$idx}, 5";
            }else {
                $sql = "SELECT a.*, b.nickname FROM `matzib` AS a, `member` AS b WHERE a.email = b.email ORDER BY a.no DESC LIMIT {$idx}, 5";
            }
            $result = $conn->query($sql);

            if ( $result && $result->num_rows > 0 ) {
                // 검색 기록 남기기; 결과가 0이상일때만
                if ( isset($_GET['search']) && $_GET['search'] != null && !isset($_GET['idx']) ) { // 검색어가 있고, paging이 아닐때만
                    if ( is_login() )
                        $sqls = "INSERT INTO `matzib_search_log` (word, member_no, date) VALUES (
                    '{$_GET['search']}'
                    , '{$_SESSION['no']}'
                    , now()
                    )";
                    else
                        $sqls = "INSERT INTO `matzib_search_log` (word, date) VALUES (
                    '{$_GET['search']}'
                    , now()
                    )";
                    $conn->query($sqls);
                }
                while ($row = $result->fetch_assoc()) {
                    //$row['date'] = substr($row['date'], 0, 10) != date('Y-m-d', time()) ? substr($row['date'], 0, 10) : substr($row['date'], 11, 5);
                    $row['date'] = substr($row['date'], 0, 16);
                    $comments = $row['comments'] > 0 ? '(' . $row['comments'] . ')' : '';

                    // 내용 중 첫번째 이미지 가져와버리기~~
                    preg_match_all("/<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>/i", $row['contents'], $img);
                    $img = isset($img[1][0])?"<img src=\"{$img[1][0]}\">":"<div class='nothing'><i class=\"material-icons\">error</i>사진없음</div>";

                    ?>
                    <a href="./matzib_view.php?no=<?php echo $row['no']; ?>" class="list">
                        <div class="img">
                            <?php echo $img ?>
                        </div>
                        <div class="bbsinfo">
                            <div class="subject"><?php echo $row['subject']; ?><b><?php echo $comments; ?></b></div>
                            <ul>
                                <li><i class="material-icons">home</i><span><?php echo $row['matzib_title']; ?></span></li>
                                <li><?php echo $row['nickname']; ?></li>
                                <li><?php echo $row['date']; ?></li>
                                <li><br>조회수 <?php echo $row['views']; ?>회</li>
                                <li>댓글 <?php echo $row['comments']; ?>개</li>
                            </ul>
                        </div>
                        <ul class="info">
                            <li><i class="material-icons">title</i><span><?php echo $row['matzib_title']; ?></span></li>
                            <li><i class="material-icons">call</i><span><?php echo $row['matzib_telephone']; ?></span></li>
                            <li><i class="material-icons">location_on</i><span><?php echo $row['matzib_address']; ?></span></li>
                            <li><i class="material-icons">add_location</i><span><?php echo $row['matzib_roadAddress']; ?></span></li>
                        </ul>
                    </a>
                    <?php
                }
            }else {
                echo "<div class='nothing'>아무 글도 없습니다.</div>";
            }
        ?>
    </div>
    <div class="paging">
        <?php
        if ( ($idx - 5) >= 0 )
            echo "<a href=\"./matzib_list.php?idx=".($idx-5)."\" class=\"prev\"><i class=\"material-icons\">chevron_left</i><span>이전</span></a>";
        if ( $result->num_rows >= 5 )
            echo "<a href=\"./matzib_list.php?idx=".($idx+5)."\" class=\"next\"><span>다음</span><i class=\"material-icons\">chevron_right</i></a>";
        ?>
    </div>
    <div class="buttons">
        <a href="./matzib_write.php" class="write"><i class="material-icons">mode_edit</i><span>글작성</span></a>
    </div>
</div>

<?php
include_once 'tail.php';
?>
