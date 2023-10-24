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
<title>JOIN</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/css/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!--         Core theme CSS (includes Bootstrap) -->
<link href="/css/styles.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="http://moden939.gabia.io/css/default.css?ver=171253">
<link rel="stylesheet" href="http://moden939.gabia.io/skin/member/basic/style.css?ver=171253">
<script>
var isCheckedId = false;
var isCheckedNickname = false;
var isCheckedEmail = false;

$(function(){
	$("#joinBtn").click(function(){
		//이름
		var name = $("#name").val();
		if(name == "" || name.length < 2){
			alert("이름을 두 글자 이상 입력해주세요.");
			$("#name").focus();
			return false;					//멈춤
		}
		
		//아이디
		var id = $("#id").val();
		if (!isCheckedId) {
			alert("아이디 중복을 확인해주세요.");
			$("#id").focus();
			return false;
		}
		//닉네임
		var id = $("#nickname").val();
		if (!isCheckedNickname) {
			alert("닉네임 중복을 확인해주세요.");
			$("#nickname").focus();
			return false;
		}
		//이메일
		var id = $("#email").val();
		if (!isCheckedEmail) {
			alert("이메일 중복을 확인해주세요.");
			$("#email").focus();
			return false;
		}
		
		//비밀번호
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		//정규식 검사
	    let regex = new RegExp('^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,15}$');
	    if(!(       regex.test($("#pw1").val())   )){
	       alert("올바른 비밀번호 형식을 입력해주세요.");
	       $("#pw1").focus();
	       return false;
	    }
		if (pw1 == "" || pw1.length <8) {
			alert("암호를 여덟 글자 이상 입력해주세요.");
			$("#pw1").focus();
			return false;
		}
		if(pw1 != pw2){
			alert("암호가 일치하지 않습니다.");
			$("#pw2").val("");				//값 초기화
			$("#pw2").focus();
			return false;
		}
	});
});
//중복확인 후 값이 변경됐을 때 초기화
$(function(){
	$("#id").on("input", function() {
	    isCheckedId = false;
	    $("#checkResult").text("");
		$("#joinBtn").attr("disabled", true);
	});
	$("#nickname").on("input", function() {
	    isCheckedNickname = false;
	    $("#checkResult2").text("");
		$("#joinBtn").attr("disabled", true);
	});
	$("#email").on("input", function() {
	    isCheckedEmail = false;
	    $("#checkResult3").text("");
		$("#joinBtn").attr("disabled", true);
	});
});
function check(){
	//정규식 검사
    let regex = new RegExp('^[a-z0-9]{4,15}$');
    if(!(       regex.test($("#id").val())   )){
       alert("올바른 아이디 형식을 입력해주세요.");
       $("#id").focus();
       return false;
    }
	var id = $("#id").val();
	if (id == "" || id.length < 4) {
		$("#checkResult").css("color", "red");
		$("#checkResult").text("아이디를 여덟 글자 이상 입력해주세요.");
		$("#id").focus();
		return false;
	}else {
		$.ajax({
			url : "/checkID",
			type : "post",
			cache : false,
			dataType : "html",
			data : {"id" : $("#id").val()},
			success : function(data){
				if (data == 0) {
					$("#checkResult").css("color", "blue");
					$("#checkResult").text("가입할 수 있는 ID입니다.");
					$("#joinBtn").attr("disabled", false);
					isCheckedId = true;
				}else {
					$("#checkResult").css("color", "red");
					$("#checkResult").text("이미 가입되어있는 ID입니다.");
					$("#joinBtn").attr("disabled", true);
				}
			},
			error : function(request, status, error){
				alert("문제가 발생하였습니다." + error);
			}
		});
	}
}

function check2(){
	var nickname = $("#nickname").val();
	if (nickname == "" || nickname.length < 4) {
		$("#checkResult2").css("color", "red");
		$("#checkResult2").text("닉네임을 네 글자 이상 입력해주세요.");
		$("#nickname").focus();
		isCheckedNickname = true;
		return false;
	}else {
		$.ajax({
			url : "/checkNickname",
			type : "post",
			cache : false,
			dataType : "html",
			data : {"nickname" : $("#nickname").val()},
			success : function(data){
				if (data == 0) {
					$("#checkResult2").css("color", "blue");
					$("#checkResult2").text("가입할 수 있는 닉네임입니다.");
					$("#joinBtn").attr("disabled", false);
					isCheckedNickname = true;
				}else {
					$("#checkResult2").css("color", "red");
					$("#checkResult2").text("이미 가입되어있는 닉네임입니다.");
					$("#joinBtn").attr("disabled", true);
				}
			},
			error : function(request, status, error){
				alert("문제가 발생하였습니다." + error);
			}
		});
	}
}

