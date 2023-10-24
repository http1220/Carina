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
<title>Regist</title>
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
 
<!--  뷰 끌어오기 -->
<style type="text/css">

.top{
display: flex;
  justify-content: space-between;
  align-items: center;


}

/* 이미지 업로드 css */
.main-container {
            width: 900px;
            height: auto;
            margin: 0 auto;
             margin-bottom: 50px;
        }
        
        .room-deal-information-container {
            margin-top: 50px;
            color: #222222;
            border: 1px solid #dddddd;
            
        }
        
        .room-deal-information-title {
            text-align: center;
            font-size: 18px;
            line-height: 60px;
            border-bottom: 1px solid #dddddd;
        }
        
        .room-deal-information-content-wrapper {
            min-height: 50px;
            display: flex;
        }
        
        .room-deal-informtaion-content-title {
            font-size: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 150px;
            background-color: #f9f9f9;
        }
        
        .room-deal-information-content {
            width: 100%;
            font-size: 14px;
        }
        
        .room-deal-option-selector {
            display: flex;
            align-items: center;
            padding: 15px;
        }
        
        .room-deal-option-item {
            width: 100px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #cccccc;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .room-deal-option-item:last-child {
            margin-left: 10px;
        }
        
        .room-deal-option-notice {
            margin-left: auto;
            font-size: 14px;
            color: #888888;
        }
        
        .room-deal-option-item-deposit {
            margin-left: 10px;
        }
        
        .room-deal-information-wrapper {
            display: flex;
            flex-direction: column;
        }
        
        .room-deal-information-option {
            padding: 10px;
            display: flex;
            align-items: center;
        }
        
        .room-deal-information-option:last-child {
            border-bottom: 1px solid #dddddd;
        }
        
        .room-deal-information-item-type {
            font-size: 13px;
            color: #fff;
            background-color: #61b6e5;
            min-width: 50px;
            height: 26px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 3px;
        }
        
        .room-deal-information-item-wrapper {
            display: flex;
            align-items: center;
            margin-left: 10px;
            height: 46px;
            width: 100%;
        }
        
        .room-deal-information-item-wrapper>input {
            border: 1px solid #dddddd;
            width: 140px;
            height: 100%;
            padding: 0 15px;
            font-size: 15px;
        }
        
        .room-deal-inforamtion-won {
            margin: 0 10px;
        }
        
        .room-deal-information-example {
            color: #888888;
        }
        
        .room-deal-information-option:not(:first-child) {
            margin-top: 10px;
        }
        
        .room-deal-inforamtion-divide {
            font-size: 22px;
            margin: 0 8px;
            color: #222222;
            font-weight: 100;
        }
        
        .room-deal-close-button-wrapper {
            margin-left: auto;
            cursor: pointer;
        }
        
        .room-deal-close-button {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 22px;
            height: 22px;
            background-color: #666666;
            color: rgb(220, 220, 220);
        }
        
        .room-deal-cliked {
            background-color: rgb(235, 235, 235);
            color: rgb(170, 170, 170);
        }
        
        .room-file-upload-example {
            height: 100%;
        }
        
        .room-write-content-container {
            border-top: 1px solid #dddddd;
            min-height: 260px;
        }
        
        .room-picture-notice {
            margin: 20px;
            padding: 20px 20px;
            border: 1px solid #dddddd;
        }
        
        .file-preview-content-container {
            height: 50%;
          
        }
        
       .room-file-upload-wrapper {
margin: 20px;
border: 1px solid #dddddd;
background-color: #f4f4f4;
min-height: 150px;
font-size: 15px;
color: #888888;
display: flex;
align-items: center;
justify-content: center;
height: 400px;
width: 95%;
flex-wrap: wrap;
}
        
        .file-upload-container {
    width: 25%;
    height: 50%;
    box-sizing: border-box;
    padding: 10px;
     overflow: auto;
    flex-wrap: nowrap;
}
        
        .room-file-upload-example-container {
            display: flex;
            align-items: center;
            justify-content: center;
             height: 0%;
        }
        
        .room-file-image-example-wrapper {
            text-align: center;
        }
        
        .room-file-notice-item {
            margin-top: 5px;
            text-align: center;
        }
        
        .room-file-notice-item-red {
            color: #ef4351;
        }
        
        .image-box {
            margin-top: 30px;
            padding-bottom: 20px;
            text-align: center;
        }
        
        .image-box input[type='file'] {
            position: absolute;
            width: 0;
            height: 0;
            padding: 0;
            overflow: hidden;
            border: 0;
        }
        
        .image-box label {
            display: inline-block;
            padding: 10px 20px;
            background-color: #232d4a;
            color: #fff;
            vertical-align: middle;
            font-size: 15px;
            cursor: pointer;
            border-radius: 5px;
        }
        
        .file-preview-wrapper {
            padding: 10px;
            position: relative;
        }
        
      .file-preview-wrapper > img {
position: relative;
width: 100%;
height: 100%;
z-index: 10;
}
        
       .file-close-button {
  display: inline-block;
  width: 20px;
  height: 20px;
  line-height: 20px;
  text-align: center;
  font-size: 16px;
  font-weight: bold;
  border: none;
  background-color: transparent;
  color: #000;
  cursor: pointer;
  padding: 0;
}

        .hidden {
  display: none;
}
        
        .file-preview-container { 
            height: 180%; 
            display: flex; 
             flex-wrap: wrap; 
            
        }
        
        .file-preview-wrapper-upload {
            margin: 10px;
            padding-top: 20px;
            background-color: #888888;
            width: 190px;
            height: 130px;
        }
        
        .room-write-button-wrapper {
            margin-top: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #222222;
        }
        
        .room-write-button-wrapper>div {
            width: 160px;
            height: 50px;
            border: 1px solid #dddddd;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 15px;
            cursor: pointer;
        }
        
        .room-write-button {
            margin-left: 15px;
            color: #fff;
            background-color: #1564f9;
        }
        
        .room-write-button:hover {
            opacity: 0.8;
        }

