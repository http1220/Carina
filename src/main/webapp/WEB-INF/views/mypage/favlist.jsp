<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="(주)에스아이알소프트">
<meta name="keywords" content="영카트5,그누보드5,GPL,무료쇼핑몰솔루션">
<meta name="description" content="영카트5는 자유롭게 사용할수 있는 GPL 라이센스 독립형 무료 쇼핑몰 솔루션 입니다.">

<title>마이페이지</title>
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/css/default_shop.css?ver=2303229">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/js/font-awesome/css/font-awesome.min.css?ver=2303229">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/js/owlcarousel/owl.carousel.css?ver=2303229">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/outlogin/shop_basic/style.css?ver=2303229">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/outlogin/shop_side/style.css?ver=2303229">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/shop/basic/style.css?ver=2303229">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/latest/notice/style.css?ver=2303229">
<link rel="stylesheet" href="https://demo.sir.kr/gnuboard5/theme/basic/skin/visit/shop_basic/style.css?ver=2303229">
<!--[if lte IE 8]>
<script src="https://demo.sir.kr/gnuboard5/js/html5.js"></script>
<![endif]-->

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="/css/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<!--         Core theme CSS (includes Bootstrap) -->
<link href="/css/styles.css" rel="stylesheet" />
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"> -->
 <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.min.js"></script>
<!--  axios -->
 <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
 

<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "https://demo.sir.kr/gnuboard5";
var g5_bbs_url   = "https://demo.sir.kr/gnuboard5/bbs";
var g5_is_member = "1";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
var g5_theme_shop_url = "https://demo.sir.kr/gnuboard5/theme/basic/shop";
var g5_shop_url = "https://demo.sir.kr/gnuboard5/shop";
</script>
<script src="https://demo.sir.kr/gnuboard5/js/jquery-1.12.4.min.js?ver=2210172"></script>
<script src="https://demo.sir.kr/gnuboard5/js/jquery-migrate-1.4.1.min.js?ver=2210172"></script>
<script src="https://demo.sir.kr/gnuboard5/js/jquery.shop.menu.js?ver=2210172"></script>
<script src="https://demo.sir.kr/gnuboard5/js/common.js?ver=2210172"></script>
<script src="https://demo.sir.kr/gnuboard5/js/wrest.js?ver=2210172"></script>
<script src="https://demo.sir.kr/gnuboard5/js/placeholders.min.js?ver=2210172"></script>
<script src="https://demo.sir.kr/gnuboard5/js/owlcarousel/owl.carousel.min.js?ver=2210172"></script>
<script src="https://demo.sir.kr/gnuboard5/js/jquery.bxslider.js?ver=2210172"></script>

</head>
<style>
.content {
	width : 1000px;
	height: 800px;
	background-color: #fcfcfc;
	display: block;
	flex-direction: column;
	
}

.menu_ul {
	font-size: x-large;
	list-style: none;
	margin: 0;
	padding: 0;
}
.menu_ul > li:hover {
	color: white;
}

.title {
	font-size: xx-large;
	padding-left : 10px;
}

.board {
	height:600px;
	display: flex;
	flex-direction: column;
	font-size: x-large;
	
}

.main-container {
  width: 100%;
  height: 100%;
  display: flex;
  margin: 0;
}

.table-container {
  display: flex;
  flex-flow: column nowrap;
  background-color: white;
  width: 98%;
  margin: 0 auto;
  border-radius: 4px;
  border: 1px solid #DADADA;
  box-shadow: 0px 1px 4px rgba(0, 0, 0, .08);
}

.table-row {
  display: flex;
  flex-flow: row nowrap;
  width: 100%;
  border-bottom: 1px solid #dadada;
}

.heading {
  background-color: #ececec;
  color: #3e3e3e;
  font-weight: bold;
}

.row-item {
  display: flex;
  flex: 1;
  font-size: 14px;
  padding: 8px 0;
  justify-content: center;
  align-items: center;
  transition: all 0.15s ease-in-out;
}

