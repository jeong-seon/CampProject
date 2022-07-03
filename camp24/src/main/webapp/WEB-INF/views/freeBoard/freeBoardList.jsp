<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 자유게시판</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">
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
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Hahmlet:wght@300&family=Song+Myung&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/camp24/css/main.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/base.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/user.css">
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/main.js"></script>
<script type="text/javascript" src="/camp24/resources/js/camp24/freeBoard.js"></script>
<style>
body, h1,h2,h3,h4,h5,h6 {font-family: 'Song Myung', serif;}
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
		$('#msgWin').css('display', 'block');
		
		$('.dbtn').click(function(){
			$('#modal2').css('display', 'block');
		});
	});
</script>
</head>
<body>
	<form method="POST" action="" id="hfrm" name="hfrm">
		<input type="hidden" name="id" value="${SID}">
		<input type="hidden" id="apinowPage" name="pageno">
	</form>
<!-- Sidebar with image -->
<nav class="w3-sidebar w3-hide-medium w3-hide-small" style="width:40%">
  <div class="bgimg"></div>
</nav>

<!-- Hidden Sidebar (reveals when clicked on menu icon)-->
<nav class="w3-sidebar w3-black w3-animate-right w3-xxlarge" style="display:none;padding-top:100px;right:0;z-index:2" id="mySidebar">
  <a href="javascript:void(0)" onclick="closeNav()" class="w3-button w3-black w3-xxxlarge w3-display-topright" style="padding:0 12px;">
    <i class="fa fa-remove"></i>
  </a>
  <div class="w3-bar-block w3-center">
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="home" onclick="closeNav()">Home</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="freebtn" onclick="closeNav()">Community</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="qnabtn" onclick="closeNav()">QnA</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="faqbtn" onclick="closeNav()">FAQ</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="sellbtn" onclick="closeNav()">Used Trade</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="schbtn" onclick="closeNav()">Search</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="cmpbtn" onclick="closeNav()">Campsite Information</span>
    <span class="w3-bar-item w3-button w3-text-grey w3-hover-black" id="revbtn" onclick="closeNav()">Review</span>
  </div>
</nav>

<!-- Page Content -->
<div class="w3-main w3-padding-large" style="margin-left:40%">
<c:if test="${empty SID}">
	<div class="w3-col">
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="joinbtn"><small><strong>Join</strong></small></span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="loginbtn"><small><strong>Login</strong></small></span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="mapbtn"><small><strong>Map</strong></small></span>
	</div>
</c:if>
<c:if test="${not empty SID}">
	<div class="w3-col">
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="mypagebtn">MyPage</span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="loutbtn">Logout</span>
		<span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto; position: relative; right:0; top: -12px;" id="mapbtn">Map</span>
	</div>
</c:if>
	  <!-- Menu icon to open sidebar -->
	  <span class="w3-button w3-top w3-white w3-xxlarge w3-text-grey w3-hover-text-black" style="width:auto;right:0;" onclick="openNav()"><i class="fa fa-bars"></i></span>

  <!-- Header -->
  <header class="w3-container w3-center" style="padding:60px 16px" id="home">
    <h1 class="w3-jumbo" id="mainlogo"><a href="/camp24/main.cmp"><b>Camp 24</b></a></h1>
    <!-- <img src="/w3images/profile_girl.jpg" class="w3-image w3-hide-large w3-hide-small w3-round" style="display:block;width:60%;margin:auto;">
    <img src="/w3images/profile_girl.jpg" class="w3-image w3-hide-large w3-hide-medium w3-round" width="1000" height="1333"> -->
  </header>

  <!-- Portfolio Section -->

    <!-- Grid for photos -->
<div class="container">
	<h2 class="text-center">Community</h2>
  <div class="w3-button w3-green w3-right" id="wbtn">글 작성</div>
  <div class="w3-row w3-padding-64 pdAll20">
