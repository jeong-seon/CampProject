<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 My page Edit</title>
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
<script type="text/javascript" src="/camp24/js/camp24/edit.js"></script>
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
	.avtimg {
		width: 100px;
		height: 100px;
	}
	.avtbox {
		display: inline-block;
		width: 102px;
		height: 117px;
	}
	#pwmsg, #repwmsg {
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
	.w3-half{
		text-align: left;
	}
</style>
</head>
<body>
<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->

<h2 class="w3-center">??? ?????? ??????</h2>

<div class="w3-content w3-center">
<div class="inblock">
      <section class="panel panel-default" style="width: 700px;">
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
			??? ?????? ??????
	</c:if>
	<c:if test="${DATA.id ne SID}">
			${DATA.name} ?????? ??????
	</c:if>
		</h4>
</c:if>
<c:if test="${DATA.gen eq 'F'}">
		<h4 class="w3-orange w3-center w3-padding">
	<c:if test="${DATA.id eq SID}">
			??? ?????? ??????
	</c:if>
	<c:if test="${DATA.id ne SID}">
			${DATA.name} ?????? ??????
	</c:if>
		</h4>
</c:if>
            
            <hr>
            <div class="w3-content w3-center">
            
            
            
            <form method="POST" action="" name="frm" id="frm"
			class="w3-col w3-margin-top w3-margin-bottom w3-padding">
			<input type="hidden" id="tname" value="${DATA.name}">
			<input type="hidden" id="tmail" value="${DATA.mail}">
			<input type="hidden" id="ttel" value="${DATA.tel}">
			<input type="hidden" id="tano" value="${DATA.ano}">
			<input type="hidden" name="mno" value="${DATA.mno}">
			<div class="w3-col">
				<label for="name" class="w3-col s3 w3-right-align ft14 mgb10">?????? : </label>
				<input type="text" name="name" id="name" class="w3-col s8 mgl10 w3-input w3-border mgb10" value="${DATA.name}">
			</div>
			<div class="w3-col">
				<label for="pw" class="w3-col s3 w3-right-align ft14 mgb10">???????????? : </label>
				<input type="password" name="pw" id="pw" class="w3-col s8 mgl10 w3-input w3-border mgb10">
			</div>
			<div class="w3-col">
				<label for="repw" class="w3-col s3 w3-right-align ft14 mgb10">???????????? ?????? : </label>
				<input type="password" id="repw" class="w3-col s8 mgl10 w3-input w3-border mgb10">
				<span class="w3-col w3-text-red w3-center" id="repwmsg"># ??????????????? ???????????? ????????????.</span>
			</div>
			<div class="w3-col">
				<label for="mail" class="w3-col s3 w3-right-align ft14 mgb10">???????????? : </label>
				<input type="text" name="mail" id="mail" class="w3-col s8 mgl10 w3-input w3-border mgb10" value="${DATA.mail}">
			</div>
			<div class="w3-col">
				<label for="tel" class="w3-col s3 w3-right-align ft14 mgb10">???????????? : </label>
				<input type="text" name="tel" id="tel" class="w3-col s8 mgl10 w3-input w3-border mgb10" value="${DATA.tel}">
			</div>
			<div>
				<label class="w3-col s3 w3-right-align ft14 mgb10">???????????? : </label>
				<h4 class="w3-col s8 mgl10 w3-center mgb10 w3-center">${DATA.gen eq "M" ? "??????": "??????" }</h4>
			</div>
			<div class="w3-col" id="avtfr">
				<label class="w3-col s3 w3-right-align ft14 mgb10">??? ??? ??? : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center">
					<div class="avtboxfr w3-center w3-margin-top" id="avt">
<c:forEach var="data" items="${LIST}">
					 	<div class="avtbox">
					 		<label for="avt${data.ano}">
					 			<img src="/camp24/img/avatar/${data.savename}" class="w3-col avtimg img-circle">
					 		</label>
		<c:if test="${data.ano eq DATA.ano}">
				 		<input type="radio" name="ano" id="avt${data.ano}" value="${data.ano}" checked>
		</c:if>
		<c:if test="${data.ano ne DATA.ano}">
				 		<input type="radio" name="ano" id="avt${data.ano}" value="${data.ano}">
		</c:if>
				 		</div>
