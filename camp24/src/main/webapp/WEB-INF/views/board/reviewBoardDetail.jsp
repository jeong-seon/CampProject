 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Camp24 방문후기 상세보기</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" type="text/css" href="/camp24/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/camp24/resources/css/user.css">
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/reboard.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/header.js"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#dbtn').click(function(){
			$('#modal').css('display', 'block');
		});
	});
</script>
</head>
<body class="w3-light-grey">
<div class="w3-container">
<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main">
<h2 class="w3-green w3-padding-16 w3-center">방문후기 상세보기</h2>
  <div class="w3-row w3-padding-64">
  
  	<form method="POST" action="/camp24/reviewboard/reviewBoardWriteProc.cmp" id="Frm" name="Frm">
			<input type="hidden" name="title" id="title" value="${data.title}">
			<input type="hidden" name="body" id="body" value="${data.body}">
			<input type="hidden" name="id" id="id" value="${data.id}">
			<input type="hidden" name="rno" id="rno" value="${data.rno}">
			
	</form>

<c:forEach var="data" items="${LIST}">
		<div class="w3-col">
			<div class="w3-col w3-round-large w3-card-4 w3-margin-bottom w3-padding">
				<div class="w3-col box120 pdAll10 w3-border-right" style="width: 135px;">
					<img src="/camp24/resources/img/avatar/${data.avatar}" class="inblock avtBox100 w3-border w3-border-grey">
					<div class="w3-center">
						<small><strong>${data.id}</strong></small>
					</div>
				</div>
				<div class="w3-rest w3-padding">
					<div class="w3-col w3-border-bottom">
						<div class="w3-cell w3-right" id="${data.rno}">
			<%-- <c:if test="${SID eq data.id}">
				<div class="w3-button w3-grey w3-hover-red w3-right debtn" 
				style="position:relative; top:30px;">리뷰삭제</div>
			</c:if> --%>
						</div>
						<div>
							<span class="w3-half w3-left mgb10 ft10"><strong>제목 : ${data.title}</strong></span>
							<span class="w3-half w3-left mgb10 ft10"><strong>캠핑장 : ${data.cname}</strong></span>
							<span class="w3-third w3-left mgb10 ft10"><small>작성일 : ${data.sdate}</small></span>
					<c:if test="${data.score eq 1}">
							<span class="w3-third w3-left mgb10 ft10"><small>별점 : ★</small></span>
					</c:if>
					<c:if test="${data.score eq 2}">
							<span class="w3-third w3-left mgb10 ft10"><small>별점 : ★ ★</small></span>
					</c:if>
					<c:if test="${data.score eq 3}">
							<span class="w3-third w3-left mgb10 ft10"><small>별점 : ★ ★ ★</small></span>
					</c:if>
					<c:if test="${data.score eq 4}">
							<span class="w3-third w3-left mgb10 ft10"><small>별점 : ★ ★ ★ ★</small></span>
					</c:if>
					<c:if test="${data.score eq 5}">
							<span class="w3-third w3-left mgb10 ft10"><small>별점 : ★ ★ ★ ★ ★</small></span>
					</c:if>
							<span class="w3-third w3-left mgb10 ft10"><small>조회수 : ${data.click}</small></span>
						</div>
					</div>
					<div class="w3-col w3-margin-top">
						<span class="w3-col w3-padding ft12">${data.body}</span>
					</div>
<c:forEach var="image" items="${IMAGE}">
			<c:if test="${data.rno eq image.imageno}">
					<div class="w3-col w3-margin-top">
						<img style="width: 200px; height: auto;" src="${image.idir}/${image.isavename}">
					</div>
			</c:if>
</c:forEach>
				</div>
			</div>
		</div>
</c:forEach>


 <!-- 페이지 처리 -->
	<div class="w3-center">
		<div class="w3-bar w3-border w3-margin-top w3-margin-bottom">
	<c:if test="${PAGE.startPage eq 1}">
			<div class="w3-bar-item w3-light-grey">&laquo;</div>
	</c:if>
	<c:if test="${PAGE.startPage ne 1}">
			<div class="w3-bar-item w3-button w3-hover-green pbtn" id="${PAGE.startPage - 1}">&laquo;</div>
	</c:if>
	<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
		<c:if test="${page eq PAGE.nowPage}">
			<div class="w3-bar-item w3-lime">${page}</div>
		</c:if>
		<c:if test="${page ne PAGE.nowPage}">
			<div class="w3-bar-item w3-button w3-hover-green pbtn" id="${page}">${page}</div>
		</c:if>
	</c:forEach>
		<c:if test="${PAGE.endPage eq PAGE.totalPage}">
			<div class="w3-bar-item w3-light-grey">&raquo;</div>
		</c:if>
		<c:if test="${PAGE.endPage ne PAGE.totalPage}">
			<div class="w3-bar-item w3-button w3-hover-green pbtn" id="${PAGE.endPage + 1}">&raquo;</div>
		</c:if>
		</div>
	</div>
	<!-- 페이지 처리 태그 끝 -->
	<form method="POST" action="/camp24/reviewBoard/reviewBoardList.cmp" id="pageFrm" name="pageFrm">
			<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
			
	</form>
	
		<div class="w3-col w3-margin-top w3-card-4">
	<c:if test="${SID eq DATA.id}">
			<div class="w3-quarter w3-button w3-blue" id="hbtn">home</div>
			<div class="w3-quarter w3-button w3-green" id="listbtn">리스트</div>
			<div class="w3-quarter w3-button w3-deep-orange" id="edit">글수정</div>
			<div class="w3-quarter w3-button w3-red" id="dbtn">글삭제</div>
	</c:if>
	<c:if test="${SID ne DATA.id}">
			<div class="w3-half w3-button w3-blue" id="hbtn">home</div>
			<div class="w3-half w3-button w3-green" id="listbtn">리스트</div>
	</c:if>
		</div>
	
	<div id="modal" class="w3-modal">
		<div class="w3-modal-content w3-animate-top w3-card-4 mxw500">
			<header class="w3-container w3-teal"> 
				<span onclick="document.getElementById('modal').style.display='none'" 
						class="w3-button w3-display-topright">&times;</span>
				<h2 class="w3-center">게시글 삭제</h2>
			</header>
			<div class="w3-container">
				<h5 class="w3-center w3-padding w3-margin" id="modalmsg">정말로 글삭제를 하시겠습니까?</h5>
			</div>
	    	<footer class="w3-container w3-teal">
				<div class="w3-col m2 w3-right w3-button" id="nbtn">아니오</div>
				<div class="w3-col m2 w3-right w3-button" id="ybtn">예</div>
			</footer>
		</div>
	</div>
<!-- END MAIN -->
</div>

</div>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>