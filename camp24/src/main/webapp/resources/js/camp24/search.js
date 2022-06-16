$(document).ready(function(){
	$('#sbtn').click(function(){
		$('#frm').submit();
	});
	
	var image = $('#image').attr('src');
	if(!image){
		$('#image').attr('src', '/camp24/resources/img/pic/noimage.png');
	}
});