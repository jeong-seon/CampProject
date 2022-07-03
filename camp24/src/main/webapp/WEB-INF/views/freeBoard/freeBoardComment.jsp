<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 자유게시판 댓글 작성</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

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
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/freeBoardComment.js"></script>
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
.form-area{
    background-color: #FAFAFA;
	padding: 10px 40px 60px;
	margin: 10px 0px 60px;
	border: 1px solid GREY;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#msgWin').css('display', 'block');
		
		$('.dbtn').click(function(){
			$('#modal2').css('display', 'block');
		});
	});
</script>
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

<div class="w3-container w3-center">
    <div class="form-area">
        <form method="POST" action="" id="frm" name="frm">
	        <input type="hidden" id="nowPage" name="nowPage" value="${param.nowPage}">
			<input type="hidden" id="mno" name="mno" value="${DATA.mno}">
			<input type="hidden" id="upno" name="upno" value="${DATA.upno}">
			<input type="hidden" name="bno" value="${DATA.bno}">
			<input type="hidden" id="view" name="vw" value="${param.vw}">
			<input type="hidden" name="id" value="${SID}">
        <br style="clear:both">
                    <h2 style="margin-bottom: 25px; text-align: center;">Community 댓글 작성</h2>
						<img src="/camp24/img/avatar/${DATA.avatar}" class="w3-center w3-circle">
						<span class="w3-col w3-center mgb10 ft10"><b>${SID}</b></span>
					    	<div class="w3-col w3-border-top">
								<span class="w3-col w3-left mgb10 ft10 w3-margin-top"><strong>윗글 내용 : </strong> ${DATA.fbody}</span>
							</div>
    				<div class="form-group">
    					<div style="text-align: left;">
	    					<label for="title" style="text-align: left;"><strong>제목</strong></label>
    					</div>
						<input type="text" class="form-control" id="title" name="title" placeholder="Title">
					</div>
                    <div class="form-group">
                    	<div style="text-align: left;">
	    					<label for="body" style="text-align: left;"><strong>본문</strong></label>
    					</div>
                    	<textarea style="resize: none;" class="form-control" id="body" name="body" placeholder="Body" rows="7"></textarea>
                    </div>
        <button type="button" class="btn btn-primary pull-right w3-green w3-margin-left" id="cmtbtn">등록</button>
        <button type="button" class="btn btn-primary pull-right w3-green w3-margin-left" id="rbtn">리셋</button>
        <button type="button" class="btn btn-primary pull-right w3-green w3-margin-left" id="listbtn">리스트</button>
        </form>
        
    </div>
</div>
</div>



</div>
    <!-- Grid for photos -->
    
  <!-- End Portfolio Section -->
  
  


  <!-- About Section -->
  
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




<!-- END MAIN -->
