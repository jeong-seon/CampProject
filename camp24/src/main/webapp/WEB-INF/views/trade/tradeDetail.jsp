<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품 상세보기</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">

<!-- top button -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!--To Work with icons-->
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">


<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/camp24/css/main.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/base.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/user.css">
<script type="text/javascript" src="/camp24/resources/js//jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/tradeboard.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/trade2.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
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
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.dbtn').click(function(){
			$('#modal2').css('display', 'block');
		});
	});
</script>
</head>
<body>
	<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->
  
	<form method="POST" action="/camp24/trade/trade.cmp" id="frm" name="frm">
		<input type="hidden" name="nowPage" value="${param.nowPage}">
		<input type="hidden" name="tno" value="${DATA.tno}">
	</form>
	<div class="w3-content">
	<c:if test="${not empty LIST}">			
			<div class="w3-margin-bottom" id="previewbox">
				<div class="m10 w3-center" id="preview">
		<c:forEach var="data" items="${LIST}">
			<c:if test="${not empty data.isavename}">
					<div class="inblock picbox">
				<c:if test="${data.idir eq '/camp24/upload/'}">
						<img class="pic" style="WIDTH: 100px" onclick="window.open(this.src)"  alt="클릭하시면 조금더 커집니다.."  src="${data.idir}${data.isavename}"> 
						
				</c:if>
				<c:if test="${data.idir ne '/camp24/upload/'}">
						<img class="pic" style="WIDTH: 100px" onclick="window.open(this.src)"  alt="클릭하시면 조금더 커집니다.."  src="/camp24${data.idir}/${data.isavename}"> 
				</c:if>
					</div>
			</c:if>
		</c:forEach>
				</div>
			</div>
</c:if>
		<div class="w3-col frmpadding w3-center">
			<div class="w3-col  w3-margin-bottom">
				<label class="w3-left">물품 이름 : ${DATA.title}</label>
			</div>
				<div class="w3-col  w3-margin-bottom"  >
				<label class="w3-left">판매자 아이디 : ${DATA.id} </label>
			</div>
			<div class="w3-col  w3-margin-bottom" >
				<label class="w3-left">금액 : ${DATA.price} 원</label>
			</div>
			<div class="w3-col w3-margin-bottom">
				<label class="w3-left">지역위치 : ${DATA.position}</label>
			</div>	
			<div class="w3-col w3-margin-bottom w3-margin-top">
				<label class="w3-left">캠핑장비 상세 설명 :  ${DATA.body}</label>
			</div>
		</div>
		
		<div class="w3-col w3-margin-top w3-card-4">
	<c:if test="${SID eq DATA.id}">
			<div class="w3-quarter w3-button w3-blue" id="hbtn">home</div>
			<div class="w3-quarter w3-button w3-green" id="listbtn">리스트</div>
			<div class="w3-quarter w3-button w3-deep-orange" id="edit">글수정</div>
			<div class="w3-quarter w3-button w3-red" id="dbtn">글삭제</div>
	</c:if>
	<c:if test="${SID ne DATA.id}">
			<div class="w3-half w3-button w3-blue" id="hbtn">home</div>
			<div class="w3-half w3-button w3-green" id="listbtn">리스트</div>
	</c:if>
		</div>
	<!-- END PAGE CONTENT -->
</div>

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