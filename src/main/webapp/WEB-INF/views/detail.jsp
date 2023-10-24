<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
<title>Detail</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/css/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!--         Core theme CSS (includes Bootstrap) -->
<link href="css/styles.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.css">
<link href="css/lightbox.css" rel="stylesheet" />




<style type="text/css">
.top {
	margin: 0 auto;
	margin-top: 45px;
	width: 1180px;
	height: auto;
	position: relative;
}

.top-left {
	width: 620px;
	height: auto;
	float: left;
	margin-bottom: 50px;
}

.thumbnail {
	width: 620px;
	height: 280px;
}

.bx-wrapper {
	width: 620px;
	height: 280px;
	border: 0;
	box-shadow: none;
}

.bx-viewport, .bx-wrapper img {
	width: 620px;
	height: 280px;
}

#bx-pager {
	margin-top: 50px;
}

#bx-pager a {
	margin: 0;
	width: 154.6px;
	height: 80px;
}

#bx-pager a img {
	float: left;
	width: 154.6px;
	height: 80px;
}

#bx-pager a.active img {
	width: 154.6px;
	height: 80px;
}

#bx-pager a img:hover {
	border: #F00 3px solid;
}

.allgallery {
	border: #F00 3px solid;
}

.top-right {
	width: 500px;
	height: auto;
	float: left;
	position: absolute;
	top: -70px;
	right: 0;
}

.vehicle-table {
	width: 500px;
	height: 200px;
	border: 1px solid black;
}

.vehicle-table td {
	border: 1px solid black;
	text-align: center;
	width: 50%;
	height: calc(25%);
}

.vehicle-table td:nth-child(1) {
	background-color: lightgray;
}

.member-table {
	width: 500px;
	height: 150px;
	border: 1px solid black;
	margin-top: 70px;
	margin-bottom: 10px;
}

.member-table td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
	width: 50%;
	height: calc(33.3%);
}

.member-table td:nth-child(1) {
	background-color: lightgray;
}

.content {
	display: block;
	margin: 0 auto;
	width: 1000px;
	height: auto;
	min-height: 300px;
	margin-bottom: 40px;
	/*    background-color: green; */
	border: 1px solid lightgray;
	border-radius: 10px 90px 10px 90px;
}

.favorites-btn {
	border: 3px solid skyblue;
	display: block;
	float: right;
	margin-right: 10px;
	margin-bottom: 10px;
	border-radius: 10px;
}

.estimated {
	margin: 0 auto;
	width: 1000px;
	height: auto;
	margin-bottom: 20px;
	margin-top: 50px;

}

.price {
	width: 1000px;
	height: auto;
	/*    border: 1px solid black; */
	/*    background-color: pink; */
	display: flex;
	margin-top: 10px;
}
.price_1{
width: 1000px;
	height: auto;
	/*    border: 1px solid black; */
	/*    background-color: pink; */
	display: flex;
margin-top: 250px;
}

.estimated_price {
	width: calc(100% * 2/ 3);
	height: 50px;
	border: 1px solid lightgray;
	border-radius: 10px;
	float: left;
	margin-right: 50px;
	line-height: 50px;
	
}

.estimated_price1 {
	width: calc(100% * 2/ 3);
	height: 30px;
	/*    border: 1px solid black; */
	/*    background-color: yellow; */
	float: left;
	margin-right: 50px;
	line-height: 30px;
}

.advance_payment {
	width: calc(100% * 1/ 3);
	height: 50px;
	/*    background-color: skyblue; */
	float: left;
	line-height: 50px;
}

.advance_payment1 {
	width: calc(100% * 1/ 3);
	height: 30px;
	/*    border: 1px solid black; */
	/*    background-color: skyblue; */
	float: left;
	line-height: 30px;
}

.advance_payment2 {
	width: calc(100%);
	height: 50px;
	border: 1px solid lightgray;
	border-radius: 10px;
	line-height: 50px;
}

.monthly {
	margin: 0 auto;
	width: 1000px;
	height: 50px;
	line-height: 50px;
	margin-bottom: 20px;
}

.monthly1 {
	margin: 0 auto;
	width: 1000px;
	height: 30px;
	line-height: 30px;
	margin-top: 30px;
	/*    border: 1px solid black; */
	/*    background-color: blue; */
}

