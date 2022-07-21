$(document).ready(function(){
	$('#kakaopay').click(function(){
		$.ajax({
			url: 'kakaopay.json',
			dataType :'json',
			data : {
				
			},
			success:function(data){
				
				var box = data.next_redirect_pc_url;
				location.href = box;

			},
			error:function(error){
				alert(error)
			}
		});
	});
})