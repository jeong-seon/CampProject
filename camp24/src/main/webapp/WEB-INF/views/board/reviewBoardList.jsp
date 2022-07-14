<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 방문후기</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<!-- top button -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


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
<link rel="stylesheet" type="text/css" href="/camp24/css/review.css">
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/reboard.js"></script>
<style type="text/css">
    .back-to-top {
    cursor: pointer;
    position: fixed;
    bottom: 40px;
    right: 40px;
    display:none;
}
</style>
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
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.dbtn').click(function(){
			$('#modal2').css('display', 'block');
		});
		
	});
</script>
</head>
<body>
<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->
<form method="POST" action="/camp24/reviewBoard/reviewBoardWriteProc.cmp" id="frm" name="frm">
	<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
	<input type="hidden" name="id" id="id" value="${SID}">
	<input type="hidden" name="rno" id="rno" >
	<input type="hidden" name="vw" id="vw" >
</form>
    			<h2 class="w3-padding-16 w3-center">방문후기 게시판</h2>
    <div class="container">
		<div class="row">
			<div class="col-sm-8">
				<hr/>
				
				
		<c:forEach var="data" items="${LIST}">
				<div class="review-block">
				
					<div class="row">
						<div class="col-sm-3">
							<img src="/camp24/resources/img/avatar/${data.avatar}" class="img-rounded">
							<div class="review-block-name" style="padding-left: 35px;"><span>${data.id}</span></div>
						</div>
						<div class="col-sm-9">
						
						<div class="review-block-title float-right" id="${data.rno}">
							<a href="/camp24/reviewBoard/likeCnt.json" style="margin-top: 10px; height: 25px;" class="w3-right btn text-white btn-danger like"> <i class="fa fa-heart"></i> ${data.likecount}</a>
						</div>
						
						<c:if test="${data.score eq 1}">
							<!-- 별점 1점 -->
							<div class="review-block-rate">
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</c:if>
						<c:if test="${data.score eq 2}">
							<!-- 별점 2점 -->
							<div class="review-block-rate">
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</c:if>
						<c:if test="${data.score eq 3}">
							<!-- 별점 3점 -->
							<div class="review-block-rate">
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</c:if>
						<c:if test="${data.score eq 4}">
							<!-- 별점 4점 -->
							<div class="review-block-rate">
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</c:if>
						<c:if test="${data.score eq 5}">
							<!-- 별점 5점 -->
							<div class="review-block-rate">
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</c:if>
							
							<div class="review-block-title">제목 : ${data.title}</div>
							<div class="review-block-title w3-right">조회수 : ${data.click}</div>
							<div class="review-block-title" style="margin-bottom: 0px;">캠핑장명 : ${data.cname}</div>
							<div class="w3-col">
								<div class="review-block-title w3-right" style="margin-bottom: 0px;"><small><i class="fa fa-clock-o"></i> 작성일 : ${data.sdate}</small></div>
							</div>
							<div class="w3-col">
							<c:if test="${not empty data.sedate}">
								<div class="review-block-title w3-right" style="margin-bottom: 0px;"><small><i class="fa fa-clock-o"></i> 수정일 : ${data.sedate}</small></div>
							</c:if>
							</div>
							
							<c:choose>
							        <c:when test="${fn:length(data.body) gt 3}">
							        <c:out value="${fn:substring(data.body, 0, 3)}" />...
							        </c:when>
							        <c:otherwise>
							        <c:out value="${data.body}">
							        </c:out></c:otherwise>
							</c:choose>
							<%-- <div class="w3-col review-block-description" id="rbody">${data.body}</div> --%>
						
			<!-- <div class="w3-container inblock">
				<div class="w3-content" style="width: 100px; height: 100px; overflow: hidden"> -->
			<c:forEach var="image" items="${IMAGE}">
				<c:if test="${data.rno eq image.imageno}">
					<div class="w3-display-center">
						<div class="w3-quarter w3-margin-top">
							<img style="display: inline-block; width: 120px; height: 120px;" src="${image.idir}${image.isavename}">
						</div>
					</div>
				</c:if>
			</c:forEach>
				<!-- </div>
			</div> -->
						<div class="w3-col w3-right w3-margin-top">
			<c:if test="${SID ne data.id}">
				<div class="w3-button w3-small w70 w3-khaki w3-right revList" id="${data.rno}">상세보기</div>
			</c:if>
			<c:if test="${SID eq data.id}">
				<div class="w3-button w3-small w70 w3-red w3-right dbtn" id="${data.rno}">삭제</div>
				<div class="w3-button w3-small w70 w3-lime w3-right ebtn" id="${data.rno}">수정</div>
				<div class="w3-button w3-small w70 w3-khaki w3-right revList" id="${data.rno}">상세보기</div>
			</c:if>
						</div>
		
						</div>
					</div>
					
				</div>
		</c:forEach>
		
				
				
			</div>
		</div>
		
    </div> 
    <!-- /container -->



  
 <!-- 페이지 처리 -->
	<div class="w3-center">
		<div class="w3-bar w3-border w3-margin-top w3-margin-bottom">
	<c:if test="${PAGE.startPage eq 1}">
			<div class="w3-bar-item w3-white">&laquo;</div>
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
			<div class="w3-bar-item w3-white">&raquo;</div>
		</c:if>
		<c:if test="${PAGE.endPage ne PAGE.totalPage}">
			<div class="w3-bar-item w3-button w3-hover-green pbtn" id="${PAGE.endPage + 1}">&raquo;</div>
		</c:if>
		</div>
	</div>
	<!-- 페이지 처리 태그 끝 -->
	
	
   <div id="modal2" class="w3-modal">
      <div class="w3-modal-content w3-animate-opacity w3-card-4 mxw500">
         <header class="w3-container w3-red"> 
            <span onclick="document.getElementById('modal2').style.display='none'" 
                  class="w3-button w3-display-topright">&times;</span>
            <h2 class="w3-center">알림</h2>
         </header>
         <div class="w3-container">
            <h5 class="w3-center w3-padding w3-margin" id="modalmsg">정말로 글을 삭제하시겠습니까?</h5>
         </div>
          <div class="w3-container w3-red">
            <div class="w3-col m2 w3-right w3-button" id="nbtn">아니오</div>
            <div class="w3-col m2 w3-right w3-button" id="ybtn">예</div>
         </div>
      </div>
   </div>
    <!-- Grid for photos -->
  
  <!-- Page top button -->
  <a style="width: 50px; height: 40px;" id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top w3-green" role="button" title="Click to return on the top page" data-toggle="tooltip" data-placement="left"><span class="glyphicon glyphicon-chevron-up"></span></a>
  
  
  
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
<!-- top button -->
<script type="text/javascript">
	$(document).ready(function(){
     $(window).scroll(function () {
            if ($(this).scrollTop() > 50) {
                $('#back-to-top').fadeIn();
            } else {
                $('#back-to-top').fadeOut();
            }
        });
        // scroll body to 0px on click
        $('#back-to-top').click(function () {
            $('#back-to-top').tooltip('hide');
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });
        
        $('#back-to-top').tooltip('show');

	});	
</script>

</body>
</html>