.monthly button {
	width: 125px;
	height: 55px;
	border: 1px solid lightgray;
	border-radius: 10px;
	margin-left: 15px;
	float: left;
	text-align: center;
	margin-left: calc(( 1000px - ( 125px * 6))/12);
	margin-right: calc(( 1000px - ( 125px * 6))/12);
	margin-top: 20px;
}

.result_price {

	margin: 0 auto;
	width: 1000px;
	height: 200px;
	line-height: 30px;
	background-color: #f2f2f2;
	margin-top:50px ;
	padding: 40px;
	border-radius: 10px;
}

.rp_ {
	width: 100%;
	height: 100%;
	/*    background-color: pink; */
	display: flex;
}

.rp_left {
	width: calc(100%/ 2);
	height: 100%;
	/*    background-color: yellow; */
	position: relative;
}

.rp_right {
	width: calc(100%/ 2);
	height: 100%;
	/*    background-color: gray; */
}

.rp_left1 {
	width: 100%;
	height: calc(100%/ 2);
	/*    background-color: red; */
	display: flex;
	font-size: 25px;
}

.rp_left2 {
	width: 100%;
	height: calc(100%/ 2);
	/*    background-color: blue; */
	display: flex;
	font-size: 25px;
}

.rp_right1 {
	width: 100%;
	height: calc(100%/ 2);
	/*    background-color: green; */
	display: flex;
}

.rp_right1 button {
	width: 125px;
	height: 55px;
	border: 1px solid red;
	border-radius: 10px;
	margin-left: 15px;
	float: left;
	text-align: center;
	margin-left: calc(( 100% - ( 125px * 2))/3);
	/*    margin-right: calc((100% - (125px * 2)) / 3); */
	color: red;
	line-height: 55px;
	background-color: white;
}

.rp_right2 {
	width: 100%;
	height: calc(100%/ 2);
	/*    background-color: yellow; */
	display: flex;
	line-height: 60px;
	margin-left: 50px;
	margin-top: 10px;
}

.rp_right2 ul {
	line-height: 60px;
}

.rp_right2 li {
	line-height: 20px;
}

.rp_left1-1 {
	width: calc(100%/ 2);
	height: 100%;
	/*    background-color: black; */
	text-align: left;
	line-height: 60px;
	/*    color: white; */
}

.rp_left1-2 {
	width: calc(100%/ 2);
	height: 100%;
	/*    background-color: purple; */
	text-align: right;
	line-height: 60px;
}

.rp_left2-1 {
	width: calc(100%/ 2);
	height: 100%;
	/*    background-color: purple; */
	text-align: left;
	line-height: 60px;
}

.rp_left2-2 {
	width: calc(100%/ 2);
	height: 100%;
	/*    background-color: black; */
	text-align: right;
	line-height: 60px;
	color: #a60000;
}

.rp_left2-3 {
	widows: 100%;
	height: 100%;
	color: gray;
	font-size: 13px;
	position: absolute;
	right: 5px;
	top: 100px;
}

.rp_right1-1 {
	width: 125px;
	height: 55px;
	border: 1px solid red;
	border-radius: 10px;
	margin-left: 15px;
	float: left;
	text-align: center;
	margin-left: calc(( 100% - ( 125px * 2))/3);
	/*    margin-right: calc((100% - (125px * 2)) / 3); */
	color: red;
	line-height: 55px;
	background-color: white;
}

.rp_right1-2 {
	width: 125px;
	height: 55px;
	border: 1px solid red;
	border-radius: 10px;
	margin-left: 30px;
	float: left;
	text-align: center;
	/*    margin-right: calc((100% - (125px * 2)) / 3); */
	color: white;
	line-height: 55px;
	background-color: red;
}
.container-option{
margin-top: 50px;
}
.container-option td{
color: #c0c0c0;
}

.submit {
	margin: 0 auto;
	width: 370px;
	height: 50px;
}

.counseling {
	width: 300px;
	height: 50px;
	border: 3px solid skyblue;
	display: block;
	text-align: center;
	line-height: 50px;
	float: left;
	margin-right: 20px;
	border-radius: 10px;
}

.favorites-btn1 {
	width: 50px;
	height: 50px;
	border: 3px solid skyblue;
	display: block;
	text-align: center;
	line-height: 50px;
	float: left;
	border-radius: 10px;
}