.preview-image {
max-width: 100%;
max-height: 100%;
width: 200px;
height: 200px;
}

/* 이미지 업로드 css 끝 */


.top-right{
	 width: 500px;
/*   height: auto; */
  margin-right: 120px;
  margin-bottom: 100px; 
  margin-top: 100px;
  }

.vehicle-table {
	width: 500px;
	height: 400px;
	border: 1px solid black;
	
}

.vehicle-table td {
	border: 1px solid black;
	text-align: center;
	width: 50%;
}
.vehicle-table td:nth-child(1) {
  background-color: lightgray;
}

.top-textbox {
width: 100%; /* Adjust the width as needed */
font-size: 16px;
border: 1px solid black;
height: 100%;
}

select.dark {
  display:inline-block;
  margin-bottom:20px;
  width: 150px;
  height: 40px;
  border:1px solid black;
  color: black;
  border-color: lightgray;	
  background: lightgray url("static/img/dropdownbar.png") no-repeat scroll right center;
}
select.dark:hover, select.dark:active {
  border-color: lightgray;
}

.dropdown-box {
	display:inline-block;
	width:170px;
	height:60px;
	padding: 5px;
	margin-top: 20px;
}


.btn {
display: block;
margin: auto;
border: 3px solid skyblue;
}

.option-main-title {
width:80px;
height:200px;
font-size: 24px;
font-weight: bold;
margin-bottom: 20px;
display: block;
margin-top: 20px;
}

.option-reset-frame {
width: 80px;
height: 350px;
display: block;
}
.reset-button{
width:100%;
height:100px;
background-color: #ccc;
font-size: 14px;
padding: 10px;
border: none;
border-radius: 5px;
}

.option-frame {
   display: flex;
  justify-content: space-between;
  border-bottom: 1px solid #ccc;
  padding-bottom: 10px;
  margin-bottom: 20px;
  margin-left: 200px;
  bottom: 0;
  left: 0;
  width: 80%;
  box-sizing: border-box; /* option-frame 크기를 width에 맞게 조정 */
  padding: 0 20px;
  
}


