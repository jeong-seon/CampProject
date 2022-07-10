<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 방문후기 수정</title>
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
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/camp24/css/main.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/base.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/user.css">
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/reboard.js"></script>
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
.form-area{
    background-color: #FAFAFA;
	padding: 10px 40px 60px;
	margin: 10px 0px 60px;
	border: 1px solid GREY;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.dbtn').click(function(){
			$('#modal2').css('display', 'block');
		});
		
		var score = $('#oscore').val();
		$('input:radio[name=score]:input[value=' + score + ']').attr("checked", true);
		
	});
</script>
</head>
<body>
<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->

<div class="w3-container w3-center">
    <div class="form-area">  
        <form method="POST" action="/camp24/reviewBoard/reviewBoardEditProc.cmp" enctype="multipart/form-data" id="frm" name="frm">
        <br style="clear:both">
                    <h2 style="margin-bottom: 25px; text-align: center;">방문 후기 수정</h2>
						<img src="/camp24/img/avatar/${DATA.avatar}" class="w3-center w3-circle">
						<span class="w3-col w3-center mgb10 ft10"><b>${SID}</b></span>
    				<div class="form-group">
    					<div style="text-align: left;">
	    					<label for="title" style="text-align: left;"><strong>제목</strong></label>
    					</div>
						<input type="text" class="form-control" id="title" name="rtitle" value="${DATA.rtitle}">
					</div>
    				<div class="form-group">
    					<div style="text-align: left;">
	    					<label for="cname" style="text-align: left;"><strong>캠핑장명</strong></label>
    					</div>
						<input type="text" class="form-control" id="cname" name="cname" value="${DATA.cname}" readonly>
					</div>
    				<div class="form-group">
    					<div style="text-align: left;">
	    					<label for="file" style="text-align: left;"><strong>파일첨부</strong></label>
    					</div>
    					<div class="w3-margin-bottom" id="filebox">
							<input type="file" class="w3-input w3-border w3-margin-bottom upfile" id="file" name="file">
    					</div>
					</div>
    				<div class="form-group" id="previewbox">
    					<div style="text-align: left;">
	    					<label for="file" style="text-align: left;"><strong>미리보기</strong></label>
    					</div>
    					<div class="w3-margin-bottom" id="preview">
			                    <c:forEach var="image" items="${IMAGE}">
									<c:if test="${not empty image.imageno}">
		                    <div class="inblock picbox evtPic" id="${image.ino}">
										<div class="w3-display-center">
											<div class="w3-quarter">
												<img style="display: inline-block; width: 100px; height: 100px;" src="${image.idir}${image.isavename}">
											</div>
										</div>
		                    </div>
									</c:if>
								</c:forEach>
    					</div>
					</div>
					<div class="form-group">
    					<div style="text-align: left;">
	    					<label for="cname" style="text-align: left;"><strong>별점</strong></label>
    					</div>
    					
    					<input type="radio" id="descore" name="score" value="1"><label for="star1" style="margin-right: 33px">☆</label>
						<input type="radio" name="score" value="2"><label for="star2" style="margin-right: 33px">☆☆</label>
						<input type="radio" name="score" value="3"><label for="star3" style="margin-right: 33px">☆☆☆</label>
						<input type="radio" name="score" value="4"><label for="star4" style="margin-right: 33px">☆☆☆☆</label>
						<input type="radio" name="score" value="5"><label for="star5" style="margin-right: 33px">☆☆☆☆☆</label>
					</div>
					
					
					
                    <div class="form-group">
                    	<div style="text-align: left;">
	    					<label for="body" style="text-align: left;"><strong>본문</strong></label>
    					</div>
                    	<textarea style="resize: none;" class="form-control" id="body" name="rbody" rows="7">${DATA.rbody}</textarea>
                    </div>
                    
                    
            <input type="hidden" id="nowPage" name="nowPage" value="${param.nowPage}">
            <input type="hidden" id="otitle" value="${DATA.rtitle}">
			<input type="hidden" id="obody" value="${DATA.rbody}">
            <input type="hidden" id="oscore" value="${DATA.score}">
            <input type="hidden" name="rno" value="${DATA.rno}">
        <button type="button" class="btn btn-primary pull-right w3-green w3-margin-left" id="editProc">수정</button>
        <button type="button" class="btn btn-primary pull-right w3-green w3-margin-left" id="rbtn">리셋</button>
        <button type="button" class="btn btn-primary pull-right w3-green w3-margin-left" id="listbtn">리스트</button>
        </form>
        
    </div>
