-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 17-06-24 08:30
-- 서버 버전: 10.1.22-MariaDB
-- PHP 버전: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `matzib`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `bbs`
--

CREATE TABLE `bbs` (
  `no` int(11) NOT NULL,
  `table_name` varchar(20) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `contents` text NOT NULL,
  `comments` int(11) NOT NULL DEFAULT '0',
  `email` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `bbs`
--

INSERT INTO `bbs` (`no`, `table_name`, `subject`, `contents`, `comments`, `email`, `date`, `views`) VALUES
(2, 'free', 'gasdgsda', '<p>fsdafasdfsd<img alt=\"\" src=\"./images/dictionary.png\" style=\"height:128px; width:128px\" />gasdfsdafsadfsadf</p>\r\n', 0, 'test@naver.com', '2017-04-11 03:13:21', 7),
(3, 'free', 'asgsadfsadfasdfsda', '<p>gsadsdaf</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:21:57', 13),
(4, 'free', '안녕하세요', '<p>감사하빈다.안녕하세요</p>\r\n\r\n<p>ㅎㅁㄴㅇㄹ ㅋㄷㅋㄷ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:29:41', 7),
(5, 'free', '사람들 닉네임이 왤케 귀엽냐?', '<p>그르게 말이에요 ㅎㅎ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:30:17', 11),
(6, 'free', '감사합니다', '<p>네</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:50:26', 7),
(7, 'free', '테스트', '<p>ㅍㅍㅍ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:50:32', 7),
(8, 'free', '페이징 테스트 20개 채우기', '<p>ㅅㅅㅅ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:50:39', 11),
(9, 'free', '채우는중', '<p>ㅇㅇㅇ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:50:44', 7),
(10, 'free', '자유게시판', '<p>ㄴㅁㅇㄹ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:50:48', 7),
(11, 'free', '맛집', '<p>ㅎㅁㄴㅇㅎㅁㄴㅇㅎㄴㅁㅎㄴㅁ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:50:51', 7),
(12, 'free', '웹프로그래밍', '<p>ㅎㄴㅇㅁㅎㅇㅁㄶㅇㅁㄴ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:01', 11),
(13, 'free', '저는 김휘용입니다', '<p>ㅎㅇㄴㅁㅎㄴㅇㅁㅎㄴㅇㅁ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:05', 9),
(14, 'free', '저는 손동욱 입니다', '<p>ㄶㅇㄴㅁㅇㅎㅇㄴㅁㅎㅇㅁㄶㄴㅇㅁ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:09', 7),
(15, 'free', '저는 안현수입니다', '<p>ㄴㅇㅁㅎㄴㅇㅁㅎㅌㅋㅍㅋㅌㅊㅍㅋㅌㅍㅋㅌㅊㅍ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:14', 15),
(16, 'free', '게시판 테스트', '<p>ㅎㄴㅁㅇㅎㄴㅇㅁㅎㄴㅁㅎㄴㅇㅁㄻㄴㅇㄹㅇㅁㄶㄴㅇㅁㄻㄴㅇㄹㄴㅇㅁㄹㅇㅁㄴㄹㄴㅁㅇㄹㄴㅇㅁㄹ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:20', 7),
(17, 'free', '감사합니다감사합니다감사합니다감사합니다감사합니다감사합니다', '<p>ㅠㅎㅊㅋㅍㅋㅌㅊㅍ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:26', 16),
(18, 'free', '반갑습니다', '<p>ㅎㄴㅇㅁㄹㄴㅇㅁㄻㄴㅇㄹㅇㄴ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:31', 7),
(19, 'free', '감사해요', '<p>ㅎㅎ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:36', 8),
(20, 'free', '굿', '<p>ㅅㅅ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:40', 8),
(21, 'free', '안녕하세요', '<p>ㅎㅎ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:45', 9),
(22, 'free', 'ㅎㅎㅎㅎ', '<p>ㅎㅎㅎ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:51:57', 7),
(23, 'free', '이미지도 첨부가 됩니다.', '<p><img alt=\"\" src=\"./images/dictionary.png\" style=\"height:128px; width:128px\" /></p>\r\n\r\n<p>ㅎㅎ</p>\r\n', 0, 'test@naver.com', '2017-05-28 03:52:23', 17),
(24, 'free', '제 닉네임은 삼겹살 입니다.', '<p>&nbsp;</p>\r\n\r\n<p>삼겹살입니다 ㅎㅎ</p>\r\n', 0, 'test@test.com', '2017-05-28 03:54:52', 20),
(25, 'free', '긴글 테스트', '<p><img alt=\"\" src=\"http://image.hankookilbo.com/i.aspx?Guid=6a6cccf6b1cc4ed6b6ff279099e5d471&amp;Month=201705&amp;size=640\" /></p>\r\n\r\n<p>커제 9단이 27일 오전 중국 저장(浙江)성 우전(烏鎭) 인터넷 국제컨벤션센터에서 열린 &#39;바둑의 미래 서밋&#39; 행사에서 구글의 인공지능(AI) 알파고를 상대로 마지막 3국을 두고 있다. 연합뉴스</p>\r\n\r\n<p>세계 최강자로 인정받는 중국랭킹 1위 커제(柯潔ㆍ20) 9단도 바둑 인공지능 알파고에 무릎을 꿇었다.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>하지만 지난해 이세돌 9단이 알파고에 패했을 때 &lsquo;충격과 공포&rsquo;에 쌓였던 것과 달리 알파고 쇼크를 맞이한 지 1년 2개월이 지난 지금의 바둑계는 인공지능의 발전을 즐기고 있다.</p>\r\n\r\n<p>알파고를 만든 구글 딥마인드는 1년 전보다 알파고의 실력이 3점 늘었다고 자평했다. 3점 강해졌다는 것에 대해 김지석 9단은 &lsquo;100ｍ 달리기에서 상대에게 3초를 제해줘도 동등하게 경쟁할 수 있다는 느낌&rsquo;이라고 설명하기도 했다. 그만큼 알파고의 바둑 실력은 인간계를 뛰어넘었다는 뜻이다.</p>\r\n\r\n<p>실제로 알파고는 지난 23일부터 27일까지 중국 저장(浙江)성 우전(烏鎭) 국제인터넷컨벤션센터에서 열린 &lsquo;바둑의 미래 서밋&rsquo;에서 커제 9단을 3차례 격파하며 이를 입증했다. 26일 열린 상담기 행사에서는 중국 최정상의 프로 바둑기사 5명이 팀을 짜서 대적해도 알파고가 이겼다.</p>\r\n\r\n<p>하지만 바둑계는 이제 충격받지 않는다. 커제 9단은 대국 시작 전부터 알파고를 &lsquo;신선&rsquo;에 비유했고, 1국 패배 후에는 &lsquo;바둑의 신&rsquo;에 빗대기도 했다. 알파고의 압승은 어찌 보면 예상했던 결과다.</p>\r\n\r\n<p>그렇다고 인간이 알파고를 자포자기 심정으로 바라보는 것은 아니다. 정복하지는 못하더라도 탐험의 대상으로 여기고 있다. 지난해 알파고의 역습 이후 바둑계는 서서히 알파고를 가까이 받아들였다.</p>\r\n\r\n<p>알파고가 2016년 12월 말과 올해 1월 초 사이 인터넷에서 정상의 프로기사들에 60연승을 거둘 때 프로기사들은 놀라워하면서도 도전 의식에 들끓었다. 이때부터 알파고는 이세돌 9단과 겨뤘을 때보다 훨씬 강해져 있었다. 딥마인드가 &lsquo;알파고 마스터&rsquo;라고 부르는 이 알파고가 이번에 커제 9단과 대국한 알파고 버전이다.</p>\r\n\r\n<p>알파고는 프로기사들 사이에서 겨뤄보고 싶은 인기 상대가 됐다. 기사들은 알파고의 파격적인 수를 연구하고 실전에 차용하기도 했다. 그러면서 알파고의 약점을 찾아내려는 도전을 멈추지 않고 있다.</p>\r\n\r\n<p>그 과정에서 인간의 바둑도 진화했다. 오정아 3단은 &ldquo;알파고 등장 이후 &lsquo;이상한 수&rsquo;, &lsquo;말도 안 되는 수&rsquo;란 없다는 것을 깨달았다&quot;며 &ldquo;바둑이 시야가 넓어졌다. 바둑을 둘 때 전체적으로 보려고 노력하고 있다&rdquo;고 말했다. 오유진 5단도 &ldquo;대부분의 기사가 알파고 수법을 써봤을 것이다. 실전에서도 많이 시도하고 있다. 기존과 다른 바둑이 많이 나온다&rdquo;며 &ldquo;바둑이 더 재밌어졌다&rdquo;고 말했다.</p>\r\n\r\n<p>중국의 롄샤오 8단은 지난 26일 알파고와 페어바둑을 펼친 뒤 &ldquo;알파고와 팀을 이뤄 대국하면서 바둑의 지평을 넓어졌다. 바둑에 더 많은 상상력과 창의력을 발휘할 수 있었다&rdquo;고 기뻐했다. 롄샤오 8단은 &ldquo;알파고가 막강하다고 느끼지만, 천하무적이라고는 생각지 않는다. 여전히 개선의 여지가 있다&rdquo;고 기대했다.</p>\r\n\r\n<p>김지석 9단도 &ldquo;인간이 알파고를 이길 가능성이 0에 가깝다고는 해도, 알파고와 대국하면 그 어떤 대국보다 많은 것을 배울 수 있다&rdquo;고 말했다. 이어 &ldquo;알파고 등장 이후 바둑을 더 자유롭게 생각하게 됐다&rdquo;며 &ldquo;전체적으로 인공지능 덕분에 인간의 바둑이 더 발전하는 기회가 됐다&quot;&rdquo;고 반겼다.</p>\r\n\r\n<p>이처럼 바둑계는 인공지능을 공존의 대상으로 받아들이고 이를 더 잘 활용하려고 한다. 구글 딥마인드는 알파고 기술을 활용해 인공지능을 의료&middot;에너지 등 다양한 분야로 확장할 구상을 하고 있다. 알파고를 경험한 바둑계는 인간의 한계를 넘어서는 인공지능 기술이 인간을 더욱 풍요롭게 해주기를 기대하고 있다. 상담기에 참여했던 스웨 9단은 &ldquo;인공지능은 인간의 삶을 더 좋게 하는 데 다양하게 활용될 것으로 생각한다&rdquo;고 내다봤다.</p>\r\n\r\n<p>이서희 기자 shlee@hankookilbo.com</p>\r\n', 0, 'test@naver.com', '2017-05-28 04:33:14', 23),
(26, 'free', '테스트', '<p>&nbsp;</p>\r\n\r\n<p>이름은 오오오</p>\r\n\r\n<p>닉네임 은 이이이이</p>\r\n\r\n<p>감사</p>\r\n\r\n<p>합니다</p>\r\n\r\n<p>구구구구</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, 'test@naver.com', '2017-05-28 04:35:07', 23),
(27, 'free', '삼겹살', '<p>외식, 회식 자리에서 1순위로 꼽히는 삼겹살. 특히 황사가 올 때면 찾게되는 삼겹살은 대표적인 디톡스 음식이라고 할 수 있습니다.</p>\r\n\r\n<h3><em>1.</em>&nbsp;기본정보</h3>\r\n\r\n<p><strong>&middot; 구입요령 :</strong>&nbsp;하얀 지방과 붉은 살코기 부분이 선명하게 줄을 이루고 있는 것을 고른다. 기름은 하얗고 살코기 부위는 선명한 핑크빛을 띠는 것이 신선하다.<br />\r\n<strong>&middot; 유사재료 :</strong>&nbsp;차돌박이 (차돌박이와 삽겹살은 보통 구이로 해서 먹는다. 삼겹살은 기름이 많고 육질이 연하다. 차돌박이는 색이 짙다.)<br />\r\n<strong>&middot; 보관온도 :</strong>&nbsp;1~5℃<br />\r\n<strong>&middot; 보관일 :</strong>&nbsp;3일<br />\r\n<strong>&middot; 보관법 :</strong>&nbsp;삼겹살은 되도록이면 덩어리째 보관하는 것이 맛을 잃지 않는 비결이다.<br />\r\n<strong>&middot; 손질법 :</strong>&nbsp;기름이 두껍다고 모두 떼내고 조리하면 오히려 맛이 없어진다. 손질할 때 중간에 붙어 있는 기름은 그냥 두고 바깥쪽에 덩어리로 붙어 있는 기름만 떼내도록 한다.<br />\r\n<strong>&middot; 산지특성 및 기타정보 :</strong>&nbsp;돼지는 중국에서 사육하였다는 기록이 남아 있고, 고대 그리스에서는 햄, 소시지 등의 육가공품이 가공되었다.</p>\r\n\r\n<h3><em>2.</em>&nbsp;섭취정보</h3>\r\n\r\n<p><strong>&middot; 섭취방법 :</strong>&nbsp;삼겹살은 대게 아무런 양념 없이 석쇠나 프라이팬에 구워 소금을 뿌려 먹지만 편육, 볶음 등에 다양하게 응용할 수 있다.<br />\r\n<strong>&middot; 궁합음식정보 :</strong>&nbsp;마늘 (마늘의 알리신이라는 성분이 돼지고기의 영양소 흡수를 돕는다.)<br />\r\n<strong>&middot; 다이어트 :</strong>&nbsp;기름기 적은 살코기 부위를 먹는 것이 다이어트에 효과적이다.<br />\r\n<strong>&middot; 주의사항 :</strong>&nbsp;고지혈증, 동맥경화증 유발 (삼겹살에는 다른 부위에 비해 포화지방산이 많아 과다 섭취시에는 혈관 침착으로 동맥경화증 및 고지혈증 등 성인병에 노출될수 있으므로 기름기를 제거하고 섭취해야 한다.)<br />\r\n<strong>&middot; 영양성분</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<table border=\"1\" cellspacing=\"0\">\r\n	<caption>&nbsp;</caption>\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n			<p>니아신<br />\r\n			4.40mg</p>\r\n			</td>\r\n			<td>\r\n			<p>나트륨<br />\r\n			44.00mg</p>\r\n			</td>\r\n			<td>\r\n			<p>단백질<br />\r\n			17.20g</p>\r\n			</td>\r\n			<td>\r\n			<p>당질<br />\r\n			0.30g</p>\r\n			</td>\r\n			<td>\r\n			<p>레티놀<br />\r\n			6.00㎍</p>\r\n			</td>\r\n			<td>\r\n			<p>베타카로틴<br />\r\n			0.00㎍</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>비타민 A<br />\r\n			6.00㎍RE</p>\r\n			</td>\r\n			<td>\r\n			<p>비타민 B1<br />\r\n			0.68mg</p>\r\n			</td>\r\n			<td>\r\n			<p>비타민 B2<br />\r\n			0.30mg</p>\r\n			</td>\r\n			<td>\r\n			<p>비타민 B6<br />\r\n			0.09mg</p>\r\n			</td>\r\n			<td>\r\n			<p>비타민 C<br />\r\n			1.00mg</p>\r\n			</td>\r\n			<td>\r\n			<p>비타민 E<br />\r\n			0.29mg</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>식이섬유<br />\r\n			0.00g</p>\r\n			</td>\r\n			<td>\r\n			<p>아연<br />\r\n			1.50mg</p>\r\n			</td>\r\n			<td>\r\n			<p>엽산<br />\r\n			0.70㎍</p>\r\n			</td>\r\n			<td>\r\n			<p>인<br />\r\n			132.00mg</p>\r\n			</td>\r\n			<td>\r\n			<p>지질<br />\r\n			28.40g</p>\r\n			</td>\r\n			<td>\r\n			<p>철분<br />\r\n			0.70mg</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>칼륨<br />\r\n			202.00mg</p>\r\n			</td>\r\n			<td>\r\n			<p>칼슘<br />\r\n			8.00mg</p>\r\n			</td>\r\n			<td>\r\n			<p>콜레스테롤<br />\r\n			64.00mg</p>\r\n			</td>\r\n			<td>\r\n			<p>회분<br />\r\n			0.80g</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n			<td>\r\n			<p>&nbsp;</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>영양성분 : 100g 기준</p>\r\n\r\n<p>출처</p>\r\n\r\n<p><em>쿡쿡TV</em><a href=\"http://terms.naver.com/list.nhn?categoryId=42795\">표제어 전체보기</a></p>\r\n\r\n<p>본 콘텐츠의 저작권은 저자 또는 제공처에 있으며, 이를 무단 이용하는 경우 저작권법 등에 따라 법적책임을 질 수 있습니다.<br />\r\n외부 저작권자가 제공한 콘텐츠는 네이버의 입장과 다를 수 있습니다.</p>\r\n\r\n<p><strong>[네이버 지식백과]</strong>&nbsp;<a href=\"http://terms.naver.com/entry.nhn?docId=1993053\">삼겹살</a>&nbsp;(쿡쿡TV)</p>\r\n', 0, 'test@naver.com', '2017-05-28 04:39:30', 20),
(28, 'free', '삼겹살 먹고싶다', '<p>&nbsp;</p>\r\n\r\n<p>삼겹살은 &#39;살과 지방부분이 3번 겹쳐져 있다고 해서 붙여진 이름&#39;이며, 갈비를 떼어낸 부분에서 복부까지의 넓고 납작한 모양의 부위로&nbsp;붉은 살코기와&nbsp;지방이 삼겹의 막을 형성하여 풍미가 좋다. 돼지고기 부위 중 가장 고소하고 다양한 조리가 가능하지만 기름기가 많아 지방 함유량이 많고 칼로리가 높다.<br />\r\n<br />\r\n다른 육류에 비해 특히 비타민 B군 및&nbsp;양질의 단백질, 인, 칼륨, 철분&nbsp;등의 각종 미네랄이 풍부하여 젊고&nbsp;탄력 있는 피부를 유지시켜 주며, 어린이의 성장발육에도 좋다.&nbsp;또한 돼지고기에 많이 들어 있는 철분은 체내 흡수율이 높아 철 결핍성 빈혈을 예방하며 메티오닌 성분은 간장보호와 피로회복에 좋다. 그러나 칼로리가 높아 과식을 할 경우 비만이 될 수&nbsp;있으므로&nbsp;주의해야 한다.<br />\r\n<br />\r\n삼겹살은 지방의 질이 좋을수록 풍미가 좋으며 조리과정 중 너무 오래 구우면 기름기가 다 빠져 고기가 딱딱해지고 맛이 없으므로 빨리 구워야 고기에 기름이 돌고 부드럽다. 기름기를 제한해야 할 경우는 삶아서 식힌 후 표면에 굳은 지방을 제거하고 섭취하면 좋다. 또한 고추장 또는 된장, 양파, 마늘, 버섯, 깻잎, 새우젓, 익은김치&nbsp;등의 식품과 함께 먹으면 단백질과 지방분해에 도움이 되고, 살균작용, 지방산화작용, 냄새제거 등의 효과를 얻을 수 있다.<br />\r\n<br />\r\n우리나라에서는 구이, 볶음, 편육용으로, 외국요리에서는 로스구이 및 베이컨 가공에 많이 이용한다.</p>\r\n\r\n<p><strong>[네이버 지식백과]</strong>&nbsp;<a href=\"http://terms.naver.com/entry.nhn?docId=1294672\">삼겹살</a>&nbsp;(두산백과)</p>\r\n', 0, 'test@test.com', '2017-05-28 04:40:58', 200),
(33, 'free', '구구구구', '<p>ㅎㅎ</p>\r\n', 2, 'test@test.com', '2017-05-28 06:21:23', 63),
(34, 'qna', '궁금증 있습니다. ', '<p>&nbsp;</p>\r\n\r\n<p>궁금증이 있어요&nbsp;</p>\r\n', 0, 'test@test.com', '2017-06-04 17:42:15', 6),
(35, 'qna', '안녕하세요 궁금한게 있어요', '<p>&nbsp;</p>\r\n\r\n<p>누가만들었나요??</p>\r\n', 0, 'test@test.com', '2017-06-24 14:28:33', 0),
(36, 'qna', '김휘용한테 궁금한게 있어요', '<p>&nbsp;</p>\r\n\r\n<p>몇살이에요?</p>\r\n', 0, 'test@test.com', '2017-06-24 14:28:46', 1),
(37, 'qna', '안현수한테 궁금한게 있네요!!', '<p>&nbsp;</p>\r\n\r\n<p>몇학년이에요?</p>\r\n', 0, 'test@test.com', '2017-06-24 14:28:59', 1),
(38, 'qna', '손동욱한테 궁금한게 있습니다', '<p>&nbsp;</p>\r\n\r\n<p>궁금해요</p>\r\n', 0, 'test@test.com', '2017-06-24 14:29:47', 0);

-- --------------------------------------------------------

--
-- 테이블 구조 `bbs_comments`
--

CREATE TABLE `bbs_comments` (
  `no` int(11) NOT NULL,
  `table_name` varchar(20) NOT NULL,
  `bbs_no` int(11) NOT NULL,
  `contents` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `bbs_comments`
--

INSERT INTO `bbs_comments` (`no`, `table_name`, `bbs_no`, `contents`, `email`, `date`) VALUES
(1, 'free', 33, 'agasdfasdf', 'test@naver.com', '2017-05-28 22:09:31'),
(2, 'free', 33, 'gasdfasdfasdf', 'test@naver.com', '2017-05-28 22:09:40'),
(3, 'free', 33, 'gasdfasdgasdfasdf', 'test@naver.com', '2017-05-28 22:09:52'),
(4, 'free', 33, 'gasdfgdsdasfasdf', 'test@naver.com', '2017-05-28 22:13:03'),
(5, 'free', 33, 'gasdf\r\ngdsaf\r\ngdasfsdf', 'test@naver.com', '2017-05-28 22:13:43'),
(6, 'free', 33, '안녕하세요 ㅎㅎㅋㅋ', 'test@naver.com', '2017-05-28 22:18:59'),
(7, 'free', 33, '삼겹살 ㅎㅎㅠㅠㅎㅎ', 'test@test.com', '2017-05-28 22:22:17'),
(8, 'free', 33, 'ㅎㅁㄴㅇㄻㄴㅇㄹ', 'test@test.com', '2017-05-28 22:25:20'),
(9, 'free', 33, 'ㅋㅌㅊㅍㅋㅌㅊㅍㅋㅌㅊㅍㅋㅌㅊㅍ', 'test@test.com', '2017-05-28 22:25:21'),
(10, 'free', 33, 'gdsafg', 'goo@goo.com', '2017-05-29 00:21:37'),
(11, 'free', 33, 'gasdfsdafsadg', 'goo@goo.com', '2017-05-29 00:22:49'),
(12, 'free', 33, 'zxcvzxcvzxcvzxcvzxcv', 'goo@goo.com', '2017-05-29 00:56:51');

-- --------------------------------------------------------

--
-- 테이블 구조 `bbs_view_log`
--

CREATE TABLE `bbs_view_log` (
  `no` int(11) NOT NULL,
  `table_name` varchar(20) NOT NULL,
  `bbs_no` int(11) NOT NULL,
  `member_no` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `bbs_view_log`
--

INSERT INTO `bbs_view_log` (`no`, `table_name`, `bbs_no`, `member_no`, `date`) VALUES
(1, 'free', 28, 1, '2017-05-28 05:25:11'),
(2, 'free', 23, 1, '2017-05-28 05:27:55'),
(3, 'free', 27, 1, '2017-05-28 05:29:47'),
(4, 'free', 13, 1, '2017-05-28 05:29:54'),
(5, 'free', 24, 1, '2017-05-28 05:32:57'),
(6, 'free', 12, 1, '2017-05-28 05:33:49'),
(7, 'free', 17, 1, '2017-05-28 05:34:08'),
(8, 'free', 26, 1, '2017-05-28 05:36:59'),
(9, 'free', 25, 1, '2017-05-28 05:37:01'),
(10, 'free', 15, 1, '2017-05-28 05:41:56'),
(11, 'free', 8, 1, '2017-05-28 05:51:25'),
(12, 'free', 28, 4, '2017-05-28 05:55:31'),
(13, 'free', 5, 1, '2017-05-28 06:15:07'),
(14, 'free', 3, 1, '2017-05-28 06:17:00'),
(15, 'free', 33, 4, '2017-05-28 06:21:25'),
(16, 'free', 33, 1, '2017-05-28 22:08:07'),
(17, 'free', 33, 5, '2017-05-28 23:44:00'),
(18, 'free', 19, 5, '2017-05-28 23:44:30'),
(19, 'free', 17, 5, '2017-05-28 23:44:53'),
(20, 'free', 28, 5, '2017-05-29 00:05:23'),
(21, 'free', 27, 5, '2017-05-29 00:05:24'),
(22, 'free', 26, 5, '2017-05-29 00:05:26'),
(23, 'qna', 34, 4, '2017-06-04 17:42:19'),
(24, 'free', 23, 4, '2017-06-22 02:40:13'),
(25, 'free', 27, 4, '2017-06-22 02:47:30'),
(26, 'free', 21, 4, '2017-06-22 02:47:32'),
(27, 'free', 20, 4, '2017-06-22 02:47:41'),
(28, 'qna', 34, 1, '2017-06-22 02:50:06'),
(29, 'qna', 37, 4, '2017-06-24 14:29:23'),
(30, 'qna', 36, 4, '2017-06-24 14:29:26');

-- --------------------------------------------------------

--
-- 테이블 구조 `matzib`
--

CREATE TABLE `matzib` (
  `no` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `contents` text NOT NULL,
  `comments` int(11) NOT NULL DEFAULT '0',
  `email` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `matzib_title` varchar(50) NOT NULL,
  `matzib_telephone` varchar(20) NOT NULL,
  `matzib_address` varchar(50) NOT NULL,
  `matzib_roadAddress` varchar(50) NOT NULL,
  `matzib_mapx` int(11) NOT NULL,
  `matzib_mapy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `matzib`
--

INSERT INTO `matzib` (`no`, `subject`, `contents`, `comments`, `email`, `date`, `views`, `matzib_title`, `matzib_telephone`, `matzib_address`, `matzib_roadAddress`, `matzib_mapx`, `matzib_mapy`) VALUES
(1, '깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창', '<p>깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창</p>\r\n', 0, 'test@naver.com', '2017-06-01 23:09:25', 1, '깡통돌곱창', '031-826-6992', '경기도 의정부시 의정부2동 442-8 ', '경기도 의정부시 신흥로258번길 18 ', 315971, 571173),
(2, '깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창', '\r\n깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창\r\n\r\n', 0, 'test@naver.com', '2017-06-01 23:09:29', 51, '깡통돌곱창', '031-826-6992', '경기도 의정부시 의정부2동 442-8 ', '경기도 의정부시 신흥로258번길 18 ', 315971, 571173),
(3, '깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창', '<p>깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창깡통곱창</p>\r\n', 2, 'test@naver.com', '2017-06-01 23:09:49', 49, '깡통돌곱창', '031-826-6992', '경기도 의정부시 의정부2동 442-8 ', '경기도 의정부시 신흥로258번길 18 ', 315971, 571173),
(4, '의정부 곱창맛집 : 의정부 깡통돌곱창 존맛!!!', '<p><img alt=\"\" src=\"./images/다운로드.jpg\" style=\"height:500px; width:500px\" /></p>\r\n\r\n<p>오늘 제가 소개해드릴 맛집은 바로&nbsp;<br />\r\n의정부 곱창맛집!<br />\r\n의정부 깡통돌곱창 이라는 맛집입니다.<br />\r\n&nbsp;</p>\r\n\r\n<p><a href=\"http://post.naver.com/viewer/postView.nhn?volumeNo=5382445&amp;memberNo=28446192&amp;vType=VERTICAL#\" onclick=\"return false;\"><img alt=\"\" src=\"http://post.phinf.naver.net/MjAxNjEwMzFfNDQg/MDAxNDc3ODk1NTczNTcz.JnlyxjizJkwtZThjegglSKQYxGwApqco4DrWZu0OPuAg.UcIiqP6LD9so20CI9VwlFlIeGRgBw4Ihu_a-IqyX9cAg.JPEG/P161031_153254.jpg?type=w1200\" style=\"height:1297px; width:900px\" /></a>이미지 확대보기</p>\r\n\r\n<p>이렇게 가림막? 설치해서 기름튀는거 막아주는 센스~<br />\r\n직원분이 직접 익혀주시고 먹기좋은 크기로 짤라주니깐<br />\r\n수다떨다가 다 익으면 먹기만 하면 되니깐&nbsp;<br />\r\n너무 좋았어요~<br />\r\n&nbsp;</p>\r\n\r\n<p><a href=\"http://post.naver.com/viewer/postView.nhn?volumeNo=5382445&amp;memberNo=28446192&amp;vType=VERTICAL#\" onclick=\"return false;\"><img alt=\"\" src=\"http://post.phinf.naver.net/MjAxNjEwMzFfMTM3/MDAxNDc3ODk1OTExMjcx.uTpS22ZUayMGQs2FFVgZVCwKLO4ZWPnaxsjKo_MzK28g.EQcCPXcRZZwWV4Spk7SUrN6uStloXhxtpeNW4zvXMxAg.JPEG/1477895518859.jpg?type=w1200\" style=\"height:675px; width:900px\" /></a></p>\r\n\r\n<p>친절하게 익혀주시는 사이 사진 한장 찰칵~!<br />\r\n&nbsp;</p>\r\n\r\n<p><a href=\"http://post.naver.com/viewer/postView.nhn?volumeNo=5382445&amp;memberNo=28446192&amp;vType=VERTICAL#\" onclick=\"return false;\"><img alt=\"\" src=\"http://post.phinf.naver.net/MjAxNjEwMzFfMTg5/MDAxNDc3ODk1OTQ4ODAy.n_ebXJzMscJ6erQm_NzP6KJ0M_nNY-8DBoxhjeldcKog.h3T3avBjcM0m-JTNj2kMojNF8LJ7wQ2jziGreQ1nrY4g.JPEG/1477895519429.jpg?type=w1200\" style=\"height:675px; width:900px\" /></a></p>\r\n\r\n<p>익기전에 묵이랑 소주한잔 먹으면서 수다타임~<br />\r\n기본메뉴에 선지국도 주시는데 허겁지겁 먹다보니깐<br />\r\n사진을 못찍었네요 ㅠㅠ<br />\r\n선지국은 무한리필 가능하다고 하니!!</p>\r\n\r\n<p><a href=\"http://post.naver.com/viewer/postView.nhn?volumeNo=5382445&amp;memberNo=28446192&amp;vType=VERTICAL#\" onclick=\"return false;\"><img alt=\"스티커 이미지\" src=\"http://gfmarket.phinf.naver.net/moon_and_james/original_3.png?type=p50_50\" style=\"height:123px; width:107px\" /></a></p>\r\n\r\n<p><a href=\"http://post.naver.com/viewer/postView.nhn?volumeNo=5382445&amp;memberNo=28446192&amp;vType=VERTICAL#\" onclick=\"return false;\"><img alt=\"\" src=\"http://post.phinf.naver.net/MjAxNjEwMzFfOTUg/MDAxNDc3ODk2MTQzNTQ3.fmyk6D7vnjVMz-fEUx9rZ244wiiZhcJvTWlvK6Hr824g.1aMKl0fNejW05pxMwKQF-XpvvlmIuhifmN1tjnj-N90g.JPEG/1477895519666.jpg?type=w1200\" style=\"height:675px; width:900px\" /></a></p>\r\n\r\n<p>마지막엔 부추까지 넣어서 먹기좋게 요렇게 딱!!<br />\r\n의정부 곱창맛집 : 의정부 깡통돌곱창<br />\r\n정말 추천합니다!<br />\r\n워낙 유명하다 보니 어느정도 웨이팅은 생각하셔야 할꺼에요 ㅎㅎ<br />\r\n요새 날씨가 많이 추워졌는데 다들 감기 조심하세요!!<br />\r\n다음에 조금 더 성장한 모습으로 포스팅 하러 오겠습니다~~</p>\r\n', 0, 'test@naver.com', '2017-06-01 23:44:11', 32, '깡통돌곱창', '031-826-6992', '경기도 의정부시 의정부2동 442-8 ', '경기도 의정부시 신흥로258번길 18 ', 315971, 571173),
(5, '구글코리아 맛집 구글맛집', '<p><img alt=\"\" src=\"./images/google.gif\" style=\"height:200px; width:469px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>구글맛집&nbsp;</p>\r\n', 0, 'test@naver.com', '2017-06-02 00:03:20', 14, '구글코리아', '02-531-9000', '서울특별시 강남구 역삼동 737 강남파이낸스센터 22층', '서울특별시 강남구 테헤란로 152 강남파이낸스센터', 315014, 544642),
(6, '의정부 맛집 오돌갈비 굿', '<p>작년 연말에 친구들과 가보고 가끔 여기서 먹은 고기가 생각나요 ㅠ_ㅠ^<br />\r\n어차피 버스를 타든 자동차를 타든간에 직진만 하면 나오는 곳이라서 며칠 전에<br />\r\n친구들과 또 다녀온 의정부 맛집 오돌갈비를 파는 곳이랍니다.<br />\r\n<br />\r\n<br />\r\n&nbsp;</p>\r\n', 0, 'test@test.com', '2017-06-02 00:33:05', 19, '연탄갈비삼산이수', '031-872-8990', '경기도 의정부시 의정부동 544-7 ', '경기도 의정부시 범골로 106 ', 315441, 570624),
(7, '맛있는 비빔국수 전주집', '<p><img alt=\"\" src=\"./images/비빔국수.jpg\" style=\"height:225px; width:225px\" /></p>\r\n', 1, 'test@test.com', '2017-06-02 00:48:39', 25, '진주집', '', '서울특별시 영등포구 여의도동 36-2 여의도백화점 지하1층 5호', '서울특별시 영등포구 국제금융로6길 33 ', 305334, 547046),
(8, '대진대 도리돈 강추드림니다 ㅎㅎ', '<p><img alt=\"\" src=\"./images/도리돈.jpg\" style=\"height:250px; width:250px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>도리돈 도리도리돈</p>\r\n', 0, 'test@test.com', '2017-06-02 00:50:57', 68, '도리돈', '', '서울특별시 은평구 녹번동 158-21', '서울특별시 은평구 은평로11길 26-1', 305147, 556200),
(9, '코코미 맛집 입니다', '<p><img alt=\"\" src=\"./images/1496014262581652.jpg\" style=\"height:1080px; width:1080px\" /></p>\r\n\r\n<p>코코미 맛집 맛있겠죠? ㅎㅎ</p>\r\n', 0, 'test@test.com', '2017-06-22 02:30:10', 3, '코코미', '02-872-2233', '서울특별시 관악구 봉천동 1598-21 1층', '서울특별시 관악구 관악로 146 ', 307557, 542317),
(10, '관악 고며명 맛집 고명집', '<p>고명집</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"./images/고명집.jpg\" style=\"height:640px; width:640px\" /></p>\r\n', 0, 'test@test.com', '2017-06-22 02:42:54', 8, '고명집', '02-883-5988', '서울특별시 관악구 행운동 858-1 ', '서울특별시 관악구 봉천로 482 ', 307643, 542696),
(11, '차이나당 중국요리 맛집', '<p><img alt=\"\" src=\"./images/차이나당.jpg\" style=\"height:1080px; width:1080px\" /></p>\r\n', 0, 'test@test.com', '2017-06-22 02:47:12', 3, '차이나당', '02-882-0818', '서울특별시 관악구 낙성대동 1625-29 ', '서울특별시 관악구 낙성대로 16 ', 308108, 542177),
(12, '새우당 새우덮밥 전문 새우레스토랑', '<p><img alt=\"\" src=\"./images/새우당.jpg\" style=\"height:1080px; width:1080px\" /></p>\r\n', 0, 'test@test.com', '2017-06-22 02:48:48', 4, '새우당', '02-3285-8292', '서울특별시 관악구 봉천동 1620-3 ', '서울특별시 관악구 남부순환로234길 19 1층(새우당)', 307962, 542336);

-- --------------------------------------------------------

--
-- 테이블 구조 `matzib_comments`
--

CREATE TABLE `matzib_comments` (
  `no` int(11) NOT NULL,
  `matzib_no` int(11) NOT NULL,
  `contents` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `matzib_comments`
--

INSERT INTO `matzib_comments` (`no`, `matzib_no`, `contents`, `email`, `date`) VALUES
(1, 3, 'gasdvzxcvzxcvzxcv', 'test@naver.com', '2017-06-01 23:18:20'),
(2, 3, 'zxvzxbczxvzxcgasdfasdfasdf', 'test@naver.com', '2017-06-01 23:18:23'),
(3, 7, '전주가아니라 진주네', 'test@test.com', '2017-06-02 00:49:23');

-- --------------------------------------------------------

--
-- 테이블 구조 `matzib_great`
--

CREATE TABLE `matzib_great` (
  `matzib_no` int(11) NOT NULL,
  `member_no` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `matzib_great`
--

INSERT INTO `matzib_great` (`matzib_no`, `member_no`, `date`) VALUES
(2, 4, '2017-06-22 02:11:46'),
(4, 1, '2017-06-04 18:27:25'),
(4, 4, '2017-06-04 18:27:04'),
(5, 1, '2017-06-04 18:28:11'),
(6, 4, '2017-06-04 18:24:17'),
(7, 4, '2017-06-04 18:23:33'),
(8, 2, '2017-06-04 00:00:00'),
(9, 4, '2017-06-22 02:30:17'),
(10, 1, '2017-06-22 02:50:00'),
(10, 4, '2017-06-22 02:43:03'),
(11, 4, '2017-06-22 02:47:16'),
(12, 4, '2017-06-22 02:48:55');

-- --------------------------------------------------------

--
-- 테이블 구조 `matzib_search_log`
--

CREATE TABLE `matzib_search_log` (
  `no` int(11) NOT NULL,
  `word` varchar(20) NOT NULL,
  `member_no` int(11) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `matzib_search_log`
--

INSERT INTO `matzib_search_log` (`no`, `word`, `member_no`, `date`) VALUES
(11, '깡통', 4, '2017-06-22 01:12:45'),
(12, '도리돈', 4, '2017-06-22 01:21:20'),
(13, '구글', 4, '2017-06-22 01:21:23'),
(14, '비빔국수', 4, '2017-06-22 01:24:53'),
(15, '의정부', 4, '2017-06-22 01:25:01'),
(16, '코코미', 4, '2017-06-22 02:30:15'),
(17, '고명집', 4, '2017-06-22 02:43:00'),
(18, '새우당', 4, '2017-06-22 02:48:53'),
(19, '곱창', 1, '2017-06-22 04:25:22'),
(20, '곱창', 4, '2017-06-24 15:08:49'),
(21, '도리돈', 4, '2017-06-24 15:08:53');

-- --------------------------------------------------------

--
-- 테이블 구조 `member`
--

CREATE TABLE `member` (
  `no` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(5) NOT NULL,
  `nickname` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 테이블의 덤프 데이터 `member`
--

INSERT INTO `member` (`no`, `email`, `password`, `name`, `nickname`) VALUES
(1, 'test@naver.com', '*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29', '이름임', '닉넴임'),
(2, 'asdf@naver.com', '*88223E1B52E83F28C384A3012A80D484D38718EA', '123', '123'),
(3, 'testkim@naver.com', '*576036912888CE03769B7D8214AB0D19C4C09B06', '김이름', '김닉넴'),
(4, 'test@test.com', '*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29', '김국진', '삼겹살'),
(5, 'goo@goo.com', '*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29', '테스트', '테수트');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `bbs`
--
ALTER TABLE `bbs`
  ADD PRIMARY KEY (`no`),
  ADD KEY `no` (`no`,`table_name`,`email`),
  ADD KEY `mail` (`email`);

--
-- 테이블의 인덱스 `bbs_comments`
--
ALTER TABLE `bbs_comments`
  ADD PRIMARY KEY (`no`),
  ADD KEY `table_name` (`table_name`,`bbs_no`),
  ADD KEY `default` (`bbs_no`,`table_name`),
  ADD KEY `email` (`email`);

--
-- 테이블의 인덱스 `bbs_view_log`
--
ALTER TABLE `bbs_view_log`
  ADD PRIMARY KEY (`no`),
  ADD KEY `table_name` (`table_name`,`bbs_no`,`date`) USING BTREE COMMENT '인기게시물 검색위하여',
  ADD KEY `table_name_2` (`table_name`,`bbs_no`,`member_no`) USING BTREE COMMENT 'view페이지에서 조회시',
  ADD KEY `de` (`bbs_no`,`table_name`),
  ADD KEY `member_no` (`member_no`);

--
-- 테이블의 인덱스 `matzib`
--
ALTER TABLE `matzib`
  ADD PRIMARY KEY (`no`),
  ADD KEY `no` (`no`,`email`),
  ADD KEY `members` (`email`);

--
-- 테이블의 인덱스 `matzib_comments`
--
ALTER TABLE `matzib_comments`
  ADD PRIMARY KEY (`no`),
  ADD KEY `table_name` (`matzib_no`),
  ADD KEY `member` (`email`);

--
-- 테이블의 인덱스 `matzib_great`
--
ALTER TABLE `matzib_great`
  ADD PRIMARY KEY (`matzib_no`,`member_no`),
  ADD KEY `member_nos` (`member_no`);

--
-- 테이블의 인덱스 `matzib_search_log`
--
ALTER TABLE `matzib_search_log`
  ADD PRIMARY KEY (`no`),
  ADD KEY `mem` (`member_no`);

--
-- 테이블의 인덱스 `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`no`),
  ADD KEY `email` (`email`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `bbs`
--
ALTER TABLE `bbs`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- 테이블의 AUTO_INCREMENT `bbs_comments`
--
ALTER TABLE `bbs_comments`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 테이블의 AUTO_INCREMENT `bbs_view_log`
--
ALTER TABLE `bbs_view_log`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 테이블의 AUTO_INCREMENT `matzib`
--
ALTER TABLE `matzib`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 테이블의 AUTO_INCREMENT `matzib_comments`
--
ALTER TABLE `matzib_comments`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 테이블의 AUTO_INCREMENT `matzib_search_log`
--
ALTER TABLE `matzib_search_log`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- 테이블의 AUTO_INCREMENT `member`
--
ALTER TABLE `member`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `bbs`
--
ALTER TABLE `bbs`
  ADD CONSTRAINT `mail` FOREIGN KEY (`email`) REFERENCES `member` (`email`);

--
-- 테이블의 제약사항 `bbs_comments`
--
ALTER TABLE `bbs_comments`
  ADD CONSTRAINT `default` FOREIGN KEY (`bbs_no`,`table_name`) REFERENCES `bbs` (`no`, `table_name`),
  ADD CONSTRAINT `email` FOREIGN KEY (`email`) REFERENCES `member` (`email`);

--
-- 테이블의 제약사항 `bbs_view_log`
--
ALTER TABLE `bbs_view_log`
  ADD CONSTRAINT `de` FOREIGN KEY (`bbs_no`,`table_name`) REFERENCES `bbs` (`no`, `table_name`),
  ADD CONSTRAINT `member_no` FOREIGN KEY (`member_no`) REFERENCES `member` (`no`);

--
-- 테이블의 제약사항 `matzib`
--
ALTER TABLE `matzib`
  ADD CONSTRAINT `members` FOREIGN KEY (`email`) REFERENCES `member` (`email`);

--
-- 테이블의 제약사항 `matzib_comments`
--
ALTER TABLE `matzib_comments`
  ADD CONSTRAINT `matzib` FOREIGN KEY (`matzib_no`) REFERENCES `matzib` (`no`),
  ADD CONSTRAINT `member` FOREIGN KEY (`email`) REFERENCES `member` (`email`);

--
-- 테이블의 제약사항 `matzib_great`
--
ALTER TABLE `matzib_great`
  ADD CONSTRAINT `mastzib` FOREIGN KEY (`matzib_no`) REFERENCES `matzib` (`no`),
  ADD CONSTRAINT `member_nos` FOREIGN KEY (`member_no`) REFERENCES `member` (`no`);

--
-- 테이블의 제약사항 `matzib_search_log`
--
ALTER TABLE `matzib_search_log`
  ADD CONSTRAINT `mem` FOREIGN KEY (`member_no`) REFERENCES `member` (`no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
