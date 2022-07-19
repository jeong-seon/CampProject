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
.typeimg, .priceimg, .viewimg, .petimg {
		width: 100px;
		height: 100px;
	}
	.typebox, .pricebox, .viewbox, .petbox {
		display: inline-block;
		width: 100px;
		height: 100px;
	}
	#pwmsg, #repwmsg, #typefr, #pricefr, #viewfr, #petfr, #idmsg {
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
	border-radius: 70%;
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
				   <h2>Camp24 Preference Survey</h2>
				   <p>Please check your Preference Information</p>
			   	</div>
    			<form method="POST" action="" name="frm" id="frm"
			class="w3-col w3-margin-top w3-margin-bottom w3-padding">
			
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10">Type : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center" id="type">
					<div class="w3-half">
						<input type="radio" name="type" id="ytype" class="w3-radio" value="TY"> <label for="ytype"> YES</label>
					</div>
					<div class="w3-half">
						<input type="radio" name="type" id="ntype" class="w3-radio" value="TN"> <label for="ntype"> NO</label>
					</div>
				</div>
			</div>
			<div class="w3-col" id="typefr">
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10"> </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center">
					<div class="typeboxfr w3-center w3-margin-top" id="sytype">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.smenu eq 'TY'}">		
					 	<div class="typebox">
					 		<label for="sytype${data.mmno}">
					 			<img src="/camp24/resources/img/preference/${data.msavename}" class="w3-col typeimg">
					 		</label>
					 		<input type="radio" name="mmno" id="sytype${data.mmno}" value="${data.mmno}">
					 	</div>
	</c:if>
</c:forEach>
					</div>
					 <div class="typeboxfr w3-center w3-margin-top" id="sntype">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.smenu eq 'TN'}">
					 	<div class="typebox">
							<label for="sntype${data.mmno}">
								<img src="/camp24/resources/img/preference/${data.msavename}" class="w3-col typeimg">
							</label>
							<input type="radio" name="mmno" id="sntype${data.mmno}" value="${data.mmno}">
					 	</div>
	</c:if>
</c:forEach>
			 		</div>
				</div>
			</div>
			
			
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10">Price : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center" id="price">
					<div class="w3-half">
						<input type="radio" name="price" id="yprice" class="w3-radio" value="PY"> <label for="yprice"> YES</label>
					</div>
					<div class="w3-half">
						<input type="radio" name="price" id="nprice" class="w3-radio" value="PN"> <label for="nprice"> NO</label>
					</div>
				</div>
			</div>
			<div class="w3-col" id="pricefr">
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10"> </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center">
					<div class="priceboxfr w3-center w3-margin-top" id="syprice">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.smenu eq 'PY'}">		
					 	<div class="pricebox">
					 		<label for="syprice${data.mmno}">
					 			<img src="/camp24/resources/img/preference/${data.msavename}" class="w3-col priceimg">
					 		</label>
					 		<input type="radio" name="mmno" id="syprice${data.mmno}" value="${data.mmno}">
					 	</div>
	</c:if>
</c:forEach>
					</div>
					 <div class="priceboxfr w3-center w3-margin-top" id="snprice">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.smenu eq 'PN'}">
					 	<div class="pricebox">
							<label for="sntype${data.mmno}">
								<img src="/camp24/resources/img/preference/${data.msavename}" class="w3-col priceimg">
							</label>
							<input type="radio" name="mmno" id="snprice${data.mmno}" value="${data.mmno}">
					 	</div>
	</c:if>
</c:forEach>
			 		</div>
				</div>
			</div>
			
			
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10">View : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center" id="mview">
					<div class="w3-half">
						<input type="radio" name="mview" id="yview" class="w3-radio" value="VY"> <label for="yview"> YES</label>
					</div>
					<div class="w3-half">
						<input type="radio" name="mview" id="nview" class="w3-radio" value="VN"> <label for="nview"> NO</label>
					</div>
				</div>
			</div>
			<div class="w3-col" id="viewfr">
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10"> </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center">
					<div class="viewboxfr w3-center w3-margin-top" id="syview">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.smenu eq 'VY'}">		
					 	<div class="viewbox">
					 		<label for="syview${data.mmno}">
					 			<img src="/camp24/resources/img/preference/${data.msavename}" class="w3-col viewimg">
					 		</label>
					 		<input type="radio" name="mmno" id="syview${data.mmno}" value="${data.mmno}">
					 	</div>
	</c:if>
</c:forEach>
					</div>
					 <div class="viewboxfr w3-center w3-margin-top" id="snview">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.smenu eq 'VN'}">
					 	<div class="viewbox">
							<label for="snview${data.mmno}">
								<img src="/camp24/resources/img/preference/${data.msavename}" class="w3-col viewimg">
							</label>
							<input type="radio" name="mmno" id="snview${data.mmno}" value="${data.mmno}">
					 	</div>
	</c:if>
</c:forEach>
			 		</div>
				</div>
			</div>
			
			
			<div>
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10">Pet : </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center" id="pet">
					<div class="w3-half">
						<input type="radio" name="pet" id="ypet" class="w3-radio" value="PY2"> <label for="ypet"> YES</label>
					</div>
					<div class="w3-half">
						<input type="radio" name="pet" id="npet" class="w3-radio" value="PN2"> <label for="npet"> NO</label>
					</div>
				</div>
			</div>
			<div class="w3-col" id="petfr">
				<label class="w3-col s3 w3-right-align clrgrey ft14 mgb10"> </label>
				<div class="w3-col s8 mgl10 mgb10 w3-center">
					<div class="typeboxfr w3-center w3-margin-top" id="sypet">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.smenu eq 'PY2'}">		
					 	<div class="petbox">
					 		<label for="sypet${data.mmno}">
					 			<img src="/camp24/resources/img/preference/${data.msavename}" class="w3-col petimg">
					 		</label>
					 		<input type="radio" name="mmno" id="sypet${data.mmno}" value="${data.mmno}">
					 	</div>
	</c:if>
</c:forEach>
					</div>
					 <div class="petboxfr w3-center w3-margin-top" id="snpet">
<c:forEach var="data" items="${LIST}">
	<c:if test="${data.smenu eq 'PN2'}">
					 	<div class="petbox">
							<label for="snpet${data.mmno}">
								<img src="/camp24/resources/img/preference/${data.msavename}" class="w3-col petimg">
							</label>
							<input type="radio" name="mmno" id="snpet${data.mmno}" value="${data.mmno}">
					 	</div>
	</c:if>
</c:forEach>
			 		</div>
				</div>
			</div>
			
			<button type="submit" class="w3-half w3-button btn-primary w3-blue w3-hover-aqua" id="sbtn">Submit</button>
			<div class="w3-half w3-button w3-red w3-hover-orange" id="hbtn">Home</div>
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

