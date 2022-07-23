$(document).ready(function(){
	/* 홈버튼 클릭이벤트 */
	$('#hbtn').click(function(){
		$(location).attr('href', '/camp24/');
	});
	
	/* 제출버튼 클릭이벤트 */
	$('#sbtn').click(function(){
		$('#frm').attr('action', '/camp24/preference/preferenceProc.cmp');
		$('#frm').submit();
	});
});