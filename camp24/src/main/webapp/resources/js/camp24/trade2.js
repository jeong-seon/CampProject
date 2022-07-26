$(document).ready(function(){
	$('#xlcate').change(function(){
		// 할일...
		// 기존 내용 지우고
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
						var stag = 
									'<div class="col-md-3 w3-margin-bottom w3-hover-blue brdList" style ="margin-right: 30px; cursor:pointer; height: auto; width: 100%; border:1px solid black;" id="' + arr[i].tno + '">' +
									
									'<img style= "display: inline-block; margin-top: 10px; margin-bottom: 20px; width: 80px; height: 80px; cursor:pointer; " src="/camp24/upload/'+ (arr[i].isavename) +'">'+
									
									'<div class="w3-col w3-margin-bottom" style="height: 40px; border-top: 1px solid black; border-bottom:1px solid black;"><h4>' + arr[i].title + '</h4></div>' + 
									'<p>가격 : <fmt:formatNumber value="${data.price}" pattern="#,###" />' + arr[i].price + '원</p>' +
									'<p>지 역 위 치  : ' + arr[i].position + '</p>' +
									'<p>조 회 수  : ' + arr[i].click + '</p>' +
									'<p>아이디  : ' + arr[i].id + '</p>' +
									'</div>' +
									
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
	
$('#cano').ready(function(){

	var sno = $(this).val();

		$.ajax({
			url: '/camp24/trade/cateList.json',
			type: 'post',
			dataType: 'json',
			data: {
				caname: sno
			},
			success: function(arr){
				if(arr.length > 0){
					for(var i = 0 ; i < arr.length ; i++ ){			
						var stag = '<option value="'+ arr[i].cano +'">'+ arr[i].caname +'</option>'
						
						$('#cano').append(stag);
					}
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
		}
			});
		});


$('#tPanel').on('click','.brdList',function(){
	
	var sno = $(this).attr('id');
	
	
	$(document.frm.tno).val(sno);	
	$('#frm').submit();
});	

});