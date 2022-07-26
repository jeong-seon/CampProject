<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="home" onclick="closeNav()">홈</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="freebtn" onclick="closeNav()">자유게시판</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="qnabtn" onclick="closeNav()">Q & A</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="faqbtn" onclick="closeNav()">F A Q</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="sellbtn" onclick="closeNav()">중고거래</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="schbtn" onclick="closeNav()">캠핑장 검색</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="cmpbtn" onclick="closeNav()">캠핑장 정보</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="revbtn" onclick="closeNav()">방문후기</span>
  </div>
</nav>

<!-- Page Content -->
<div class="w3-main w3-padding-large" style="margin-left:40%">
<c:if test="${empty SID}">
	<div class="w3-col m9">
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="joinbtn"><small><strong>Join</strong></small></span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="loginbtn"><small><strong>Login</strong></small></span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="mapbtn"><small><strong>Map</strong></small></span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="weather"><small><strong>Weather</strong></small></span>
	</div>
</c:if>
<c:if test="${not empty SID}">
	<div class="w3-col m9">
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="mypagebtn"><small><strong>MyPage</strong></small></span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="loutbtn"><small><strong>Logout</strong></small></span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="mapbtn"><small><strong>Map</strong></small></span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="weather"><small><strong>Weather</strong></small></span>
	</div>
</c:if>
	  <!-- Menu icon to open sidebar -->
	  <span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto;right:0;" onclick="openNav()"><i class="fa fa-bars"></i></span>

  <!-- Header -->
  <header class="w3-container w3-center" style="padding:60px 16px; padding-bottom: 0px;" id="home">
    <h1 class="w3-jumbo" id="mainlogo"><a href="/camp24/main.cmp"><b style="color: black !important; text-decoration-color: black !important;">Camp 24</b></a></h1>
  </header>

  <div id="weatherWin" class="w3-modal">
	    <div class="w3-modal-content w3-animate-top w3-card-4 mxw500">
			<header class="w3-container w3-green"> 
		        <span class="w3-button w3-display-topright" 
		        							id="weatherClose">&times;</span>
		        <h2 class="w3-center">날씨 정보</h2>
			</header>
	    	<div class="w3-container">
	        	<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="weathermsg1"></h3>
	        	<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="weathermsg2"></h3>
	        	<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="weathermsg3"></h3>
	        	<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="weathermsg4"></h3>
	        	<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="weathermsg5"></h3>
	        	<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="weathermsg6"></h3>
	    	</div>
	    </div>
 	</div>