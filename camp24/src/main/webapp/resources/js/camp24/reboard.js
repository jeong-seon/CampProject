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
	
	$('#rbtn').click(function(){
		document.frm.reset();
	});
	
	// 리뷰쓰기 버튼
	$('#wbtn').click(function(){
		$('#pageFrm').attr('action', '/camp24/reviewBoard/reviewBoardWrite.cmp');
		$('#pageFrm').submit();
	});
	
	/* 게시글 수정 버튼 클릭 이벤트 처리 */
	$('.ebtn').click(function(){
		var sno = $(this).attr('id');
		$('#rno').val(sno);
		
		$('#frm').attr('action', '/camp24/reviewBoard/reviewBoardEdit.cmp');
		$('#frm').submit();
	});
	
	//삭제
	$('.dbtn').click(function(){
		var sno = $(this).attr('id');
		
		$('#ybtn').click(function(){
			$('#rno').val(sno);
			$('#frm').attr('action', '/camp24/reviewBoard/reviewBoardDelete.cmp');
			$('#frm').submit();
		
		});
		$('#nbtn').click(function(){
			$('#modal2').css('display', 'none');
		});
	});
	
	
	//이전페이지 버튼
	$('#listbtn').click(function(){
		$('#frm').attr('action', '/camp24/reviewBoard/reviewBoardList.cmp');
		$('#nowPage').prop('disabled', true);
		$('#title').prop('disabled', true);
		$('#body').prop('disabled', true);
		$('#cname').prop('disabled', true);
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
	
	// 상세보기 버튼 클릭
	$('.revList').click(function(){
		var sno = $(this).attr('id');
		
		$('#rno').val(sno);
		$('#frm').attr('action', '/camp24/reviewBoard/reviewBoardDetail.cmp');
		$('#frm').submit();
	});
	
	
	
	$('.evtPic').click(function(){
		// 파일번호 꺼내오고
		var sno = $(this).attr('id');
		var el = $(this);
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url: '/camp24/reviewBoard/fileDel.json',
				type: 'post',
				dataType: 'json',
				data: {
					ino: sno
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
		
		// 수정 여부 검사
		var otitle = $('#otitle').val();
		var obody = $('#obody').val();
		var oscore = $('#oscore').val();
		
		var title = $('#title').val();
		var body = $('#body').val();
		var score = $('input:radio[name=score]:checked').val();
		
		if(otitle == title && obody == body && $('#filebox > input').length == 1 && oscore == score){
			$('#editWin').css('display', 'block');
			return;
		}
		
		$('#frm').submit();
	});
	
	$('#editClose').click(function(){
		$('#editWin').css('display', 'none');
	});
	
	// 좋아요 버튼 클릭
	$('.like').click(function(){
		var srno = $(this).parent().attr('id');
		
		var sid = $('#id').val();
		
		$.ajax({
			url: '/camp24/reviewBoard/likeCnt.json',
			type: 'post',
			dataType: 'json',
			data: {
				id: sid,
				rno: srno
			},
			success: function(likeCheck){
				if(likeCheck == 0){
					location.reload();
				} else if (likeCheck == 1){
					location.reload();
				}
			},
			error: function(){
				$(location).attr('href', '/camp24/member/login.cmp');
			}
		});
	});
	
	// 캠핑장 명으로 검색
	$('#searchbtn').click(function(){
		document.schfrm.submit();
	});
	
});