.row-item:hover {
  cursor: pointer;
  background-color: #F0F0F0;
/*   box-shadow: 0px 1px 4px rgba(0, 0, 0, .08); */
}

.row-sub-container {
  display: flex;
  flex-flow: row wrap;

}

.row-sub-container .row-item {
  padding: 8px 0;
  text-align: center;
  flex: 1;
  width: max-content;

}

.table-row:last-child,
.row-sub-container .row-item:last-child {
  border-bottom: 0;
}

.modal {
  visibility: hidden;
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1.5rem;
  display: flex;
  justify-content: center;
  align-items: center;
  transition: all 0.3s;
}
.modal_inner {
  max-width: 32rem;
  padding: 1.5rem;
  border-radius: 2px;
  background-color: #ffffff;
  box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
  opacity: 0;
  transform: scale(0.8);
  transition: all 0.3s;
}
.modal.-open {
  visibility: visible;
  background-color: rgba(0, 0, 0, 0.4);
}
.modal.-open .modal_inner {
  opacity: 1;
  transform: scale(1);
}



.paging{
	height : 100px;
	display:flex;
	justify-content: center;
}


.pagination,
.pagination li a {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  list-style: none;
}

.pagination li {  }

.pagination a {
  font-weight: 300;
  padding-top: 1px;
  text-decoration:none;  
  border: none;
  border-left-width: 0;
  min-width:44px;
  min-height:44px;
  color: black;  
 
}

.pagination li:not([class*="current"]) a:hover { 
  background-color: rgba(255,255,255,.2);
  border-top-color: rgba(0,0,0,.35);
  border-bottom-color: rgba(0,0,0,.5);
}

.pagination li:not([class*="current"]) a:focus,
.pagination li:not([class*="current"]) a:active {;
  box-shadow: 0px 0px 10px 1px rgba(0,0,0,.25);
  border-left-width:1px;
}

.pagination li:first-of-type a {
  border-left-width: 1px;
}

.pagination li:first-of-type span,
.pagination li:last-of-type span,
.pagination li:nth-of-type(2) span,
.pagination li:nth-last-of-type(2) span { 
  /* screen readers only */
  position: absolute;
  top: -9999px;
  left: -9999px;
}

.pagination li:first-child a::before,
.pagination li:last-child a::after,
.pagination li:nth-of-type(2) a::before,
.pagination li:nth-last-of-type(2) a::after {  
  display: inline-block;
  font-family: Fontawesome;  
  font-size: inherit;
  text-rendering: auto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  transform: translate(0, 0);
}

 .pagination li:first-child a::before,
 .pagination li:last-child a::after { content: "\f100"; } 

 .pagination li:nth-of-type(2) a::before, 
 .pagination li:nth-last-of-type(2) a::after { content: "\f104"; } 

 .pagination li:last-child a::after, 
 .pagination li:nth-last-of-type(2) a::after { transform: rotate(180deg); } 

.pagination li.current a { 
  padding-top:.25em;
  color: blue;
  background-color: rgba(255,255,255,.15);
  box-shadow: inset 0px 2px 1px 0px rgba(0,0,0,.25);
  cursor: default;
  pointer-events: none;
}

@media only screen and ( max-width: 64.063em ) {  
  .pagination li:first-child,
  .pagination li:last-child {
    /* screen readers only */
    position: absolute;
    top: -9999px;
    left: -9999px;
  }

  .pagination li:nth-of-type(2) a { border-left-width: 1px; }

}

@media only screen and ( max-width: 40.063em ) {  
  .pagination li {
    /* screen readers only */
    position: absolute;
    top: -9999px;
    left: -9999px;
  }

  .pagination li.current,
  .pagination li:first-of-type,
  .pagination li:last-of-type,
  .pagination li:nth-of-type(2),
  .pagination li:nth-last-of-type(2){
    position: initial;
    top: initial;
    left: initial;
  }

  .pagination li:nth-of-type(2) a { border-left-width: 0; }

}

