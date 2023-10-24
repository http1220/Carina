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
<title>Carina</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/css/favicon.ico" />
<!-- Bootstrap icons-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
   rel="stylesheet" />
<!--         Core theme CSS (includes Bootstrap) -->
<link href="/css/styles.css" rel="stylesheet" />
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> -->
<script>
   function search() {
      alert("검색!");
   }
</script>
</head>
<style>
.banner {
   margin: 0 auto;
   display: flex;
   justify-content: center;
   align-items: center;
}

.header video {
   width: 2000px;
   height: 500px;
}

.fs-4 pri {
   text-align: center;
}

.input-group input-group-lg {
   display: inline-block;
}

/* controls 숨김 */
video::-webkit-media-controls {
   display: none !important;
}

video::-webkit-media-controls-enclosure {
   display: none !important;
}

video::-webkit-media-controls-panel {
   display: none !important;
}
 .card-img-top { 
   object-fit: cover; 
   height:inherit;
 } 
.p-lg-5 {
    margin-top: -100px;
    }


</style>
<body>

   <%@ include file="menu.jsp"%>
   <!-- img banner -->

   <div class="py-5"  style="width:100%;">
      <div class="container px-lg-5" >
      <div class="row">
            <div class="col-lg-6 offset-lg-3">
      
         <div class="header">
            <div class="banner">
               <video autoplay loop muted>
                  <source src="img/open.mp4" type="video/webm">
               </video>
               </div>
            </div>
            </div>
         </div>
      </div>
   </div>

   <!-- search form -->
   <section class="pt-0">
   <div class="container px-lg-5">
      <div class="p-4 p-lg-5 rounded-3 text-center">
         <div class="m-4 m-lg-5">
            <br>
            <div class="fs-4 pri d-flex justify-content-center align-items-center">
              <form method="GET" action="/indexsearch" class="w-100">
               <div class="input-group input-group-lg">
                  <input type="text" id="kwd" placeholder="검색어를 입력해주세요" name="model" class="form-control">
                  <button class="btn btn-outline-dark">
                     <img src="img/search.png" width="38px" height="38px">
                  </button>
               </div>
              </form>
            </div>
         </div>
      </div>
   </div>
</section>

          <div class="container px-lg-5">
  <div class="table">
    <h4 class="mb-4">실시간 인기매물 Top 5</h4>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-5 g-4">
      <c:forEach items="${carlist}" var="car">
        <div class="col">
          <div class="card h-100" style="
    padding-left: 0px;
    padding-bottom: 0px;
    padding-right: 0px;
    padding-top: 0px;">
            <img src="${car.thumbnail}" class="card-img-top" alt="car thumbnail">
            <div class="card-body p-4">
              <h5 class="card-title fw-bolder">${car.modelname}</h5>
              <p class="card-text" style="font-size: x-small">
              <fmt:formatNumber value="${car.mileage }" pattern="" />Km ${car.fueltype}</p>                     
              <p class="card-text"><strong>
              <fmt:formatNumber value="${car.price }" pattern="" /></strong>원
              </p>
              <h4 class="card-text"><strong>${car.views}</strong>명 왔다감</h4>
              
            </div>
            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
              <div class="text-center">
                <a href="/detail?vehicleno=${car.vehicleno}&thumbnail=${car.thumbnail}" class="btn btn-outline-dark mt-auto">자세히 보기</a>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</div>
            
      
   



   <%@ include file="footer.jsp"%>
   <!-- Bootstrap core JS-->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- Core theme JS-->

</body>
</html>