<?php
include_once 'head.php';


// no 왔는지 체크
if ( isset($_GET['no']) )
    $no = (int)$_GET['no'];
else
    exit;

// 조회수 증가
$conn->query("UPDATE `matzib` SET `views` = `views` + 1 WHERE `no` = {$no}"); // 비회원도

// 게시물 조회
$sql = "SELECT a.*, b.nickname FROM `matzib` AS a, `member` AS b WHERE a.email = b.email AND a.no = {$no} ";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
if ( !$result || !$row ) {
    alert('삭제된 게시글입니다.');
    go_url('./board.php?table=' . $table);
    exit;
}

$idx = isset($_GET['idx'])?(int)$_GET['idx']:0;
?>
<script>
$(document).ready(function() {
// 지도에 그리기
    var map = new naver.maps.Map("map", {
        center: new naver.maps.Point(<?php echo $row['matzib_mapx']; ?>, <?php echo $row['matzib_mapy']; ?>),
        zoom: 12,
        mapTypes: new naver.maps.MapTypeRegistry({
            'normal': naver.maps.NaverMapTypeOption.getNormalMap({
                projection: naver.maps.TM128Coord
            }),
            'terrain': naver.maps.NaverMapTypeOption.getTerrainMap({
                projection: naver.maps.TM128Coord
            }),
            'satellite': naver.maps.NaverMapTypeOption.getSatelliteMap({
                projection: naver.maps.TM128Coord
            }),
            'hybrid': naver.maps.NaverMapTypeOption.getHybridMap({
                projection: naver.maps.TM128Coord
            })
        })
    });
    var marker = new naver.maps.Marker({
        position: new naver.maps.Point(<?php echo $row['matzib_mapx']; ?>, <?php echo $row['matzib_mapy']; ?>),
        map: map
    });
});
</script>
<div id="bbs">
    <h1><i class="material-icons">content_paste</i>맛집 게시판</h1>
    <div class="article">
        <a href="./matzib_list.php?idx=<?php echo $idx; ?>" class="gotolist">
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
        <div class="great">
            <?php
            $sql = "SELECT count(*) as count FROM `matzib_great` WHERE `matzib_no` = {$no}";
            $result = $conn->query($sql);
            $great_row = $result->fetch_assoc();
            ?>
            <a href="./matzib_great.php?no=<?php echo $no; ?>"><i class="material-icons">star_rate</i><span><?php echo $great_row['count']; ?></span></a>
        </div>
    </div>
    <div class="matzibview">
        <div class="header">
            <i class="material-icons">location_on</i><span>맛집정보</span>
        </div>
        <ul class="content">
            <li><i class="material-icons">title</i><span><?php echo $row['matzib_title']; ?></span></li>
            <li><i class="material-icons">call</i><span><?php echo $row['matzib_telephone']; ?></span></li>
            <li><i class="material-icons">location_on</i><span><?php echo $row['matzib_address']; ?></span></li>
            <li><i class="material-icons">add_location</i><span><?php echo $row['matzib_roadAddress']; ?></span></li>
        </ul>
        <div class="map" id="map">

        </div>
    </div>
    <div class="commentlist">
        <div class="header">
            <i class="material-icons">comment</i><span>댓글을 작성하세요.</span>
        </div>
        <form class="writecomment" method="post" action="matzib_comment.php">
            <input type="hidden" name="no" value="<?php echo $no; ?>">
            <textarea name="contents" placeholder="욕설은 안돼요." minlength="6" required></textarea>
            <input type="submit" value="댓글작성">
        </form>
        <div class="list">
            <?php
            $sql = "SELECT a.*, b.nickname FROM `matzib_comments` AS a, `member` AS b WHERE a.email = b.email AND a.matzib_no = {$no} ORDER BY `no` DESC ";
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