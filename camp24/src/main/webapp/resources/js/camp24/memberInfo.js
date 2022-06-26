$(document).ready(function(){
	$('#dbtn').click(function(){
		$('#frm').attr('action', '/camp24/member/delMember.cmp');
		$('#frm').submit();
		
		if(confirm('정말 탈퇴합니까?')){
			// form 태그가 완성이 됬으니 전송한다.
			$('#frm').submit();
		} 
	});
});