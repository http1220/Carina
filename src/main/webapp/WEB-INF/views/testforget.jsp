<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<body>
<form method="get" action="/test1">
<input type="text" name="a1" value="a">
<input type="text" name="a2" value="b">
<input type="text" name="a3" value="c">
<input type="text" name="a4" value="d">
<input type="text" name="a5" value="e">
<input type="text" name="a6" value="f">
<input type="text" name="a7" value="g">
<input type="text" name="a8" value="h">
<input type="text" name="a9" value="i">
<input type="text" name="a10" value="j">
<button>dd</button>
</form>
<a id="me1">보내기</a>
</body>
<script>
document.addEventListener("DOMContentLoaded", function() {
	  
	  document.querySelector("#me1").addEventListener("click", function() {
	    const form = document.querySelector('form');
	    const data = new FormData(form);
	    const url = '/test1?' + new URLSearchParams(data).toString();
	    fetch(url, {
	      method: 'GET'
	    })
	    .then(response => response.text())
	    .then(data => console.log(data))
	    .catch(error => console.error(error));
	  });
	});


$(function(){
	
	$("#me").click(function(){
		$.ajax({
			  url: '/test1',
			  type: 'GET',
			  data: $('form').serialize(),
			  success: function(data) {
			    console.log(data);
			  },
			  error: function(jqXHR, textStatus, errorThrown) {
			    console.error(textStatus, errorThrown);
			  }
			});
	})
	
})
</script>
</html>