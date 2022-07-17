<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 지도</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/main.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/base.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/user.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/map.js"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=da2xg11dum"></script>
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: 'IBM Plex Sans KR', serif;}
.w3-row-padding img {margin-bottom: 12px}
.bgimg {
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url('/camp24/resources/img/pic/14.png');
  min-height: 100%;
}
div{
	z-index: 2;
}
</style>
</head>
<body>
<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->
<div class="w3-col" style="margin-top: 30px;">
	<div class="w3-col m4">
		<div>
			<div class="w3-content w3-center w3-margin-bottom" style="margin-top: 100px;">
				<label class="w3-col w3-center w3-padding"><strong style="font-size: 18pt;">캠핑장 검색</strong>&nbsp;</label>
				<div class="w3-col w3-center w3-padding">
					<input type="text" style="margin-left: 30px; margin-bottom: 30px;" class="w3-col w3-center m9 w3-input" placeholder="캠핑장 이름을 입력하세요." id="name" name="input">
					<div class="w3-rest w3-button w3-green" id="sbtn">검색</div>
				</div>
				
				<input type="hidden" name="X" id="X" >
				<input type="hidden" name="Y" id="Y" >
			<div class="w3-center" id="info">
					
			</div>
			</div>
		</div>
	</div>
	<div class="w3-col m8" id="map" style="width:60%;height:400px;"></div>
</div>


    <!-- Grid for photos -->
    <div id="editWin" class="w3-modal">
	    <div class="w3-modal-content w3-animate-top w3-card-4 mxw500">
			<header class="w3-container w3-green"> 
		        <span class="w3-button w3-display-topright" 
		        							id="editClose">&times;</span>
		        <h2 class="w3-center">알림</h2>
			</header>
	    	<div class="w3-container">
	        	<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="editmsg">검색중입니다. 잠시만 기다려주세요.</h3>
	    	</div>
	    </div>
 	</div>
   	
  <!-- End Portfolio Section -->
  
<!-- END PAGE CONTENT -->

<script>
// Open and close sidebar
function openNav() {
  document.getElementById("mySidebar").style.width = "60%";
  document.getElementById("mySidebar").style.display = "block";
}

function closeNav() {
  document.getElementById("mySidebar").style.display = "none";
}

initMap();

function initMap(){
	
	var map = new naver.maps.Map('map', {
		center: new naver.maps.LatLng(37.3595704, 127.105399),
		zoom: 17
	});
	
	
	var contentString = [
	    '<div class="iw_inner w3-center" style="margin-left: 10px; margin-right: 10px;">',
	    '   <h3>NAVER 그린팩토리</h3>',
	    '   <p>경기 성남시 분당구 불정로 6 그린팩토리 <br>',
	    '       <img style="margin-top: 10px; margin-bottom: 10px;" src="https://search.pstatic.net/common/?autoRotate=true&quality=95&type=w750&src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20180420_84%2F1524190400282Ddz2p_JPEG%2FQNqMb_152FdXVYmznU-ia5cJ.jpg" width="100" height="100" alt="NAVER" class="thumb" /><br>',
	    '       <a href="https://www.navercorp.com" target="_blank">https://www.navercorp.com/</a>',
	    '   </p>',
	    '</div>'
	].join('');
	
	var marker = new naver.maps.Marker({
		position: new naver.maps.LatLng(37.3595704, 127.105399),
		map: map
	});
	
	var infowindow = new naver.maps.InfoWindow({
	    content: contentString
	});
	
	naver.maps.Event.addListener(marker, "click", function(e) {
	    if (infowindow.getMap()) {
	        infowindow.close();
	    } else {
	        infowindow.open(map, marker);
	    }
	});
}
</script>

</body>
</html>
