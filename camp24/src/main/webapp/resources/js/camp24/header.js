$(document).ready(function(){
	$('#home').click(function(){
		$(location).attr('href', '/camp24/main.cmp');
	});
	$('#schbtn').click(function(){
		$(location).attr('href', '/camp24/board/searchBoardList.cmp');
	});
	$('#cmpbtn').click(function(){
		$('#apinowPage').val('1');
		$('#hfrm').attr('action', '/camp24/campapi/campApi.cmp');
		$('#hfrm').submit();
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
	$('#sellbtn').click(function(){
		$(location).attr('href', '/camp24/trade/trade.cmp');
	});
	 
	$('#mypagebtn').click(function(){
		$('#hfrm').attr('action', '/camp24/member/myInfo.cmp');
		$('#hfrm').submit();
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
	$('#revbtn').click(function(){
		$(location).attr('href', '/camp24/reviewBoard/reviewBoardList.cmp');
	});
});