</c:forEach>
					</div>
				</div>
			</div>
			
			<div class="w3-col w3-margin-top" style="margin-bottom: 30px;">
				<div class="w3-col w3-button w3-green" id="pebtn">?????????</div>
			</div>

			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10 w3-margin-right">Type : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-left" id="type">
<c:forEach var="data" items="${PLIST}">
	<c:if test="${data.mupno eq '1001'}">
		<c:if test="${data.mname eq PDATA.pftype}">
					<div class="w3-half">
						<input type="radio" name="mtype" id="mtype${data.mmno}" class="w3-radio" value="${data.msname}" checked> <label for="type${data.mmno}"> ${data.msname}</label>
					</div>
		</c:if>
		<c:if test="${data.mname ne PDATA.pftype}">
					<div class="w3-half">
						<input type="radio" name="mtype" id="mtype${data.mmno}" class="w3-radio" value="${data.msname}"> <label for="type${data.mmno}"> ${data.msname}</label>
					</div>
		</c:if>
	</c:if>
</c:forEach>
				</div>
			</div>
			
			
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10 w3-margin-right">Price : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-left" id="price">
<c:forEach var="data" items="${PLIST}">
	<c:if test="${data.mupno eq '1011'}">
		<c:if test="${data.mname eq PDATA.pfprice}">
					<div class="w3-half">
						<input type="radio" name="mprice" id="price${data.mmno}" class="w3-radio" value="${data.msname}" checked> <label for="price${data.mmno}"> ${data.msname}</label>
					</div>
		</c:if>
		<c:if test="${data.mname ne PDATA.pfprice}">
					<div class="w3-half">
						<input type="radio" name="mprice" id="price${data.mmno}" class="w3-radio" value="${data.msname}"> <label for="price${data.mmno}"> ${data.msname}</label>
					</div>
		</c:if>
	</c:if>
</c:forEach>
				</div>
			</div>
			
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10 w3-margin-right">View : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-left" id="mview">
<c:forEach var="data" items="${PLIST}">
	<c:if test="${data.mupno eq '1021'}">
		<c:if test="${data.mname eq PDATA.pfview}">
					<div class="w3-half">
						<input type="radio" name="mview" id="view${data.mmno}" class="w3-radio" value="${data.msname}" checked> <label for="view${data.mmno}"> ${data.msname}</label>
					</div>
		</c:if>
		<c:if test="${data.mname ne PDATA.pfview}">
					<div class="w3-half">
						<input type="radio" name="mview" id="view${data.mmno}" class="w3-radio" value="${data.msname}"> <label for="view${data.mmno}"> ${data.msname}</label>
					</div>
		</c:if>
	</c:if>
</c:forEach>
				</div>
			</div>
			
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10 w3-margin-right">Pet : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-left" id="pet">
<c:forEach var="data" items="${PLIST}">
	<c:if test="${data.mupno eq '1031'}">
		<c:if test="${data.mname eq PDATA.pfpet}">
					<div class="w3-half">
						<input type="radio" name="mpet" id="pet${data.mmno}" class="w3-radio" value="${data.msname}" checked> <label for="pet${data.mmno}"> ${data.msname}</label>
					</div>
		</c:if>
		<c:if test="${data.mname ne PDATA.pfpet}">
					<div class="w3-half">
						<input type="radio" name="mpet" id="pet${data.mmno}" class="w3-radio" value="${data.msname}"> <label for="pet${data.mmno}"> ${data.msname}</label>
					</div>
		</c:if>
	</c:if>
</c:forEach>				
				</div>
			</div>
			
		</form>
		
            </div>
          </article>
        </div>
      </section>
<div class="w3-col w3-margin-top" style="margin-bottom: 30px;">
	<div class="w3-col w3-button w3-lime" id="ebtn">??????</div>
</div>
    
    
    <div id="editWin" class="w3-modal">
	    <div class="w3-modal-content w3-animate-top w3-card-4 mxw500">
			<header class="w3-container w3-red"> 
		        <span class="w3-button w3-display-topright" 
		        							id="editClose">&times;</span>
		        <h2 class="w3-center">??????</h2>
			</header>
	    	<div class="w3-container">
	        	<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="editmsg">????????? ????????? ????????????.</h3>
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







