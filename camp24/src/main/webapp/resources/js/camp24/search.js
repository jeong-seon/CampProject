$(document).ready(function(){
	var image = $('#image').attr('src');
	if(!image){
		$('#image').attr('src', '/camp24/resources/img/pic/noimage.png');
	}

	$('#sbtn').click(function(){
		$('#frm').submit();
	});
	
	
	$('.review').click(function(){
		var cname = $(this).parent().find($('.facltNm')).html();
		
		$('#cname').val(cname);
		$('#rfrm').submit();
	});
});