.option-list {
list-style: none;
text-align: center;
flex-basis: 16%;
border-right: 1px solid #ccc;
padding-right: 10px;
}

.option-list:last-child {
border-right: none;
}

.option-list-title {
font-size: 16px;
font-weight: bold;
margin-bottom: 5px;
margin-right: 40px;
}

.option-detail {
list-style: none;
padding: 0;
}

.option-item {
margin-bottom: 5px;
display: flex;
align-items: center;
text-align: center;
justify-content: center;
}

.option-item-label {
display: inline-block;
width: 120px;
margin-right: 10px;
font-size: 14px;
vertical-align: middle;
}

.option-item-checkbox {
display: none;
}

.option-item-checkbox + label {
display: inline-block;
width: 24px;
height: 24px;
margin-right: 10px;
vertical-align: middle;
background: url("/img/checkbox.svg") left top no-repeat;
cursor: pointer;
background-size: cover;
}

.option-item-checkbox:checked + label {
background-position: -26px top;
}

.option-item-checkbox:checked + label::before {
content: "";
display: inline-block;
width: 10px;
height: 10px;
margin-right: 5px;
vertical-align: middle;
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
	resize: none;
}
</style>

</head>

<body>
<%@ include file="menu.jsp" %>
		<form method="post" enctype="multipart/form-data" action="/regist" onsubmit="return validateImageUploads();">
	<div class="top">
	<div class="main-container">
        <div class="room-deal-information-container">
            <div class="room-deal-information-title">사진 등록</div>
            <div class="room-picture-notice">
                <ul class="room-write-wrapper">
                    <li>
                        사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800px)
                    </li>
                    <li>사진 용량은 사진 한 장당 10MB 까지 등록이 가능합니다.</li>
  							<div class="room-file-notice-item">
                            실사진 최소 3장 이상 등록하셔야 하며, 총 8 모두 올려주시길 권장합니다.
                        </div>
                        <div class="room-file-notice-item room-file-notice-item-red">
                            로고를 제외한 불필요한 정보(워터마크,상호,전화번호 등)가 있는 매물은 비공개처리됩니다
                        </div>
                </ul>
            </div>
            
       <div class="room-file-upload-wrapper">
  <div class="file-upload-container">
    <div class="room-file-upload-example-container">
      <div class="room-file-upload-example">
        <div class="room-file-image-example-wrapper">썸네일</div>
        <div class="room-file-notice-item room-file-upload-button">
          <div class="image-box">
            <label for="file-0">사진 등록</label>
            <input type="file" id="file-0" name="thumbnail" onchange="handleImageUpload(event, 0)"  />
          </div>
        </div>
      </div>
    </div>
    <div class="file-preview-content-container">
      <div class="file-preview-container" id="preview-0">
      
      <div class="file-close-button hidden" onclick="cancelImageUpload(event, 0)">
  X
</div>
      </div>
    </div>
  </div>

  <!-- Repeat the above code for each file input -->
  
  <div class="file-upload-container">
    <div class="room-file-upload-example-container">
      <div class="room-file-upload-example">
        <div class="room-file-image-example-wrapper">앞면</div>
        <div class="room-file-notice-item room-file-upload-button">
          <div class="image-box">
            <label for="file-1">사진 등록</label>
            <input type="file" id="file-1" name="front" onchange="handleImageUpload(event, 1)" />
          </div>
        </div>
      </div>
    </div>
    <div class="file-preview-content-container">
      <div class="file-preview-container" id="preview-1">
      <div class="file-close-button hidden" onclick="cancelImageUpload(event, 1)">
  X
</div>
</div>
    </div>
  </div>
  <!-- Repeat the above code for each file input -->

 <div class="file-upload-container">
    <div class="room-file-upload-example-container">
      <div class="room-file-upload-example">
        <div class="room-file-image-example-wrapper">옆면</div>
        <div class="room-file-notice-item room-file-upload-button">
          <div class="image-box">
            <label for="file-2">사진 등록</label>
            <input type="file" id="file-2" name="side" onchange="handleImageUpload(event, 2)"  />
          </div>
        </div>
      </div>
    </div>
    <div class="file-preview-content-container">
      <div class="file-preview-container" id="preview-2">
      <div class="file-close-button hidden" onclick="cancelImageUpload(event, 2)">
  X
