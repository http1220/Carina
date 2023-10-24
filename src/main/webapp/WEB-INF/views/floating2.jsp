<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
.sideBanner {
	position: absolute;
	width: 150px;
	height: 200px;
	top: calc(50% - 100px);
	left: 85%;
	background-color: rgba(22, 245, 52, 0.1);
	color: #fffffff;
	border-radius: 10px;
	z-index: 2147483647;
}

.floating-menu {
	position: fixed;
	bottom: 20px;
	right: 20px;
	z-index: 100;
}

.vehicle-item {
	display: flex;
	align-items: center;
	border: 1px solid #ccc;
	padding: 10px;
	margin-bottom: 10px;
}

.vehicle-thumbnail {
	max-width: 60px;
	max-height: 60px;
	margin-right: 10px;
}

.vehicle-model {
	font-weight: bold;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.js">
function getCookie(vehicleNo1) { 

    var nameOfCookie = vehicleNo1 + "=";

    var x = 0;

    while (x <= document.cookie.length) {

         var y = (x + nameOfCookie.length);

         if (document.cookie.substring(x, y) == nameOfCookie) {

              if ((endOfCookie = document.cookie.indexOf(";", y)) == -1) 

                   endOfCookie = document.cookie.length;

              return unescape(document.cookie.substring(y, endOfCookie));

         }

         x = document.cookie.indexOf(" ", x) + 1;

         if (x == 0)

              break;

    }

    return "";

}
var cookie = getCookie('vehicleNo1');
if (cookie != "") {
     alert("쿠키값은 : " + cookie);
}
</script> 
<body>
	<div class="sideBanner">
		<span class="txt-label"> Banner<br> 배경만 반투명
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li><a href="/searchpage">내차 사러가기</a></li>
				<li><a href="/regist">내차 팔러가기</a></li>
			</ul>
			<div>
				<button onclick="toTop()">위</button>
				<button onclick="toBottom()">아래</button>
			</div>
		</span>
	</div>
	<script type="text/javascript">
		//기본 위치(top)값
		var floatPosition = parseInt($(".sideBanner").css("top"))

		// scroll 인식
		$(window).scroll(function() {

			// 현재 스크롤 위치
			var currentTop = $(window).scrollTop();
			var bannerTop = currentTop + floatPosition + "px";

			//이동 애니메이션
			$(".sideBanner").stop().animate({
				"top" : bannerTop
			}, 0);

		}).scroll();

		//맨위로
		function toTop() {
			window.scrollTo(0, 0);
		}
		//맨아래로
		function toBottom() {
			window.scrollTo(0, document.body.scrollHeight);
		}
	</script>
</body>