@media only screen and ( max-width: 30.063em ) {  
  
  h1 { font-size: 1.35em !important; }
  
  .pagination li:first-child,
  .pagination li:last-child {
    /* screen readers only */
    position: absolute;
    top: -9999px;
    left: -9999px;
  }

  .pagination li:nth-of-type(2) a { border-left-width: 1px; }

}

@media only screen and ( max-width: 15.063em ) {  /* For watches? */
  
  .pagination li { width: 50%;}
  
  .pagination li.current { 
    order: 2;
    width: 100%;
    border-left-width: 1px;
      
  }  



}


.search{
	display:flex;
	justify-content: center;
}
</style>
<body>
<%@ include file="../menu.jsp" %>
<div id="hd_login_msg">영카트5님 로그인 중 <a href="https://demo.sir.kr/gnuboard5/bbs/logout.php">로그아웃</a></div>
        
<div id="side_menu">
	<ul id="quick">
		<li><button class="btn_sm_cl1 btn_sm"><i class="fa fa-user-o" aria-hidden="true"></i><span class="qk_tit">마이메뉴</span></button></li>
		<li><button class="btn_sm_cl2 btn_sm"><i class="fa fa-archive" aria-hidden="true"></i><span class="qk_tit">오늘 본 상품</span></button></li>
		<li><button class="btn_sm_cl3 btn_sm"><i class="fa fa-shopping-cart" aria-hidden="true"></i><span class="qk_tit">장바구니</span></button></li>
		<li><button class="btn_sm_cl4 btn_sm"><i class="fa fa-heart-o" aria-hidden="true"></i><span class="qk_tit">위시리스트</span></button></li>
    </ul>
    <button type="button" id="top_btn"><i class="fa fa-arrow-up" aria-hidden="true"></i><span class="sound_only">상단으로</span></button>
    <div id="tabs_con">
	    <div class="side_mn_wr1 qk_con">
	    	<div class="qk_con_wr">
	    		
<!-- 로그인 후 아웃로그인 시작 { -->
<section id="s_ol_after" class="ol">
    <header id="s_ol_after_hd">
        <h2>나의 회원정보</h2>
        <span class="profile_img">
            <img src="https://demo.sir.kr/gnuboard5/img/no_profile.gif" alt="profile_image">            <a href="https://demo.sir.kr/gnuboard5/adm/" class="btn_admin"><i class="fa fa-cog fa-fw"></i><span class="sound_only">관리자</span></a>        </span>
        <strong>영카트5님</strong>
        <a href="https://demo.sir.kr/gnuboard5/bbs/member_confirm.php?url=register_form.php" id="s_ol_after_info">정보수정</a>
        <a href="https://demo.sir.kr/gnuboard5/bbs/logout.php" id="s_ol_after_logout">로그아웃</a>
    </header>
    
</section>

<script>
// 탈퇴의 경우 아래 코드를 연동하시면 됩니다.
function member_leave()
{
    if (confirm("정말 회원에서 탈퇴 하시겠습니까?"))
        location.href = "https://demo.sir.kr/gnuboard5/bbs/member_confirm.php?url=member_leave.php";
}
</script>
<!-- } 로그인 후 아웃로그인 끝 -->
		        <ul class="side_tnb">
		        						<li><a href="https://demo.sir.kr/gnuboard5/shop/mypage.php">마이페이지</a></li>
		            					<li><a href="https://demo.sir.kr/gnuboard5/shop/orderinquiry.php">주문내역</a></li>
					<li><a href="https://demo.sir.kr/gnuboard5/bbs/faq.php">FAQ</a></li>
		            <li><a href="https://demo.sir.kr/gnuboard5/bbs/qalist.php">1:1문의</a></li>
		            <li><a href="https://demo.sir.kr/gnuboard5/shop/personalpay.php">개인결제</a></li>
		            <li><a href="https://demo.sir.kr/gnuboard5/shop/itemuselist.php">사용후기</a></li>
		            <li><a href="https://demo.sir.kr/gnuboard5/shop/itemqalist.php">상품문의</a></li>
		            <li><a href="https://demo.sir.kr/gnuboard5/shop/couponzone.php">쿠폰존</a></li>
		        </ul>
	        		    		<button type="button" class="con_close"><i class="fa fa-times-circle" aria-hidden="true"></i><span class="sound_only">나의정보 닫기</span></button>
	    	</div>
	    </div>
	    <div class="side_mn_wr2 qk_con">
	    	<div class="qk_con_wr">
	        	
