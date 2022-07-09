$(document).ready(function(){
	/* 리스트 버튼 클릭 이벤트 */
	$('#lbtn').click(function(){
		$(location).attr('href', '/camp24/qnaBoard/qnaBoardList.cmp');	
	});
	
	/* 리셋 버튼 클릭 이벤트 */
	$('#rbtn').click(function(){
		document.frm.reset();
	});
	
	/* 수정 버튼 클릭 이벤트 */
	$('#ebtn').click(function(){
		var stitle = $('#title').val();
		var sbody = $('#body').val();
		var otitle = $('#otitle').val();
		var obody = $('#obody').val();
		
		
		if((stitle == otitle) && (sbody == obody)){
			$('#editWin').css('display', 'block');
			return;
		}
		$('#frm').submit();
		
	});
	
	$('#editClose').click(function(){
		$('#editWin').css('display', 'none');
	});
});