</div>
</div>
    </div>
  </div>
   <div class="file-upload-container">
    <div class="room-file-upload-example-container">
      <div class="room-file-upload-example">
        <div class="room-file-image-example-wrapper">뒷면</div>
        <div class="room-file-notice-item room-file-upload-button">
          <div class="image-box">
            <label for="file-3">사진 등록</label>
            <input type="file" id="file-3" name="back" onchange="handleImageUpload(event, 3)" />
          </div>
        </div>
      </div>
    </div>
    <div class="file-preview-content-container">
      <div class="file-preview-container" id="preview-3">
      <div class="file-close-button hidden" onclick="cancelImageUpload(event, 3)">
  X
</div>
</div>
    </div>
  </div>
   <div class="file-upload-container">
    <div class="room-file-upload-example-container">
      <div class="room-file-upload-example">
        <div class="room-file-image-example-wrapper">안쪽앞면</div>
        <div class="room-file-notice-item room-file-upload-button">
          <div class="image-box">
            <label for="file-4">사진 등록</label>
            <input type="file" id="file-4" name="inside_front" onchange="handleImageUpload(event, 4)" />
          </div>
        </div>
      </div>
    </div>
    <div class="file-preview-content-container">
      <div class="file-preview-container" id="preview-4">
      <div class="file-close-button hidden" onclick="cancelImageUpload(event, 4)">
  X
</div>
</div>
    </div>
  </div>
   <div class="file-upload-container">
    <div class="room-file-upload-example-container">
      <div class="room-file-upload-example">
        <div class="room-file-image-example-wrapper">안쪽뒷면</div>
        <div class="room-file-notice-item room-file-upload-button">
          <div class="image-box">
            <label for="file-5">사진 등록</label>
            <input type="file" id="file-5" name="inside_back" onchange="handleImageUpload(event, 5)"  />
          </div>
        </div>
      </div>
    </div>
    <div class="file-preview-content-container">
      <div class="file-preview-container" id="preview-5">
      <div class="file-close-button hidden" onclick="cancelImageUpload(event, 5)">
  X
</div>
</div>
    </div>
  </div>
   <div class="file-upload-container">
    <div class="room-file-upload-example-container">
      <div class="room-file-upload-example">
        <div class="room-file-image-example-wrapper">엔진룸</div>
        <div class="room-file-notice-item room-file-upload-button">
          <div class="image-box">
            <label for="file-6">사진 등록</label>
            <input type="file" id="file-6" name="engine_room" onchange="handleImageUpload(event, 6)"  />
          </div>
        </div>
      </div>
    </div>
    <div class="file-preview-content-container">
      <div class="file-preview-container" id="preview-6">
      <div class="file-close-button hidden" onclick="cancelImageUpload(event, 6)">
  X
</div>
</div>
    </div>
  </div>
   <div class="file-upload-container">
    <div class="room-file-upload-example-container">
      <div class="room-file-upload-example">
        <div class="room-file-image-example-wrapper">트렁크</div>
        <div class="room-file-notice-item room-file-upload-button">
          <div class="image-box">
            <label for="file-7">사진 등록</label>
            <input type="file" id="file-7" name="trunk" onchange="handleImageUpload(event, 7)"  />
          </div>
        </div>
      </div>
    </div>
    <div class="file-preview-content-container">
      <div class="file-preview-container" id="preview-7">
      <div class="file-close-button hidden" onclick="cancelImageUpload(event, 7)">
  X
</div>
</div>
    </div>
  </div>
   
</div>

 <script>
  const MAX_FILES = 8; // 최대 업로드 가능한 파일 수
  const files = Array(MAX_FILES).fill([]); // 업로드 된 파일의 배열을 담은 배열

