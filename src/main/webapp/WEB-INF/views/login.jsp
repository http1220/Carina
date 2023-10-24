<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" type="image/x-icon"
	href="/img/CarinaLogoheader.png">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>login</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/css/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!--         Core theme CSS (includes Bootstrap) -->
<link href="/css/styles.css" rel="stylesheet" />
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> -->
<link rel="stylesheet"
	href="http://moden939.gabia.io/css/default.css?ver=171253">
<link rel="stylesheet"
	href="http://moden939.gabia.io/skin/member/basic/style.css?ver=171253">
<script src="http://moden939.gabia.io/js/jquery-1.8.3.min.js"></script>
<script src="http://moden939.gabia.io/js/jquery.menu.js?ver=171253"></script>
<script src="http://moden939.gabia.io/js/common.js?ver=171253"></script>
<script src="http://moden939.gabia.io/js/wrest.js?ver=171253"></script>
<script src="http://moden939.gabia.io/js/placeholders.min.js"></script>
<link rel="stylesheet"
	href="http://moden939.gabia.io/js/font-awesome/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link
		href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean"
		rel="stylesheet">
	<style>
body {
	background: #fff;;
}

h1, input, 
h2, h3, h4, h5, h6, button, textarea, select
 {
	font-family: 'Noto Sans KR', sans-serif;
}

#gnb .gnb_wrap {
	width: 100%;
}

#wrapper {
	margin: 20px auto 100px;
	font-family: 'Noto Sans KR', sans-serif
}

.sctt {
	display: block;
	margin: 100px 0 60px;
	font-size: 30px;
	color: #1f284f;
	font-weight: 400;
	line-height: 1;
	text-align: center;
}

.sctt:after {
	content: "";
	display: block;
	width: 27px;
	height: 2px;
	margin: 30px auto;
	background: #43508b;
}
</style>
</head>
<body>

	<%@ include file="menu.jsp"%>
	<!-- 콘텐츠 시작 { -->
	<div id="wrapper">
		<div id="container_wr">


			<!-- 로그인 시작 { -->
			<div id="mb_login" class="mbskin">
				<h1>로그인</h1>

				<form action="/login" method="post">

					<fieldset id="login_fs">
						<legend>회원로그인</legend>
						<label for="id" class="sound_only">회원아이디<strong
							class="sound_only"> 필수</strong></label> <input type="text" name="id"
							id="id" required class="frm_input required" size="20"
							maxLength="20" placeholder="아이디"> <label for="password"
							class="sound_only">비밀번호<strong class="sound_only">
								필수</strong></label> <input type="password" name="pw1" id="pw1" required
							class="frm_input required" size="20" maxLength="15"
							placeholder="비밀번호"> <input type="submit" value="로그인"
							class="btn_submit"> <input type="checkbox" name="saveId"
							id="saveId"> <label for="saveId">아이디 저장</label>
						<!--         <input type="checkbox" name="autoLogin" id="autoLogin"> -->
						<!--         <label for="autoLogin">자동로그인</label> -->
					</fieldset>


					<aside id="login_info">
						<h2>회원로그인 안내</h2>
						<div>
							<a href="/find" target="_blank" id="find">아이디 비밀번호 찾기</a> <a
								href="/agree">회원 가입</a>
						</div>
					</aside>

				</form>



				<!-- 주문하기, 신청하기 -->


				</form>

			</div>

			<script>
$(function(){
    $("#autoLogin").click(function(){
        if (this.checked) {
            this.checked = confirm("자동로그인을 사용하시면 다음부터 회원아이디와 비밀번호를 입력하실 필요가 없습니다.\n\n공공장소에서는 개인정보가 유출될 수 있으니 사용을 자제하여 주십시오.\n\n자동로그인을 사용하시겠습니까?");
        }
    });
});
</script>
			<!-- } 로그인 끝 -->

		</div>

	</div>
	<!-- } 콘텐츠 끝 -->


	<script>

	window.onload = function() {
		<c:if test="${loginFailed}">
		alert('로그인에 실패하였습니다. \r\n아이디와 비밀번호를 다시한번 확인해주세요.');
		</c:if>
		<c:if test="${draw}">
		alert('회원탈퇴한 아이디입니다.');
		</c:if>
		<c:if test="${gradeZero}">
		var result = confirm('회원인증이 완료되지 않았습니다.\r\n회원정보에 입력된 이메일로 회원인증 이메일을 다시 보내시겠습니까?');
		if (result) {
//			alert("${id}");
			sendRequest("/mail/re-resend", {
				id : "${id}"
			});
		}
		</c:if>
	};
	function sendRequest(url, data) {
		var form = document.createElement('form');
		form.method = 'POST';
		form.action = url;
		for ( var key in data) {
			var input = document.createElement('input');
			input.type = 'hidden';
			input.name = key;
			input.value = data[key];
			form.appendChild(input);
		}
		document.body.appendChild(form);
		form.submit();
	}
	
</script>

<script type="text/javascript">
$(document).ready(function(){
	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("saveId");
    $("#id").val(key); 
     
    // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
    if($("#id").val() != ""){ 
        $("#saveId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#saveId").change(function(){ // 체크박스에 변화가 있다면,
        if($("#saveId").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("saveId", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시
            deleteCookie("saveId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#saveId").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("saveId", $("#id").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
// 쿠키 저장하기 
// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value)
			+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}

// 쿠키 삭제
function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires="
			+ expireDate.toGMTString();
}
 
// 쿠키 가져오기
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if (start != -1) { // 쿠키가 존재하면
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
			end = cookieData.length;
            console.log("end위치  : " + end);
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}
</script>
	<%@ include file="footer.jsp"%>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/js/script.js"></script>
</body>
</html>
