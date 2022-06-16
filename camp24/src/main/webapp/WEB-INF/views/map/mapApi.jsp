<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
	<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
	<script type="text/javascript" src="/camp24/resources/js/camp24/header.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>Camp24 네이버지도</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=da2xg11dum"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
</head>
<body class="w3-light-grey">
<div class="w3-col">

	<div class="w3-col m4">
		<div>
			<form method="post" action="" id="frm" name="frm"
					class="w3-content w3-center w3-margin-bottom">
				<label class="w3-col w3-center w3-padding-32"><strong style="font-size: 18pt; font-family: Raleway;">캠핑장 검색</strong>&nbsp;</label>
				<div class="w3-col w3-center w3-padding-16">
					<input type="text" style="margin-left: 30px;" class="w3-col w3-center m9 w3-input" placeholder="캠핑장 이름을 입력하세요." id="name" name="input">
					<div class="w3-rest w3-button w3-dark-gray" id="sbtn">검색</div>
				</div>
			</form>
		</div>
	</div>
	<div class="w3-col" id="map" style="width:65%;height:600px;"></div>
</div>
<script>
var mapOptions = {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
};

var map = new naver.maps.Map('map');
</script>
</body>
</html>
<%@ include file="../footer.jsp" %>