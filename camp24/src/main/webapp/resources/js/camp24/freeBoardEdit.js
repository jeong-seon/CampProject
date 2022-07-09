$(document).ready(function(){
	/* 리스트 버튼 클릭 이벤트 */
	$('#lbtn').click(function(){
		$('#frm').attr('action', '/camp24/freeBoard/freeBoardList.cmp');	
		$('#frm').submit();
	});
	
	/* 리셋 버튼 클릭 이벤트 */
	$('#rbtn').click(function(){
		document.frm.reset();
	});
	
	/* 수정 버튼 클릭 이벤트 */
	$('#ebtn').click(function(){
		var ftitle = $('#title').val();
		var fbody = $('#body').val();
		var otitle = $('#otitle').val();
		var obody = $('#obody').val();
		
		
		if((ftitle == otitle) && (fbody == obody)){
			$('#editWin').css('display', 'block');
			return;
		}
		
		$('#frm').submit();
		
	});
	
	$('#editClose').click(function(){
		$('#editWin').css('display', 'none');
	});
});