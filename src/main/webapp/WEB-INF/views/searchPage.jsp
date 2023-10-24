<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="menu.jsp"%>
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
<title>카리나</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/css/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!--         Core theme CSS (includes Bootstrap) -->
<link href="/css/styles.css" rel="stylesheet" />
<script src="js/SearchPageJS.js"></script>
</head>
<style>
body {
	

}

.maincontainer {
	width : 100vw;
	max-width : 1200px;
	margin: 0 auto;
}
</style>
<body>

<div class="maincontainer">
	<div class="row">
		<div class="col-lg-3">
			<form name="filter_form" id="filter_form">
				<div class="accordion" id="accordionPanelsStayOpenExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="panelsStayOpen-headingOne">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseOne"
								aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
								제조사</button>
						</h2>

						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse show"
							aria-labelledby="panelsStayOpen-headingOne">
							<div class="accordion-body">
								<select class="form-select" aria-label="Default select example"
									name="maker">
									<option selected value="all" value="all">전체보기</option>
									<c:forEach items="${Manufacturer }" var="e">
									<option value="${e } ">${e}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingTwo">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseTwo"
								aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">차종</button>
						</h2>
						<div id="panelsStayOpen-collapseTwo"
							class="accordion-collapse collapse show"
							aria-labelledby="panelsStayOpen-headingTwo">
							<div class="accordion-body">
								<select class="form-select" aria-label="Default select example"
									id="selcettype" name="type">
									<option selected value="all">전체보기</option>
									<c:forEach items="${Vehicletype }" var="e">
									<option value="${e}">${e}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingThree">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseThree"
								aria-expanded="true"
								aria-controls="panelsStayOpen-collapseThree">연료타입</button>
						</h2>
						<div id="panelsStayOpen-collapseThree"
							class="accordion-collapse collapse show"
							aria-labelledby="panelsStayOpen-headingThree">
							<div class="accordion-body">
								<select class="form-select" aria-label="Default select example"
									name="fuel">
									<option selected value="all">전체보기</option>
									<c:forEach items="${Fueltype }" var="e">
									<option value="${e } ">${e}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>

					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFour">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseFour"
								aria-expanded="false"
								aria-controls="panelsStayOpen-collapseFour">변속기</button>
						</h2>
						<div id="panelsStayOpen-collapseFour"
							class="accordion-collapse collapse"
							aria-labelledby="panelsStayOpen-headingFour">
							<div class="accordion-body">
								<select class="form-select" aria-label="Default select example"
									name="mission">
									<option selected value="all">전체보기</option>
									<c:forEach items="${Transmissiontype }" var="e">
									<option value="${e } ">${e}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>


					<div class="accordion-item">
						<h2 class="accordion-header" id="headingFive">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseFive"
								aria-expanded="false"
								aria-controls="panelsStayOpen-collapseFive">전륜후륜</button>
						</h2>
						<div id="panelsStayOpen-collapseFive"
							class="accordion-collapse collapse"
							aria-labelledby="panelsStayOpen-headingFive"
							data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<select class="form-select" aria-label="Default select example"
									name="wheeldrt">
									<option selected value="all">전체보기</option>
									<c:forEach items="${Wheeltype }" var="e">
									<option value="${e } ">${e}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>

					<div class="accordion-item">
						<h2 class="accordion-header" id="headingSix">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseSix"
								aria-expanded="false" aria-controls="panelsStayOpen-collapseSix">승차정원</button>
						</h2>
						<div id="panelsStayOpen-collapseSix"
							class="accordion-collapse collapse"
							aria-labelledby="panelsStayOpen-headingSix"
							data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<select class="form-select" aria-label="Default select example"
									name="psngcap">
									<option selected value="all">전체보기</option>
									<c:forEach items="${Passengercapacity }" var="e">
									<option value="${e } ">${e}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>


					<div class="accordion-item">
						<h2 class="accordion-header" id="headingSeven">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseSeven"
								aria-expanded="false"
								aria-controls="panelsStayOpen-collapseSeven">배기량</button>
						</h2>
						<div id="panelsStayOpen-collapseSeven"
							class="accordion-collapse collapse"
							aria-labelledby="panelsStayOpen-headingSeven"
							data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<select class="form-select" aria-label="Default select example"
									name="cc">
									<option selected value="all">전체보기</option>
									<option value="1000">1000cc 이하</option>
									<option value="1600">1600cc 이하</option>
									<option value="2000">2000cc 이하</option>
									<option value="3000">3000cc 이하</option>
									<option value="3001">3000cc 초과</option>
								</select>
							</div>
						</div>
					</div>

					<div class="accordion-item">
						<h2 class="accordion-header" id="headingEight">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseEight"
								aria-expanded="false"
								aria-controls="panelsStayOpen-collapseEight">연식</button>
						</h2>
						<div id="panelsStayOpen-collapseEight"
							class="accordion-collapse collapse"
							aria-labelledby="panelsStayOpen-headingEight"
							data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<div class="row">
									<div class="col-5">
										<select class="form-select"
											aria-label="Default select example" name="priyear">
											<option selected value="0">전체보기</option>
											<option value="1950">1950</option>
											<option value="1960">1960</option>
											<option value="1970">1970</option>
											<option value="1980">1980</option>
											<option value="1990">1990</option>
											<option value="2000">2000</option>
											<option value="2010">2010</option>
											<option value="2020">2020</option>
										</select>
									</div>
									<div class="col-2">~</div>
									<div class="col-5">
										<select class="form-select"
											aria-label="Default select example"  name="afteryear">
											<option selected value="9999" >전체보기</option>
											<option value="1959">1960</option>
											<option value="1969">1970</option>
											<option value="1979">1980</option>
											<option value="1989">1990</option>
											<option value="1999">2000</option>
											<option value="2009">2010</option>
											<option value="2019">2020</option>
											<option value="2029">2030</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingNine">
							<button class="accordion-button collapsed" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#panelsStayOpen-collapseNine"
								aria-expanded="false"
								aria-controls="panelsStayOpen-collapseNine">주행거리</button>
						</h2>
						<div id="panelsStayOpen-collapseNine"
							class="accordion-collapse collapse"
							aria-labelledby="panelsStayOpen-headingNine"
							data-bs-parent="#accordionExample">
							<div class="accordion-body">
								<div class="row">
									<div class="col-5">
										<select class="form-select"
											aria-label="Default select example" name="pridistance">
											<option selected value="0">전체보기</option>
											<option value="0">0</option>
											<option value="100000">10만</option>
											<option value="200000">20만</option>
											<option value="300000">30만</option>
										</select>
									</div>
									<div class="col-2">~</div>
									<div class="col-5">
										<select class="form-select"
											aria-label="Default select example" name="afterdistance">
											<option selected value="999999">전체보기</option>
											<option value="199999">10만</option>
											<option value="299999">20만</option>
											<option value="399999">30만</option>
											<option value="999999">30만 이상</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
