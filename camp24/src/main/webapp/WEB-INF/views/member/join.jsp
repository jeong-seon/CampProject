<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 Join</title>
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
<script type="text/javascript" src="/camp24/resources/js/camp24/join.js"></script>
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
.avtimg {
		width: 100px;
		height: 100px;
	}
	.avtbox {
		display: inline-block;
		width: 100px;
		height: 100px;
	}
	#pwmsg, #repwmsg, #avtfr, #idmsg {
		display: none;
	}
	label.s3 {
		position: relative;
		top: 5px;
		font-size: 14pt;
		font-weight: normal;
		opacity: 0.7;
	}
	
	#gen label {
		position: relative;
		top: 2px;
		left: 7px;
	}
img{
	border-radius: 70%;
	overflow: hidden;
}
</style>
</head>
<body>
<%@ include file="../include.jsp" %>

  <!-- Portfolio Section -->
<div id="JoinForm">
	<div class="w3-container">
		<div class="login-form w3-center">
			<div class="main-div">
			    <div class="panel w3-center">
				   <h2>Camp24 Join</h2>
				   <p>Please enter your Information</p>
			   	</div>
    			<form method="POST" action="" name="frm" id="frm"
			class="w3-col w3-margin-top w3-margin-bottom w3-padding">
			<div>
				<label for="name" class="w3-col s3 w3-right-align w3-margin-top ft14 mgb10">?????? : </label>
				<input type="text" name="name" id="name" class="w3-col s8 w3-margin-top mgl10 w3-input w3-border mgb10 w3-margin-bottom" placeholder="????????? ??????????????????">
			</div>
			<div>
				<label for="id" class="w3-col s3 w3-right-align ft14 mgb10" >????????? : </label>
				<div class="w3-col s8 mgl10">
				<div class="w3-button w3-lime w3-right pd9-16 w3-margin-left w3-text-grey" id="idck">?????? ??????</div>
					<div class="w3-rest pdr10">					
						<input type="text" name="id" id="id" class="w3-input w3-border mgb10 w3-margin-bottom" onkeydown="inputIdChk()" placeholder="????????? ??????????????????">
						<input type="hidden" name="idCheck" id="idCheck" value="">
					</div>
					<span class="w3-col mgb10 w3-center" id="idmsg"></span>
				</div>
			</div>
			<div>
				<label for="repw" class="w3-col s3 w3-right-align ft14 mgb10" >???????????? : </label>
					<div class="w3-col s8 mgl10 mgb10">
					<input type="password" id="pw" name="pw" class="w3-col w3-input w3-border w3-margin-bottom" placeholder="????????? ??????????????????">
					</div>
				<label for="repw" class="w3-col s3 w3-right-align ft14 mgb10">???????????? ?????? : </label>
				<div class="w3-col s8 mgl10 mgb10">
					<input type="password" id="repw" class="w3-col w3-input w3-border w3-margin-bottom" placeholder="????????? ??????????????????">
					<span class="w3-col w3-text-red w3-center" id="repwmsg"># ??????????????? ???????????? ????????????.</span>
				</div>
			</div>
			<div>
				<label for="tel" class="w3-col s3 w3-right-align ft14 mgb10">???????????? : </label>
				<input type="text" name="tel" id="tel" class="w3-col s8 mgl10 w3-input w3-border mgb10 w3-margin-bottom" placeholder="????????? ??????????????????">
			</div>
			<div>
				<label for="mail" class="w3-col s3 w3-right-align ft14 mgb10">?????? : </label>
				<div class="w3-col s8 mgl10">
						<div class="mail_check_button w3-button w3-lime w3-right pd9-16 w3-margin-left w3-text-grey">?????? ??????</div>
				<div class="mail_input_box w3-rest pdr10">
					<input class="mail_input w3-input w3-border mgb10 w3-margin-bottom" id="mail" name="mail" placeholder="????????? ??????????????????"> <!-- ????????? ?????? ??? -->
				</div>
					<div class="mail_check_wrap">
						<div class="mail_check_input_box" id="mail_check_input_box_false">
							<input class="mail_check_input w3-input w3-border mgb10 w3-margin-bottom" disabled="disabled" placeholder="????????????"> <!-- ???????????? ?????? ??? -->
						</div>
						<span id="mail_check_input_box_warn"></span>
					</div>
				</div>
			</div>
			<div>
				<label class="w3-col s3 w3-right-align ft14 mgb10">?????? : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center" id="gen">
					<div class="w3-half">
						<input type="radio" name="gen" id="mgen" class="w3-radio" value="M"> <label for="mgen"> ??????</label>
					</div>
					<div class="w3-half">
						<input type="radio" name="gen" id="fgen" class="w3-radio" value="F"> <label for="fgen"> ??????</label>
					</div>
				</div>
			</div>
			<div class="w3-col" id="avtfr">
				<label class="w3-col s3 w3-right-align ft14 mgb10">????????? : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center">
					<div class="avtboxfr w3-center w3-margin-top" id="mavt">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.gen eq 'M'}">
					 	<div class="avtbox">
					 		<label for="mavt${data.ano}">
					 			<img src="/camp24/resources/img/avatar/${data.savename}" class="w3-col avtimg">
					 		</label>
					 		<input type="radio" name="ano" id="mavt${data.ano}" value="${data.ano}">
					 	</div>
	</c:if>
</c:forEach>
					</div>
					 <div class="avtboxfr w3-center w3-margin-top" id="favt">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.gen eq 'F'}">
					 	<div class="avtbox">
					 		<label for="favt${data.ano}">
					 			<img src="/camp24/resources/img/avatar/${data.savename}" class="w3-col avtimg img-circle">
					 		</label>
					 		<input type="radio" name="ano" id="favt${data.ano}" value="${data.ano}">
					 	</div>
	</c:if>
</c:forEach>
			 		</div>
				</div>
			</div>
			<div class="w3-center">
				<button type="submit" class="btn btn-primary w3-green" id="jbtn">Join</button>
			</div>
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

