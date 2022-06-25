<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Camp24 QnA 게시판</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/camp24/resources/css/w3.css">
<link rel="stylesheet" type="text/css" href="/camp24/resources/css/user.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/qnaBoard.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/header.js"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.dbtn').click(function(){
			$('#modal2').css('display', 'block');
		});
	});
</script>
</head>
<body class="w3-light-grey">
<div class="w3-container">

<div class="w3-main">
<h2 class="w3-green w3-padding-16 w3-center">QnA 게시판</h2>
  <div class="w3-row w3-padding-64 pdAll20">
  <div class="w3-button w3-lime w3-right" id="wbtn">질문 작성</div>
  
<c:forEach var="data" items="${LIST}">
		<div class="w3-col" style="padding-left: ${data.step * 70}px">
			<div class="w3-col w3-round-large w3-card-4 w3-margin-bottom w3-padding">
				<div class="w3-col mgt20 box120 pdAll10 w3-border-right" style="width: 135px;">
					<img src="/camp24/resources/img/avatar/${data.avatar}" class="inblock avtBox100 w3-border w3-border-grey">
							<span class="w3-col w3-center mgb10 ft10">${data.id}</span>
				</div>
				<div class="w3-rest w3-padding">
					<div class="w3-col w3-border-bottom">
						<div class="w3-cell w3-right" id="${data.qno}">
			<c:if test="${SID ne data.id}">
							<div class="w3-button w3-small w70 w3-green w3-right cmtbtn">답글</div>
			</c:if>
			<c:if test="${SID eq data.id}">
							<div class="w3-button w3-small w70 w3-orange w3-right ebtn">수정</div>
							<div class="w3-button w3-small w70 w3-red w3-right dbtn">삭제</div>
			</c:if>
						</div>
						<div>
					<c:if test="${data.qtitle eq '[ 답변 ]'}">
							<span class="w3-col w3-left mgb10 ft10"><strong>${data.qtitle}</strong></span>
					</c:if>
					<c:if test="${data.qtitle ne '[ 답변 ]'}">
						<span class="w3-col w3-left mgb10 ft10"><strong>제목 : ${data.qtitle}</strong></span>
					</c:if>
					<c:if test="${not empty data.sedate}">
							<span class="w3-third w3-right mgb10 ft10"><small>수정일 : ${data.sedate}</small></span>
					</c:if>	
							<span class="w3-third w3-right mgb10 ft10"><small>작성일 : ${data.sdate}</small></span>
						</div>
					</div>
					<div class="w3-col w3-margin-top">
						<span class="w3-col w3-padding ft12">${data.qbody}</span>
					</div>
				</div>
			</div>
		</div>
</c:forEach>
  </div>
  
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

<!-- END MAIN -->
</div>

<!-- 메세지 출력 모달창  -->
<c:if test="${not empty MSG}">
	  <div id="modal" class="w3-modal" style="display:block;">
	 	 <div class="w3-modal-content mxw650 w3-animate-opacity w3-card-4">
			<header class="w3-container w3-green">
	      		<span onclick="document.getElementById('modal').style.display='none'"
	     		 class="w3-button w3-display-topright">&times;</span>
	      <h2>알림</h2>
	    </header>
	    <div class="w3-container w3-center">
	      <h4>${MSG}</h4>
	    </div>
	  </div>
	</div>
</c:if>

   <div id="modal2" class="w3-modal">
      <div class="w3-modal-content w3-animate-opacity w3-card-4 mxw500">
         <header class="w3-container w3-green"> 
            <span onclick="document.getElementById('modal2').style.display='none'" 
                  class="w3-button w3-display-topright">&times;</span>
            <h2 class="w3-center">알림</h2>
         </header>
         <div class="w3-container">
            <h5 class="w3-center w3-padding w3-margin" id="modalmsg">정말로 글을 삭제하시겠습니까?</h5>
         </div>
          <div class="w3-container w3-green">
            <div class="w3-col m2 w3-right w3-button" id="nbtn">아니오</div>
            <div class="w3-col m2 w3-right w3-button" id="ybtn">예</div>
         </div>
      </div>
   </div>

	<!-- 데이터 전송용 form 태그 -->
	<form method="POST" action="/camp24/qnaBoard/qnaBoardList.cmp" id="frm" name="frm">
		<input type="hidden" id="nowPage" name="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="id" value="${SID}">
		<input type="hidden" id="qno" name="bno">
		<input type="hidden" id="view" name="vw" value="/camp24/qnaBoard/qnaBoardList.cmp">
	</form>
</div>
</body>
</html>
<%@ include file="../footer.jsp" %>