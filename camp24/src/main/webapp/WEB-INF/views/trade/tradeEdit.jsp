<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고물품 수정</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">

<!-- top button -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!--To Work with icons-->
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">


<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/camp24/css/main.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/base.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/user.css">
<script type="text/javascript" src="/camp24/resources/js//jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/tradeboard.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/trade2.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
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
  
	<div class="w3-content mxw700">
		<h1 class="w3-blue w3-padding w3-center w3-card-4">물품 수정</h1>
		<input type="hidden" id="otitle" value="${DATA.title}">
		<input type="hidden" id="obody" value="${DATA.body}">
		<form method="POST" action="/camp24/trade/tradeEditProc.cmp" encType="multipart/form-data"
				id="frm" name="frm" class="w3-col w3-card-4 frmpadding">
			<input type="hidden" name="nowPage" value="${param.nowPage}">
			<input type="hidden" name="tno" value="${DATA.tno}">
			
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="title" class="w3-col s2">Title</label>
				<input type="text" id="title" name="title" class="w3-col m10 w3-input w3-border" value="${DATA.title}">
			</div>
			<div class="w3-col w3-margin-bottom">
				<label class="w3-col s2">Add File</label>
				<div class="w3-col m10" id="filebox">
					<input type="file" name="file" class="w3-input w3-border w3-margin-bottom upfile">
				</div>
			</div>
			<div class="w3-col w3-margin-bottom" id="previewbox" style="display: none;">
				<label class="w3-col s2">Preview</label>
				<div class="w3-col m10 w3-center" id="preview">
				</div>
			</div>
			<div class="w3-col">
				<label for="body" class="w3-col s2">글본문</label>
				<div class="w3-col m10">
					<textarea class="w3-col w3-input w3-padding w3-border w3-margin-bottom" 
							id="body" name="body" rows="10" style="resize: none;">${DATA.body}</textarea>
				</div>
			</div>
			
<c:if test="${not empty LIST}">			
			<div class="w3-col w3-margin-bottom" id="previewbox">
				<label class="w3-col s2">이미지</label>
				<div class="w3-col m10 w3-center" id="preview">
		<c:forEach var="data" items="${LIST}">
			<c:if test="${not empty data.isavename}">
					<div class="inblock picbox evtPic" id="${data.ino}">
				<c:if test="${data.idir eq '/camp24/upload/'}">
						<img class="pic" src="${data.idir}${data.isavename}"> 
				</c:if>
				<c:if test="${data.idir ne '/camp24/upload/'}">
						<img class="pic" src="${data.idir}/${data.isavename}"> 
				</c:if>
					</div>
			</c:if>
		</c:forEach>
				</div>
			</div>
</c:if>
		</form>
		
		<div class="w3-col w3-margin-top w3-card-4">
	<c:if test="${SID eq DATA.id}">

			<div class="w3-third w3-button w3-green" id="listbtn">리스트</div>
			<div class="w3-third w3-button w3-deep-orange" id="editProc">수정등록</div>
	</c:if>
	<c:if test="${SID ne DATA.id}">
			<div class="w3-half w3-button w3-green" id="listbtn">리스트</div>
	</c:if>
		</div>
	</div>


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
<!-- END PAGE CONTENT -->
</div>

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