<c:forEach var="data" items="${LIST}">
<div class="w3-col w3-margin-top" style="padding-left: ${data.step * 70}px">
	<div class="card">
	    <div class="card-body">
	        <div class="row">
        	    <div class="col-md-2">
        	    	<div class="overhidden w3-circle w3-margin-bottom">
	        	        <img src="/camp24/resources/img/avatar/${data.avatar}" class="img img-rounded img-fluid"/>
        	    	</div>
        	        <%-- <span class="w3-col w3-center mgb10 ft10">${data.id}</span> --%>
        	        <p class="text-secondary text-center">${data.id}</p>
        	    </div>
        	    
        	    <div class="col-md-10 w3-padding">
					<div class="w3-col w3-border-bottom">
						<div class="w3-cell w3-right" id="${data.fbno}">
			<c:if test="${SID ne data.id}">
							<div class="w3-button w3-small w70 w3-green w3-right cmtbtn">댓글</div>
			</c:if>
			<c:if test="${SID eq data.id}">
							<div class="w3-button w3-small w70 w3-lime w3-right ebtn">수정</div>
							<div class="w3-button w3-small w70 w3-red w3-right dbtn">삭제</div>
			</c:if>
						</div>
						<div>
							<div class="w3-col w3-left mgb10 ft10"><strong>제목 : ${data.ftitle}</strong></div>
			<c:if test="${not empty data.sedate}">
							<div class="w3-third w3-right mgb0 ft10"><small>수정일 : ${data.sedate}</small></div>
			</c:if>
							<div class="w3-third w3-right mgb0 ft10"><small>작성일 : ${data.sdate}</small></div>
						</div>
					</div>
					<div class="w3-col w3-margin-top">
						<span class="w3-col w3-padding ft12">${data.fbody}</span>
					</div>
				</div>
			
			</div>
				
        	    <!-- <div class="col-md-10">
        	        <p>
        	            <a class="float-left" href="https://maniruzzaman-akash.blogspot.com/p/contact.html"><strong>Maniruzzaman Akash</strong></a>
        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
                        <span class="float-right"><i class="text-warning fa fa-star"></i></span>
        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>

        	       </p>
        	       <div class="clearfix"></div>
        	        <p>Lorem Ipsum is simply dummy text of the pr make  but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
        	        <p>
        	            <a class="float-right btn btn-outline-primary ml-2"> <i class="fa fa-reply"></i> Reply</a>
        	            <a class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i> Like</a>
        	       </p>
        	    </div> -->
        	    
        	    
	        </div>
	        
	        
	        	<!-- <div class="card card-inner">
            	    <div class="card-body">
            	        <div class="row">
                    	    <div class="col-md-2">
                    	        <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid"/>
                    	        <p class="text-secondary text-center">15 Minutes Ago</p>
                    	    </div>
                    	    <div class="col-md-10">
                    	        <p><a href="https://maniruzzaman-akash.blogspot.com/p/contact.html"><strong>Maniruzzaman Akash</strong></a></p>
                    	        <p>Lorem Ipsum is simply dummy text of the pr make  but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                    	        <p>
                    	            <a class="float-right btn btn-outline-primary ml-2">  <i class="fa fa-reply"></i> Reply</a>
                    	            <a class="float-right btn text-white btn-danger"> <i class="fa fa-heart"></i> Like</a>
                    	       </p>
                    	    </div>
            	        </div>
            	    </div>
	            </div> -->
	            
	            
	    </div>
	</div>
</c:forEach>
</div>
    
  <!-- End Portfolio Section -->
  
  
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
  
  
<c:if test="${(not empty SID) and (MSG_CHECK eq 'OK')}">
	<div id="msgWin" class="w3-modal">
		<div class="w3-modal-content w3-animate-top w3-card-4 mxw500">
			<header class="w3-container w3-green"> 
				<span class="w3-button w3-display-topright" id="msgClose">&times;</span>
				<h2 class="w3-center">알림 메세지</h2>
			</header>
			<div class="w3-container">
				<h3 class="w3-center w3-padding w3-margin-top w3-margin-bottom" id="msg">${SID} 님이 로그인 하셨습니다.</h3>
			</div>
		</div>
	</div>
</c:if>


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
	<form method="POST" action="/camp24/freeBoard/freeBoardList.cmp" id="frm" name="frm">
		<input type="hidden" id="nowPage" name="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" id="id" name="id" value="${SID}">
		<input type="hidden" id="fbno" name="bno">
		<input type="hidden" id="view" name="vw" value="/camp24/freeBoard/freeBoardList.cmp">
	</form>
  <!-- About Section -->
  
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

</body>
</html>








<%-- 

<div class="w3-main">
<h2 class="w3-green w3-padding-16 w3-center">자유게시판</h2>
  <div class="w3-row w3-padding-64 pdAll20">
  <div class="w3-button w3-lime w3-right" id="wbtn">글 작성</div>
  
<c:forEach var="data" items="${LIST}">
		<div class="w3-col" style="padding-left: ${data.step * 70}px">
			<div class="w3-col w3-round-large w3-card-4 w3-margin-bottom w3-padding">
				<div class="w3-col mgt20 box120 pdAll10 w3-border-right" style="width: 135px;">
					<img src="/camp24/resources/img/avatar/${data.avatar}" class="inblock avtBox100 w3-border w3-border-grey">
							<span class="w3-col w3-center mgb10 ft10">${data.id}</span>
				</div>
				<div class="w3-rest w3-padding">
					<div class="w3-col w3-border-bottom">
						<div class="w3-cell w3-right" id="${data.fbno}">
			<c:if test="${SID ne data.id}">
							<div class="w3-button w3-small w70 w3-green w3-right cmtbtn">댓글</div>
			</c:if>
			<c:if test="${SID eq data.id}">
							<div class="w3-button w3-small w70 w3-orange w3-right ebtn">수정</div>
							<div class="w3-button w3-small w70 w3-red w3-right dbtn">삭제</div>
			</c:if>
						</div>
						<div>
							<div class="w3-col w3-left mgb10 ft10"><strong>제목 : ${data.ftitle}</strong></div>
			<c:if test="${not empty data.sedate}">
							<div class="w3-third w3-right mgb0 ft10"><small>수정일 : ${data.sedate}</small></div>
			</c:if>
							<div class="w3-third w3-right mgb0 ft10"><small>작성일 : ${data.sdate}</small></div>
						</div>
					</div>
					<div class="w3-col w3-margin-top">
						<span class="w3-col w3-padding ft12">${data.fbody}</span>
					</div>
				</div>
			</div>
		</div>
</c:forEach>
  </div>
</div>
   --%>


<!-- END MAIN -->





	
