$(document).ready(function(){
	
	$('.pbtn').click(function(){
		// 클릭된 버튼의 아이디 읽고
		var spage = $(this).attr('id');
		
		$('#nowPage').val(spage);
		$('#tno').prop('disabled', true);
		
		// action 속성 변경하고
		$('#frm').attr('action', '/camp24/trade/trade.cmp');
		$('#frm').submit();
		
	});
	
	$('.brdList').click(function(){
		var sno = $(this).attr('id');
		$('#tno').val(sno);
		$('#frm').submit();
	});
	
	$('#wbtn').click(function(){
		$('#frm').attr('action', '/camp24/trade/tradeWrite.cmp');
		$('#frm').submit();
	});
	
	// 리셋 버튼 클릭이벤트
	$('#rbtn').click(function(){
		document.frm.reset();
	});
	
	$('#listbtn').click(function(){
		$('#frm').attr('action', '/camp24/trade/trade.cmp');
		$('#frm').submit();
	});
	
	$('#list2btn').click(function(){
		$('#price').prop('disabled',true);
		$('#frm').attr('action', '/camp24/trade/trade.cmp');
		$('#frm').submit();
	});
	$('#list3btn').click(function(){
		$('#frm').attr('action', '/camp24/trade/trade.cmp');
		$('#frm').submit();
	});
	
	
	$('#filebox').on('change', '.upfile', function(evt){
		var str = $(this).val();
		var index = $(this).index();
		var tmp = $('.upfile');
		var max = tmp.length;
		if(!str){
			$(this).remove();
			$('.picbox').eq(index).remove();
			return;
		}
		
		var path = URL.createObjectURL(evt.target.files[0]);
		var el = $('.upfile');
		if((index + 1) != el.length){
			$('.infoAvtBox').eq(index).attr('src', path);
		}
		
		if(index == max - 1){
			
			$('#preview').append('<div class="inblock pdAll10 picbox w3-card"><div class="w3-col" style="width: 200%; height: 200%; overflow: hidden;">' +
					'<img src="' + path + '" class="pic">' +
			'</div></div>');
		}
		$('#previewbox').css('display', 'block');
	});
	
	$('#wpbtn').click(function(){
		// 비어있는 input 태그 비활성 시켜놓고
		$('.upfile').last().prop('disabled', true);
		
		// 데이터 유효성 검사
		var title = $('#title').val();
		if(!title){
			$('#title').focus();
			return;
		}
		var body = $('#body').val();
		if(!body){
			$('#body').focus();
			return;
		}
		
		$('#frm').submit();
	});
	
	// 수정버튼 이벤트 처리
	$('#edit').click(function(){
		$('#frm').attr('action', '/camp24/trade/tradeEdit.cmp');
		$('#frm').submit();
	});
	
	$('.evtPic').click(function(){
		// 파일번호 꺼내오고
		var sno = $(this).attr('id');
		var el = $(this);
		
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url: '/camp24/trade/fileDel.json',
				type: 'post',
				dataType: 'json',
				data: {
					ino : sno
				},
				success: function(data){
					if(data.result == 'OK'){
						$(el).remove();
					}
				},
				error: function(){
					alert('### 통신에러 ###');
				}
			});
		}
	});
	
	$('#editProc').click(function(){
		$('.upfile').last().prop('disabled', true);
		
		// 수정 여부검사
		var otitle = $('#otitle').val();
		var obody = $('#obody').val();
		
		var title = $('#title').val();
		var body = $('#body').val();
		
		if(otitle == title && obody == body && $('#filebox > input').length == 1){
			$('#editWin').css('display', 'block');
			return;
		}
		
		$('#frm').submit();
	});
	$('#editClose').click(function(){
		$('#editWin').css('display', 'none');
	});
	
	// 글삭제 버튼 이벤트 처리
	$('.dbtn').click(function(){
		var sno = $(this).attr('id');
		
		$('#ybtn').click(function(){
			$('#rno').val(sno);
			$('#frm').attr('action', '/camp24/trade/tradeDel.cmp');
			$('#frm').submit();
		
		});
		$('#nbtn').click(function(){
			$('#modal2').css('display', 'none');
		});
	});
	
});