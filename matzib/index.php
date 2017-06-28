<?php
include_once './head.php';

?>
<div id="index">
    <style>
    </style>
    <div class="bestzib">
        <h1>인기 맛집</h1>
        <?php
        $sql = "SELECT COUNT(a.matzib_no) AS `count`, b.* FROM `matzib_great` AS a, `matzib` AS b WHERE a.matzib_no = b.no GROUP BY a.`matzib_no` ORDER BY count(a.matzib_no) DESC, `date` DESC LIMIT 0, 10";
        $result = $conn->query($sql);
        if ( $result && $result->num_rows > 0 ){
            while ($row = $result->fetch_assoc()) {
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
                    <ul class="info">
                        <li><?php echo $row['matzib_title']; ?></span></li>
                        <li><i class="material-icons">thumb_up</i><span><?php echo $row['count']; ?>명 추천</span></li>

                    </ul>
                </a>
                <?php
            }
        }else{
            echo "<div class='nothing'>아무 글도 없습니다</div>";
        }
        ?>
    </div>
    <div class="bestzib">
        <h1>최근 등록된 맛집</h1>
        <?php
        $sql = "SELECT * FROM `matzib` ORDER BY `date` DESC LIMIT 0, 10";
        $result = $conn->query($sql);
        if ( $result && $result->num_rows > 0 ){
            while ($row = $result->fetch_assoc()) {
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
                    <ul class="info">
                        <li><?php echo $row['matzib_title']; ?></span></li>

                    </ul>
                </a>
                <?php
            }
        }else{
            echo "<div class='nothing'>아무 글도 없습니다</div>";
        }
        ?>
    </div>
    <div class="latestboard" style="clear:both;">
        <h1>커뮤니티</h1>
        <div class="latest">
            <h3>자유게시판 최근 게시물</h3>
            <div class='list'>
                <?php
                $sql = "SELECT a.*, b.nickname FROM `bbs` AS a, `member` AS b WHERE a.email = b.email AND a.table_name = 'free' ORDER BY a.no DESC LIMIT 0, 10";
                $result = $conn->query($sql);
                if ( $result && $result->num_rows > 0 ){
                    while( $row = $result->fetch_assoc() ) {
                        echo "<a href='./view.php?table={$row['table_name']}&no={$row['no']}'>{$row['subject']}<span>{$row['nickname']}</span></a>";
                    }
                }else{
                    echo "<div class='nothing'>아무 글도 없습니다</div>";
                }
                ?>
            </div>
        </div>
        <div class="latest">
            <h3>질문답변 최근 게시물</h3>
            <div class='list'>
                <?php
                $sql = "SELECT a.*, b.nickname FROM `bbs` AS a, `member` AS b WHERE a.email = b.email AND a.table_name = 'qna' ORDER BY a.no DESC LIMIT 0, 10";
                $result = $conn->query($sql);
                if ( $result && $result->num_rows > 0 ){
                    while( $row = $result->fetch_assoc() ) {
                        echo "<a href='./view.php?table={$row['table_name']}&no={$row['no']}'>{$row['subject']}<span>{$row['nickname']}</span></a>";
                    }
                }else{
                    echo "<div class='nothing'>아무 글도 없습니다</div>";
                }
                ?>
            </div>
        </div>
    </div>
    <!--
    <div class="bestmatzib">
        <div class="list">
            <h3>역대 인기 맛집</h3>
        <?php
        $sql = "SELECT COUNT(a.matzib_no) AS `count`, b.* FROM `matzib_great` AS a, `matzib` AS b WHERE a.matzib_no = b.no GROUP BY a.`matzib_no` ORDER BY count(a.matzib_no) DESC LIMIT 0, 5";
        $result = $conn->query($sql);
        if ( $result && $result->num_rows > 0 ){
            while ($row = $result->fetch_assoc()) {
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
                    <ul class="info">
                        <li><?php echo $row['matzib_title']; ?></span></li>
                        <li><i class="material-icons">thumb_up</i><span><?php echo $row['count']; ?>명 추천</span></li>
                        <?php
                        if ( $row['matzib_telephone'] ) {
                        ?>
                        <li><i class="material-icons">call</i><span><?php echo $row['matzib_telephone']; ?></span></li>
                        <?php
                        }
                        ?>
                        <li><i class="material-icons">location_on</i><span><?php echo $row['matzib_address']; ?></span></li>
                        <li><i class="material-icons">add_location</i><span><?php echo $row['matzib_roadAddress']; ?></span></li>
                    </ul>
                </a>
                <?php
            }
        }else{
            echo "<div class='nothing'>아무 글도 없습니다</div>";
        }
        ?>
        </div>
    </div>
    <div class="latestboard">
        <div class="latest">
            <h3>자유게시판 최근 게시물</h3>
            <div class='list'>
                <?php
                $sql = "SELECT a.*, b.nickname FROM `bbs` AS a, `member` AS b WHERE a.email = b.email AND a.table_name = 'free' ORDER BY a.no DESC LIMIT 0, 10";
                $result = $conn->query($sql);
                if ( $result && $result->num_rows > 0 ){
                    while( $row = $result->fetch_assoc() ) {
                        echo "<a href='./view.php?table={$row['table_name']}&no={$row['no']}'>{$row['subject']}</a>";
                    }
                }else{
                    echo "<div class='nothing'>아무 글도 없습니다</div>";
                }
                ?>
            </div>
        </div>
        <div class="latest">
            <h3>질문답변 최근 게시물</h3>
            <div class='list'>
                <?php
                $sql = "SELECT a.*, b.nickname FROM `bbs` AS a, `member` AS b WHERE a.email = b.email AND a.table_name = 'qna' ORDER BY a.no DESC LIMIT 0, 10";
                $result = $conn->query($sql);
                if ( $result && $result->num_rows > 0 ){
                    while( $row = $result->fetch_assoc() ) {
                        echo "<a href='./view.php?table={$row['table_name']}&no={$row['no']}'>{$row['subject']}</a>";
                    }
                }else{
                    echo "<div class='nothing'>아무 글도 없습니다</div>";
                }
                ?>
            </div>
        </div>
    </div>
    -->
</div>
<?php
include_once './tail.php';
?>
