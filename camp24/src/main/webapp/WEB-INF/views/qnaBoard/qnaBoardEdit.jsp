<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 Q & A 글 수정</title>
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
<script type="text/javascript" src="/camp24/resources/js/camp24/qnaBoardEdit.js"></script>
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
</head>
<body>
<%@ include file="../include.jsp" %>
  <!-- Portfolio Section -->

<div class="w3-container w3-center">
    <div class="form-area">  
        <form method="POST" action="/camp24/qnaBoard/qnaBoardEditProc.cmp" id="frm" name="frm">
        <input type="hidden" name="mno" value="${DATA.mno}">
		<input type="hidden" name="bno" value="${DATA.bno}">
		<input type="hidden" name="vw" value="${param.vw}">
		<input type="hidden" id="otitle" value="${DATA.qtitle}">
		<input type="hidden" id="obody" value="${DATA.qbody}">
        <input type="hidden" id="nowPage" name="nowPage" value="${param.nowPage}">
        <br style="clear:both">
                    <h2 style="margin-bottom: 25px; text-align: center;">Q & A 글 수정</h2>
						<img src="/camp24/img/avatar/${DATA.avatar}" class="w3-center w3-circle">
						<span class="w3-col w3-center mgb10 ft10"><b>${SID}</b></span>
    				<div class="form-group">
   					<c:if test="${DATA.qtitle ne '[ 답변 ]'}">
    					<div style="text-align: left;">
	    					<label for="title" style="text-align: left;"><strong>제목</strong></label>
    					</div>
						<input type="text" class="form-control" id="title" name="title" value="${DATA.qtitle}">
	    			</c:if>
   					<c:if test="${DATA.qtitle eq '[ 답변 ]'}">
    					<div style="text-align: left;">
	    					<label for="title" style="text-align: left;"><strong>제목</strong></label>
    					</div>
						<input type="text" class="form-control" id="title" name="title" value="${DATA.qtitle}" readonly>
	    			</c:if>
					</div>
                    <div class="form-group">
                    	<div style="text-align: left;">
	    					<label for="body" style="text-align: left;"><strong>본문</strong></label>
    					</div>
                    	<textarea style="resize: none;" class="form-control" id="body" name="body"rows="7">${DATA.qbody}</textarea>
                    </div>
        <button type="button" class="btn btn-primary pull-right w3-green w3-margin-left" id="ebtn">수정</button>
        <button type="button" class="btn btn-primary pull-right w3-green w3-margin-left" id="rbtn">리셋</button>
        <button type="button" class="btn btn-primary pull-right w3-green w3-margin-left" id="lbtn">리스트</button>
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



