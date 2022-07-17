<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고 거래</title>
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

    <!-- Grid for photos -->
<div class="container">
	<h2 class="text-center">중고거래게시판</h2>
</div>
<div class="w3-col w3-margin-bottom">
			<div class="w3-quarter">
				<select id="xlcate" class="w3-select w3-border w3-center w3-margin-bottom">
					<option disabled selected>분류 선택</option>
		<c:forEach var="data" items="${LIST2}">
					<option value="${data.cano}">${data.caname}</option>
		</c:forEach>
				</select>
			</div>
</div>

	<form method="POST" action="/camp24/trade/tradeDetail.cmp" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="tno" id="tno">
		<input type="hidden" name="vw" id="vw">

<div class="w3-col w3-left" id="tPanel">	     
<c:forEach var="data" items="${LIST}">
			<div class="col-md-3 w3-margin-bottom brdList" style ="margin-right: 30px; cursor:pointer;"  id="${data.tno}">
				<c:forEach var="image" items="${IMAGE}">
				<c:if test="${data.tno eq image.imageno}">
				<div class = "w3-margin-right">
							<img style= "display: inline-block; width: 202px; height: 202px; cursor:pointer;"  src="${image.idir}${image.isavename}">
				</div>
				</c:if>
				</c:forEach>
                	<h4>${data.title}</h4>
               		<label>$ ${data.price}원</label>
               		<p>위치 :${data.position}</p>
               		<p>조회수 : ${data.click} 작성자 : ${data.id}</p>

               		
		</div>
	
</c:forEach>
</div>
	</form>
	<c:if test="${not empty SID}">
			<div class="w3-col w3-margin-top" style="margin-bottom: 100px;">
			<button type="button" class="btn btn-primary pull-right w3-green w3-margin-left"id="wbtn">물품 등록</button>
		</div>
	</c:if>
	
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