<!-- 오늘 본 상품 시작 { -->
<div id="stv">
    <h2 class="s_h2">오늘 본 상품 <span>0</span></h2>

    
    <p class="li_empty">없음</p>

    </div>

<script src="https://demo.sir.kr/gnuboard5/js/scroll_oldie.js"></script>
<!-- } 오늘 본 상품 끝 -->	    		<button type="button" class="con_close"><i class="fa fa-times-circle" aria-hidden="true"></i><span class="sound_only">오늘 본 상품 닫기</span></button>
	    	</div>
	    </div>
	    <div class="side_mn_wr3 qk_con">
	    	<div class="qk_con_wr">
	        	
<!-- 장바구니 간략 보기 시작 { -->
<aside id="sbsk" class="sbsk">
    <h2 class="s_h2">장바구니 <span class="cart-count">2</span></h2>
    <form name="skin_frmcartlist" id="skin_sod_bsk_list" method="post" action="https://demo.sir.kr/gnuboard5/shop/cartupdate.php">
    <ul>
    <li><div class="prd_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1404980700"><img src="https://demo.sir.kr/gnuboard5/data/item/1404980700/thumb-7LK07YGs11_65x65.jpg" width="65" height="65" alt=""></a></div><div class="prd_cnt"><a href="https://demo.sir.kr/gnuboard5/shop/cart.php" class="prd_name">TH-블락체크 셔츠-그레이2 [착불]</a><span class="prd_cost">31,000
</span>
</div><button class="cart_del" type="button" data-it_id="1404980700"><i class="fa fa-trash-o" aria-hidden="true"></i><span class="sound_only">삭제</span></button>
</li><input type="hidden" name="act" value="buy"><input type="hidden" name="ct_chk[0]" value="1"><input type="hidden" name="it_id[0]" value="1404980700"><input type="hidden" name="it_name[0]" value="TH-블락체크 셔츠-그레이2 [착불]"><li><div class="prd_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1446772772"><img src="https://demo.sir.kr/gnuboard5/data/item/1446772772/thumb-7LK07YGs11_65x65.jpg" width="65" height="65" alt=""></a></div><div class="prd_cnt"><a href="https://demo.sir.kr/gnuboard5/shop/cart.php" class="prd_name">TH-블락체크 셔츠-그레이2 [면세]</a><span class="prd_cost">31,000
</span>
</div><button class="cart_del" type="button" data-it_id="1446772772"><i class="fa fa-trash-o" aria-hidden="true"></i><span class="sound_only">삭제</span></button>
</li><input type="hidden" name="act" value="buy"><input type="hidden" name="ct_chk[1]" value="1"><input type="hidden" name="it_id[1]" value="1446772772"><input type="hidden" name="it_name[1]" value="TH-블락체크 셔츠-그레이2 [면세]">    </ul>
    <div class="btn_buy"><button type="submit" class="btn_submit">구매하기</button></div>    <a href="https://demo.sir.kr/gnuboard5/shop/cart.php" class="go_cart">전체보기</a>
    </form>
</aside>
<script>
jQuery(function ($) {
    $("#sbsk").on("click", ".cart_del", function(e) {
        e.preventDefault();

        var it_id = $(this).data("it_id");
        var $wrap = $(this).closest("li");

        $.ajax({
            url: g5_theme_shop_url+"/ajax.action.php",
            type: "POST",
            data: {
                "it_id" : it_id,
                "action" : "cart_delete"
            },
            dataType: "json",
            async: true,
            cache: false,
            success: function(data, textStatus) {
                if(data.error != "") {
                    alert(data.error);
                    return false;
                }

                $wrap.remove();
            }
        });
    });
});
</script>
<!-- } 장바구니 간략 보기 끝 -->

	    		<button type="button" class="con_close"><i class="fa fa-times-circle" aria-hidden="true"></i><span class="sound_only">장바구니 닫기</span></button>
	    	</div>
	    </div>
	    <div class="side_mn_wr4 qk_con">
	    	<div class="qk_con_wr">
	        	