//이미지 업로드 핸들러
  function handleImageUpload(event, inputNum) {
    var file = event.target.files[0];
    var previewId = "preview-" + inputNum;
    var preview = document.getElementById(previewId);
    var reader = new FileReader();
    console.log(file);

    // 파일 읽기 완료시 콜백 함수
    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", event.target.result);
      img.setAttribute("class", "preview-image");
      preview.appendChild(img);

   // 닫기 버튼 보이기
      var closeButton = preview.querySelector(".file-close-button");
      if (closeButton) {
        closeButton.classList.remove("hidden");
      }

      // 파일 배열 업데이트
      files[inputNum] = [file];
    };

    reader.readAsDataURL(file);
  }

//이미지 업로드 취소 핸들러
 function cancelImageUpload(event, inputNum) {
  event.stopPropagation();
  event.preventDefault();
  var previewId = "preview-" + inputNum;
  var preview = document.getElementById(previewId);

  if (!preview) {
    return;
  }

//기존 이미지 제거
  preview.innerHTML = "";

//닫기 버튼을 다시 추가
  var closeButton = document.createElement("button");
  closeButton.setAttribute("class", "file-close-button hidden");
  closeButton.setAttribute("type", "button");
  closeButton.setAttribute("data-input-num", inputNum);
  closeButton.appendChild(document.createTextNode("X")); // add text node with "x" character
  closeButton.addEventListener("click", function(event) {
    cancelImageUpload(event, inputNum);
  });
  preview.appendChild(closeButton);

//파일 배열을 빈 배열로 재설정
  files[inputNum] = [];

//입력 필드를 빈 값으로 재설정
  var inputFile = document.getElementById("file-" + inputNum);
  inputFile.value = "";

//파일 입력 필드를 다시 활성화하기 위해 변경 이벤트를 트리거합니다.
  var inputEvent = new Event("input", { bubbles: true });
  inputFile.dispatchEvent(inputEvent);
}


//닫기 버튼 클릭 이벤트 위임
  document.addEventListener("click", function(event) {
    if (event.target.classList.contains("file-close-button")) {
      var inputNum = parseInt(event.target.dataset.inputNum);
      cancelImageUpload(event, inputNum);
    }
  });

  // 이미지 업로드 유효성 검사
  function validateImageUploads() {
    var uploaded = true;

    for (var i = 0; i < MAX_FILES; i++) {
      if (files[i].length === 0) {// 업로드 된 파일이 없으면
        uploaded = false;
        break;
      }
    }

    if (!uploaded) {
      alert("사진을 모두 올려주세요.");
    }

    return uploaded;
  }