<!-- 					<div class="accordion-item"> -->
<!-- 						<h2 class="accordion-header" id="headingTen"> -->
<!-- 							<button class="accordion-button collapsed" type="button" -->
<!-- 								data-bs-toggle="collapse" -->
<!-- 								data-bs-target="#panelsStayOpen-collapseTen" -->
<!-- 								aria-expanded="false" aria-controls="panelsStayOpen-collapseTen">가격</button> -->
<!-- 						</h2> -->
<!-- 						<div id="panelsStayOpen-collapseTen" -->
<!-- 							class="accordion-collapse collapse" -->
<!-- 							aria-labelledby="panelsStayOpen-headingTen" -->
<!-- 							data-bs-parent="#accordionExample"> -->
<!-- 							<div class="accordion-body"> -->
<!-- 								<div class="row"> -->
<!-- 									<div class="col-5"> -->
<!-- 										<select class="form-select" -->
<!-- 											aria-label="Default select example"> -->
<!-- 											<option selected value="0">전체보기</option> -->
<!-- 											<option value="0">0</option> -->
<!-- 											<option value="100000">10만</option> -->
<!-- 											<option value="200000">20만</option> -->
<!-- 											<option value="300000">30만</option> -->
<!-- 										</select> -->
<!-- 									</div> -->
<!-- 									<div class="col-2">~</div> -->
<!-- 									<div class="col-5"> -->
<!-- 										<select class="form-select" -->
<!-- 											aria-label="Default select example"> -->
<!-- 											<option selected value="all">1</option> -->
<!-- 											<option value="1">2</option> -->
<!-- 											<option value="2">3</option> -->
<!-- 											<option value="3">4</option> -->
<!-- 										</select> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->

					<!-- <div class="accordion-item">
					<h2 class="accordion-header" id="headingEleven">
						<button class="accordion-button collapsed" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseEleven"
							aria-expanded="false" aria-controls="collapseThree">지역</button>
					</h2>
					<div id="collapseEleven" class="accordion-collapse collapse"
						aria-labelledby="headingEleven" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<select class="form-select" aria-label="Default select example">
								<option selected value="all">1</option>
								<option value="1">2</option>
								<option value="2">3</option>
								<option value="3">4</option>
							</select>
						</div>
					</div>
				</div> -->
