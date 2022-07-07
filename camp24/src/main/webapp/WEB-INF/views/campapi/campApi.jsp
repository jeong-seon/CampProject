<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- top button -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/camp24/css/main.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/base.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/user.css">
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/campapi.js"></script>
<style type="text/css">
    .back-to-top {
    cursor: pointer;
    position: fixed;
    bottom: 40px;
    right: 40px;
    display:none;
}
</style>
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
#image{
	width: 60%;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#msgWin').css('display', 'block');
	});
</script>
</head>
<body>
<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->
<div class="">

	<div style="align: center;">
			<div class="w3-margin w3-white w3-center">
				<h2 class="w3-padding-16 w3-center w3-margin-bottom w3-border-bottom">캠핑장 정보</h2>
<c:forEach var="data" items="${LIST}" varStatus="st">
<div class="w3-center">
	<div class="w3-padding-64 w3-border-bottom" style="margin-bottom: 30px;">
		<div class="w3-margin w3-center">
			<h5>주소 : ${data.addr1}</h5>
			<h5>캠핑장명 : ${data.facltNm}</h5>
	<c:if test="${not empty data.firstImageUrl && not empty data.homepage}">
			<a href="${data.homepage}"><img id="image" src="${data.firstImageUrl}"></a>
	</c:if>
	<c:if test="${not empty data.firstImageUrl && empty data.homepage}">
			<img id="image" src="${data.firstImageUrl}">
	</c:if>
	<c:if test="${empty data.firstImageUrl && empty data.homepage}">
			<img id="image" style="width: 200px; height: auto;" src="/camp24/resources/img/pic/noimage.png">
	</c:if>
	<c:if test="${empty data.firstImageUrl && not empty data.homepage}">
			<a href="${data.homepage}"><img id="image" style="width: 200px; height: auto;" src="/camp24/resources/img/pic/noimage.png"></a>
	</c:if>
			<h5>입지구분 : ${data.lctCl}</h5>
			<h5>업종 : ${data.induty}</h5>
	<c:if test="${not empty data.eqpmnLendCl}">
			<h5>캠핑장비대여 가능장비 : ${data.eqpmnLendCl}</h5>
	</c:if>
	<c:if test="${empty data.eqpmnLendCl}">
			<h5>캠핑장비대여 가능장비 : 없음</h5>
	</c:if>
			<h5>캠핑장 전화번호 : ${data.tel}</h5>
			<h5>경도 : ${data.mapX}</h5>
			<h5>위도 : ${data.mapY}</h5>
			<h5>애완동물 출입여부 : ${data.animalCmgCl}</h5>
		</div>
	</div>
</div>
</c:forEach>
   			</div>
	</div>

	<!-- 페이지 처리 시작 -->
		<div class="w3-center">
			<div class="w3-bar w3-border w3-margin-top w3-margin-bottom">
	<c:if test="${PAGE.startPage eq 1}">
				<div class="w3-bar-item w3-white">&laquo;</div>
	</c:if>
	<c:if test="${PAGE.startPage ne 1}">
				<div class="w3-bar-item w3-button w3-hover-green pbtn" id="${PAGE.startPage - 1}">&laquo;</div>
	</c:if>
	<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
			<c:if test="${page eq PAGE.nowPage}">
				<div class="w3-bar-item w3-lime">${page}</div>
			</c:if>
			<c:if test="${page ne PAGE.nowPage}">
				<div class="w3-bar-item w3-button w3-hover-green pbtn" id="${page}">${page}</div>
			</c:if>
	</c:forEach>
			<c:if test="${PAGE.endPage eq PAGE.totalPage}">
				<div class="w3-bar-item w3-white">&raquo;</div>
			</c:if>
			<c:if test="${PAGE.endPage ne PAGE.totalPage}">
				<div class="w3-bar-item w3-button w3-hover-green pbtn" id="${PAGE.endPage + 1}">&raquo;</div>
			</c:if>
			</div>
		</div>
		<!-- 페이지 처리 태그 끝 -->
		
		<!-- 데이터 전송용 form 태그 -->
		<form method="POST" action="/camp24/campapi/campApi.cmp" id="frm" name="frm">
			<input type="hidden" id="nowPage" name="pageno" value="${PAGE.nowPage}">
		</form>
	<!-- <form method="post" action="/camp24/campapi/campApi.cmp" id="frm" name="frm">
		<div class="w3-row w3-center">
			<div class="w3-button w3-center w3-dark-gray" id="before">이전페이지</div>
			<div class="w3-button w3-center w3-dark-gray" id="next">다음페이지</div>
			<input type="hidden" id="pageno" name="pageno" value="1">
		</div>
	</form> -->
</div>
    <!-- Grid for photos -->
  
  <!-- Page top button -->
  <a style="width: 50px; height: 40px;" id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top w3-green" role="button" title="Click to return on the top page" data-toggle="tooltip" data-placement="left"><span class="glyphicon glyphicon-chevron-up"></span></a>
<!-- END PAGE CONTENT -->
<!-- 데이터 전송용 form 태그 -->
		<form method="POST" action="/camp24/campapi/campApi.cmp" id="frm" name="frm">
			<input type="hidden" id="nowPage" name="pageno" value="${PAGE.nowPage}">
		</form>
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
<!-- top button -->
<script type="text/javascript">
	$(document).ready(function(){
     $(window).scroll(function () {
            if ($(this).scrollTop() > 50) {
                $('#back-to-top').fadeIn();
            } else {
                $('#back-to-top').fadeOut();
            }
        });
        // scroll body to 0px on click
        $('#back-to-top').click(function () {
            $('#back-to-top').tooltip('hide');
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
        
        $('#back-to-top').tooltip('show');

	});	
</script>

</body>
</html>




