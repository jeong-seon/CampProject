<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>camp24 중고 물품 작성</title>
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
<script type="text/javascript">
  // 천단위 콤마 (소수점포함)
  function numberWithCommas(num) {
    var parts = num.toString().split(".");
    return parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + (parts[1] ? "." + parts[1] : "");
  }

  // 숫자 체크(숫자 이외 값 모두 제거)
  function chkNumber(obj){
    var tmpValue = $(obj).val().replace(/[^0-9,]/g,'');
    tmpValue = tmpValue.replace(/[,]/g,'');
    // 천단위 콤마 처리 후 값 강제변경
    obj.value = numberWithCommas(tmpValue);
  }
</script>
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
  
	<div class="w3-content">
		<h3 class="w3-center">중고물품 등록</h3>
		
		<div class="w3-col w3-margin-bottom">
			<div class="w3-quarter">
				<select id="cano" class="w3-select w3-border w3-center">
					<option selected>분류 선택</option>
		<c:forEach var="data" items="${LIST2}">
					<option value="${data.cano}">${data.caname}</option>
		</c:forEach>
				</select>
			</div>
</div>
		
		
		
		<form method="POST" action="/camp24/trade/tradeWriteProc.cmp" encType="multipart/form-data"
				id="frm" name="frm" class="w3-col frmpadding">
			<input type="hidden" name="nowPage" id="nowPage" value="${param.nowPage}">
			<input type="hidden" name="id" value="${SID}">
			
 				
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="title" class="w3-col s2">물품 제목</label>
				<input type="text" id="title" name="title" class="w3-col m10 w3-input w3-border">
			</div>
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="position" class="w3-col s2">위치</label>
				<input type="text" id="position" name="position" class="w3-col m10 w3-input w3-border" >
			</div>
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="price" class="w3-col s2">가격</label>
				<input type="text" onkeyup="chkNumber(this)" id="price" name="price" class="w3-col m10 w3-input w3-border" >
			</div>
			<div class="w3-col w3-margin-bottom">
				<label class="w3-col s2">이미지 파일</label>
				<div class="w3-col m10" id="filebox">
					<input type="file" name="file" class="w3-input w3-border w3-margin-bottom upfile" accept="image/gif,image/jpeg,image/png/">
				</div>
			</div>
			<div class="w3-col w3-margin-bottom" id="previewbox" style="display: none;">
				<label class="w3-col s2">Preview</label>
				<div class="w3-col m10 w3-center" id="preview">
				</div>
			</div>
			<div class="w3-col">
				<label for="body" class="w3-col s2">물품 설명</label>
				<div class="w3-col m10">
					<textarea class="w3-col w3-input w3-padding w3-border w3-margin-bottom" 
							id="body" name="body" rows="10" style="resize: none;"></textarea>
				</div>
			</div>
		</form>
		
		<div class="w3-col w3-margin-top">
			<div class="w3-button w3-green" id="list2btn">물품 리스트</div>
			<div class="w3-button w3-gray w3-right" id="wpbtn">물품 등록</div>
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