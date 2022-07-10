<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Camp24 방문후기 상세보기</title>
<meta charset="UTF-8">
<link rel="icon" href="/camp24/resources/img/pic/favicon.png">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

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
<link rel="stylesheet" type="text/css" href="/camp24/css/detail.css">
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
body, h1,h2,h3,h4,h5,h6,section {font-family: 'IBM Plex Sans KR', serif;}
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
<form method="POST" action="/camp24/reviewboard/reviewBoardList.cmp" id="frm" name="frm">
	<input type="hidden" name="rno" id="rno" value="${DATA.rno}">
	<input type="hidden" name="nowPage" id="nowPage" value="${param.nowPage}">
</form>
<h2 class="w3-padding-16 w3-center">방문후기 상세보기</h2>
    <!-- /container -->



	
	    <!-- ==============================================
	    Hero
	    =============================================== -->
        <section class="hero">
         <div class="">
          <div class="row">	
		  
		   <div class="col-md-6 col-md-offset-3">
			
			<div class="cardbox shadow-lg bg-white">
			 
			 <div class="cardbox-heading">
			 <div class="media m-0 w3-border-bottom">
				   <div class="d-flex mr-3">
					<img class="img-fluid rounded-circle" src="/camp24/resources/img/avatar/${DATA.avatar}" alt="User">
				   </div>
				   <div class="media-body">
				    <p class="m-0"><strong>${DATA.id}</strong></p>
				    <div class="w3-col">
					<small><strong><i class="fa fa-clock-o"></i> 작성일 : ${DATA.sdate}</strong></small>
				    </div>
				<c:if test="${not empty DATA.sedate}">
				    <div class="w3-col">
					<small><strong><i class="fa fa-clock-o"></i> 수정일 : ${DATA.sedate}</strong></small>
				    </div>
				</c:if>
				   </div>
				  </div><!--/ media -->
			 
			  <div class="float-right w3-margin-right w3-padding-16 block">
			 		<c:if test="${DATA.score eq 1}">
							<!-- 별점 1점 -->
							<div class="review-block-rate">
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</c:if>
						<c:if test="${DATA.score eq 2}">
							<!-- 별점 2점 -->
							<div class="review-block-rate">
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</c:if>
						<c:if test="${DATA.score eq 3}">
							<!-- 별점 3점 -->
							<div class="review-block-rate">
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</c:if>
						<c:if test="${DATA.score eq 4}">
							<!-- 별점 4점 -->
							<div class="review-block-rate">
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-default star-grey star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</c:if>
						<c:if test="${DATA.score eq 5}">
							<!-- 별점 5점 -->
							<div class="review-block-rate">
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
								  <span class="star star-warning star-xs glyphicon glyphicon-star" aria-hidden="true"></span>
							</div>
						</c:if>
			 
			  	<span class="w3-right w3-margin-top"><small><strong>조회수 : ${DATA.click}</strong></small></span>
			  </div>
			  <div class="w3-margin-left w3-margin-top">
			  	<span><strong>제목 : ${DATA.rtitle}</strong></span>
			  </div>
			  <div class="w3-margin-left w3-margin-top">
			  	<span><strong>캠핑장명 : ${DATA.cname}</strong></span>
			  </div>
			  
			  
			  
			 </div><!--/ cardbox-heading -->
			  
			 <div class="cardbox-item">
		<c:forEach var="image" items="${IMAGE}">
			<c:if test="${DATA.rno eq image.imageno}">
			  <div class="w3-margin-bottom">
				  <img class="img-fluid" src="${image.idir}${image.isavename}" alt="Image">
			  	<!-- <a href="" class="img-modal-btn left"><i class="glyphicon glyphicon-chevron-left"></i></a>
           		<a href="" class="img-modal-btn right"><i class="glyphicon glyphicon-chevron-right"></i></a> -->
			  </div>
		 	</c:if>
		</c:forEach>
			 </div><!--/ cardbox-item -->
			 <div class="cardbox-base">
			 
			 	
			  
			  
			  
			 	
			  
			  
			 </div><!--/ cardbox-base -->
			 
			 
			 
			 <div class="cardbox-base">
			 	<div class="w3-center w3-padding-32">
				 	<span>${DATA.rbody}</span>
			 	</div>
			 </div><!--/ cardbox-like -->			  
					
			</div><!--/ cardbox -->

           </div><!--/ col-lg-6 -->	
			
          </div><!--/ row -->
         </div><!--/ container -->
         
        </section>





	
	
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

        $(".img-modal-btn.right").on('click', function(e){
            e.preventDefault();
            cur = $(this).parent().find('img:visible()');
            next = cur.next('img');
            par = cur.parent();
            if (!next.length) { next = $(cur.parent().find("img").get(0)) }
            cur.addClass('hidden');
            next.removeClass('hidden');
            
            return false;
        })
        
        $(".img-modal-btn.left").on('click', function(e){
            e.preventDefault();
            cur = $(this).parent().find('img:visible()');
            next = cur.prev('img');
            par = cur.parent();
            children = cur.parent().find("img");
            if (!next.length) { next = $(children.get(children.length-1)) }
            cur.addClass('hidden');
            next.removeClass('hidden');
            
            return false;
        })
	});
	
</script>

</body>
</html>