<!-- 위시리스트 간략 보기 시작 { -->
<aside id="wish" class="side-wish">
    <h2 class="s_h2">위시리스트 <span>8</span></h2>
    <ul>
    <li><div class="prd_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1446772772"><img src="https://demo.sir.kr/gnuboard5/data/item/1446772772/thumb-7LK07YGs11_65x65.jpg" width="65" height="65" alt=""></a></div><div class="prd_cnt"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1446772772" class="prd_name">TH-블락체크 셔츠-그레이2 [면세]</a><div class="prd_price">31,000원</div></div>
</li><li><div class="prd_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387871842"><img src="https://demo.sir.kr/gnuboard5/data/item/1387871842/thumb-t31_65x65.jpg" width="65" height="65" alt=""></a></div><div class="prd_cnt"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387871842" class="prd_name">베이직 기모 레글런 오트밀와인2</a><div class="prd_price">130,000원</div></div>
</li><li><div class="prd_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1404980700"><img src="https://demo.sir.kr/gnuboard5/data/item/1404980700/thumb-7LK07YGs11_65x65.jpg" width="65" height="65" alt=""></a></div><div class="prd_cnt"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1404980700" class="prd_name">TH-블락체크 셔츠-그레이2 [착불]</a><div class="prd_price">31,000원</div></div>
</li><li><div class="prd_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387869984"><img src="https://demo.sir.kr/gnuboard5/data/item/1387869984/thumb-44WF41_65x65.jpg" width="65" height="65" alt=""></a></div><div class="prd_cnt"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387869984" class="prd_name">TH-베이직 슬림셔츠 블루</a><div class="prd_price">340,000원</div></div>
</li><li><div class="prd_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1483597591"><img src="https://demo.sir.kr/gnuboard5/data/item/1483597591/thumb-w700_65x65.png" width="65" height="65" alt=""></a></div><div class="prd_cnt"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1483597591" class="prd_name">선택옵션 테스트 20170105</a><div class="prd_price">5,000원</div></div>
</li><li><div class="prd_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1405042530"><img src="https://demo.sir.kr/gnuboard5/data/item/1405042530/thumb-t41_65x65.jpg" width="65" height="65" alt=""></a></div><div class="prd_cnt"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1405042530" class="prd_name">베이직 기모 레글런 오트밀레드2 [30만원 이상 무료]</a><div class="prd_price">130,000원</div></div>
</li><li><div class="prd_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1412210417"><img src="https://demo.sir.kr/gnuboard5/data/item/1412210417/thumb-7LK07YGs11_65x65.jpg" width="65" height="65" alt=""></a></div><div class="prd_cnt"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1412210417" class="prd_name">TH-블락체크 셔츠-그레이2 [테스트]</a><div class="prd_price">1,000원</div></div>
</li><li><div class="prd_img"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387870214"><img src="https://demo.sir.kr/gnuboard5/data/item/1387870214/thumb-44WF31_65x65.jpg" width="65" height="65" alt=""></a></div><div class="prd_cnt"><a href="https://demo.sir.kr/gnuboard5/shop/item.php?it_id=1387870214" class="prd_name">TH-베이직 슬림셔츠 베이지</a><div class="prd_price">340,000원</div></div>
</li>    </ul>
</aside>
<!-- } 위시리스트 간략 보기 끝 -->
	    		<button type="button" class="con_close"><i class="fa fa-times-circle" aria-hidden="true"></i><span class="sound_only">위시리스트 닫기</span></button>
	    	</div>
	    </div>
    </div>
