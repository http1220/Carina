 <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
     pageEncoding="UTF-8"%> --%>
 <!DOCTYPE html> 
 <head> 
 <meta name="viewport" 
 	content="width=device-width, initial-scale=1, shrink-to-fit=no" /> 
 <meta name="description" content="" /> 
 <meta name="author" content="" /> 

 <title>Carina</title> 
 <script src="https:ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script> 
  Favicon 
 <link rel="icon" type="image/x-icon" href="assets/car.png" /> 
  Bootstrap icons 
 <link 
 	href="https:cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" 
 	rel="stylesheet" /> 
  Core theme CSS (includes Bootstrap) 
 <link href="css/styles.css" rel="stylesheet" /> 
 <script type="text/javascript"> 
 $(function(){
 	$("#joinBtn").click(function(){
 		이름
 		var name = $("#name").val();
 		if(name == "" || name.length < 2){
 			alert("이름을 두 글자 이상 입력해주세요.");
 			$("#name").focus();
 			return false;					멈춤
 		}
		
 		아이디
 		var id = $("#id").val();
 		if (id == "" || id.length < 5) {
 			alert("아이디를 다섯 글자 이상 입력해주세요.");
 			$("#id").focus();
 			return false;
 		}
		
 		비밀번호
 		var pw1 = $("#pw1").val();
 		var pw2 = $("#pw2").val();
 		if (pw1 == "" || pw1.length <5) {
 			alert("암호를 다섯 글자 이상 입력해주세요.");
 			$("#pw1").focus();
 			return false;
 		}
 		if(pw1 != pw2){
 			alert("암호가 일치하지 않습니다.");
 			$("#pw2").val("");				값 초기화
 			$("#pw2").focus();
 			return false;
 		}
 	});
 });

 function check(){
 	정규식 검사
     let regex = new RegExp('[a-z0-9]{8,15}');
     if(!(       regex.test($("#id").val())   )){
        alert("올바른 아이디 형식을 입력해주세요.");
        $("#id").focus();
        return false;
     }
 	var id = $("#id").val();
 	if (id == "" || id.length < 8) {
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
 					$("#joinBtn").text("회원가입");
 				}else {
 					$("#checkResult").css("color", "red");
 					$("#checkResult").text("이미 가입되어있는 ID입니다.");
 					$("#joinBtn").attr("disabled", true);
 					$("#joinBtn").text("다시 ID를 입력하세요");
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
 					$("#joinBtn").text("회원가입");
 				}else {
 					$("#checkResult2").css("color", "red");
 					$("#checkResult2").text("이미 가입되어있는 닉네임입니다.");
 					$("#joinBtn").attr("disabled", true);
 					$("#joinBtn").text("다시 닉네임을를 입력하세요");
 				}
 			},
 			error : function(request, status, error){
 				alert("문제가 발생하였습니다." + error);
 			}
 		});
 	}
 }

 function check3(){
 	정규식 검사
     let regex = new RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
     if(!(       regex.test($("#email").val())   )){
        alert("올바른 이메일 형식을 입력해주세요.");
        $("#email").focus();
        return false;
     }
 	var email = $("#email").val();
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
 					$("#joinBtn").text("회원가입");
 				}else {
 					$("#checkResult3").css("color", "red");
 					$("#checkResult3").text("이미 가입되어있는 이메일입니다.");
 					$("#joinBtn").attr("disabled", true);
 					$("#joinBtn").text("다시 닉네임을를 입력하세요");
 				}
 			},
 			error : function(request, status, error){
 				alert("문제가 발생하였습니다." + error);
 			}
 		});
 }

 $(document).ready(function() {
 	$("#pw1").on("keyup", function() {
 		if ($(this).val()) {
 		  $(this).css("font-family", "sans-serif");
 		} else {
 		  $(this).css("font-family", "");
 		}
 	});
 });

 $(document).ready(function() {
 	$("#pw2").on("keyup", function() {
 		if ($(this).val()) {
 		  $(this).css("font-family", "sans-serif");
 		} else {
 		  $(this).css("font-family", "");
 		}
 	});
 });
 function join(){
 	정규식 검사
     let regex = new RegExp('^(?=.*[A-Za-z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,15}$');
     if(!(       regex.test($("#pw1").val())   )){
        alert("올바른 비밀번호 형식을 입력해주세요.");
        $("#pw1").focus();
     }else{
        $("#joinBtn").submit();
     }
 }
 </script> 
 <style> 
 .zero, .one, .three, .four { 
 	position: absolute; 
 	margin-top: -10px; 
 	z-index: 1; 
 	height: 35px; 
 	width: 35px; 
 	border-radius: 25px; 
 } 

 .zero { 
 	left: 17%; 
 } 

 .one { 
 	left: 38%; 
 } 

 .three { 
 	left: 62%; 
 } 

 .four { 
 	left: 82%; 
 } 

 .primary-color { 
 	background-color: #4989bd; 
 } 

 .no-color { 
 	background-color: inherit; 
 } 
 .text-steps-container { 
 	width: 100%; 
 	display: flex; 
 	align-items: center; 
 	justify-content: flex-start; 
 } 
 </style> 
 </head> 
 <body> 

 <%@ include file="menu.jsp" %>

 	 Header 
 	<header class="py-5"> 
 		<div class="container px-lg-5"> 
 			<div class="p-4 p-lg-5 bg-white rounded-3 "> 
 				<div class="m-4 m-lg-5"> 
 					<h2 class=" text-center" style="font-style: bold;">일반회원가입</h2> 
 				</div> 
 				<div class="container"> 
 					<div class="row"> 
 						<br /> 
 						<div class="col-md-12"> 
 							<div class="progress"> 
 								<div class="zero primary-color"></div> 
 								<div class="one primary-color"></div> 
 								<div class="three primary-color"></div> 
 								<div class="four no-color"></div> 
 								<div class="progress-bar" style="width: 68%;"></div> 
 							</div> 
 						</div> 
 					</div> 
 				</div> 
 			</div> 
 			<div class="text-steps-container"> 
 				<div class="text-step" 
 					style="font-size: 20px; position: absolute; left: 14%; width: 150px;">약관 
 					및 이용 동의</div> 
 				<div class="text-step" 
 					style="font-size: 20px; position: absolute; left: 37%; width: 150px;">본인인증</div> 
 				<div class="text-step" 
 					style="font-size: 20px; position: absolute; left: 60%; width: 150px;">가입정보 
 					입력</div> 
 				<div class="text-step" 
 					style="font-size: 20px; position: absolute; left: 79%; width: 150px;">회웝가입 
 					완료</div> 
 			</div> 
 		</div> 
 	</header> 
 	 Page Content 


 	<section class="pt-4 bg-light "> 
 		<div class="container  px-lg-5"> 
 			 Page Features 
 			<div class="row gx-4 gx-lg-5 bg-white justify-content-center" style="margin-bottom: 50px;"> 
			
 				<form action="/memberRegist" method="post"> 
 				<input id="membership_status" name="membership_status" value="1" hidden readonly> 
 					<table class="table caption-top " > 
 						<tbody> 
 							<tr> 
 								<th scope="row">아이디</th> 
 								<td> 
 									<div class="row"> 
 										<div class="mb-3 col-6" style="width: 35%;"> 
 											<input type="text" class="form-control text-center" 
 												id="id" name="id" placeholder="영문,숫자 혼합 8~15이내" 
 												maxlength='15'> 
 										</div> 
 										<div class="col-6"> 
 											<button type="button" class="btn btn-secondary" onclick="check()">중복 
 												확인</button> 
 												<p id="checkResult"></p> 
 										</div> 
 									</div> 
 							</tr> 
 							<tr> 
 								<th scope="row">비밀번호</th> 
 								<td><div class="mb-3" style="width: 35%;"> 
 										<input type="password" class="form-control text-center" 
 											id="pw1" name="pw1" 
 											placeholder="영문,숫자,특수문자 혼합 8~15이내" maxlength='15'> 
 									</div></td> 
	
 							</tr> 
 							<tr> 
 								<th scope="row">비밀번호 확인</th> 
 								<td><div class="mb-3" style="width: 35%;"> 
 										<input type="password" class="form-control text-center" 
 											id="pw2" 
 											placeholder="영문,숫자,특수문자 혼합 8~15이내" maxlength='15' id="pw2"> 
 									</div></td> 
 							</tr> 
 							<tr> 
 								<th scope="row">이름</th> 
 								<td><div class="mb-3" style="width: 25%;"> 
 										<input type="text" class="form-control text-center" 
 											id="name" name="name"> 
 									</div></td> 
 							</tr> 
 							<tr> 
 								<th scope="row">성별</th> 
 								<td><div class="form-check form-check-inline"> 
 										<input class="form-check-input" type="radio" name="gender"  
 										id="gender" value="male"> 
 										<label class="form-check-label" for="male">남자</label> 
 									</div> 
 									<div class="form-check form-check-inline"> 
 										<input class="form-check-input" type="radio" name="gender"  
 										id="gender" value="female"> 
 										<label class="form-check-label" for="female">여자</label> 
 									</div></td> 
 							</tr> 
 							<tr> 
 								<th scope="row">닉네임</th> 
 								<td><div class="row"> 
 										<div class="mb-3 col-6" style="width: 25%;"> 
 											<input type="text" class="form-control text-center" 
 												id="nickname" name="nickname"> 
 										</div> 
 										<div class="col-6"> 
 											<button type="button" class="btn btn-secondary" onclick="check2()">중복 
 												확인</button> 
 												<p id="checkResult2"></p> 
 										</div> 
 									</div></td> 
 							</tr> 
 							<tr> 
 								<th scope="row">이메일</th> 
 								<td> 
 									<div class="row"> 
 										<div class="mb-3" style="width: 25%;"> 
 											<input type="text" class="form-control text-center" 
 												id="email" name="email"> 
 										</div> 
 										<div class="col-6"> 
 											<button type="button" class="btn btn-secondary" onclick="check3()">중복 
 												확인</button> 
 												<p id="checkResult3"></p> 
 										</div> 
 									</div> 
 								</td> 
 							</tr> 
 							<tr> 
 								<th scope="row">생년월일</th> 
 								<td><div class="mb-3" style="width: 25%;"> 
 										<input type="date" class="form-control text-center" 
 											id="dateOfBirth" name="dateOfBirth"> 
 									</div></td> 
 							</tr> 
 							<tr> 
 								<th scope="row">휴대폰 번호</th> 
 								<td><div class="row "> 
 										<div class="mb-3" style="width: 25%;"> 
 											<input type="text" class="form-control text-center" 
 												id="phone" name="phone" maxlength='11' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
 										</div>(-, 공백 없이 숫자만 입력해주세요.) 
 									</div></td> 
	
 							</tr> 
 							<button type="button" class="btn btn-secondary ">중복
 												확인</button>   
 							<tr> 
	
 								<th scope="row">주소</th> 
 								<td> 
 								<div class="row"> 
							
 								<input type="text" style="width: 15%;" 
 									class="form-control text-center"  
 									placeholder="우편번호"  
 									id="postcode" name="postcode" readonly>  
 									&nbsp;&nbsp;&nbsp; 
 									<input type="button" 
 									class="btn btn-secondary" style="width: 15%;" onclick="execDaumPostcode()" 
 									value="우편번호 찾기"> 
 										</div> 
 										<div class="row"> 
 								<input type="text" 
 									style="width: 30%;" class="form-control text-center" 
 									id="address" name="address" placeholder="주소" readonly> 
 								<input type="text" 
 									style="width: 30%;" class="form-control text-center" 
 									id="extraAddress" name="extraAddress" placeholder="나머지주소" readonly><br> 
 									</div> 
 									<div class="row"> 
 								<input type="text" style="width: 30%;" 
 									class="form-control text-center"  
 									id="detailAddress" name="detailAddress" placeholder="상세주소">  
 									</div> <script 
 										src="t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
 									<script> 
 										function execDaumPostcode() {
 											new daum.Postcode(
 													{
 														oncomplete : function(data) {
 															 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
 															 각 주소의 노출 규칙에 따라 주소를 조합한다.
 															 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
 															var addr = '';  주소 변수
 															var extraAddr = '';  참고항목 변수
	
 															사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
 															if (data.userSelectedType === 'R') {  사용자가 도로명 주소를 선택했을 경우
 																addr = data.roadAddress;
 															} else {  사용자가 지번 주소를 선택했을 경우(J)
 																addr = data.jibunAddress;
 															}
	
 															 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
 															if (data.userSelectedType === 'R') {
 																 법정동명이 있을 경우 추가한다. (법정리는 제외)
 																 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
 																if (data.bname !== ''
 																		&& /[동|로|가]$/g
 																				.test(data.bname)) {
 																	extraAddr += data.bname;
 																}
 																 건물명이 있고, 공동주택일 경우 추가한다.
 																if (data.buildingName !== ''
 																		&& data.apartment === 'Y') {
 																	extraAddr += (extraAddr !== '' ? ', '
 																			+ data.buildingName
 																			: data.buildingName);
 																}
 																 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
 																if (extraAddr !== '') {
 																	extraAddr = ' ('
 																			+ extraAddr
 																			+ ')';
 																}
 																 조합된 참고항목을 해당 필드에 넣는다.
 																document
 																		.getElementById("extraAddress").value = extraAddr;
	
 															} else {
 																document
 																		.getElementById("extraAddress").value = '';
 															}
	
 															 우편번호와 주소 정보를 해당 필드에 넣는다.
 															document
 																	.getElementById('postcode').value = data.zonecode;
 															document
 																	.getElementById("address").value = addr;
 															 커서를 상세주소 필드로 이동한다.
 															document
 																	.getElementById(
 																			"detailAddress")
 																	.focus();
 														}
 													}).open();
 										}
 									</script></td> 
 							</tr> 
							
 						</tbody> 
 					</table> 
 					<button type="button" style="width: 120px; margin-bottom: 20px;" class="btn btn-primary btn-lg" id="joinBtn" onclick="join()">가입하기</button> 
 				</form> 
 			</div> 
 		</div> 
 		<div class="pt-5 bg-white " ></div> 
 	</section> 
 <%@ include file="footer.jsp" %> --%>
 	 Bootstrap core JS 
 	<script 
 		src="https:cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
 	 Core theme JS 
 	<script src="js/scripts.js"></script> 
 </body> 
 </html> 
