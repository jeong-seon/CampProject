$(document).ready(function(){
	$('#dbtn').click(function(){
		$('#ybtn').click(function(){
			$('#frm').attr('action', '/camp24/member/delMember.cmp');
			$('#frm').submit();		
		});
		$('#nbtn').click(function(){
			$('#modal').css('display', 'none');
		});
	});
	
	$('#ebtn').click(function(){
		$('#frm').attr('action', '/camp24/member/myInfoEdit.cmp');
		$('#frm').submit();
	});
	
	$('#pbtn').click(function(){
		$('#frm').attr('action', '/camp24/preference/preference.cmp');
		$('#frm').submit();
	});
});
