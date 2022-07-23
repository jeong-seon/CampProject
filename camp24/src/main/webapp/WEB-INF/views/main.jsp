<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Camp24</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<!-- top button -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


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
<script src="https://kit.fontawesome.com/08d8cbeedb.js" crossorigin="anonymous"></script>
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
#rank {
	position: relative;
	top: -10px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#msgWin').css('display', 'block');
	});
</script>
</head>
<body>
<%@ include file="include.jsp" %>
  <!-- Portfolio Section -->

    <!-- Grid for photos -->
    <div class="w3-container">
    
   		<div class="w3-col m6">
			<div class="w3-margin w3-white w3-center">
				<div class="w3-container">
					<div class="w3-border-bottom">
						<!-- <img id="rank" style="width: 40px; height: auto;" src="/camp24/resources/img/pic/rank.png"> -->
						<h2 class="inblock">Best Review</h2>
						<!-- <img id="rank" style="width: 40px; height: auto;" src="/camp24/resources/img/pic/rank.png"> -->
					</div>
					
						<div class="carousel-reviews broun-block">
						    <div class="content">
						        <div class="row">
						            <div id="carousel-reviews" class="carousel slide" data-ride="carousel">
						                <div class="carousel-inner">
		        <c:forEach var="data" items="${BLIST}">
						        <c:if test="${data.cnt eq 1}">
						                    <div class="item active">
						                	    <div class="col">
						        				    <div class="block-text rel zmin">
												        <a title="">
												        <c:choose>
														        <c:when test="${fn:length(data.rtitle) gt 10}">
														        <c:out value="${fn:substring(data.rtitle, 0, 10)}" /> ...
														        </c:when>
														        <c:otherwise>
														        <c:out value="${data.rtitle}">
														        </c:out></c:otherwise>
														</c:choose>
												        </a>
													    <div class="mark">
													    <div class="review-block-title w3-center" style="margin-bottom: 0px;">${data.cname}</div>
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
															
															<span style="height: 25px;" class="w3-left btn text-white btn-danger like"> <i class="fa fa-heart"></i> ${data.likecount}</span>
															<div class="review-block-title w3-right">조회수 : ${data.click}</div>
															
															<div class="w3-col">
																<div class="review-block-title w3-right" style="margin-bottom: 0px;"><small><i class="fa fa-clock-o"></i> 작성일 : ${data.sdate}</small></div>
															</div>
															<div class="w3-col">
															<c:if test="${not empty data.sedate}">
																<div class="review-block-title w3-right" style="margin-bottom: 0px;"><small><i class="fa fa-clock-o"></i> 수정일 : ${data.sedate}</small></div>
															</c:if>
															</div>
															
															
													    </div>
													    
													    <c:forEach var="image" items="${IMAGE}">
															<c:if test="${data.rno eq image.imageno}">
																<div class="inblock">
																	<div class="w3-col w3-margin-top">
																		<img class="w3-center inblock" style="border-radius: 10%; width: 120px; height: 120px;" src="${image.idir}${image.isavename}">
																	</div>
																</div>
															</c:if>
														</c:forEach>
														
														<p style="margin-top: 10px;">
														<c:choose>
														        <c:when test="${fn:length(data.rbody) gt 10}">
														        <c:out value="${fn:substring(data.rbody, 0, 10)}" /> ...
														        </c:when>
														        <c:otherwise>
														        <c:out value="${data.rbody}">
														        </c:out></c:otherwise>
														</c:choose>
														</p>
							
													    <ins class="ab zmin sprite sprite-i-triangle block"></ins>
											        </div>
													<div class="person-text rel">
										                <img style="margin-top: 40px; border-radius: 70%;" src="/camp24/img/avatar/${data.avatar}"/>
														<h5><strong>${data.id}</strong></h5>
													</div>
												</div>
											</div>
								</c:if>
						                
						                <c:if test="${data.cnt eq 2}">
						                    <div class="item">
						                	    <div class="col">
						        				    <div class="block-text rel zmin">
												        <a title="">
												        <c:choose>
														        <c:when test="${fn:length(data.rtitle) gt 10}">
														        <c:out value="${fn:substring(data.rtitle, 0, 10)}" /> ...
														        </c:when>
														        <c:otherwise>
														        <c:out value="${data.rtitle}">
														        </c:out></c:otherwise>
														</c:choose>
												        </a>
													    <div class="mark">
													    <div class="review-block-title w3-center" style="margin-bottom: 0px;">${data.cname}</div>
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
															
															<span style="height: 25px;" class="w3-left btn text-white btn-danger like"> <i class="fa fa-heart"></i> ${data.likecount}</span>
															<div class="review-block-title w3-right">조회수 : ${data.click}</div>
															
															<div class="w3-col">
																<div class="review-block-title w3-right" style="margin-bottom: 0px;"><small><i class="fa fa-clock-o"></i> 작성일 : ${data.sdate}</small></div>
															</div>
															<div class="w3-col">
															<c:if test="${not empty data.sedate}">
																<div class="review-block-title w3-right" style="margin-bottom: 0px;"><small><i class="fa fa-clock-o"></i> 수정일 : ${data.sedate}</small></div>
															</c:if>
															</div>
															
															
													    </div>
													    
													    <c:forEach var="image" items="${IMAGE}">
															<c:if test="${data.rno eq image.imageno}">
																<div class="inblock">
																	<div class="w3-col w3-margin-top">
																		<img class="w3-center inblock" style="border-radius: 10%; width: 120px; height: 120px;" src="${image.idir}${image.isavename}">
																	</div>
																</div>
															</c:if>
														</c:forEach>
														
														<p style="margin-top: 10px;">
														<c:choose>
														        <c:when test="${fn:length(data.rbody) gt 10}">
														        <c:out value="${fn:substring(data.rbody, 0, 10)}" /> ...
														        </c:when>
														        <c:otherwise>
														        <c:out value="${data.rbody}">
														        </c:out></c:otherwise>
														</c:choose>
														</p>
							
													    <ins class="ab zmin sprite sprite-i-triangle block"></ins>
											        </div>
													<div class="person-text rel">
										                <img style="margin-top: 40px; border-radius: 70%;" src="/camp24/img/avatar/${data.avatar}"/>
														<h5><strong>${data.id}</strong></h5>
													</div>
												</div>
											</div>
										</c:if>
											
										<c:if test="${data.cnt eq 3}">
											<div class="item">
						                	    <div class="col">
						        				    <div class="block-text rel zmin">
												        <a title="">
												        <c:choose>
														        <c:when test="${fn:length(data.rtitle) gt 10}">
														        <c:out value="${fn:substring(data.rtitle, 0, 10)}" /> ...
														        </c:when>
														        <c:otherwise>
														        <c:out value="${data.rtitle}">
														        </c:out></c:otherwise>
														</c:choose>
												        </a>
													    <div class="mark">
													    <div class="review-block-title w3-center" style="margin-bottom: 0px;">${data.cname}</div>
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
															
															<span style="height: 25px;" class="w3-left btn text-white btn-danger like"> <i class="fa fa-heart"></i> ${data.likecount}</span>
															<div class="review-block-title w3-right">조회수 : ${data.click}</div>
															
															<div class="w3-col">
																<div class="review-block-title w3-right" style="margin-bottom: 0px;"><small><i class="fa fa-clock-o"></i> 작성일 : ${data.sdate}</small></div>
															</div>
															<div class="w3-col">
															<c:if test="${not empty data.sedate}">
																<div class="review-block-title w3-right" style="margin-bottom: 0px;"><small><i class="fa fa-clock-o"></i> 수정일 : ${data.sedate}</small></div>
															</c:if>
															</div>
															
															
													    </div>
													    
													    <c:forEach var="image" items="${IMAGE}">
															<c:if test="${data.rno eq image.imageno}">
																<div class="inblock">
																	<div class="w3-col w3-margin-top">
																		<img class="w3-center inblock" style="border-radius: 10%; width: 120px; height: 120px;" src="${image.idir}${image.isavename}">
																	</div>
																</div>
															</c:if>
														</c:forEach>
														
														<p style="margin-top: 10px;">
														<c:choose>
														        <c:when test="${fn:length(data.rbody) gt 10}">
														        <c:out value="${fn:substring(data.rbody, 0, 10)}" /> ...
														        </c:when>
														        <c:otherwise>
														        <c:out value="${data.rbody}">
														        </c:out></c:otherwise>
														</c:choose>
														</p>
							
													    <ins class="ab zmin sprite sprite-i-triangle block"></ins>
											        </div>
													<div class="person-text rel">
										                <img style="margin-top: 40px; border-radius: 70%;" src="/camp24/img/avatar/${data.avatar}"/>
														<h5><strong>${data.id}</strong></h5>
													</div>
												</div>
											</div>
										</c:if>
					</c:forEach>
						                </div>
						                <a class="left carousel-control" href="#carousel-reviews" role="button" data-slide="prev">
						                    <span class="glyphicon glyphicon-chevron-left"></span>
						                </a>
						                <a class="right carousel-control" href="#carousel-reviews" role="button" data-slide="next">
						                    <span class="glyphicon glyphicon-chevron-right"></span>
						                </a>
						            </div>
						        </div>
						    </div>
						</div>
					
				
					
					
					
				</div>
   			</div>
   		</div>
    
    <div class="w3-col m6">
			<div class="w3-margin w3-white w3-center">
				<div class="w3-container">
					<div class="w3-border-bottom">
						<h2>랜덤 추천 캠핑장 리스트</h2>
					</div>
					
					<br>
		<c:forEach var="data" items="${LIST}">
					<h5><strong>캠핑장명 : ${data.facltNm}</strong></h5>
					<div id="image" style="width: 100%; height: 300px; overflow: hidden;">
			<c:if test="${not empty data.firstImageUrl && not empty data.homepage}">
					<a href="${data.homepage}"><img id="image" style="width: 80%" src="${data.firstImageUrl}"></a>
			</c:if>
			<c:if test="${not empty data.firstImageUrl && empty data.homepage}">
					<img id="image" style="width: 80%" src="${data.firstImageUrl}">
			</c:if>
			<c:if test="${empty data.firstImageUrl && empty data.homepage}">
					<img id="image" style="width: 80%" src="/camp24/resources/img/pic/noimage.png">
			</c:if>
			<c:if test="${empty data.firstImageUrl && not empty data.homepage}">
					<a href="${data.homepage}"><img id="image" style="width: 80%" src="/camp24/resources/img/pic/noimage.png"></a>
			</c:if>
					</div>
					<h5 style="font-size: 10pt;"># 이미지 클릭 시 해당 홈페이지로 이동합니다 #</h5>
					<h5 style="font-size: 10pt;"># 홈페이지가 없는 경우는 클릭되지 않습니다 #</h5>
		</c:forEach>
					<!--
					<p style="margin-bottom: 20px;"></p>
					<a href="" id="prev"><img src="/camp24/resources/img/pic/prev.png" width="50px" height="auto"></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="" id="next"><img src="/camp24/resources/img/pic/next.png" width="50px" height="auto"></a>
					<p style="margin-bottom: 20px;"></p>
					-->
					<a href="" class="w3-green w3-button">변경</a>
				</div>
   			</div>
   		</div>
   		
   	
  <!-- End Portfolio Section -->
  </div>
  
<c:if test="${(not empty SID) and (MSG_CHECK eq 'OK')}">
	<div id="msgWin" class="w3-modal">
		<div class="w3-modal-content w3-animate-top w3-card-4 mxw500">
			<header class="w3-container w3-green"> 
				<span class="w3-button w3-display-topright" id="msgClose">&times;</span>
				<h2 class="w3-center">알림</h2>
			</header>
			<div class="w3-container">
				<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="msg">${SID}님이 로그인 하셨습니다</h3>
			</div>
		</div>
	</div>
</c:if>
  
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