<!-- 					<div class="accordion-item"> -->
<!-- 						<h2 class="accordion-header" id="headingTwelve"> -->
<!-- 							<button class="accordion-button collapsed" type="button" -->
<!-- 								data-bs-toggle="collapse" -->
<!-- 								data-bs-target="#panelsStayOpen-collapseTwelve" -->
<!-- 								aria-expanded="false" -->
<!-- 								aria-controls="panelsStayOpen-collapseTwelve">색상</button> -->
<!-- 						</h2> -->
<!-- 						<div id="panelsStayOpen-collapseTwelve" -->
<!-- 							class="accordion-collapse collapse show" -->
<!-- 							aria-labelledby="panelsStayOpen-headingTwelve" -->
<!-- 							data-bs-parent="#accordionExample"> -->
<!-- 							<div class="accordion-body"> -->
<!-- 								<select class="form-select" aria-label="Default select example"> -->
<!-- 									<option selected value="all">1</option> -->
<!-- 									<option value="1">2</option> -->
<!-- 									<option value="2">3</option> -->
<!-- 									<option value="3">4</option> -->
<!-- 								</select> -->

<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->

				</div>
				<div class="d-grid gap-2">
					<button class="btn btn-primary" type="button"
						onclick="get_list('vehicleno_DESC')">찾기</button>
				</div>
		</div>

		<div class="col-lg-9">
			<section class="py-1">
				<div class="container">
					<div class="input-group mb-3">
						<input type="text" style="display:none;">
						<input type="text" class="form-control form-control-lg"
							id="search" placeholder="모델명을 검색 할 수 있습니다."
							aria-label="Recipient's username"
							aria-describedby="button-addon2" name="model" value="${kwd}"  onkeypress="if( event.keyCode == 13 ){get_list('vehicleno_DESC')}">
						<button class="btn btn-outline-primary" type="button" id="enter"
							onclick="get_list('vehicleno_DESC')">검색하기</button>

					</div>
					<button class="btn btn-outline-primary" type="button"
						value="mileage_DESC" onclick="get_list(this.value)">주행거리
						내림순</button>
					<button class="btn btn-outline-primary" type="button"
						value="mileage_ASC" onclick="get_list(this.value)">주행거리
						오름순</button>
					<button class="btn btn-outline-primary" type="button"
						value="year_DESC" onclick="get_list(this.value)">연식
						내림순</button>
					<button class="btn btn-outline-primary" type="button"
						value="year_ASC" onclick="get_list(this.value)">연식
						오름순</button>
					<button class="btn btn-outline-primary" type="button"
						value="price_DESC" onclick="get_list(this.value)">가격
						내림순</button>
					<button class="btn btn-outline-primary" type="button"
						value="price_ASC" onclick="get_list(this.value)">가격
						오름순</button>
					</form>
				</div>
				<div class="container px-4 px-lg-5 mt-5">
					<div
						class="row row-cols-1 row-cols-md-4 g-4"
						id="place">
						<!-- 여기서부터 전부 js로 코드 생성함 -->
						<c:forEach items="${list }" var="i">
							<div class="col mb-5">
								<div class="card h-100">
									<!-- Product image-->

									<img class="card-img-top" src="${i.thumbnail }" style="height: inherit;">


									<!-- Product details-->
									<div class="card-body">
											<!-- Product name-->
											<h5 class="card-title">${i.modelname }</h5>
											<p class="card-text">										
												<fmt:formatNumber value="${i.year }" pattern="00" />연식
												<br>
												<fmt:formatNumber value="${i.mileage }" pattern="" />Km
												<br>${i.fueltype }</p>
											<!-- Product price-->
											<strong>
											<fmt:formatNumber value="${i.price }" pattern="" /></strong>원
									</div>
									<!-- Product actions-->
									<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
										<div class="text-center">
										<c:url var="imagePath" value="${i.thumbnail }"/>
											<a class="btn btn-outline-dark mt-auto"
												href="/detail?vehicleno=${i.vehicleno}
<%-- 												=&thumbnail=${i.thumbnail} --%>
												">자세히 보기</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center" id="paginglayer">
					<%-- <li class="page-item"><a class="page-link" href="#"
						aria-label="Previous" onclick="previous_page()"> <span
							aria-hidden="true">이전</span>
					</a></li>
					<c:choose>
						<c:when test="${total ne null}">
							<c:forEach var="i" begin="1" end="${total-1 }">
								<li class="page-item"><a class="page-link">${i}</a></li>
							</c:forEach>
						</c:when>
					</c:choose>
					<li class="page-item"><a class="page-link">${total}</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next" onclick="next_page()"><span
							aria-hidden="true">다음</span> </a></li> --%>

					<c:forEach begin="0" end="${total-1}" var="i">
						<li class="page-item"><a class="page-link"
							onclick="get_list('vehicleno_DESC', ${i})">${i+1}</a></li>
					</c:forEach>
					<c:if test="${total ne 1}">
					<li class="page-item" id="next"><a class="page-link"
						onclick="get_list('vehicleno_DESC','${i+1}')">다음</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
	<!-- 여기까지 전부 js로 코드 생성함 -->
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</div>
	<%@ include file="footer.jsp"%>



</body>
<script>
window.addEventListener("hashchange", function() {
	//hash = #page0&sortAtt_dir
	var sort = location.hash.slice(7);
	var page = location.hash[5];
	get_list(sort, page-1);
});
</script>
</html>
