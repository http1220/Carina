<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-lg-5">
			<a class="navbar-brand" href="#!"><img src="/img/CarinaLogoheader.png" alt="로고" width="40px" height="30px"></a> <a class="navbar-brand"
				href="/index"><b>Carina</b></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="/searchpage">내차 사러가기</a></li>
				<li class="nav-item"><a class="nav-link" href="/regist">내차
						팔러가기</a></li>
			</ul>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<c:choose>
					<%-- 
			<c:when test="조건식">참일 때</c:when> 
			<c:when test="조건식2">참일 때</c:when>
			<c:when test="조건식3">참일 때</c:when>
			<c:otherwise>거짓일 때</c:otherwise>
				<!-- 로그인 id가 null값일 때 = 로그인 하지 않았을 때 -->
 --%>
					<c:when test="${sessionScope.id eq null }">
						<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="/myimfo">${sessionScope.nickname }님
								반갑습니다.</a></li>
						<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="/agree">회원가입</a></li>
			</ul>
		</div>
	</div>
	</nav>