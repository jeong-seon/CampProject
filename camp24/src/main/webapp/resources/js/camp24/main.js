$(document).ready(function(){
	$('#home').click(function(){
		$(location).attr('href', '/camp24/main.cmp');
	});
	$('#mapbtn').click(function(){
		$(location).attr('href', '/camp24/map/mapApi.cmp');
	});
	$('#joinbtn').click(function(){
		$(location).attr('href', '/camp24/member/join.cmp');
	});
	$('#loginbtn').click(function(){
		$(location).attr('href', '/camp24/member/login.cmp');
	});
	$('#loutbtn').click(function(){
		$(location).attr('href', '/camp24/member/logout.cmp');
	});
	$('#schbtn').click(function(){
		$(location).attr('href', '/camp24/board/searchBoardList.cmp');
	});
	$('#freebtn').click(function(){
		$(location).attr('href', '/camp24/freeBoard/freeBoardList.cmp');
	});
	$('#qnabtn').click(function(){
		$(location).attr('href', '/camp24/qnaBoard/qnaBoardList.cmp');
	});
	$('#faqbtn').click(function(){
		$(location).attr('href', '/camp24/board/faqList.cmp');
	});
	$('#sellbtn').click(function(){
		$(location).attr('href', '/camp24/trade/trade.cmp');
	});
	$('#schbtn').click(function(){
		$(location).attr('href', '/camp24/board/searchBoardList.cmp');
	});
	$('#cmpbtn').click(function(){
		$('#apinowPage').val('1');
		$('#hfrm').attr('action', '/camp24/campapi/campApi.cmp');
		$('#hfrm').submit();
	});
	$('#revbtn').click(function(){
		$(location).attr('href', '/camp24/reviewBoard/reviewBoardList.cmp');
	});
	$('#mypagebtn').click(function(){
		$('#hfrm').attr('action', '/camp24/member/myInfo.cmp');
		$('#hfrm').submit();
	});
	
	
	
	$('#msgClose').click(function(){
		$('#msgWin').css('display', 'none');
		
		$.ajax({
			url: '/camp24/mainMsgCheck.json',
			type: 'POST',
			dataType: 'json',
			success: function(data){
				if(data.result == 'OK'){
					// 처리에 성공한 경우
					$('#msgWin').remove();
				}
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
		});
	});
	
	var image = $('#img01').attr('src');
	if(!image){
		$('#img01').attr('src', '/camp24/resources/img/pic/noimage.png');
	}
	
	// Page top button
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