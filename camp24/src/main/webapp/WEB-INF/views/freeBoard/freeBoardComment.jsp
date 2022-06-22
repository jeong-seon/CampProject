<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camp24 자유게시판 댓글 작성</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" type="text/css" href="/camp24/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/camp24/resources/css/user.css">
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/freeBoardComment.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/header.js"></script>
<style type="text/css">
	.box120 {
		width: 135px;
		height: auto;
	}
	.mid {
		position: relative;
		top: 5px;
		right: 5px;
	}
</style>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
</head>
<body class="w3-light-grey">
<div class="w3-container">
	<div class="w3-content mxw750 w3-margin-top">
		<!-- 페이지 헤더 -->
		<header class="w3-col w3-card-4 mgb20">
			<h1 class="w3-grey w3-center w3-padding mg0">Camp24 자유게시판 댓글 작성</h1>
		</header>
		
		<!-- 페이지 본문 -->
		<div class="w3-col">
			<div class="w3-col w3-round-large w3-card-4 w3-margin-bottom w3-padding">
				<div class="w3-col box120 pdAll10 w3-border-right">
					<img src="/camp24/img/avatar/${DATA.avatar}" class="inblock avtBox100 w3-border w3-border-grey">
					<span class="w3-col w3-center ft10 mid"><b>${SID}</b></span>
				</div>
				<div class="w3-rest w3-padding">
					<div class="w3-col w3-border-bottom">
						<span class="w3-col w3-left mgb10 ft10"><strong>윗글 내용 : </strong> ${DATA.fbody}</span>
					</div>
					<form method="POST" action="" id="frm" name="frm" class="w3-col w3-margin-top">
						<input type="hidden" id="nowPage" name="nowPage" value="${param.nowPage}">
						<input type="hidden" id="mno" name="mno" value="${DATA.mno}">
						<input type="hidden" id="upno" name="upno" value="${DATA.upno}">
						<input type="hidden" name="bno" value="${DATA.bno}">
						<input type="hidden" id="view" name="vw" value="${param.vw}">
						<input type="hidden" name="id" value="${SID}">
				<div class="w3-col w3-border-grey">
					<label for="title"><small><strong>제목</strong></small></label>
					<input type="text" name="title" id="title" class="w3-col w3-input w3-border w3-border-gray w3-padding ft12">
				</div>
				<div class="w3-col w3-border-grey">
					<label for="title"><small><strong>내용</strong></small></label>
						<textarea class="w3-col w3-padding ft12" id="body" name="body" style="resize: none;"></textarea>
				</div>
					</form>
				</div>
			</div>
		</div>
		
		<div class="w3-col w3-margin-top w3-card-4">
			<div class="w3-third w3-button w3-grey" id="listbtn">리스트</div>
			<div class="w3-third w3-button w3-light-grey" id="reset">리셋</div>
			<div class="w3-third w3-button w3-grey" id="cmtbtn">댓글 등록</div>
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>