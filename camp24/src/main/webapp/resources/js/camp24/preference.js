$(document).ready(function(){
	
	$(document.frm.type).change(function(){
		var stype = $(this).val();
		$('#typefr').stop().slideUp(500, function(){	
			if(stype == 'TY'){
				$('#sntype').css('display', 'none');
				$('#sytype').css('display', 'block');
				$('#typefr').stop().slideDown(500);
			} else if(stype == 'TN'){
				$('#sytype').css('display', 'none');
				$('#sntype').css('display', 'block');
				$('#typefr').stop().slideDown(500);			
			}
		});
	});
	
	$(document.frm.price).change(function(){
		var sprice = $(this).val();
		$('#pricefr').stop().slideUp(500, function(){	
			if(sprice == 'PY'){
				$('#snprice').css('display', 'none');
				$('#syprice').css('display', 'block');
				$('#pricefr').stop().slideDown(500);
			} else if(sprice == 'PN'){
				$('#syprice').css('display', 'none');
				$('#snprice').css('display', 'block');
				$('#pricefr').stop().slideDown(500);			
			}
		});
	});
	
	$(document.frm.mview).change(function(){
		var sview = $(this).val();
		$('#viewfr').stop().slideUp(500, function(){	
			if(sview == 'VY'){
				$('#snview').css('display', 'none');
				$('#syview').css('display', 'block');
				$('#viewfr').stop().slideDown(500);
			} else if(sview == 'VN'){
				$('#syview').css('display', 'none');
				$('#snview').css('display', 'block');
				$('#viewfr').stop().slideDown(500);			
			}
		});
	});
	
	$(document.frm.pet).change(function(){
		var spet = $(this).val();
		$('#petfr').stop().slideUp(500, function(){	
			if(spet == 'PY2'){
				$('#snpet').css('display', 'none');
				$('#sypet').css('display', 'block');
				$('#petfr').stop().slideDown(500);
			} else if(spet == 'PN2'){
				$('#sypet').css('display', 'none');
				$('#snpet').css('display', 'block');
				$('#petfr').stop().slideDown(500);			
			}
		});
	});
	
	/*
	// .yet 클릭이벤트
	$('.yet').click(function(){
		var sno = $(this).attr('id');
		var txt = $(this).html();
		txt = txt.substring(txt.indexOf('.') + 2);
		
		$('#title').val(txt);
		$('#sino').val(sno);
		
//		alert($('#title').val() + ' - ' + $('#sino').val());
		
		$('#frm').submit();
	});
	
	$('.done').click(function(){
		// 넘겨줄 데이터 읽어오고
		var sno = $(this).attr('id');
		var txt = $(this).text();
		txt = txt.substring(txt.indexOf('.') + 2);
		
		// 입력태그에 데이터 채우고
		$('#sino').val(sno);
		$('#title').val(txt);
		
		// 서버주소 정하고
		$('#frm').attr('action', '/camp24/survey/surveyResult.cmp');
		// 폼 전송하고
		$('#frm').submit();
	});
	*/
	/* 홈버튼 클릭이벤트 */
	$('#hbtn').click(function(){
		$(location).attr('href', '/camp24/');
	});
	
	$('#sbtn').click(function(){
		$('#frm').attr('action', '/camp24/preference/preferenceProc.cmp');
		$('#frm').submit();
	});
	
	/*
	$('#rbtn').click(function(){
		document.frm1.reset();
	});
	*/
	/*
	$('#sbtn').click(function(){
		var el1 = $('.quest');
		var len1 = el1.length;
		var dap = $('[type="radio"]:checked');
		var len2 = dap.length;
		
		if(len1 != len2){
			// 선택하지 않은 문항이 존재한다.
			return;
		}
		
		for(i = 0; i < len2 ; i++){
			var tmp = $(dap).eq(i).val();
			
//			$('#frm').append('<input type="hidden" name="dap" value="' + tmp + '">');
			
			var el = document.createElement('input');
			$(el).attr('type', 'hidden');
			$(el).attr('name', 'dap');
			$(el).val(tmp);
			$('#frm').append(el);
		}
		$('#frm').attr('action', '/camp24/survey/surveyProc.cmp');
		$('#frm').submit();
	});
	*/
});