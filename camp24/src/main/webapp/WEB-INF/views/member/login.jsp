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
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Hahmlet:wght@300&family=Song+Myung&display=swap" rel="stylesheet">

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
body, h1,h2,h3,h4,h5,h6 {font-family: 'Song Myung', serif;}
.w3-row-padding img {margin-bottom: 12px}
.bgimg {
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url('/camp24/resources/img/pic/14.png');
  min-height: 100%;
}
#lbtn{
	border-color: white;
}
</style>
</head>
<body>
<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->
<div id="LoginForm">
	<div class="w3-container">
		<div class="login-form">
			<div class="main-div">
			    <div class="panel">
				   <h2>Camp24 Login</h2>
				   <p>Please enter your id and password</p>
			   	</div>
			    <form method="POST" action="" id="frm" name="frm">
			
			        <div class="w3-col form-group">
			
			
			            <input type="text" class="form-control" id="id" name="id" placeholder="ID">
			
			        </div>
			
			        <div class="w3-col form-group">
			
			            <input type="password" class="form-control" id="pw" name="pw" placeholder="Password">
			
			        </div>
			        <div class="forgot">
			       		<a href="">Forgot password?</a>
					</div>
			        <button type="submit" class="btn btn-primary w3-green" id="lbtn">Login</button>

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
