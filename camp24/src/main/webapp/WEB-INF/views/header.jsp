<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" type="text/css" href="/camp24/resources/css/w3.css">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
html {
	position: relative;
	min-height: 100%;
	padding-bottom: 120px;
}
body{
	min-height: 100%;
}
footer {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	padding: 15px 0;
	text-align: center;
}
</style>
</head>
<body>
<c:if test="${empty SID}">
	<div style="width: 100%;">
		<div class="w3-col w3-border-bottom">
		<div class="w3-col m2 w3-button w3-green w3-hover-light-green" id="home"><strong>Camp 24</strong></div>
			<span class="w3-col m1 w3-button w3-dark-gray w3-right" id="joinbtn">Join</span>
			<span class="w3-col m1 w3-button w3-light-gray w3-right" id="loginbtn">Login</span>
			<span class="w3-col m1 w3-button w3-lime w3-right" id="mapbtn">지 도</span>
		</div>
	</div>
</c:if>
<c:if test="${not empty SID}">
	<div style="width: 100%;">
		<div class="w3-col w3-border-bottom pdb3">
		<div class="w3-col m3 w3-button w3-blue w3-hover-light-green" id="home"><strong>Camp 24</strong></div>
			<span class="w3-cell m1 w3-button w3-gray w3-right mt0" id="loutbtn">LogOut</span>
			<span class="w3-cell m1 w3-button w3-dark-gray w3-right mt0" id="mypagebtn">마이페이지</span>
			<span class="w3-col m1 w3-button w3-lime w3-right" id="mapbtn">지 도</span>
			<span class="w3-col m1 w3-button w3-green w3-right" id="faqbtn">FAQ</span>
		</div>
	</div>
</c:if>
<header class="w3-container w3-center w3-padding-32"> 
  <h1><b><a href="/camp24/main.cmp"><img style="width: 200px;"src="/camp24/resources/img/pic/logo6.png"></a></b></h1>
  <p>Welcome to the blog of <span class="w3-tag">Camp24</span></p>
</header>
<!-- 데이터 전송용 form 태그 -->
	<form method="POST" action="" id="hfrm" name="hfrm">
		<input type="hidden" name="id" value="${SID}">
		<input type="hidden" id="apinowPage" name="pageno">
	</form>
	
<div class="w3-content" style="max-width:1400px">
		<div class="w3-col w3-center">
			<div class="w3-col m2 w3-button w3-green w3-border-right" id="freebtn">자유게시판</div>
			<div class="w3-col m2 w3-button w3-green w3-border-right" id="qnabtn">QnA 게시판</div>
			<div class="w3-col m2 w3-button w3-green w3-border-right" id="sellbtn">중고거래 게시판</div>
			<div class="w3-col m2 w3-button w3-green w3-border-right" id="schbtn">검색게시판</div>
			<div class="w3-col m2 w3-button w3-green w3-border-right" id="cmpbtn">캠핑장 정보게시판</div>
			<div class="w3-col m2 w3-button w3-green w3-border-right" id="revbtn">방문후기 게시판</div>
		</div>