function check3(){
	//정규식 검사
    let regex = new RegExp('^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$');
    if(!(       regex.test($("#email").val())   )){
       alert("올바른 이메일 형식을 입력해주세요.");
       $("#email").focus();
       isCheckedEmail = true;
       return false;
    }
	var email = $("#checkEmail").val();
		$.ajax({
			url : "/checkEmail",
			type : "post",
			cache : false,
			dataType : "html",
			data : {"email" : $("#email").val()},
			success : function(data){
				if (data == 0) {
					$("#checkResult3").css("color", "blue");
					$("#checkResult3").text("가입할 수 있는 이메일입니다.");
					$("#joinBtn").attr("disabled", false);
					isCheckedEmail = true;
				}else {
					$("#checkResult3").css("color", "red");
					$("#checkResult3").text("이미 가입되어있는 이메일입니다.");
					$("#joinBtn").attr("disabled", true);
				}
			},
			error : function(request, status, error){
				alert("문제가 발생하였습니다." + error);
			}
		});
}

// $(document).ready(function() {
// 	$("#pw1").on("keyup", function() {
// 		if ($(this).val()) {
// 		  $(this).css("font-family", "sans-serif");
// 		} else {
// 		  $(this).css("font-family", "");
// 		}
// 	});
// });

// $(document).ready(function() {
// 	$("#pw2").on("keyup", function() {
// 		if ($(this).val()) {
// 		  $(this).css("font-family", "sans-serif");
// 		} else {
// 		  $(this).css("font-family", "");
// 		}
// 	});
// });
</script>

<script src="http://moden939.gabia.io/js/jquery-1.8.3.min.js"></script>
<script src="http://moden939.gabia.io/js/jquery.menu.js?ver=171253"></script>

