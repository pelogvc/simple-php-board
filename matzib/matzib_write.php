<?php
include_once 'head.php';
if ( !is_login() ) {
    alert("로그인하세요.");
    $url = (isset($_SERVER['HTTP_REFERER'])) ? $_SERVER['HTTP_REFERER'] : './index.php';
    go_url($url);
}
?>
<script>
    $(document).ready(function(){
        var eObj = CKEDITOR.replace( 'contents', {
              height : 400
            , filebrowserImageUploadUrl: './upload.php'
        });
    });
</script>
    <script>
        // 기본 로딩
        $(document).ready(function() {
            var map, marker;

            // 기본 : 대진대로
            map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(37.873063, 127.156772),
                zoom: 10
            });
            marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(37.873063, 127.156772),
                map: map
            });
            var s = 1; // index
            var query;
            function writeLocalList(query, start){
                var contents;
                $.ajax({
                    type: "POST",
                    url: "./api.local.php",
                    data: {query: query, start: start},
                    dataType: "json",
                    success: function (data) {
                        contents = "";
                        $.each(data['items'], function(i, v){
                            contents += "<div class='content'>" +
                                "<h1 class='title'>" + v['title'] + "</h1>" +
                                "<span class='telephone'>" + v['telephone'] + "</span>" +
                                "<span class='address'>" + v['address'] + "</span>" +
                                "<span class='roadAddress'>" + v['roadAddress'] + "</span>" +
                                "<span class='mapx'>" + v['mapx'] + "</span>" +
                                "<span class='mapy'>" + v['mapy'] + "</span>" +
                                "</div>";
                        });
                        if ( s+10 >= data['total'] )
                            $("#searchMore").css('display','none');
                        else
                            $("#searchMore").css('display','block');

                        if ( start > 1 )
                            $(".searchContents").append(contents);
                        else
                            $(".searchContents").html(contents);
                    }
                });
            }
            // 검색
            $("#maptext").keypress(function (e) { // 엔터키 처리
                if (e.which == 13){
                    $('#mapsearch').click();
                    return false;
                }
            });
            $('#mapsearch').click(function() {
                query = $("#maptext").val();
                s = 1;
                writeLocalList(query, s);
                return false;
            });
            // 더 보기
            $('#searchMore').click(function() {
                s += 10;
                writeLocalList(query, s);
                return false;
            });
            // 리스트중에 선택, 동적 컨텐츠라 on 메소드 사용
            $('.searchContents').on('click', '.content', function(){

                //input 에 넣기
                $('form>input[name=matzib_title]').val($(this).children('.title').text());
                $('form>input[name=matzib_telephone]').val($(this).children('.telephone').text());
                $('form>input[name=matzib_address]').val($(this).children('.address').text());
                $('form>input[name=matzib_roadAddress]').val($(this).children('.roadAddress').text());
                $('form>input[name=matzib_mapx]').val($(this).children('.mapx').text());
                $('form>input[name=matzib_mapy]').val($(this).children('.mapy').text());

                // 지도에 그리기
                map = new naver.maps.Map("map",{
                    center: new naver.maps.Point($(this).children('.mapx').text(), $(this).children('.mapy').text()),
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
                marker = new naver.maps.Marker({
                    position: new naver.maps.Point($(this).children('.mapx').text(), $(this).children('.mapy').text()),
                    map: map
                });

                //색강조
                $(this).css('background-color', '#cae0ef');
                $(this).prevAll().css('background-color', '#f2f4f7');
                $(this).nextAll().css('background-color', '#f2f4f7');
            });
        });
    </script>
<div id="bbs">
    <h1><i class="material-icons">mode_edit</i>맛집 게시판 글쓰기</h1>
    <div class="write">
        <form action="matzib_write_ok.php" method="post">
            <input type="text" name="subject" class="subject" placeholder="글 제목을 입력하세요" minlength="10" required>
            <div class="searchNaver"> <!-- use naver api -->
                <div class="list">
                    <input type="text" placeholder="맛집 이름으로 검색" id="maptext">
                    <input type="button" class="material-icons" value="search" id="mapsearch">
                    <div class="searchContents">
                    </div>
                    <div class="searchMore" id="searchMore">
                        <i class="material-icons">add</i><span>더보기</span>
                    </div>
                </div>
                <div class="map" id="map">
                </div>
            </div>
            <textarea class="contents" name="contents"></textarea>
            <input type="hidden" name="matzib_title">
            <input type="hidden" name="matzib_telephone">
            <input type="hidden" name="matzib_address">
            <input type="hidden" name="matzib_roadAddress">
            <input type="hidden" name="matzib_mapx">
            <input type="hidden" name="matzib_mapy">
            <input type="submit" value="글 작성">
        </form>
    </div>
</div>

<?php
include_once 'tail.php';
?>