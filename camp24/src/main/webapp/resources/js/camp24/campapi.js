$(document).ready(function(){
	var image = $('#image').attr('src');
	
	if(!image){
		$('#image').attr('src', '/camp24/resources/img/pic/noimage.png');
	}
	/*
	$('#before').click(function(){
		var page = $('#pageno').val();
		page = page - 1;
		if(page < 1) {
			page = 1;
		}
		$('#pageno').val(page);
		
		$('#frm').submit();
	});
	$('#next').click(function(){
		var page = $('#pageno').val();
		var pageNo = parseInt(page);
		page = pageNo + 1;
		$('#pageno').val(page);
		alert('### 페이지넘버 : ' + $('#pageno').val());
		$('#frm').submit();
	});*/
	$('.pbtn').click(function(){
		// 데이터 읽어오고
		var page = $(this).attr('id');
		
		// 데이터 셋팅
		$('#nowPage').val(page);
		$('#frm').submit();
	});
});