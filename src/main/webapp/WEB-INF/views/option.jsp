<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Appearance</title>
	<style>
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		.option-frame {
			display: flex;
			justify-content: space-between;
			border-bottom: 1px solid #ccc;
			padding-bottom: 10px;
			margin-bottom: 20px;
		}

		.option-list {
			list-style: none;
			text-align: center;
			flex-basis: 18%;
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
		
		
		
		
		
@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");
	

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    text-align: center;
    padding: 100px;
    background: whitesmoke;
    display: table-cell;
}

button {
    margin: 20px;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-indigo {
    background-color: aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline {
    border: 3px solid aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
    color: #1e6b7b;
    background: aliceblue;
}
.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn:active {
    transform: scale(1.5);
}

.w-btn-outline:active {
    transform: scale(1.5);
}

</style>
</head>
<body>   
<!--
<script type="text/javascript"> 
var checkboxLabels = ['선루프', '파라노마선루프', '알루미늄휠'];

var checkboxHTML = '';
for (var i = 0; i < checkboxLabels.length; i++) {
  var id = 'checkbox' + (i+1);
  var label = checkboxLabels[i];
  checkboxHTML += '<li class="option-item">';
  checkboxHTML += '<label class="option-item-label" for="' + id + '">' + label + '</label>';
  checkboxHTML += '<input class="option-item-checkbox" type="checkbox" id="' + id + '">';
  checkboxHTML += '<label for="' + id + '"></label>';
  checkboxHTML += '</li>';
}

var optionDetailHTML = '<ul class="option-detail">' + checkboxHTML + '</ul>';

var optionListHTML = '<ul class="option-list"><li class="option-list-title">외관</li>' + optionDetailHTML + '</ul>';

var optionFrameHTML = '<div class="option-frame">' + optionListHTML + '</div>';

document.body.innerHTML += optionFrameHTML;
</script> 
 -->
 <form method="post" action="/option/save">
 
  <div class="option-frame">
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
          <input class="option-item-checkbox" type="checkbox" id="checkbox2" name="panoramic_sunroof">
          <label for="checkbox2"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox3">알루미늄휠</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox3" name="aluminum_wheels">
          <label for="checkbox3"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox4">전동사이드미러</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox4" name="power_side_mirror">
          <label for="checkbox4"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox5">HID램프</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox5" name="hid_lamps">
          <label for="checkbox5"></label>
        </li>
        
         <li class="option-item">
          <label class="option-item-label" for="checkbox6">어댑티드헤드램프</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox6" name="adaptive_headlamps">
          <label for="checkbox6"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox7">LED리어램프</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox7" name="led_rear_lamps">
          <label for="checkbox7"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox8">데이라이트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox8" name="daytime_lights">
          <label for="checkbox8"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox9">하이빔어시스트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox9" name="high_beam_assist">
          <label for="checkbox9"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox10">압축도어</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox10" name="compression_door">
          <label for="checkbox10"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox11">자동슬라이딩도어</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox11" name="automatic_sliding_door">
          <label for="checkbox11"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox12">전동사이드스탭</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox12" name="power_side_step">
          <label for="checkbox12"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox13">루프랙</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox13" name="roof_rack">
          <label for="checkbox13"></label>
        </li>
      </ul>
    </ul>
    	
      <ul class="option-list">
      <li class="option-list-title">내관</li>
      <ul class="option-detail">
        <li class="option-item">
          <label class="option-item-label" for="checkbox14">가죽시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox14" name="leather_seats">
          <label for="checkbox14"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox15">전동시트(운전석)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox15" name="power_seat_driver">
          <label for="checkbox15"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox16">전동시트(동승석)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox16" name="power_seat_passenger">
          <label for="checkbox16"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox17">열선시트(앞좌석)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox17" name="heated_seat_front">
          <label for="checkbox17"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox18">열선시트(뒷좌석)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox18" name="heated_seat_rear">
          <label for="checkbox18"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox19">통풍시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox19" name="ventilated_seats">
          <label for="checkbox19"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox20">메모리시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox20" name="memory_seats">
          <label for="checkbox20"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox21">폴딩시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox21" name="folding_seats">
          <label for="checkbox21"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox22">마사지시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox22" name="massage_seats">
          <label for="checkbox22"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox23">워크인시트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox23" name="walk-in_seat">
          <label for="checkbox23"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox24">요추받침</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox24" name="lumbar_support">
          <label for="checkbox24"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox25">하이패스룸미러</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox25" name="high_pass_room_mirror">
          <label for="checkbox25"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox26">ECM룸미러</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox26" name="ecm_room_mirror">
          <label for="checkbox26"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox27">뒷좌석에어벤트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox27" name="rear_seat_vents">
          <label for="checkbox27"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox28">패들쉬프트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox28" name="paddle_shift">
          <label for="checkbox28"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox29">전동햇빛가리개</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox29" name="power_sunshade">
          <label for="checkbox29"></label>
        </li>
        <li class="option-item">
          <label class="option-item-label" for="checkbox30">엠비언트라이트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox30" name="ambient_lighting">
          <label for="checkbox30"></label>
        </li>
        
      </ul>
    </ul>
    	  <ul class="option-list">
      <li class="option-list-title">안전</li>
      <ul class="option-detail">
       <li class="option-item">
          <label class="option-item-label" for="checkbox31">커튼 에어백</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox31" name="curtain_airbags">
          <label for="checkbox31"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox32">무릎 에어백</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox32" name="knee_airbags">
          <label for="checkbox32"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox33">승객감지 에어백</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox33" name="passenger_airbags">
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
          <input class="option-item-checkbox" type="checkbox" id="checkbox36" name="rear_sensors">
          <label for="checkbox36"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox37">전방센서</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox37" name="front_sensors">
          <label for="checkbox37"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox38">후방카메라</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox38" name="rear_camera">
          <label for="checkbox38"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox39">전방카메라</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox39" name="front_camera">
          <label for="checkbox39"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox40">어라운드뷰</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox40" name="around_view">
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
          <input class="option-item-checkbox" type="checkbox" id="checkbox45" name="rear_cross_traffic_alert">
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
          <input class="option-item-checkbox" type="checkbox" id="checkbox47" name="smart_key">
          <label for="checkbox47"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox48">열선 핸들</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox48" name="heated_steering_wheel">
          <label for="checkbox48"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox49">리모컨 핸들</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox49" name="remote_control_steering_wheel">
          <label for="checkbox49"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox50">자동 에어컨</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox50" name="automatic_air_conditioning">
          <label for="checkbox50"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox51">좌우독립 에어컨</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox51" name="dual_zone_air_conditioning">
          <label for="checkbox51"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox52">오토라이트</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox52" name="auto_headlights">
          <label for="checkbox52"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox53">크루즈 컨트롤</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox53" name="cruise_control">
          <label for="checkbox53"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox54">스마트 크루즈 컨트롤</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox54" name="smart_cruise_control">
          <label for="checkbox54"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox55">스탑앤고</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox55" name="stop_and_go">
          <label for="checkbox55"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox56">전동 트렁크</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox56" name="power_trunk">
          <label for="checkbox56"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox57">스마트 트렁크</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox57" name="smart_trunk">
          <label for="checkbox57"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox58">전자주차 브레이크(EPB)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox58" name="electronic_parking_brake">
          <label for="checkbox58"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox59">경사로 밀림방지</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox59" name="hill_start_assist">
          <label for="checkbox59"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox60">헤드업 디스플레이(HUD)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox60" name="head-up_display">
          <label for="checkbox60"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox61">무선충전</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox61" name="wireless_charging">
          <label for="checkbox61"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox62">자동주차</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox62" name="automatic_parking">
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
          <input class="option-item-checkbox" type="checkbox" id="checkbox63" name="genuine_navigation">
          <label for="checkbox63"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox64">네비게이션(비순정)</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox64" name="aftermarket_navigation">
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
          <label class="option-item-label" for="checkbox67">MP3</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox67" name="mp3">
          <label for="checkbox67"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox68">DMB</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox68" name="dmb">
          <label for="checkbox68"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox69">CD플레이어</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox69" name="cd_player">
          <label for="checkbox69"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox70">AV시스템</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox70" name="av_system">
          <label for="checkbox70"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox71">뒷좌석 TV</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox71" name="rear_seat_tv">
          <label for="checkbox71"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox72">텔레매틱스</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox72" name="telematics">
          <label for="checkbox72"></label>
        </li>
         <li class="option-item">
          <label class="option-item-label" for="checkbox73">스마트폰 미러링</label>
          <input class="option-item-checkbox" type="checkbox" id="checkbox73" name="smartphone_mirroring">
          <label for="checkbox73"></label>
        </li>
        
      </ul>
    </ul>
    </div>
 <button class="w-btn w-btn-indigo" type="button">
        제출
    </button>
     </form>
</body>
</html>

