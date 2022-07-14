$(document).ready(function(){
	$('#xlcate').change(function(){
		// 할일...
		// 기존 내용 지우고
		$('#tPanel').css('display', 'none');
		$('#tPanel').html('');
		
		// 분류 번호 가져오고...
		var sno = $(this).val();
		
		$.ajax({
			url: '/camp24/trade/tradelist.json',
			type: 'post',
			dataType: 'json',
			data: {
				cano: sno
			},
			success: function(arr){
				if(arr.length > 0){
					for(var i = 0 ; i < arr.length ; i++ ){
						var stag = '<div class="col-md-3 w3-margin-bottom w3-hover-blue w3-margin-right w3-card-2 brdList" id="' + arr[i].tno + '">' +
									'<div class="w3-center">' +
									'<img style="display: inline-block; width: 150px; height: 150px;" src="/camp24/upload/'+ (arr[i].isavename) +'">'+
									'<div class="w3-col" style="height: 92px;"><h3>' + arr[i].title + '</h3></div>' + 
									'<p>가 격 : ' + arr[i].price + '</p>' +
									'<p>지 역 위 치  : ' + arr[i].position + '</p>' +
									'<p>조 회 수  : ' + arr[i].click + '</p>' +
									'</div>' +
									'</div>';
						
						$('#tPanel').append(stag);
					}
					$('#tPanel').css('display', 'block');
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
			}
		});
	});
	$('#tPanel').on('click', '.trade',function(){
		var sno = $(this).attr('id');
		$(document.frm.tno).val(sno);
		$('#frm').submit();
	});		
});