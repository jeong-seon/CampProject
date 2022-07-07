<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="/camp24/css/main.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/base.css">
<link rel="stylesheet" type="text/css" href="/camp24/css/user.css">
<script type="text/javascript" src="/camp24/resources/js/jquery-3.6.0.min.js"></script>
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
body, h1,h2,h3,h4,h5,h6 {font-family: 'Gowun Dodum', serif;}
.w3-row-padding img {margin-bottom: 12px}
.bgimg {
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-image: url('/camp24/resources/img/pic/14.png');
  min-height: 100%;
}
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
				<div class="w3-container" style="height: 500px;">
					<div class="w3-border-bottom">
						<h4 style="font-size: 36pt; display: inline-block;">Best 캠핑장</h4><img id="rank" style="width: 70px; height: auto;" src="/camp24/resources/img/pic/rank.png">
					</div>
				</div>
   			</div>
   		</div>
    
    <div class="w3-col m6">
			<div class="w3-margin w3-white w3-center">
				<div class="w3-container">
					<h3>랜덤 추천 캠핑장 리스트</h3>
					
					<br>
		<c:forEach var="data" items="${LIST}">
					<h5><strong>캠핑장명 : ${data.facltNm}</strong></h5>
					<div id="image" style="width: 100%; height: 250px; overflow: hidden;">
			<c:if test="${not empty data.firstImageUrl && not empty data.homepage}">
					<a href="${data.homepage}"><img id="image" style="width: 70%" src="${data.firstImageUrl}"></a>
			</c:if>
			<c:if test="${not empty data.firstImageUrl && empty data.homepage}">
					<img id="image" style="width: 70%" src="${data.firstImageUrl}">
			</c:if>
			<c:if test="${empty data.firstImageUrl && empty data.homepage}">
					<img id="image" style="width: 70%" src="/camp24/resources/img/pic/noimage.png">
			</c:if>
			<c:if test="${empty data.firstImageUrl && not empty data.homepage}">
					<a href="${data.homepage}"><img id="image" style="width: 70%" src="/camp24/resources/img/pic/noimage.png"></a>
			</c:if>
					</div>
					<h5 style="font-size: 10pt;"># 이미지 클릭 시 해당 홈페이지로 이동합니다 #</h5>
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

  <!-- About Section -->
  <div class="w3-content w3-justify w3-text-grey w3-padding-32" id="about">
    <h2>About</h2>
    <hr class="w3-opacity">
    <p>Some text about me. Some text about me. I am lorem ipsum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
      consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing
      elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
    </p>
    <h3 class="w3-padding-16">My Skills</h3>
    <p class="w3-wide">Photography</p>
    <div class="w3-light-grey">
      <div class="w3-container w3-center w3-padding-small w3-dark-grey" style="width:95%">95%</div>
    </div>
    <p class="w3-wide">Web Design</p>
    <div class="w3-light-grey">
      <div class="w3-container w3-center w3-padding-small w3-dark-grey" style="width:85%">85%</div>
    </div>
    <p class="w3-wide">Photoshop</p>
    <div class="w3-light-grey">
      <div class="w3-container w3-center w3-padding-small w3-dark-grey" style="width:80%">80%</div>
    </div><br>

    <div class="w3-row w3-center w3-dark-grey w3-padding-16 w3-section">
      <div class="w3-quarter w3-section">
        <span class="w3-xlarge">14+</span><br>
        Partners
      </div>
      <div class="w3-quarter w3-section">
        <span class="w3-xlarge">55+</span><br>
        Projects Done
      </div>
      <div class="w3-quarter w3-section">
        <span class="w3-xlarge">89+</span><br>
        Happy Clients
      </div>
      <div class="w3-quarter w3-section">
        <span class="w3-xlarge">150+</span><br>
        Meetings
      </div>
    </div>

    <button class="w3-button w3-light-grey w3-padding-large w3-section">
      <i class="fa fa-download"></i> Download Resume
    </button>

    Testimonials
    <h3 class="w3-padding-24">My Reputation</h3>
    <img src="" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:80px">
    <p><span class="w3-large w3-text-black w3-margin-right">Chandler Bing.</span> Web Designer.</p>
    <p>Jane Doe is just awesome. I am so happy to have met her!</p><br>
   
    <img src="" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:80px">
    <p><span class="w3-large w3-text-black w3-margin-right">Chris Fox.</span> CEO at Mighty Schools.</p>
    <p>Jane Doe saved us from a web disaster.</p><br>
    
    <img src="" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:80px">
    <p><span class="w3-large w3-text-black w3-margin-right">Rebecca Flex.</span> CEO at Company.</p>
    <p>No one is better than Jane Doe.</p><br>
    
    Grid for pricing tables
    <h3 class="w3-padding-16">My Price</h3>
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-half w3-margin-bottom">
        <ul class="w3-ul w3-center w3-card w3-hover-shadow">
          <li class="w3-dark-grey w3-xlarge w3-padding-32">Basic</li>
          <li class="w3-padding-16">Web Design</li>
          <li class="w3-padding-16">Photography</li>
          <li class="w3-padding-16">5GB Storage</li>
          <li class="w3-padding-16">Mail Support</li>
          <li class="w3-padding-16">
            <h2>$ 10</h2>
            <span class="w3-opacity">per month</span>
          </li>
          <li class="w3-light-grey w3-padding-24">
            <button class="w3-button w3-white w3-padding-large w3-hover-black">Sign Up</button>
          </li>
        </ul>
      </div>

      <div class="w3-half">
        <ul class="w3-ul w3-center w3-card w3-hover-shadow">
          <li class="w3-black w3-xlarge w3-padding-32">Pro</li>
          <li class="w3-padding-16">Web Design</li>
          <li class="w3-padding-16">Photography</li>
          <li class="w3-padding-16">50GB Storage</li>
          <li class="w3-padding-16">Endless Support</li>
          <li class="w3-padding-16">
            <h2>$ 25</h2>
            <span class="w3-opacity">per month</span>
          </li>
          <li class="w3-light-grey w3-padding-24">
            <button class="w3-button w3-white w3-padding-large w3-hover-black">Sign Up</button>
          </li>
        </ul>
      </div>
    End Grid/Pricing tables
    </div>
    
  End About Section
  </div>

  Contact Section
  <div class="w3-padding-32 w3-content w3-text-grey" id="contact" style="margin-bottom:64px">
    <h2>Contact Me</h2>
    <hr class="w3-opacity">

    <div class="w3-section">
      <p><i class="fa fa-map-marker fa-fw w3-xxlarge w3-margin-right"></i> Chicago, US</p>
      <p><i class="fa fa-phone fa-fw w3-xxlarge w3-margin-right"></i> Phone: +00 151515</p>
      <p><i class="fa fa-envelope fa-fw w3-xxlarge w3-margin-right"> </i> Email: mail@mail.com</p>
    </div>
    
    Image of location/map
    <img src="" class="w3-image w3-greyscale" style="width:100%;margin:32px 0">
   
    <p>Lets get in touch. Send me a message:</p>
    <form action="" target="_blank">
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required name="Name"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Email" required name="Email"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Subject" required name="Subject"></p>
      <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Message" required name="Message"></p>
      <p>
        <button class="w3-button w3-light-grey w3-padding-large" type="submit">
          <i class="fa fa-paper-plane"></i> SEND MESSAGE
        </button>
      </p>
    </form>
  End Contact Section
  </div>  
  
  Footer
  <footer class="w3-container w3-padding-64 w3-light-grey w3-center w3-opacity w3-xlarge" style="margin:-24px">
    <i class="fa fa-facebook-official w3-hover-opacity"></i>
    <i class="fa fa-instagram w3-hover-opacity"></i>
    <i class="fa fa-snapchat w3-hover-opacity"></i>
    <i class="fa fa-pinterest-p w3-hover-opacity"></i>
    <i class="fa fa-twitter w3-hover-opacity"></i>
    <i class="fa fa-linkedin w3-hover-opacity"></i>
    <p class="w3-medium">Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank" class="w3-hover-text-green">w3.css</a></p>
  End footer
  </footer>
  
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