<!-- <script src="http://moden939.gabia.io/js/jquery-1.8.3.min.js"></script> -->
<!-- <script src="http://moden939.gabia.io/js/jquery.menu.js?ver=171253"></script> -->
<script src="http://moden939.gabia.io/js/common.js?ver=171253"></script>
<script src="http://moden939.gabia.io/js/wrest.js?ver=171253"></script>
<script src="http://moden939.gabia.io/js/placeholders.min.js"></script>
<link rel="stylesheet" href="http://moden939.gabia.io/js/font-awesome/css/font-awesome.min.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<style>
body { background: #fff; ; }
h1, h2, h3, h4, h5, h6, button, textarea, select {font-family: hanna;}
#gnb .gnb_wrap { width: 100%; }
#wrapper { margin: 20px auto 100px; font-family: 'Noto Sans KR', sans-serif }

.sctt { display: block; margin: 100px 0 60px; font-size: 30px; color: #1f284f; font-weight: 400; line-height: 1; text-align: center; }
.sctt:after { content: ""; display: block; width: 27px; height: 2px; margin: 30px auto; background: #43508b; }
</style>
<body>

<%@ include file="menu.jsp" %>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">


<!-- 콘텐츠 시작 { -->
<div id="wrapper">
    <div id="container_wr">

<!-- 회원정보 입력/수정 시작 { -->
<h2 class="sctt">회원정보 입력</h2>

<script src="http://moden939.gabia.io/js/jquery.register_form.js"></script>
<script src="http://moden939.gabia.io/js/certify.js?v=171253"></script>

<form id="fregisterform" name="fregisterform" action="/mail" method="post" 
>
<!-- onsubmit="return fregisterform_submit(this);" enctype="multipart/form-data" autocomplete="off" -->
<!-- <input type="hidden" name="w" value=""> -->
<!-- <input type="hidden" name="url" value="%2Fbbs%2Fregister_form.php"> -->
<!-- <input type="hidden" name="agree" value="1"> -->
<!-- <input type="hidden" name="agree2" value="1"> -->
<!-- <input type="hidden" name="cert_type" value=""> -->
<!-- <input type="hidden" name="cert_no" value=""> -->
<!-- <input type="hidden" name="mb_sex" value="">  -->
<div id="register_form"  class="form_01">
<input id="membership_status" name="membership_status" value="1" type="hidden">  
<input id="membershipGrade" name="membershipGrade" value="0" type="hidden">  
    <div>
        <h2>사이트 이용정보 입력</h2>
        <ul>
            <li>
                <label for="id" class="sound_only">아이디<strong>필수</strong></label>
                <input type="text" name="id" value="" id="id" required  class="frm_input half_input required " minlength="3" maxlength="20" placeholder="아이디">
				<button type="button" class="btn_frmline" onclick="check()">중복확인</button>
				<p id="checkResult"></p>
                <span id="msg_id"></span>
                <span class="frm_info">영문자, 숫자만 입력 가능. 최소 4자이상 입력하세요.</span>
            </li>
            <li>
                <label for="pw1" class="sound_only">비밀번호<strong class="sound_only">필수</strong></label>
                <input type="password" name="pw1" value="" id="pw1" required class="frm_input half_input required" minlength="8" maxlength="15" placeholder="비밀번호">

                <label for="pw2" class="sound_only">비밀번호 확인<strong>필수</strong></label>
                <input type="password" name="pw2" value="" id="pw2" required class="frm_input half_input right_input required" minlength="8" maxlength="15" placeholder="비밀번호 확인">
				<span class="frm_info">영문,숫자,특수문자 혼합 8자 이상 15자 이하로 입력하세요.</span>                
            </li>
        </ul>
    </div>

    <div class="tbl_frm01 tbl_wrap">
        <h2>개인정보 입력</h2>

        <ul>
            <li>
                <label for="name" class="sound_only">이름<strong>필수</strong></label>
                <input type="text" id="name" name="name" value="" required  class="frm_input half_input required " size="10" placeholder="이름">
            </li>
            
            <li>
                <label for="nickname" class="sound_only">닉네임<strong>필수</strong></label>
                
                <input type="hidden" name="nickname_default" value="">
                <input type="text" name="nickname" value="" id="nickname" required class="frm_input required nospace  half_input" size="10" maxlength="20" placeholder="닉네임">
                <button type="button" class="btn_frmline" onclick="check2()">중복확인</button>
                <p id="checkResult2"></p>
                <span id="msg_nickname"></span>
                <span class="frm_info">
                    공백없이 한글,영문,숫자만 입력 가능 (한글2자, 영문4자 이상)<br>
                    닉네임을 바꾸시면 앞으로 0일 이내에는 변경 할 수 없습니다.
                </span>
                
            </li>
            
            <li>
                <label for="email" class="sound_only">E-mail<strong>필수</strong></label>
                
                                <input type="hidden" name="old_email" value="">
                <input type="text" name="email" value="" id="email" required class="frm_input email full_input required" style="width: 575px;" size="70" maxlength="100" placeholder="E-mail">
            	<button type="button" class="btn_frmline" onclick="check3()">중복확인</button>
            	<p id="checkResult3"></p>
            </li>

            <li>
                        
                <label for="phoneNumber" class="sound_only">휴대폰번호<strong>필수</strong></label>
                <input type="text" name="phoneNumber" value="" id="phoneNumber" required class="frm_input half_input required" maxlength="20" placeholder="휴대폰번호">
                <input type="hidden" name="old_phoneNumber" value="">
            </li>
            
			<div style="font-size: 1.167em; margin: 0;">성별</div>
            <li>
									<input class="form-check-input" type="radio" name="gender"
										id="genderMale" value="male" checked> <label
										class="form-check-label" for="male">남자</label>
									<input class="form-check-input" type="radio" name="gender"
										id="genderFemale" value="female"> <label
										class="form-check-label" for="female">여자</label>
            </li>
            
            <div style="font-size: 1.167em; margin: 0;">생년월일</div>
            <li>
            <div style="width: 25%;"> 
 										<input type="date" class="form-control text-center" 
 											id="dateOfBirth" name="dateOfBirth" value=""> 
 									</div>
            </li>
            
            <li>
                <strong class="sound_only">필수</strong>                <label for="postcode" class="sound_only">우편번호<strong class="sound_only"> 필수</strong></label>
                <input type="text" name="postcode" value="" id="postcode" required class="frm_input required" size="5" maxlength="6"  placeholder="우편번호" readonly>
                <button type="button" class="btn_frmline" onclick="win_zip('fregisterform', 'postcode', 'address', 'detailAddress', 'extraAddress', 'mb_addr_jibeon');">주소 검색</button><br>
               
                <input type="text" name="address" value="" id="address" required class="frm_input frm_address full_input required" size="50"  placeholder="기본주소" readonly>
                <label for="address" class="sound_only">기본주소<strong> 필수</strong></label><br>
               
                <input type="text" name="extraAddress" value="" id="extraAddress" class="frm_input frm_address full_input" size="50" readonly="readonly"  placeholder="참고항목" readonly>
                <label for="extraAddress" class="sound_only">참고항목</label>
                <br>
                
                <input type="text" name="detailAddress" value="" id="detailAddress" class="frm_input frm_address full_input" size="50"  placeholder="상세주소">
                <label for="detailAddress" class="sound_only">상세주소</label>
                <input type="hidden" name="mb_addr_jibeon" value="">
                
            </li>
		</ul>
    </div>

</div>
<div class="btn_confirm">
    <a href="/login" class="btn_cancel">취소</a>
<!--     <input type="button" value="회원가입" id="joinBtn" class="btn_submit" accesskey="s" onclick="join()"> -->
    <input type="submit" value="회원가입" id="joinBtn" class="btn_submit">
</div>
</form>

<!-- } 회원정보 입력/수정 끝 -->
    </div>
    
</div>
<!-- } 콘텐츠 끝 -->




<%@ include file="footer.jsp" %>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->

</body>
</html>
