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

<!-- google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/main.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/base.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/user.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/login.js"></script>
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
#check{
	border-color: white;
}
</style>
<script type="text/javascript">
	document.ready(function(){
		$('#check').click(function(){
			$('#frm').submit();
		});
	});
</script>
</head>
<body>
<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->
<div id="LoginForm">
	<div class="w3-container">
		<div class="login-form">
			<div class="main-div">
			    <div class="panel">
				   <h2>Camp24 Find ID</h2>
			   	</div>
			    
<form method="post" class="form-signin" action="/camp24/user/find_id.cmp" name="findform">
		<div class="w3-col form-group">
			<input type="text" id="name" name="name" class="form-control" placeholder="Name">
		</div>
		
		<div class="w3-col form-group">
			<input type="text" id="tel" name="tel" class="form-control" placeholder="Phone">
		</div>

		<div class="form-label-group">
			<button type="submit" class="btn btn-primary w3-green" id="check">Check</button>
		</div>

		<!-- 이름과 전화번호가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<label class="w3-padding-32">일치하는 아이디가 없습니다</label>
		</c:if>

		<!-- 이름과 전화번호가 일치할 때 -->
		<c:if test="${check == 0}">
		<label class="w3-padding-32">찾으시는 아이디는' ${id}' 입니다</label>
			<div class="form-label-group">
				<a href="/camp24/member/login.cmp" class="btn btn-primary w3-lime" style="border-color: white;">Login</a>
			</div>
		</c:if>

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