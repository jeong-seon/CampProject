<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/header.js"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
#rank {
	position: relative;
	top: -10px;
}
</style>
</head>
<body class="w3-light-grey">
	<div class="w3-row">

		<div class="w3-col l8 s12">
			<div class="w3-card-4 w3-margin w3-white w3-center">
				<div class="w3-container">
					<h3 class="w3-text-purple">Camp24 홈페이지에 오신걸 환영합니다.</h3>
					<img src="/camp24/resources/img/pic/camp.png" style="width: 100%; margin-bottom: 20px;">
					
				</div>
   			</div>
   		</div>
   		
   		<div class="w3-col l4">
			<div class="w3-card-4 w3-margin w3-white w3-center">
				<div class="w3-container">
					<h3>랜덤 캠핑장 리스트</h3>
					
		<c:forEach var="data" items="${LIST}">
					<h5><strong>캠핑장명 : ${data.facltNm}</strong></h5>
					<a href="${data.homepage}"><img id="img01" src="${data.firstImageUrl}" style="width: 100%;"></a>
					<h5 style="font-size: 10pt;"># 이미지 클릭 시 해당 홈페이지로 이동합니다 #</h5>
		</c:forEach>
					<p style="margin-bottom: 20px;"></p>
					<!--
					<p style="margin-bottom: 20px;"></p>
					<a href="" id="prev"><img src="/camp24/resources/img/pic/prev.png" width="50px" height="auto"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="" id="next"><img src="/camp24/resources/img/pic/next.png" width="50px" height="auto"></a>
					<p style="margin-bottom: 20px;"></p>
					-->
					<a href="" class="w3-dark-grey w3-button">변경</a>
					<p style="margin-bottom: 20px;"></p>
				</div>
   			</div>
   		</div>
   		
   		<div class="w3-col">
			<div class="w3-card-4 w3-margin w3-white w3-center">
				<h4 style="font-size: 36pt; display: inline-block;">Best 캠핑장</h4><img id="rank" style="width: 70px; height: auto;" src="/camp24/resources/img/pic/rank.png">
   			</div>
   		</div>
		<hr>
	</div>
<c:if test="${(not empty SID) and (MSG_CHECK eq 'OK')}">
	<div id="msgWin" class="w3-modal">
		<div class="w3-modal-content w3-animate-top w3-card-4 mxw500">
			<header class="w3-container w3-blue"> 
				<span class="w3-button w3-display-topright" id="msgClose">&times;</span>
				<h2 class="w3-center">알림 메세지</h2>
			</header>
			<div class="w3-container">
				<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="msg">${SID} 님이 로그인 하셨습니다.</h3>
			</div>
		</div>
	</div>
</c:if>
</body>
</html>
<%@ include file="footer.jsp" %>