<?php
include_once 'head.php';

/*
 * 게시판 글목록 페이지
 */
$table = isset($_GET['table'])?$_GET['table']:'';
checkTableId($table);

$idx = isset($_GET['idx'])?$_GET['idx']:0;
?>
<div id="bbs">
    <h1><i class="material-icons">content_paste</i><?php echo $matzib['bbs'][$table]; ?></h1>
    <table class="list">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>닉네임</th>
            <th>시간</th>
            <th>조회수</th>
        </tr>
        <?php
            $sql = "SELECT a.*, b.nickname FROM `bbs` AS a, `member` AS b WHERE a.email = b.email AND a.table_name = '{$table}' ORDER BY a.no DESC LIMIT {$idx}, 20";
            $result = $conn->query($sql);

            if ( $result && $result->num_rows > 0 )
                while( $row = $result->fetch_assoc() ) {
                    $row['date'] = substr($row['date'], 0, 10) != date('Y-m-d', time())?substr($row['date'], 0, 10):substr($row['date'], 11, 5);
                    $row['comments'] = $row['comments']>0?'('.$row['comments'].')':'';
                    echo "<tr>
                                <td>".$row['no']."</td>
                                <td><a href=\"./view.php?table=".$table."&no=".$row['no']."&idx=".$idx."\" class=\"title\">".$row['subject']."<b>".$row['comments']."</b></a></td>
                                <td>".$row['nickname']."</td>
                                <td>".$row['date']."</td>
                                <td>".$row['views']."</td>
                           </tr>";
                }
            else {
                echo "<tr><td colspan='5' class='nothing'>아무 글도 없습니다.</td>";
            }
        ?>
    </table>
    <div class="paging">
        <?php
        if ( ($idx - 20) >= 0 )
            echo "<a href=\"./board.php?table={$table}&idx=".($idx-20)."\" class=\"prev\"><i class=\"material-icons\">chevron_left</i><span>이전</span></a>";
        if ( $result->num_rows >= 20 )
            echo "<a href=\"./board.php?table={$table}&idx=".($idx+20)."\" class=\"next\"><span>다음</span><i class=\"material-icons\">chevron_right</i></a>";
        ?>
    </div>
    <div class="buttons">
        <a href="./write.php?table=<?php echo $table; ?>" class="write"><i class="material-icons">mode_edit</i><span>글작성</span></a>
    </div>
</div>

<?php
include_once 'tail.php';
?>
