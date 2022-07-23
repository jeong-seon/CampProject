<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 My page</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<!-- google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/mypage.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/main.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/base.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/user.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/memberInfo.js"></script>
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
.avtbox {

}
.w3-display-container {
	position: relative;
	top: 10px;
}

.pdl20 > h4 > span:nth-child(2) {
	position: relative;
	left: 20px;
}
.pdl20 {
	position: relative;
	top: 40px;
}
#mainlogo{
	text-color: black!important;
	text-decoration: underline;
	text-decoration-color: black!important;
}
a{
	color: black;
}
a:hover{
	color: black;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#dbtn').click(function(){
			$('#modal').css('display', 'block');
		});
	});
</script>
</head>
<body>
<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->

<h2 class="w3-center">My Page</h2>

<div class="w3-content w3-center">
<div class="inblock">
      <section class="panel panel-default" style="width: 400px;">
        <div class="panel-body">
          <article class="panel-body" style="margin-bottom: 0px;">
            <figure class="text-center">
            <div>
              <img src="/camp24/img/avatar/${DATA.savename}" class="img-thumbnail img-circle img-responsive" alt="me">
            </div>
              <h3 class="w3-center">${DATA.id}</h3>
            </figure>
          </article>
          <article>
          
          <c:if test="${DATA.gen ne 'F'}">
		<h4 class="w3-green w3-center w3-padding">
	<c:if test="${DATA.id eq SID}">
			내 정보
	</c:if>
	<c:if test="${DATA.id ne SID}">
			${DATA.name} 회원 정보
	</c:if>
		</h4>
</c:if>
<c:if test="${DATA.gen eq 'F'}">
		<h4 class="w3-orange w3-center w3-padding">
	<c:if test="${DATA.id eq SID}">
			내 정보
	</c:if>
	<c:if test="${DATA.id ne SID}">
			${DATA.name} 회원 정보
	</c:if>
		</h4>
</c:if>
            <c:if test="${not empty SID}">
					<input type="hidden" name="id" value="${SID}">	
					<input type="hidden" name="mno" value="${SMNO}">	
			</c:if>
            <hr>
            <div class="w3-content w3-center">
            <dl class="dl-horizontal" style="font-size: 14pt;">
              <dt>이름 :</dt>
              <dd style="text-align: left" id="name">${DATA.name}</dd>
              <dt>아이디 :</dt>
              <dd style="text-align: left" id="id">${DATA.id}</dd>
              <dt>전화번호 :</dt>
              <dd style="text-align: left" id="tel">${DATA.tel}</dd>
              <dt>이메일 :</dt>
              <dd style="text-align: left" id="mail">${DATA.mail}</dd>
              <dt>성별 :</dt>
              <dd style="text-align: left" id="gen">${DATA.gen == 'M' ? "남자":"여자"}</dd>
			</dl>
			<div class="w3-center" style="width: 250px; font-size: 14pt;">
			  <div>선호도</div>
			</div>
			<dl class="dl-horizontal" style="font-size: 14pt;">
		      <dt>타입 :</dt>
		      <dd style="text-align: left" id="pftype">${PDATA.pftype}</dd>
		      <dt>가격 :</dt>
		      <dd style="text-align: left" id="pfprice">${PDATA.pfprice}</dd>
		      <dt>뷰 :</dt>
		      <dd style="text-align: left" id="pfview">${PDATA.pfview}</dd>
		      <dt>반려동물 :</dt>
		      <dd style="text-align: left" id="pfpet">${PDATA.pfpet}</dd>
            </dl>
            </div>
          </article>
        </div>
      </section>
<div class="w3-col w3-margin-top" style="margin-bottom: 30px;">
	<div class="w3-half w3-button w3-lime" id="ebtn">수정</div>
	<div class="w3-half w3-button w3-red" id="dbtn">회원탈퇴</div>
</div>
    </div>
  </div>

	 <form method="POST" action="" id="frm" name="frm">
	 	<input type="hidden" name="mno" id="smno">
	 	<input type="hidden" name="id" id="sid" value="${SID}">
	 </form>
    
    <!-- Grid for photos -->
    <div id="modal" class="w3-modal">
		<div class="w3-modal-content w3-animate-top w3-card-4 mxw500">
			<header class="w3-container w3-red"> 
				<span onclick="document.getElementById('modal').style.display='none'" 
						class="w3-button w3-display-topright">&times;</span>
				<h2 class="w3-center">회원 탈퇴</h2>
			</header>
			<div class="w3-container">
				<h3 class="w3-center w3-padding w3-margin" id="modalmsg">정말로 회원 탈퇴를 하시겠습니까?</h3>
			</div>
	    	<footer class="w3-container w3-red">
				<div class="w3-col m2 w3-right w3-button" id="nbtn">아니오</div>
				<div class="w3-col m2 w3-right w3-button" id="ybtn">예</div>
			</footer>
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
</script>

</body>
</html>