</script>



	</div> 
		</div> 
	
		
		
		<div class="top-right">
			<table class="vehicle-table">
				<tr>
					<td>모델명</td>
					<td><input type="text" class="top-textbox" name="modelname"></td>
				</tr>
				<tr>
					<td>가격</td>
						<td><input type="text" class="top-textbox" name="price"></td>
				</tr>
				<tr>
					<td>주행거리</td>
						<td><input type="text" class="top-textbox" name="mileage"></td>
				</tr>
				<tr>
					<td>연식</td>
						<td><input type="text" class="top-textbox" name="yearofmanufacture"></td>
				</tr>
				<tr>
					<td>차량번호</td>
						<td><input type="text" class="top-textbox" name="licensenumber"></td>
				</tr>
				<tr>
					<td>제조사</td>
						<td><input type="text" class="top-textbox" name="manufacturer"></td>
				</tr>
				<tr>
					<td>색상</td>
						<td><input type="text" class="top-textbox" name="color"></td>
				</tr>
				<tr>
					<td>배기량</td>
						<td><input type="text" class="top-textbox" name="displacement"></td>
				</tr>
			</table>
			
				<div class="dropdown-frame">
					<div class="dropdown-box">
					<p>국산/수입</p>
					<select class="dark" name="domesticimport">
						<option>선택하세요</option>
						<option value="domesticCar">국산차</option>
						<option value="importedcar">수입차</option>
					</select>
					</div>
					
					
					<div class="dropdown-box">
					<p>차종</p>
					<select class="dark" name="vehicletype">
						<option>선택하세요</option>
						<option value="lightcar">경차</option>
						<option value="mediumcar">중형</option>
						<option value="bigcar">대형</option>
					</select>
					</div>
					
					<div class="dropdown-box">
					<p>구동 방식</p>
					<select class="dark" name="wheeltype">
						<option>선택하세요</option>
						<option value="frontwheel">전륜</option>
						<option value="backwheel">후륜</option>
						<option value="fourwheel">사륜</option>
					</select>
					</div>
					
					<div class="dropdown-box">
					<p>연료 타입</p>
					<select class="dark" name="fueltype">
						<option>선택하세요</option>
						<option value="gasoline">휘발유(가솔린)</option>
						<option value="diesel">경유(디젤)</option>
						<option value="lpg">액화석유(LPG)</option>
						<option value="electric">전기</option>
						<option value="bio">바이오디젤</option>
					</select>
					</div>
					
					<div class="dropdown-box">
					<p>자동/수동</p>
					<select class="dark" name="transmissiontype">
						<option>선택하세요</option>
						<option value="automatic">자동</option>
						<option value="manual">수동</option>
					</select>
					</div>
						
					<div class="dropdown-box">
					<p>탑승인원</p>
					<select class="dark" name="passengercapacity">
						<option>선택하세요</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="5">4~5</option>
						<option value="8">6~8</option>
						<option value="15">12~15</option>
						<option value="16">16</option>
					</select>
 					<script>
 					window.onload = function() {
 					const form = document.querySelector('form');
 					const submitBtn = document.querySelector('input[type="submit"]');

 					submitBtn.addEventListener('click', (event) => {
					 const modelName = form.elements['modelname'].value;
 					  const price = form.elements['price'].value;
 					  const mileage = form.elements['mileage'].value;
 					  const yearofmanufacture = form.elements['yearofmanufacture'].value;
 					  const licensenumber = form.elements['licensenumber'].value;
 					  const color = form.elements['color'].value;
 					  const displacement = form.elements['displacement'].value;
 					

 					  const domesticImport = form.elements['domesticimport'].value;
 					  const vehicleType = form.elements['vehicletype'].value;
 					  const wheelType = form.elements['wheeltype'].value;
 					  const fuelType = form.elements['fueltype'].value;
 					  const transmissionType = form.elements['transmissiontype'].value;
 					  const passengerCapacity = form.elements['passengercapacity'].value;

 					  if (!modelName || !price || !mileage || !yearofmanufacture || !licensenumber || !color || !displacement || 
 					      domesticImport === '선택하세요' || vehicleType === '선택하세요' ||
					      wheelType === '선택하세요' || fuelType === '선택하세요' ||
 					      transmissionType === '선택하세요' || passengerCapacity === '선택하세요') {
 					    alert('차량의 재원을 빠짐없이 입력해주세요');
 					    event.preventDefault();
				  }
 					});
 					};
				</script>
					</div>
			</div>	
		</div>	
		   
		
	</div>
		
  <div class="option-frame">
  <div class="option-main-title">
  <h1>옵션 선택</h1>
  
  <div class="option-reset-frame">
  <button onclick="resetCheckboxes()" class="reset-button" type="reset">초기화</button>
  </div>
<script>
function resetCheckboxes() {
  var checkboxes = document.querySelectorAll('input[type="checkbox"]');
  
    checkbox.checked = false;
  
}
</script>