</div>
<script>
jQuery(function ($){
	$(".btn_member_mn").on("click", function() {
        $(".member_mn").toggle();
        $(".btn_member_mn").toggleClass("btn_member_mn_on");
    });
    
    var active_class = "btn_sm_on",
        side_btn_el = "#quick .btn_sm",
        quick_container = ".qk_con";

    $(document).on("click", side_btn_el, function(e){
        e.preventDefault();

        var $this = $(this);
        
        if (!$this.hasClass(active_class)) {
            $(side_btn_el).removeClass(active_class);
            $this.addClass(active_class);
        }

        if( $this.hasClass("btn_sm_cl1") ){
            $(".side_mn_wr1").show();
        } else if( $this.hasClass("btn_sm_cl2") ){
            $(".side_mn_wr2").show();
        } else if( $this.hasClass("btn_sm_cl3") ){
            $(".side_mn_wr3").show();
        } else if( $this.hasClass("btn_sm_cl4") ){
            $(".side_mn_wr4").show();
        }
    }).on("click", ".con_close", function(e){
        $(quick_container).hide();
        $(side_btn_el).removeClass(active_class);
    });

    $(document).mouseup(function (e){
        var container = $(quick_container),
            mn_container = $(".shop_login");
        if( container.has(e.target).length === 0){
            container.hide();
            $(side_btn_el).removeClass(active_class);
        }
        if( mn_container.has(e.target).length === 0){
            $(".member_mn").hide();
            $(".btn_member_mn").removeClass("btn_member_mn_on");
        }
    });

    $("#top_btn").on("click", function() {
        $("html, body").animate({scrollTop:0}, '500');
        return false;
    });
});
</script>
<!-- 전체 콘텐츠 시작 { -->
<div id="wrapper" class="">
    <!-- #container 시작 { -->
    <div id="container">

                        <!-- .shop-content 시작 { -->
        <div class="shop-content">
            <div id="wrapper_title">마이페이지</div>            <!-- 글자크기 조정 display:none 되어 있음 시작 { -->
            <div id="text_size">
                <button class="no_text_resize" onclick="font_resize('container', 'decrease');">작게</button>
                <button class="no_text_resize" onclick="font_default('container');">기본</button>
                <button class="no_text_resize" onclick="font_resize('container', 'increase');">크게</button>
            </div>
            <!-- } 글자크기 조정 display:none 되어 있음 끝 -->
<!-- 마이페이지 시작 { -->
<div id="smb_my">

    <!-- 회원정보 개요 시작 { -->
    <section id="smb_my_ov">
        <h2>회원정보 개요</h2>
        
        <div class="smb_me">
	        <strong class="my_ov_name"><img src="https://demo.sir.kr/gnuboard5/img/no_profile.gif" alt="profile_image"><br>Carina2</strong><br>
	      <a href="myimfo" >정보수정</a>
             <a href="logout">로그아웃</a>
        </div>
        
    
	    
        <h3>내정보</h3>
        <dl class="op_area">
            <dt>연락처</dt>
            <dd>01090908080</dd>
            <dt>E-Mail</dt>
            <dd>Test@test.test</dd>
            <dt>최종접속일시</dt>
            <dd>2023-04-03 02:32:34</dd>
            <dt>회원가입일시</dt>
            <dd>2023-04-02 09:47:45</dd>
            <dt id="smb_my_ovaddt">주소</dt>
            <dd id="smb_my_ovaddd">(06252)서울 강남구 강남대로 328  (역삼동, 강남역 쉐르빌) 3번출구</dd>
        </dl>
        
        <a href="https://demo.sir.kr/gnuboard5/bbs/member_confirm.php?url=member_leave.php" onclick="return member_leave();" class="withdrawal">회원탈퇴</a>
    </section>
    <!-- } 회원정보 개요 끝 -->

		<div class="content">
			<span class="title">
				<p>찜목록</p>
			</span>
		<div class="board">
			<div class="main-container">
			  <div class="table-container" id="modal-pa">
			    <div class="table-row heading">
			      <div class="row-item">찜한 차량</div>
			      <div class="row-item">거래 희망일</div>
			      <div class="row-item">거래 희망 장소</div>
			      <div class="row-item">판매자 닉네임</div>
			      <div class="row-item">등록일</div>
			      <div class="row-item">게시글로 이동</div>
			    </div>
			    	<c:forEach items="${boardlist}" var="i">
			   			<div class="table-row">
			    			<div class="row-item" onclick="go_board_detail('${i.bno}')">${i.bno}</div>
			    			<div class="row-item" onclick="go_board_detail('${i.bno}')">${i.nickname}</div>
				      		<div class="row-item" onclick="go_board_detail('${i.bno}')">${i.registration_date}</div>
				      		<div class="row-item" onclick="go_board_detail('${i.bno}')">${i.vehicle_no}</div>
				      		<div class="row-item" onclick="go_board_detail('${i.bno}')">${i.views}</div>
		       			 	<div class="row-item"><button onclick="User_Ban('${i.bno}')">목록에서 삭제</button></div>
			    		</div>
			    	</c:forEach>			      
		       			 	<div class="modal" id="modal">
							  <div class="modal_inner" id="modal_board">
							  </div>
							</div>

			  	</div>
			  </div>
			</div>
		<div class="paging">
			<ul class="pagination" role="menubar" aria-label="Pagination">
				
			    <li class="first"><a href="/admin/board?page=1"><span>First</span></a></li>
			    <li class="previous"><a href="/admin/board?page=${nowpage}"><span>Previous</span></a></li>
			   
				<c:forEach begin="1" end="${totalpages}" var="i">
			    <li><a href="/admin/board?page=${i }">${i}</a></li>
			    </c:forEach>
			   
				<li class="next"><a href="/admin/board?page=${nowpage+2}"><span>Next</span></a></li>				
				<li class="last"><a href="/admin/board?page=${totalpages }"><span>Last</span></a></li>
			   	
 			 </ul>  
		</div>
		<div class="search">
			<form action="/adminSearch" method="GET">
			<input type="text" name="kwd"><button class="search_btn">검색</button>
			</form>
		</div>	
	</div>
		
	</div>
</div>

<script>
function member_leave()
{
    return confirm('정말 회원에서 탈퇴 하시겠습니까?')
}

function out_cd_check(fld, out_cd)
{
    if (out_cd == 'no'){
        alert("옵션이 있는 상품입니다.\n\n상품을 클릭하여 상품페이지에서 옵션을 선택한 후 주문하십시오.");
        fld.checked = false;
        return;
    }

    if (out_cd == 'tel_inq'){
        alert("이 상품은 전화로 문의해 주십시오.\n\n장바구니에 담아 구입하실 수 없습니다.");
        fld.checked = false;
        return;
    }
}

function fwishlist_check(f, act)
{
    var k = 0;
    var length = f.elements.length;

    for(i=0; i<length; i++) {
        if (f.elements[i].checked) {
            k++;
        }
    }

    if(k == 0)
    {
        alert("상품을 하나 이상 체크 하십시오");
        return false;
    }

    if (act == "direct_buy")
    {
        f.sw_direct.value = 1;
    }
    else
    {
        f.sw_direct.value = 0;
    }

    return true;
}
</script>
<!-- } 마이페이지 끝 -->

        </div>  <!-- } .shop-content 끝 -->
	</div>      <!-- } #container 끝 -->
</div>
<!-- } 전체 콘텐츠 끝 -->

<!-- 하단 시작 { -->
<%@ include file="../footer.jsp" %>




</body>
</html>
