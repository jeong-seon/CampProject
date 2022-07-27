<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 Recommend</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/recommend.js"></script>
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: 'IBM Plex Sans KR', serif;}
label.s3 {
	position: relative;
	top: 5px;
	font-size: 14pt;
	font-weight: normal;
	opacity: 0.7;
}
.rfrm{
	width: 300px; 
	height: 29px;
	margin-top: 8px;
}
</style>
</head>
<body>
<%@ include file="../include.jsp" %>

  <!-- Portfolio Section -->
<div id="PreferenceForm">
	<div class="w3-content">
		<div class="preference-form">
			<div class="main-div">
			    <div class="panel w3-center">
				   <h2><strong>선호도에 따른 추천 캠핑장 TOP 5</strong></h2>
			   	</div>
    			<form method="POST" action="" name="frm" id="frm"
			class="w3-col w3-margin-top w3-margin-bottom w3-padding">
			
			<c:if test="${not empty SID}">
					<input type="hidden" name="id" value="${SID}">	
			</c:if>
			
			<div class="w3-border-bottom">
				<label class="w3-col s3 w3-right-align ft14 mgb10 w3-margin-right"></label>
				<div class="w3-col s8 mgl10 mgb10 w3-left" id="type">
<c:forEach var="data" items="${RCLIST}" begin="1" end="5">
	
					<div class="w3-col w3-margin-top w3-margin-bottom w3-border-bottom">
						<label class="w3-col s3 w3-right-align ft14 mgb10 w3-margin-right">캠핑장명 : </label>
						<div class="w3-col s8 mgl10 mgb10 w3-left" id="facname">
							<div class="rfrm">
								<label for="facltnm" name="facltnm" id="facltnm" value="${data.facltnm}">${data.facltnm}</label>
							</div>
						</div>
						
						<label class="w3-col s3 w3-right-align ft14 mgb10 w3-margin-right">주소 : </label>
						<div class="w3-col s8 mgl10 mgb10 w3-left" id="addrname">
							<div class="rfrm">
								<label for="addr1" name="addr1" id="addr1" value="${data.addr1}">${data.addr1}</label>
							</div>
						</div>
						
						<label class="w3-col s3 w3-right-align ft14 mgb10 w3-margin-right">홈페이지 : </label>		
						<div class="w3-col s8 mgl10 mgb10 w3-left" id="homename">
							<div class="rfrm">
								<label for="homepage" name="homepage" id="homepage" value="${data.homepage}"><a href ="${data.homepage}">${data.homepage}</a></label>
							</div>
						</div>	
						
						<label class="w3-col s3 w3-right-align ft14 mgb10 w3-margin-right">전화번호 : </label>
						<div class="w3-col s8 mgl10 mgb10 w3-left" id="telname">
							<div class="rfrm">
								<label for="tel" name="tel" id="tel" value="${data.tel}">${data.tel}</label>
							</div>
						</div>
						
						<label class="w3-col s3 w3-right-align ft14 mgb10 w3-margin-right">업종 : </label>
						<div class="w3-col s8 mgl10 mgb10 w3-left" id="indname">
							<div class="rfrm">
								<label for="induty" name="induty" id="induty" value="${data.induty}">${data.induty}</label>
							</div>
						</div>
						
						<label class="w3-col s3 w3-right-align ft14 mgb10 w3-margin-right">위치 : </label>
						<div class="w3-col s8 mgl10 mgb10 w3-left" id="locname">
							<div class="rfrm">
								<label for="lctcl" name="lctcl" id="lctcl" value="${data.lctcl}">${data.lctcl}</label>
							</div>
						</div>
						
						<label class="w3-col s3 w3-right-align ft14 mgb10 w3-margin-right">애완동물 : </label>
						<div class="w3-col s8 mgl10 mgb10 w3-left" id="petname">
							<div class="rfrm">
								<label for="animalcmgcl" name="animalcmgcl" id="animalcmgcl" value="${data.animalcmgcl}">${data.animalcmgcl}</label>
							</div>
						</div>
					</div>

</c:forEach>
				</div>
			</div>
			
			<div class="w3-col w3-button w3-green w3-hover-grey" id="hbtn">Home</div>
		</form>
    		</div>
		</div>
	</div>
</div>


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