</div>
    <ul class="option-list">
      <li class="option-list-title">외관</li>
      <ul class="option-detail">
        <li class="option-item">
          <label class="option-item-label" for="checkbox1" >선루프</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox1" name="sunroof">
          <label for="checkbox1"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox2">파노라마선루프</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox2" name="panoramicsunroof">
          <label for="checkbox2"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox3">알루미늄휠</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox3" name="aluminumwheels">
          <label for="checkbox3"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox4">전동사이드미러</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox4" name="powersidemirror">
          <label for="checkbox4"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox5">HID램프</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox5" name="hidlamps">
          <label for="checkbox5"></label>
        </li>
        
         <li class="option-item">
          <label class="option-item-label" for="checkbox6">어댑티드헤드램프</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox6" name="adaptiveheadlamps">
          <label for="checkbox6"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox7">LED리어램프</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox7" name="ledrearlamps">
          <label for="checkbox7"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox8">데이라이트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox8" name="daytimelights">
          <label for="checkbox8"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox9">하이빔어시스트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox9" name="highbeamassist">
          <label for="checkbox9"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox10">압축도어</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox10" name="compressiondoor">
          <label for="checkbox10"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox11">자동슬라이딩도어</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox11" name="automaticslidingdoor">
          <label for="checkbox11"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox12">전동사이드스탭</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox12" name="powersidestep">
          <label for="checkbox12"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox13">루프랙</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox13" name="roofrack">
          <label for="checkbox13"></label>
        </li>
      </ul>
    </ul>
  
      <ul class="option-list">
      <li class="option-list-title">내관</li>
      <ul class="option-detail">
        <li class="option-item">
          <label class="option-item-label" for="checkbox14">가죽시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox14" name="leatherseats">
          <label for="checkbox14"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox15">전동시트(운전석)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox15" name="powerseatdriver">
          <label for="checkbox15"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox16">전동시트(동승석)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox16" name="powerseatpassenger">
          <label for="checkbox16"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox17">열선시트(앞좌석)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox17" name="heatedseatfront">
          <label for="checkbox17"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox18">열선시트(뒷좌석)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox18" name="heatedseatrear">
          <label for="checkbox18"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox19">통풍시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox19" name="ventilatedseats">
          <label for="checkbox19"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox20">메모리시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox20" name="memoryseats">
          <label for="checkbox20"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox21">폴딩시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox21" name="foldingseats">
          <label for="checkbox21"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox22">마사지시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox22" name="massageseats">
          <label for="checkbox22"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox23">워크인시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox23" name="walkinseat">
          <label for="checkbox23"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox24">요추받침</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox24" name="lumbarsupport">
          <label for="checkbox24"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox25">하이패스룸미러</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox25" name="highpassroommirror">
          <label for="checkbox25"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox26">ECM룸미러</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox26" name="ecmroommirror">
          <label for="checkbox26"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox27">뒷좌석에어벤트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox27" name="rearseatvents">
          <label for="checkbox27"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox28">패들쉬프트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox28" name="paddleshift">
          <label for="checkbox28"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox29">전동햇빛가리개</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox29" name="powersunshade">
          <label for="checkbox29"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox30">엠비언트라이트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox30" name="ambientlighting">
          <label for="checkbox30"></label>
        </li>
        
      </ul>
    </ul>
      
    	  <ul class="option-list">
      <li class="option-list-title">안전</li>
      <ul class="option-detail">
       <li class="option-item">
          <label class="option-item-label" for="checkbox31">커튼 에어백</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox31" name="curtainairbags">
          <label for="checkbox31"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox32">무릎 에어백</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox32" name="kneeairbags">
          <label for="checkbox32"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox33">승객감지 에어백</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox33" name="passengerairbags">
          <label for="checkbox33"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox34">브레이크 잠김방지(ABS)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox34" name="abs">
          <label for="checkbox34"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox35">차체자세 제어장치(ESC)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox35" name="esc">
          <label for="checkbox35"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox36">후방센서</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox36" name="rearsensors">
          <label for="checkbox36"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox37">전방센서</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox37" name="frontsensors">
          <label for="checkbox37"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox38">후방카메라</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox38" name="rearcamera">
          <label for="checkbox38"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox39">전방카메라</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox39" name="frontcamera">
          <label for="checkbox39"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox40">어라운드뷰</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox40" name="aroundview">
          <label for="checkbox40"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox41">타이어 공기압 감지(TPMS)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox41" name="tpms">
          <label for="checkbox41"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox42">차선이탈경보(LDWS)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox42" name="ldws">
          <label for="checkbox42"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox43">자동 긴급제동</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox43" name="aeb">
          <label for="checkbox43"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox44">전자제어 서스펜션(ECS)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox44" name="ecs">
          <label for="checkbox44"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox45">후측방경보</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox45" name="rearcrosstrafficalert">
          <label for="checkbox45"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox46">미끄럼방지(TCS)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox46" name="tcs">
          <label for="checkbox46"></label>
        </li>
        
        </li>
      </ul>
    </ul>  <ul class="option-list">
      <li class="option-list-title">편의</li>
      <ul class="option-detail">
        <li class="option-item">
          <label class="option-item-label" for="checkbox47">스마트키</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox47" name="smartkey">
          <label for="checkbox47"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox48">열선 핸들</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox48" name="heatedsteeringwheel">
          <label for="checkbox48"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox49">리모컨 핸들</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox49" name="remotecontrolsteeringwheel">
          <label for="checkbox49"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox50">자동 에어컨</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox50" name="automaticairconditioning">
          <label for="checkbox50"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox51">좌우독립 에어컨</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox51" name="dualzoneairconditioning">
          <label for="checkbox51"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox52">오토라이트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox52" name="autoheadlights">
          <label for="checkbox52"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox53">크루즈 컨트롤</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox53" name="cruisecontrol">
          <label for="checkbox53"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox54">스마트 크루즈 컨트롤</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox54" name="smartcruisecontrol">
          <label for="checkbox54"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox55">스탑앤고</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox55" name="stopandgo">
          <label for="checkbox55"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox56">전동 트렁크</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox56" name="powertrunk">
          <label for="checkbox56"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox57">스마트 트렁크</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox57" name="smarttrunk">
          <label for="checkbox57"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox58">전자주차 브레이크(EPB)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox58" name="electronicparkingbrake">
          <label for="checkbox58"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox59">경사로 밀림방지</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox59" name="hillstartassist">
          <label for="checkbox59"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox60">헤드업 디스플레이(HUD)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox60" name="headupdisplay">
          <label for="checkbox60"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox61">무선충전</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox61" name="wirelesscharging">
          <label for="checkbox61"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox62">자동주차</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox62" name="automaticparking">
          <label for="checkbox62"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox62">냉장고</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox62" name="refrigerator">
          <label for="checkbox62"></label>
      	</li>
        
      </ul>
    </ul>  <ul class="option-list">
      <li class="option-list-title">멀티미디어</li>
      <ul class="option-detail">
        <li class="option-item">
          <label class="option-item-label" for="checkbox63">네비게이션(순정)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox63" name="genuinenavigation">
          <label for="checkbox63"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox64">네비게이션(비순정)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox64" name="aftermarketnavigation">
          <label for="checkbox64"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox65">USB</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox65" name="usb">
          <label for="checkbox65"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox66">AUX</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox66" name="aux">
          <label for="checkbox66"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox67">블루투스</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox67" name="bluetooth">
          <label for="checkbox67"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox68">MP3</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox68" name="mp3">
          <label for="checkbox68"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox69">DMB</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox69" name="dmb">
          <label for="checkbox69"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox70">CD플레이어</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox70" name="cdplayer">
          <label for="checkbox70"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox71">AV시스템</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox71" name="avsystem">
          <label for="checkbox71"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox72">뒷좌석 TV</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox72" name="rearseattv">
          <label for="checkbox72"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox73">텔레매틱스</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox73" name="telematics">
          <label for="checkbox73"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox74">스마트폰 미러링</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox74" name="smartphonemirroring">
          <label for="checkbox74"></label>
        </li>
      </ul>
    </ul>
    
    </div>
	<textarea class="content" name="contents" ></textarea>
     <input type="submit" value="등록하기" id="submit-button" class="btn">
    	</form>

<%@ include file="footer.jsp" %>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
<!-- 	<script src="js/scripts.js"></script> -->
</body>
</html>
