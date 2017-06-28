<?php
include_once 'head.php';

if ( is_login() ) {
    //alert("이미 로그인 중 입니다.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
}
?>
<div class="join">
    <h1><i class="material-icons">content_copy</i>회원가입</h1>
    <form action="join_ok.php" method="post">
        <table>
            <tr>
                <th>이메일</th>
                <td><input name="email" type="email" placeholder="이메일" required minlength="4" maxlength="30"></td>
            </tr>
            <tr>
                <th>패스워드</th>
                <td><input name="password" type="password" placeholder="패스워드(4~20자)" required minlength="4" maxlength="20"></td>
            </tr>
            <tr>
                <th>이름</th>
                <td><input name="name" type="text" placeholder="이름(2~5자)" required minlength="2" maxlength="5"></td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td><input name="nickname" type="text" placeholder="닉네임(2~5자)" required minlength="2" maxlength="5"></td>
            </tr>
        </table>
        <input type="submit" value="무료로 회원가입하기">
    </form>
</div>

<?php
include_once 'tail.php';
?>
