<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 Q & A</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">

<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<!-- top button -->
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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

<link rel="stylesheet" type="text/css" href="/camp24/css/main.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/base.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/user.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/qna.css">
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/qnaBoard.js"></script>
<script type="text/javascript">
    window.alert = function(){};
    var defaultCSS = document.getElementById('bootstrap-css');
    function changeCSS(css){
        if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
        else $('head > link').filter(':first').replaceWith(defaultCSS); 
    }
    $( document ).ready(function() {
      var iframe_height = parseInt($('html').height()); 
      window.parent.postMessage( iframe_height, 'https://bootsnipp.com');
    });
</script>
<style type="text/css">
.back-to-top {
    cursor: pointer;
    position: fixed;
    bottom: 40px;
    right: 40px;
    display:none;
}
figure{
	width: 100%;
	position: relative;
	right: 38px;
}
.img-responsive{
	border-radius: 70%;
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
#chbox {
	position: relative;
	top: 30px;
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

    <!-- Grid for photos -->

<div class="container">
  <div class="row">
    <div class="col-md-8">
	<div class="w3-button w3-green w3-right" id="wbtn">질문 작성</div>
      <h2 class="page-header">Q & A</h2>
        <section class="comment-list">
          <!-- First Comment -->
      <c:forEach var="data" items="${LIST}">
      <c:if test="${data.qupno eq 0}">
          <article class="row">
            <div class="col-md-2 col-sm-2 hidden-xs">
              <figure class="thumbnail">
                <img class="img-responsive" src="/camp24/resources/img/avatar/${data.avatar}" />
                <figcaption class="text-center">${data.id}</figcaption>
              </figure>
            </div>
            <div class="col-md-10 col-sm-10">
              <div class="panel panel-default arrow left">
                <div class="panel-body">
                  <c:if test="${data.qtitle eq '[ 답변 ]'}">
							<div class="w3-col w3-left mgb10 ft14"><strong>${data.qtitle}</strong></div>
				</c:if>
				<c:if test="${data.qtitle ne '[ 답변 ]'}">
								<div class="w3-col w3-left mgb10 ft14"><strong>제목 : ${data.qtitle}</strong></div>
				</c:if>
                  <header class="text-left">
                    <time style="text-align: right;" class="comment-date w3-col" datetime="16-12-2014 01:05"><small><strong><i class="fa fa-clock-o"></i> 작성일 : ${data.sdate}</strong></small></time>
                <c:if test="${not empty data.sedate}">
                    <time style="text-align: right;" class="comment-date w3-col" datetime="16-12-2014 01:05"><small><strong><i class="fa fa-clock-o"></i> 수정일 : ${data.sedate}</strong></small></time>
                </c:if>
                  </header>
                  <div class="comment-post">
                    <p style="color: black;">
                    	${data.qbody}
                    </p>
                  </div>
                  <div class="w3-cell w3-right" id="${data.qno}">
			<c:if test="${SID ne data.id}">
							<div class="w3-button w3-small w70 w3-green w3-right cmtbtn">답변</div>
			</c:if>
			<c:if test="${SID eq data.id}">
							<div class="w3-button w3-small w70 w3-red w3-right dbtn">삭제</div>
							<div class="w3-button w3-small w70 w3-lime w3-right ebtn">수정</div>
			</c:if>
				  </div>
                </div>
              </div>
            </div>
          </article>
          </c:if>
          
          <c:if test="${data.qupno ne 0}">
          		<article class="row" style="position: relative; right: -50px;">
	            <div class="col-md-9 col-sm-9 col-md-offset-1 col-md-pull-1 col-sm-offset-0">
	              <div class="panel panel-default arrow right">
	                <div class="panel-heading">답변</div>
	                <br>
	                <div class="panel-body">
	                  <header class="text-right">
                        <time style="text-align: left;" class="comment-date w3-col" datetime="16-12-2014 01:05"><small><strong><i class="fa fa-clock-o"></i> 작성일 : ${data.sdate}</strong></small></time>
	                <c:if test="${not empty data.sedate}">
	                    <time style="text-align: left;" class="comment-date w3-col" datetime="16-12-2014 01:05"><small><strong><i class="fa fa-clock-o"></i> 수정일 : ${data.sedate}</strong></small></time>
	                </c:if>
	                  </header>
	                  <div class="comment-post">
	                    <p style="text-align: right; color: black;">
	                    	${data.qbody}
	                    </p>
	                  </div>
	                  <div class="w3-cell w3-right" id="${data.qno}">
			<c:if test="${SID ne data.id}">
							<div class="w3-button w3-small w70 w3-green w3-right cmtbtn">답변</div>
			</c:if>
			<c:if test="${SID eq data.id}">
							<div class="w3-button w3-small w70 w3-red w3-right dbtn">삭제</div>
							<div class="w3-button w3-small w70 w3-lime w3-right ebtn">수정</div>
			</c:if>
			  		  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-md-2 col-sm-2 col-md-pull-1 hidden-xs">
	              <figure class="thumbnail">
	                <img class="img-responsive" src="/camp24/resources/img/avatar/${data.avatar}" />
	                <figcaption class="text-center">${data.id}</figcaption>
	              </figure>
	            </div>
	          </article>
          </c:if>
      </c:forEach>
        </section>
        
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


	<!-- 데이터 전송용 form 태그 -->
	<form method="POST" action="/camp24/qnaBoard/qnaBoardList.cmp" id="frm" name="frm">
		<input type="hidden" id="nowPage" name="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="id" value="${SID}">
		<input type="hidden" id="qno" name="bno">
		<input type="hidden" id="view" name="vw" value="/camp24/qnaBoard/qnaBoardList.cmp">
	</form>
  <!-- About Section -->
  <!-- Page top button -->
  <a style="width: 50px; height: 40px;" id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top w3-green" role="button" title="Click to return on the top page" data-toggle="tooltip" data-placement="left"><span class="glyphicon glyphicon-chevron-up"></span></a>
<!-- END PAGE CONTENT -->
	
	
    </div>
  </div>
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

<!-- END MAIN -->
