$(document).ready(function(){
	$('#home').click(function(){
		$(location).attr('href', '/camp24/main.cmp');
	});
	
	$('#schbtn').click(function(){
		$(location).attr('href', '/camp24/board/searchBoardList.cmp');
	});
	$('#msgClose').click(function(){
		$('#msgWin').css('display', 'none');
		
		$.ajax({
			url: '/www/mainMsgCheck.blp',
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
	
});