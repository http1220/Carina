<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href='https://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

</head>
<style>

@font-face {

      src : url("/font/BMHANNAProOTF.otf"); 

      font-family: hanna;

}
body {
	font-family: hanna;
}

.container {
	width : 1200px;
	height: auto;
	flex-wrap: wrap;
	display: flex;
	justify-content: center;
	margin: 0 auto;
	background-color: #fcfcfc;
}

.nav {
	width : 1200px;
	height: 75px;
	background-color: #fcfcfc;
	display:flex;
	border-bottom: 2px #c9c9c9 solid;
	flex-flow: row wrap;
}

.nav > span {
	padding-top:15px;
	padding-right:15px;
	font-size: xx-large;
	
}

.nav > span:hover {
	color: white;
}

.menu {
	width : 198px;
	height: 800px;
	border-right: 2px #c9c9c9 solid;
	background-color: #fcfcfc;
	
	
}

.content {
	width : 1000px;
	height: 800px;
	background-color: #fcfcfc;
	display: flex;
	flex-direction: column;
	
}

.menu_ul {
	font-size: xx-large;
	list-style: none;
	margin: 0;
	padding: 0;
}
.title {
	font-size: xx-large;
}

.board {
	height:600px;
	display: flex;
	flex-direction: column;
	font-size: x-large;
	
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

@font-face {

      src : url("/font/BMHANNAProOTF.otf"); 

      font-family: hanna;

}
</style>
<body>
<div class="container"> 
	<div class="nav">
		<span><a href="/admin" style="text-decoration : none;">메인으로</a></span>
	
	</div>
	
	<div class="menu">
		<ul class="menu_ul">
			<li><a href="/admin/member" style="text-decoration : none;">회원 관리</a></li>
			<li><a href="/admin/board" style="text-decoration : none;">게시글 관리</a></li>
			<li>메뉴3</li>
			<li>메뉴4</li>
		</ul>
	
	</div>
	
	<div class="content">
		<span class="title">
			
		</span>
		<div class="board">
			<img src="https://edgio.clien.net/F01/12984319/1f698e20c5c7ed.jpg?scale=width[780],options[limit]">
	
		</div>
		<!-- <div class="paging">
			<ul class="pagination" role="menubar" aria-label="Pagination">
			    <li><a href=""><span>First</span></a></li>
			    <li><a href=""><span>Previous</span></a></li>
			    <li><a href="">1</a></li>
			    <li><a href="">2</a></li>
			    <li><a href="">3</a></li>
			    <li class="current"><a href="">4</a></li>
			    <li><a href="">5</a></li>
			    <li><a href="">6</a></li>
			    <li><a href="">7</a></li>
			    <li><a href="">8</a></li>
			    <li><a href="">9</a></li>
			    <li><a href="">10</a></li>
			    <li><a href=""><span>Next</span></a></li>
			    <li><a href=""><span>Last</span></a></li>
 			 </ul>  
		</div>
		<div class="search">
			<form action="adminSearch" method="post">
			<input type="text"><button class="search_btn">검색</button>
			</form>
		</div>	 -->
	</div>
</div>
</body>
</html>