</style>
<script>
	function calculateInstallmentPrice(carPrice, downPayment, period,
			interestRate) {
		const loanAmount = carPrice - downPayment;
		const monthlyInterestRate = interestRate / 12;
		const monthlyPayment = Math.round((loanAmount * monthlyInterestRate)
				/ (1 - Math.pow(1 + monthlyInterestRate, -period)));
		const totalPayment = loanAmount;
		return {
			monthlyPayment : monthlyPayment,
			totalPayment : totalPayment
		};
	}

	function calculatePrice(period) {
		const carPrice = parseInt(document.getElementById("carPrice").textContent
				.replace(/,/g, ""));//콤마가 붙은 값은 문자로 인식하므로 콤마제거
		const downPayment = parseInt(document.getElementById("downPayment").value
				.replace(/,/g, ""));//콤마가 붙은 값은 문자로 인식하므로 콤마제거
		const interestRate = 0.07; // 이자율은 7%로 가정
		const result = calculateInstallmentPrice(carPrice, downPayment, period,
				interestRate);
		const monthlyPaymentString = result.monthlyPayment.toLocaleString();
		const totalPaymentString = result.totalPayment.toLocaleString();

		document.getElementById("monthlyPayment").textContent = monthlyPaymentString;
		document.getElementById("totalPayment").textContent = totalPaymentString;
	}

	function resetCalculation() {
		document.getElementById("carPrice").value = "";
		document.getElementById("downPayment").value = "";
		document.getElementById("monthlyPayment").innerHTML = "";
		document.getElementById("totalPayment").innerHTML = "";

	}
</script>
<script type="text/javascript">
	function inputNumberAutoComma(obj) {

		// 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
		var deleteComma = obj.value.replace(/\,/g, "");

		// 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
		if (isFinite(deleteComma) == false) {
			alert("문자는 입력하실 수 없습니다.");
			obj.value = "";
			return false;

		}

		// 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
		obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
	}

	// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
	function inputNumberWithComma(str) {

		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
	}

	// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
	function inputNumberRemoveComma(str) {

		str = String(str);
		return str.replace(/[^\d]+/g, "");
	}
</script>
<script>
	function limitnumber() {
		let downPayment = document.getElementById('downPayment');
		let carPrice = document.getElementById('carPrice').textContent.replace(
				/[^0-9]/g, ''); // 숫자만 추출

		if (parseInt(downPayment.value.replace(/[^0-9]/g, '')) > parseInt(carPrice)) { //숫자만 추출해서 비교 
			downPayment.value = carPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ','); // 마지막에 콤마 추가
		}
	}
</script>



