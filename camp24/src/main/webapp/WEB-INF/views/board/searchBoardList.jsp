<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 캠핑장 검색</title>
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
<script type="text/javascript" src="/camp24/resources/js/camp24/search.js"></script>
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
#star{
	position: relative;
	top: -15px;
}
#name, #sbtn{
	position: relative;
	top: 15px;
}
#reviewBtn{
	position: relative;
	top: 60px;
	right: 80px;
}
</style>
</head>
<body>
<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->
<div class="w3-row w3-padding-64">
	<form method="post" action="/camp24/board/searchBoardList.cmp" id="frm" name="frm"
			class="w3-col w3-center w3-margin-bottom w3-border-bottom">
		<label class="w3-col m3"><strong style="font-size: 18pt;"><img id="star" style="width: 70px;"src="/camp24/resources/img/pic/star.png"> 캠핑장 검색 </strong>&nbsp;</label>
		<input type="text" class="w3-col m7 w3-input" placeholder="캠핑장 이름을 입력하세요." id="name" name="input">
		<div class="w3-rest w3-button w3-green w3-margin-bottom" id="sbtn">검색</div>
	</form>
<c:if test="${empty LIST}">
	<div class="w3-center w3-content w3-padding-32">
		<h4>검색결과가 없습니다.</h4>
		<h4>정확한 캠핑장이름을 검색해주세요.</h4>
	</div>
</c:if>
<c:forEach var="data" items="${LIST}" varStatus="st">
<c:if test="${data.facltNm ne '검색결과없음'}">
			<span id="reviewBtn" class="w3-right w3-button w3-green review">리뷰 작성</span>
	<div class="w3-row w3-center w3-padding-32 w3-border-bottom">
		<div class="w3-margin w3-center">
			<h5>주소 : ${data.addr1}</h5>
			<h5 id="${st.count}">캠핑장명 : .${data.facltNm}.</h5>
	<c:if test="${not empty data.firstImageUrl && not empty data.homepage}">
			<a href="${data.homepage}"><img style="width: 50%; height: auto;" id="image" src="${data.firstImageUrl}"></a>
	</c:if>
	<c:if test="${not empty data.firstImageUrl && empty data.homepage}">
			<img id="image" src="${data.firstImageUrl}">
	</c:if>
	<c:if test="${empty data.firstImageUrl && empty data.homepage}">
			<img id="image" src="/camp24/resources/img/pic/noimage.png">
	</c:if>
	<c:if test="${empty data.firstImageUrl && not empty data.homepage}">
			<a href="${data.homepage}"><img id="image" src="/camp24/resources/img/pic/noimage.png"></a>
	</c:if>
			<h5>입지구분 : ${data.lctCl}</h5>
			<h5>업종 : ${data.induty}</h5>
			<h5>캠핑장비대여 가능장비 : ${data.eqpmnLendCl}</h5>
			<h5>캠핑장 전화번호 : ${data.tel}</h5>
			<h5>경도 : ${data.mapX}</h5>
			<h5>위도 : ${data.mapY}</h5>
			<h5>애완동물 출입여부 : ${data.animalCmgCl}</h5>
		</div>
		
	</div>
</c:if>
</c:forEach>

</div>
<form method="POST" action="/camp24/reviewBoard/reviewBoardWrite.cmp" id="rfrm" name="rfrm">
	<input type="hidden" name="nowPage" id="nowPage" value="1">
	<input type="hidden" name="cname" id="cname" value="">
</form>

    <!-- Grid for photos -->
    
   		
   	
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
</script>

</body>
</html>
