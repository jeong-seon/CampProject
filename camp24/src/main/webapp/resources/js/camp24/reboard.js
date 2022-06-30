$(document).ready(function(){
	
	/* 페이지 버튼 클릭이벤트 처리 */
	$('.pbtn').click(function(){
		// 페이지번호 읽고
		var pno = $(this).attr('id');
		// 페이지 번호 셋팅하고
		$('#nowPage').val(pno);
		// 폼 태그 전송
		$('#frm').attr('action', '/camp24/reviewBoard/reviewBoardList.cmp');
		$('#frm').submit();
	});
	
	
	// 리뷰쓰기 버튼
	$('#wbtn').click(function(){
		$('#pageFrm').attr('action', '/camp24/reviewBoard/reviewBoardWrite.cmp');
		$('#pageFrm').submit();
	});
	
	//삭제
	$('.debtn').click(function(){
		var sno = $(this).parent().attr('id');
		alert('#### sno : ' + sno);
		$('#Frm').attr('action', '/camp24/reviewBoard/reviewBoardDelete.cmp');
		$('#rno').val(sno);
		alert('#### rno : ' + $('#rno').val());
		$('#Frm').submit();
		
	});
	
	
	//이전페이지 버튼
	$('#listbtn').click(function(){
		$('#frm').attr('action', '/camp24/reviewBoard/reviewBoardList.cmp');
		$('#nowPage').prop('disabled', true);
		$('#title').prop('disabled', true);
		$('#body').prop('disabled', true);
		$('#frm').submit();
	});
	
	//글 작성후 글등록 버튼(reboardWrite)
	$('#wpbtn').click(function(){
		$('.upfile').last().prop('disabled', true);
		
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
		
		// 별점 선택
		var score = $('input[name="score"]:checked').val();
		if(!score){
			alert('별점을 선택해주세요!');
			return;
		}
		
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
			$('#filebox').append('<input type="file" name="file" class="w3-input w3-border w3-margin-bottom upfile">');
			$('#preview').append('<div class="inblock pdAll10 picbox w3-card"><div class="w3-col w3-border" style="width: 100%; height: 100%; overflow: hidden;">' +
					'<img src="' + path + '" class="pic">' +
			'</div></div>');
		}
		$('#previewbox').css('display', 'block');
	});
	
	$('.revList').click(function(){
		var sno = $(this).attr('id');
		
		$('#rno').val(sno);
		$('#frm').attr('action', '/camp24/reviewBoard/reviewBoardDetail.cmp');
		$('#frm').submit();
	});
	
});