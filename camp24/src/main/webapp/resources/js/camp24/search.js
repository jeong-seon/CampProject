$(document).ready(function(){
	var image = $('#image').attr('src');
	if(!image){
		$('#image').attr('src', '/camp24/resources/img/pic/noimage.png');
	}

	$('#sbtn').click(function(){
		$('#frm').submit();
	});
	
	
	$('.review').click(function(){
		var cid = $(this).parent().text();
		var name = cid.split('.');
		var cname = name[1];
		
		$('#cname').val(cname);
		$('#rfrm').submit();
	});
});