</div>
</div>



</div>
    <!-- Grid for photos -->
    
  <!-- End Portfolio Section -->
  
  <div id="editWin" class="w3-modal">
	    <div class="w3-modal-content w3-animate-top w3-card-4 mxw500">
			<header class="w3-container w3-red"> 
		        <span class="w3-button w3-display-topright" 
		        							id="editClose">&times;</span>
		        <h2 class="w3-center">알림</h2>
			</header>
	    	<div class="w3-container">
	        	<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="editmsg">수정된 내용이 없습니다.</h3>
	    	</div>
	    </div>
 	</div>


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



<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Camp24 리뷰작성</title>
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
<style type="text/css">
	input[type="file"].w3-margin-bottom {
		margin-bottom: 5px!important;
	}
</style>
</head>
<body class="w3-light-grey">
<div class="w3-container">
<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main">

 <div class="w3-content mxw700">
		<h1 class="w3-light-grey w3-padding w3-center w3-card-4">Review</h1>
		<form method="POST" action="/camp24/reviewBoard/reviewBoardWriteProc.cmp" enctype="multipart/form-data"
				id="frm" name="frm" class="w3-col w3-card-4 frmpadding">
			<input type="hidden" name="nowPage" id="nowPage" value="${param.nowPage}">
			<input type="hidden" name="id" value="${SID}">
		<div class="w3-padding">
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="title" class="w3-col s2">Title</label>
				<input type="text" id="title" name="rtitle" class="w3-col m10 w3-input w3-border">
			</div>
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="title" class="w3-col s2">캠핑장</label>
				<input type="text" id="cname" name="cname" class="w3-col m10 w3-input w3-border" 
						value="${param.cname}" readonly>
			</div>
			<div class="w3-col w3-margin-bottom">
				<label class="w3-col s2">File</label>
				<div class="w3-col m10" id="filebox">
					<input type="file" name="file" class="w3-input w3-border w3-margin-bottom upfile">
				</div>
			</div>
			<div class="w3-col w3-margin-bottom" id="previewbox" style="display: none;">
				<label class="w3-col s2">Preview</label>
				<div class="w3-col m10 w3-center" id="preview">
				</div>
			</div>
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label class="w3-col s2">별점</label>
				<input type="radio" id="descore" name="score" value="1"><label for="star1" style="margin-right: 33px">☆</label>
				<input type="radio" name="score" value="2"><label for="star2" style="margin-right: 33px">☆☆</label>
				<input type="radio" name="score" value="3"><label for="star3" style="margin-right: 33px">☆☆☆</label>
				<input type="radio" name="score" value="4"><label for="star4" style="margin-right: 33px">☆☆☆☆</label>
				<input type="radio" name="score" value="5"><label for="star5" style="margin-right: 33px">☆☆☆☆☆</label>
			</div>
			<div class="w3-col">
				<label for="body" class="w3-col s2">글본문</label>
				<div class="w3-col m10">
					<textarea class="w3-col w3-input w3-padding w3-border w3-margin-bottom" 
							id="body" name="rbody" rows="10" style="resize: none;"></textarea>
				</div>
			</div>
		</div>
		</form>
		
		<div class="w3-col w3-margin-top w3-card-4">
			<div class="w3-half w3-button w3-grey" id="listbtn">이전 페이지</div>
			<div class="w3-half w3-button w3-black" id="wpbtn">글등록</div>
		</div>
	</div>


<!-- END MAIN -->
</div>

</div>
</body>
</html>
<%@ include file="../footer.jsp" %> --%>