$(document).ready(function(){
	$('#dbtn').click(function(){
		$('#frm').attr('action', '/camp24/member/delMember.cmp');
		
		if(confirm('정말 탈퇴합니까?')){
			
			$('#frm').submit();
		}
	});
	
	$('#ebtn').click(function(){
		$('#frm').attr('action', '/camp24/member/myInfoEdit.cmp');
		$('#frm').submit();
	});

});
