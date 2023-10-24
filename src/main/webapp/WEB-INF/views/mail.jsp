<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="shortcut icon" type="image/x-icon" href="/img/CarinaLogoheader.png">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
.mail{
	margin: 0 auto;
	width: 800px;
	min-height: 500px;
	background-color: gray;
}
input[type=text]{
	width: 100%;
	height: 30px;
	margin-bottom: 3px;
}
textarea{
	width: 100%;
	height: 450px;
	margin-bottom: 3px;
}
</style>
<script>
// var email = '${email}';
// var id = '${id}';
// var nickname = '${nickname}';
function resendEmail(email, id, nickname) {
    $.ajax({
        url: "/mail/resend",
        type: "post",
        data: {
            toEmail: email,
            id: id,
            nickname: nickname
        },
        success: function() {
            alert("재전송 완료.");
        },
        error: function(request, status, error) {
            alert("에러발생: " + error + "E" + request + "R" + status + "S");
        }
    });
}

</script>
</head>
<body>
<%@ include file="menu.jsp" %>
	<div class="container">
		<div class="header">
		</div>

</div>
<h2>이메일 인증 안내</h2>
<b>${email }로</b> 인증 메일이 발송되었습니다. <br>
메일을 1시간 이내에 확인한 후 인증 링크를 클릭해야<br>
Carina 회원가입을 완료하실 수 있습니다.<br>
메일을 받지 못하셨나요?<br>
<a id="resendBtn" onclick="resendEmail('${email}', '${id}', '${nickname}')">다시 보내기</a> < -클릭




<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

<%@ include file="footer.jsp" %>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