</head>
<body>
	<%@ include file="menu.jsp"%>
	<!-- 이미지 & 기본정보 -->
	<div class="top">
		<div class="top-left">
			<div class="thumbnail">

				<ul class="bxslider">
					<c:forEach items="${list }" var="car">

						<li><img src=${car.thumbnail }></li>
						<li><img src=${car.front }></li>

						<li><img src=${car.side }></li>
						<li><img src=${car.back }></li>

						<li><img src=${car.insideFront }></li>
						<li><img src=${car.insideBack }></li>

						<li><img src=${car.engineRoom }></li>
						<li><img src=${car.trunk }></li>


					</c:forEach>

				</ul>
			</div>


			<div id="bx-pager">
				<c:forEach items="${list }" var="car">

					<a data-slide-index="0" href=${car.thumbnail }
						data-lightbox="roadtrip"><img src=${car.thumbnail }
						class="allgallery"></a>

					<a href=${car.front } data-lightbox="roadtrip"></a>
					<a href=${car.side } data-lightbox="roadtrip"></a>
					<a href=${car.back } data-lightbox="roadtrip"></a>
					<a href=${car.insideFront } data-lightbox="roadtrip"></a>
					<a href=${car.insideBack } data-lightbox="roadtrip"></a>
					<a href=${car.engineRoom } data-lightbox="roadtrip"></a>
					<a href=${car.trunk } data-lightbox="roadtrip"></a>

					<a data-slide-index="1" href=""><img src=${car.front }></a>

					<a data-slide-index="2" href=""><img src=${car.side }></a>
					<a data-slide-index="3" href=""><img src=${car.back }></a>

					<a data-slide-index="4" href=""><img src=${car.insideFront }></a>
					<a data-slide-index="5" href=""><img src=${car.insideBack }></a>

					<a data-slide-index="6" href=""><img src=${car.engineRoom }></a>
					<a data-slide-index="7" href=""><img src=${car.trunk }></a>


				</c:forEach>
			</div>
			</div>
			<div class="top-right">
			<div class="container mt-5">
				<table class="table">
					<thead>
						<tr>
							<th><h4>요약정보</h4></th>
							</tr>
					</thead>
					<tbody>
						<tr>
						<td>모델명</td>
						<td><c:forEach items="${vehicle }" var="info">
						${info.modelname }	
					</c:forEach></td>
					</tr>
					<tr>
						<td>가격</td>
						<td><c:forEach items="${vehicle }" var="info">
								<fmt:formatNumber value="${info.price }" pattern="" />원		
					</c:forEach></td>
					</tr>
					<tr>
						<td>주행거리</td>
						<td><c:forEach items="${vehicle }" var="info">
								<fmt:formatNumber value="${info.mileage }" pattern="" />Km	
					</c:forEach></td>
					</tr>
					<tr>
						<td>년식</td>
						<td><c:forEach items="${vehicle }" var="info">
						${info.yearofmanufacture }년식	
					    </c:forEach></td>
					   </tr>	
					   </tbody>
				</table>
				</div>
				
				<div class="container mt-5">
				<table class="table">
					<thead>
						<tr>
							<th><h4>거래정보</h4></th>
							</tr>
					</thead>
					<tbody>
					<tr>
						<td>판매자 닉네임</td>
						<td><c:forEach items="${detailpage }" var="page">
						${page.nickname }
					    </c:forEach></td>
					</tr>
					<tr>
						<td>판매자 연락처</td>
						<td><c:forEach items="${detailpage }" var="page">
						${page.phonenumber }

					    </c:forEach></td>
					</tr>
					<tr>
						<td>거래 희망 지역</td>
						<td><c:forEach items="${detailpage }" var="page">
						${page.transactionlocation }
					    </c:forEach></td>
					</tr>
					<tr>
						<td>거래 희망 날짜</td>
						<td><c:forEach items="${detailpage }" var="page">
						${page.transactiondate }
					    </c:forEach></td>
					</tr>	
					   </tbody>
				</table>
				</div>


				
				
				<button class="favorites-btn">찜하기</button>
			</div>
		


		<!-- 할부금 -->

		<div class="estimated">
			<div class="price_1">
				<div class="estimated_price1"><h3>차량가격</h3></div>
				<div class="advance_payment1"><h3>선수금</h3></div>
			</div>
			<div class="price">
				<div class="estimated_price" id=carPrice>
					<c:forEach items="${vehicle }" var="info">
						<fmt:formatNumber value="${info.price }" pattern="" />원		
					</c:forEach>
				</div>
				<div class="advance_payment">
					<input type="text" class="advance_payment2" value="1,000,000"
						id=downPayment onKeyup="inputNumberAutoComma(this);"
						oninput="limitnumber()" maxlength="10">

				</div>
			</div>

			<div class="monthly1"><h3>할부가격</h3></div>
			<div class="monthly">
				<button onclick="calculatePrice(12)">12개월</button>
				<button onclick="calculatePrice(24)">24개월</button>
				<button onclick="calculatePrice(36)">36개월</button>
				<button onclick="calculatePrice(48)">48개월</button>
				<button onclick="calculatePrice(60)">60개월</button>
				<button onclick="calculatePrice(72)">72개월</button>
			</div>

			<div class="result_price">
				<div class="rp_">
					<div class="rp_left">
						<ul>
							<li class="rp_left1"><span class="rp_left1-1">총 할부 신청
									금액</span> <span class="rp_left1-2"><span id="totalPayment"></span>원</span>
							</li>
							<li class="rp_left2"><span class="rp_left2-1">월 납부금</span> <span
								class="rp_left2-2"><span id="monthlyPayment"></span>원</span></li>
							<span class="rp_left2-3">(금리 7% 기준)</span>
						</ul>
					</div>
					<div class="rp_right">
						<div class="rp_right1">
							<button onclick="resetCalculation()">다시계산</button>
							<div class="rp_right1-2">한도 조회</div>
						</div>
						<div class="rp_right2">
							<ul>
								<li>개인신용평점 영향 없이, 24시간 한도 조회가 가능합니다.</li>
								<li>실제 금리는 개인신용도에 따라 달라질 수 있습니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>


			<!-- 기본정보 -->

			<div class="container mt-5">
				<table class="table">
					<thead>

						<tr>
							<th><h4>기본정보</h4></th>
					</thead>
					<tbody>

						<tr>
							<th style="width: 25%;" class="fw-normal">모델명</th>
							<th style="width: 25%;" class="fw-normal"><c:forEach
									items="${vehicle }" var="info">
						${info.modelname }	
				     	</c:forEach></th>
							<th style="width: 25%;" class="fw-normal">가격</th>
							<th style="width: 25%;" class="fw-normal"><c:forEach
									items="${vehicle }" var="info">
									<fmt:formatNumber value="${info.price }" pattern="" />원		
					    </c:forEach></th>
						</tr>
						<tr>
							<td>주행거리</td>
							<td><c:forEach items="${vehicle }" var="info">
									<fmt:formatNumber value="${info.mileage }" pattern="" />Km	
					    </c:forEach></td>
							<td>년식</td>
							<td><c:forEach items="${vehicle }" var="info">
						${info.yearofmanufacture }년식	
					    </c:forEach></td>
						</tr>
						<tr>
							<td>차량번호</td>
							<td><c:forEach items="${vehicle }" var="info">
						${info.licensenumber }	
					    </c:forEach></td>
							<td>제조사</td>
							<td><c:forEach items="${vehicle }" var="info">
						${info.manufacturer }	
					    </c:forEach></td>
						</tr>
						<tr>
							<td>색상</td>
							<td><c:forEach items="${vehicle }" var="info">
						${info.color }	
					    </c:forEach></td>
							<td>배기량</td>
							<td><c:forEach items="${vehicle }" var="info">
									<fmt:formatNumber value="${info.displacement }" pattern="" />cc
					    </c:forEach></td>
						</tr>
						<tr>
							<td>국산/수입</td>
							<td><c:forEach items="${vehicle }" var="info">
						${info.domesticimport }
					    </c:forEach></td>
							<td>차종</td>
							<td><c:forEach items="${vehicle }" var="info">
						${info.vehicletype }
					    </c:forEach></td>
						</tr>
						<tr>
							<td>구동방식</td>
							<td><c:forEach items="${vehicle }" var="info">
						${info.wheeltype }
					    </c:forEach></td>
							<td>연료타입</td>
							<td><c:forEach items="${vehicle }" var="info">
						${info.fueltype }
					    </c:forEach></td>
						</tr>
						<tr>
							<td>자동/수동</td>
							<td><c:forEach items="${vehicle }" var="info">
						${info.transmissiontype }
					    </c:forEach></td>
							<td>탑승인원</td>
							<td><c:forEach items="${vehicle }" var="info">
						${info.passengercapacity }명
					    </c:forEach></td>
						</tr>

					</tbody>
				</table>



			</div>

			<!-- 옵션 -->

			<div class="container-option">
				<table class="table">
					<thead>
						<tr>
							<th><h4>옵션정보</h4></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="3" style="width: 15%; border-right: 1px solid black; color: black;">외관</td>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.sunroof == true}"> style="font-weight:bold; color:black;"</c:if>>선루프</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.panoramicsunroof == true}"> style="font-weight:bold; color:black;"</c:if>>파노라마선루프</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.aluminumwheels == true}"> style="font-weight:bold; color:black;"</c:if>>알루미늄휠</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.powersidemirror == true}"> style="font-weight:bold; color:black;"</c:if>>전동사이드미러</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.hidlamps == true}"> style="font-weight:bold; color:black;"</c:if>>HID램프</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.ledheadlamps == true}"> style="font-weight:bold; color:black;"</c:if>>LED헤드램프</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.adaptiveheadlamps == true}"> style="font-weight:bold; color:black;"</c:if>>어댑티드헤드램프</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.ledrearlamps == true}"> style="font-weight:bold; color:black;"</c:if>>LED리어램프</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.daytimelights == true}"> style="font-weight:bold; color:black;"</c:if>>데이라이트</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.highbeamassist == true}"> style="font-weight:bold; color:black;"</c:if>>하이빔어시스트</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.compressiondoor == true}"> style="font-weight:bold; color:black;"</c:if>>압축도어</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.automaticslidingdoor == true}"> style="font-weight:bold; color:black;"</c:if>>자동슬라이딩도어</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.powersidestep == true}"> style="font-weight:bold; color:black;"</c:if>>전동사이드스탭</td>
                            </c:forEach>
							<c:forEach items="${exterior}" var="option">
                            <td<c:if test="${option.roofrack == true}"> style="font-weight:bold; color:black;"</c:if>>루프랙</td>
                            </c:forEach>
							<td></td>
						</tr>
						<tr>
							<td rowspan="4" style="width: 15%; border-right: 1px solid black; color: black; ">내장</td>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.leatherseats == true}"> style="font-weight:bold; color:black;"</c:if>>가죽시트</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.powerseatdriver == true}"> style="font-weight:bold; color:black;"</c:if>>전동시트(운전석)</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.powerseatpassenger == true}"> style="font-weight:bold; color:black;"</c:if>>전동시트(동승석)</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.heatedseatfront == true}"> style="font-weight:bold; color:black;"</c:if>>열선시트(앞좌석)</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.heatedseatrear == true}"> style="font-weight:bold; color:black;"</c:if>>열선시트(뒷자석)</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.ventilatedseats == true}"> style="font-weight:bold; color:black;"</c:if>>통풍시트</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.memoryseats == true}"> style="font-weight:bold; color:black;"</c:if>>메모리시트</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.foldingseats == true}"> style="font-weight:bold; color:black;"</c:if>>폴딩시트</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.massageseats == true}"> style="font-weight:bold; color:black;"</c:if>>마사지시트</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.walkinseat == true}"> style="font-weight:bold; color:black;"</c:if>>워크인시트</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.lumbarsupport == true}"> style="font-weight:bold; color:black;"</c:if>>요추받침</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.highpassroommirror == true}"> style="font-weight:bold; color:black;"</c:if>>하이패스룸미러</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.ecmroommirror == true}"> style="font-weight:bold; color:black;"</c:if>>ECM룸미러</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.rearseatvents == true}"> style="font-weight:bold; color:black;"</c:if>>뒷자석에어벤트</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.paddleshift == true}"> style="font-weight:bold; color:black;"</c:if>>패들쉬프트</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.powersunshade == true}"> style="font-weight:bold; color:black;"</c:if>>전동햇빛가리개</td>
                            </c:forEach>
							<c:forEach items="${interior}" var="option">
                            <td<c:if test="${option.ambientlighting == true}"> style="font-weight:bold; color:black;"</c:if>>엠비언트라이트</td>
                            </c:forEach>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td rowspan="4" style="width: 15%; border-right: 1px solid black; color: black; ">안전</td>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.curtainairbags == true}"> style="font-weight:bold; color:black;"</c:if>>커튼에어백</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.kneeairbags == true}"> style="font-weight:bold; color:black;"</c:if>>무릎에어백</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.passengerairbags == true}"> style="font-weight:bold; color:black;"</c:if>>승객감지에어백</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.abs == true}"> style="font-weight:bold; color:black;"</c:if>>브레이크잠김방지(ABS)</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.esc == true}"> style="font-weight:bold; color:black;"</c:if>>차체자세제어장치(ESC)</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.rearsensors == true}"> style="font-weight:bold; color:black;"</c:if>>후방센서</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.frontsensors == true}"> style="font-weight:bold; color:black;"</c:if>>전방센서</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.rearcamera == true}"> style="font-weight:bold; color:black;"</c:if>>후방카메라</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.frontcamera == true}"> style="font-weight:bold; color:black;"</c:if>>전방카메라</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.aroundview == true}"> style="font-weight:bold; color:black;"</c:if>>어라운드뷰</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.tpms == true}"> style="font-weight:bold; color:black;"</c:if>>타이어공기압감지(TPMS)</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.ldws == true}"> style="font-weight:bold; color:black;"</c:if>>차선이탈경보(LDWS)</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.aeb == true}"> style="font-weight:bold; color:black;"</c:if>>자동긴급제동</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.ecs == true}"> style="font-weight:bold; color:black;"</c:if>>전자제어서스펜션(ECS)</td>
                            </c:forEach>
							<c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.rearcrosstrafficalert == true}"> style="font-weight:bold; color:black;"</c:if>>후측방경보</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${safety}" var="option">
                            <td<c:if test="${option.tcs == true}"> style="font-weight:bold; color:black;"</c:if>>미끄럼방지(TCS)</td>
                            </c:forEach>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td rowspan="4" style="width: 15%; border-right: 1px solid black; color: black; ">편의</td>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.smartkey == true}"> style="font-weight:bold; color:black;"</c:if>>스마트키</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.heatedsteeringwheel == true}"> style="font-weight:bold; color:black;"</c:if>>열선핸들</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.remotecontrolsteeringwheel == true}"> style="font-weight:bold; color:black;"</c:if>>리모컨핸들</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.automaticairconditioning == true}"> style="font-weight:bold; color:black;"</c:if>>자동에어컨</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.dualzoneairconditioning == true}"> style="font-weight:bold; color:black;"</c:if>>좌우독립에어컨</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.autoheadlights == true}"> style="font-weight:bold; color:black;"</c:if>>오토라이트</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.cruisecontrol == true}"> style="font-weight:bold; color:black;"</c:if>>크루즈컨트롤</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.smartcruisecontrol == true}"> style="font-weight:bold; color:black;"</c:if>>스마트크루즈컨트롤</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.stopandgo == true}"> style="font-weight:bold; color:black;"</c:if>>스탑앤고</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.powertrunk == true}"> style="font-weight:bold; color:black;"</c:if>>전동트렁크</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.smarttrunk == true}"> style="font-weight:bold; color:black;"</c:if>>스마트트렁크</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.electronicparkingbrake == true}"> style="font-weight:bold; color:black;"</c:if>>전자주차브레이크(EPB)</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.hillstartassist == true}"> style="font-weight:bold; color:black;"</c:if>>경사로밀림방지</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.headupdisplay  == true}"> style="font-weight:bold; color:black;"</c:if>>헤드업디스플레이(HUD)</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.wirelesscharging == true}"> style="font-weight:bold; color:black;"</c:if>>무선충전</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.automaticparking == true}"> style="font-weight:bold; color:black;"</c:if>>자동주차</td>
                            </c:forEach>
							<c:forEach items="${convenience}" var="option">
                            <td<c:if test="${option.refrigerator == true}"> style="font-weight:bold; color:black;"</c:if>>냉장고</td>
                            </c:forEach>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td rowspan="4" style="width: 15%; border-right: 1px solid black; color: black; ">멀티미디어</td>
							<c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.genuinenavigation == true}"> style="font-weight:bold; color:black;"</c:if>>네비게이션(순정)</td>
                            </c:forEach>
							<c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.aftermarketnavigation == true}"> style="font-weight:bold; color:black;"</c:if>>네비게이션(비순정)</td>
                            </c:forEach>
							<c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.usb == true}"> style="font-weight:bold; color:black;"</c:if>>USB</td>
                            </c:forEach>
							<c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.aux == true}"> style="font-weight:bold; color:black;"</c:if>>AUX</td>
                            </c:forEach>
							<c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.bluetooth == true}"> style="font-weight:bold; color:black;"</c:if>>블루투스</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.mp3 == true}"> style="font-weight:bold; color:black;"</c:if>>MP3</td>
                            </c:forEach>
							<c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.dmb == true}"> style="font-weight:bold; color:black;"</c:if>>DMB</td>
                            </c:forEach>
							<c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.cdplayer == true}"> style="font-weight:bold; color:black;"</c:if>>CD플레이어</td>
                            </c:forEach>
							<c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.avsystem == true}"> style="font-weight:bold; color:black;"</c:if>>AV시스템</td>
                            </c:forEach>
							<c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.rearseattv == true}"> style="font-weight:bold; color:black;"</c:if>>뒷좌석TV</td>
                            </c:forEach>
						</tr>
						<tr>
						    <c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.telematics == true}"> style="font-weight:bold; color:black;"</c:if>>텔레매틱스</td>
                            </c:forEach>
							<c:forEach items="${multimedia}" var="option">
                            <td<c:if test="${option.smartphonemirroring == true}"> style="font-weight:bold; color:black;"</c:if>>스마트폰미러링</td>
                            </c:forEach>
							<td></td>
							<td></td>
							<td></td>
						</tr>
											
						</tbody>
						</table>
						</div>

		<!-- 본문내용 -->
		<div class="content">
		<c:forEach items="${vehicle }" var="info">
			${info.contents }
		 </c:forEach>
		</div>

		<!-- 상담신청 & 찜하기 -->
		<div class="submit">
			<div class="counseling"><a href="/index" onclick="complete()">상담 신청하기</a></div>
			<script>
			function complete(){alert("신청이 완료되었습니다.")}
			</script>
			<div class="favorites-btn1">찜하기</div>
		</div>
	</div>
	</div>
	<%@ include file="footer.jsp"%>


	<!-- Bootstrap core JS-->


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

	<!-- Core theme JS-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


	<!-- slider JS -->
	<script
		src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="js/slider.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.js"></script>
	<script src="js/lightbox.js"></script>
</body>
</html>
