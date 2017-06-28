<?php
include_once './config.php';
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo $matzib['title']; ?></title>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">
    <link href="./default.css" rel="stylesheet">
    <link href="./matzib.css" rel="stylesheet">
    <script src="./js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="./lib/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=_8if_MmmhMMpL1OHKKDM&submodules=geocoder"></script>
</head>
<div id="header">
    <div class="headArea">
        <div class="article">
            <a class="left" href="./index.php">
                <?php echo $matzib['logo']; ?>
            </a>
            <div class="search">
                <form name="search" action="./matzib_list.php" method="get">
                    <input type="search" placeholder="맛집 이름으로 검색하기" name="search" value="<?php if(isset($_GET['search'])) echo $_GET['search']; ?>" maxlength="10">
                    <input class="material-icons" type="submit" value="search">
                </form>
            </div>
            <div class="menu">
                <ul class="mainmenu">
                    <li>
                        <a href="./index.php">
                            <span>홈</span>
                        </a>
                    </li>
                    <li>
                        <a href="./matzib_list.php">맛집찾기</a>
                    </li>
                    <li>
                        <a href="./board.php?table=free">자유게시판</a>
                    </li>
                    <li>
                        <a href="./board.php?table=qna">질문게시판</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="listArticle">
        <div class="searchlog">
            <ul class="list">
                <li>
                    <a href="#" style="cursor:default">
                        <i class="material-icons">thumb_up</i>
                    </a>
                </li>
                <?php
                $sql = "SELECT * FROM `matzib_search_log` GROUP BY `word` ORDER BY `date` DESC LIMIT 0, 7";
                $result = $conn->query($sql);
                while ( $result && $row = $result->fetch_assoc() ) {
                    ?>
                    <li>
                        <a href="./matzib_list.php?search=<?php echo urlencode($row['word']); ?>&idx=0"><?php echo $row['word']; ?></a>
                    </li>
                    <?php
                }
                ?>
            </ul>
        </div>
    </div>
</div>
<body>
<div id="main">
    <div id="side">
        <?php if ( !is_login() ) { ?>
        <div class="login">
            <form name="login" action="./login.php" method="post">
                <input name="email" type="email" placeholder="이메일" required minlength="4" maxlength="30">
                <input name="password" type="password" placeholder="패스워드" required minlength="4" maxlength="20">
                <input type="submit" value="로그인">
            </form>
            <a href="./join.php">무료로 회원가입하기</a>
        </div>
        <?php }else{ ?>
        <div class="logout">
            <p>
                <i class="material-icons">person</i>
                <span><b><?php echo $_SESSION['nickname']; ?></b>님 환영합니다.</span>
            </p>
            <a href="./logout.php" class="logout">로그아웃</a>
        </div>
        <?php } ?>
        <div class="popularity">
            <h3>자유게시판 7일 인기게시물</h3>
                <div class='list'>
                <?php
                $sql = "SELECT COUNT(a.bbs_no) AS `count`, b.subject, b.no , b.table_name FROM `bbs_view_log` AS a, `bbs` AS b WHERE a.table_name = b.table_name AND a.bbs_no = b.no AND a.`date` > '".date('Y-m-d', time()-(3600*24*7))."' AND a.`table_name` = 'free' GROUP BY a.`bbs_no` ORDER BY count(a.bbs_no) DESC, b.no DESC";
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
        <div class="popularity">
            <h3>질문답변 7일 인기게시물</h3>
            <div class='list'>
                <?php
                $sql = "SELECT COUNT(a.bbs_no) AS `count`, b.subject, b.no , b.table_name FROM `bbs_view_log` AS a, `bbs` AS b WHERE a.table_name = b.table_name AND a.bbs_no = b.no AND a.`date` > '".date('Y-m-d', time()-(3600*24*7))."' AND a.`table_name` = 'qna' GROUP BY a.`bbs_no` ORDER BY count(a.bbs_no) DESC, b.no DESC";
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
    <div id="main_wrap">
