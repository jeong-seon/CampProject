<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 Preference</title>
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
<script type="text/javascript" src="/camp24/resources/js/camp24/preference.js"></script>
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
#rank {
	position: relative;
	top: -10px;
}
#jbtn{
	border-color: white;
}
#pwmsg, #repwmsg, #idmsg {
	display: none;
}
label.s3 {
	position: relative;
	top: 5px;
	font-size: 14pt;
	font-weight: normal;
	opacity: 0.7;
}

#type label, #price label, #view label, #pet label {
	position: relative;
	top: 2px;
	left: 7px;
}
img{
	overflow: hidden;
}

</style>
</head>
<body>
<%@ include file="../include.jsp" %>

  <!-- Portfolio Section -->
<div id="PreferenceForm">
	<div class="w3-container">
		<div class="preference-form">
			<div class="main-div">
			    <div class="panel w3-center">
				   <h2><strong>캠핑장 선호도 조사</strong></h2>
			   	</div>
    			<form method="POST" action="" name="frm" id="frm"
			class="w3-col w3-margin-top w3-margin-bottom w3-padding">
			
			<c:if test="${not empty SID}">
					<input type="hidden" name="id" value="${SID}">	
			</c:if>
			
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10 w3-margin-right">Type : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-left" id="type">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.mupno eq '1001'}">
					<div class="w3-half">
						<input type="radio" name="mtype" id="mtype${data.mmno}" class="w3-radio" value="${data.mkname}"> <label for="type${data.mmno}"> ${data.mkname}</label>
					</div>
	</c:if>
</c:forEach>
				</div>
			</div>
			
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10 w3-margin-right">View : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-left" id="mview">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.mupno eq '1011'}">
					<div class="w3-half">
						<input type="radio" name="mview" id="view${data.mmno}" class="w3-radio" value="${data.mkname}"> <label for="type${data.mmno}"> ${data.mkname}</label>
					</div>
	</c:if>
</c:forEach>
				</div>
			</div>
			
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10 w3-margin-right">Pet : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-left" id="pet">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.mupno eq '1021'}">
					<div class="w3-half">
						<input type="radio" name="mpet" id="pet${data.mmno}" class="w3-radio" value="${data.mkname}"> <label for="type${data.mmno}"> ${data.mkname}</label>
					</div>
	</c:if>
</c:forEach>				
				</div>
			</div>
			
			<button type="submit" class="w3-col w3-button w3-green w3-hover-grey" style="border-color: white;" id="sbtn">Submit</button>
			<!-- <div class="w3-half w3-button w3-red w3-hover-orange" id="hbtn">Home</div> -->
		</form>
    		</div>
		</div>
	</div>
</div>


</div>
    <!-- Grid for photos -->
    
   		
   	
  <!-- End Portfolio Section -->
  
<!-- END PAGE CONTENT -->

<script>
// Open and close sidebar
function openNav() {S
  document.getElementById("mySidebar").style.width = "60%";
  document.getElementById("mySidebar").style.display = "block";
}

function closeNav() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>

</body>
</html>

