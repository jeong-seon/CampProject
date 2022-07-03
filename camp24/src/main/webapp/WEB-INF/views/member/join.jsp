<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 Login</title>
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
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Hahmlet:wght@300&family=Song+Myung&display=swap" rel="stylesheet">

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
body, h1,h2,h3,h4,h5,h6 {font-family: 'Song Myung', serif;}
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
</style>
</head>
<body>
	<form method="POST" action="" id="hfrm" name="hfrm">
		<input type="hidden" name="id" value="${SID}">
		<input type="hidden" id="apinowPage" name="pageno">
	</form>
<!-- Sidebar with image -->
<nav class="w3-sidebar w3-hide-medium w3-hide-small" style="width:40%">
  <div class="bgimg"></div>
</nav>

<!-- Hidden Sidebar (reveals when clicked on menu icon)-->
<nav class="w3-sidebar w3-black w3-animate-right w3-xxlarge" style="display:none;padding-top:100px;right:0;z-index:2" id="mySidebar">
  <a href="javascript:void(0)" onclick="closeNav()" class="w3-button w3-black w3-xxxlarge w3-display-topright" style="padding:0 12px;">
    <i class="fa fa-remove"></i>
  </a>
  <div class="w3-bar-block w3-center">
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="home" onclick="closeNav()">Home</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="freebtn" onclick="closeNav()">Community</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="qnabtn" onclick="closeNav()">QnA</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="faqbtn" onclick="closeNav()">FAQ</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="sellbtn" onclick="closeNav()">Used Trade</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="schbtn" onclick="closeNav()">Search</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="cmpbtn" onclick="closeNav()">Campsite Information</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="revbtn" onclick="closeNav()">Review</span>
  </div>
</nav>

<!-- Page Content -->
<div class="w3-main w3-padding-large" style="margin-left:40%">
<c:if test="${empty SID}">
	<div class="w3-col">
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="joinbtn"><small><strong>Join</strong></small></span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="loginbtn"><small><strong>Login</strong></small></span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="mapbtn"><small><strong>Map</strong></small></span>
	</div>
</c:if>
<c:if test="${not empty SID}">
	<div class="w3-col">
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="mypagebtn">MyPage</span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="loutbtn">Logout</span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="mapbtn">Map</span>
	</div>
</c:if>
	  <!-- Menu icon to open sidebar -->
	  <span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto;right:0;" onclick="openNav()"><i class="fa fa-bars"></i></span>

  <!-- Header -->
  <header class="w3-container w3-center" style="padding:60px 16px" id="home">
    <h1 class="w3-jumbo" id="mainlogo"><a href="/camp24/main.cmp"><b>Camp 24</b></a></h1>
    <!-- <img src="/w3images/profile_girl.jpg" class="w3-image w3-hide-large w3-hide-small w3-round" style="display:block;width:60%;margin:auto;">
    <img src="/w3images/profile_girl.jpg" class="w3-image w3-hide-large w3-hide-medium w3-round" width="1000" height="1333"> -->
  </header>

  <!-- Portfolio Section -->
<div id="LoginForm">
	<div class="w3-container">
		<div class="login-form">
			<div class="main-div">
			    <div class="panel">
				   <h2>Camp24 Join</h2>
				   <p>Please enter your id and password</p>
			   	</div>
    			<form method="POST" action="" name="frm" id="frm"
			class="w3-col w3-margin-top w3-margin-bottom w3-padding">
			<div>
				<label for="name" class="w3-col s3 w3-right-align w3-margin-top clrgrey ft14 mgb10">Name : </label>
				<input type="text" name="name" id="name" class="w3-col s8 w3-margin-top mgl10 w3-input w3-border mgb10 w3-margin-bottom" placeholder="내용을 입력해주세요">
			</div>
			<div>
				<label for="id" class="w3-col s3 w3-right-align clrgrey ft14 mgb10" >I D : </label>
				<div class="w3-col s8 mgl10">
				<div class="w3-button w3-gray w3-right pd9-16 w3-margin-left" id="idck">ID Check</div>
					<div class="w3-rest pdr10">					
						<input type="text" name="id" id="id" class="w3-input w3-border mgb10 w3-margin-bottom" onkeydown="inputIdChk()" placeholder="내용을 입력해주세요">
						<input type="hidden" name="idCheck" id="idCheck" value="">
					</div>
					<span class="w3-col mgb10 w3-center" id="idmsg"></span>
				</div>
			</div>
			<div>
				<label for="repw" class="w3-col s3 w3-right-align clrgrey ft14 mgb10" >Password : </label>
					<div class="w3-col s8 mgl10 mgb10">
					<input type="password" id="pw" name="pw" class="w3-col w3-input w3-border w3-margin-bottom" placeholder="내용을 입력해주세요">
					</div>
				<label for="repw" class="w3-col s3 w3-right-align clrgrey ft14 mgb10">Password Check : </label>
				<div class="w3-col s8 mgl10 mgb10">
					<input type="password" id="repw" class="w3-col w3-input w3-border w3-margin-bottom" placeholder="내용을 입력해주세요">
					<span class="w3-col w3-text-red w3-center" id="repwmsg"># 비밀번호가 일치하지 않습니다.</span>
				</div>
			</div>
			<div>
				<label for="tel" class="w3-col s3 w3-right-align clrgrey ft14 mgb10">Phone Number : </label>
				<input type="text" name="tel" id="tel" class="w3-col s8 mgl10 w3-input w3-border mgb10 w3-margin-bottom" placeholder="내용을 입력해주세요">
			</div>
			<div>
				<label for="mail" class="w3-col s3 w3-right-align clrgrey ft14 mgb10">Mail : </label>
				<div class="w3-col s8 mgl10">
				<div class="w3-button w3-gray w3-right pd9-16 w3-margin-left" id="mailck">Mail Certification</div>
					<div class="w3-rest pdr10">
						<!-- <input type="text" name="id" id="id" class="w3-input w3-border mgb10 w3-margin-bottom" placeholder="내용을 입력해주세요"> -->
						<input type="text" name="mail" id="mail" class="w3-input w3-border mgb10 w3-margin-bottom" placeholder="내용을 입력해주세요">
					</div>
					<span class="w3-col mgb10 w3-center" id="mailmsg"></span>
				</div>
			</div>
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10">Gender : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center" id="gen">
					<div class="w3-half">
						<input type="radio" name="gen" id="mgen" class="w3-radio" value="M"> <label for="mgen"> Man</label>
					</div>
					<div class="w3-half">
						<input type="radio" name="gen" id="fgen" class="w3-radio" value="F"> <label for="fgen"> Woman</label>
					</div>
				</div>
			</div>
			<div class="w3-col" id="avtfr">
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10">Avatar : </label>
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
					 			<img src="/camp24/resources/img/avatar/${data.savename}" class="w3-col avtimg">
					 		</label>
					 		<input type="radio" name="ano" id="favt${data.ano}" value="${data.ano}">
					 	</div>
	</c:if>
</c:forEach>
			 		</div>
				</div>
			</div>
			<button type="submit" class="btn btn-primary w3-green" id="jbtn">Join</button>
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

