$(document).ready(function(){
	
	$(document.frm.gen).change(function(){
		var sgen = $(this).val();
		$('#avtfr').stop().slideUp(500, function(){	
			if(sgen == 'M'){
				$('#favt').css('display', 'none');
				$('#mavt').css('display', 'block');
				$('#avtfr').stop().slideDown(500);
			} else{
				$('#mavt').css('display', 'none');
				$('#favt').css('display', 'block');
				$('#avtfr').stop().slideDown(500);			
			}
		});
	});		
	// 아이디체크버튼 클릭이벤트
	$('#idck').click(function(){
		// 할일
		// 입력한 아이디 정보 가져오기
		var sid = $('#id').val();
		
		if(!sid){
			// 입력 내용이 없는 경우
			$('#id').focus();
			alert('* 아이디를 입력하세요!');
			return;
		}
		// 사용가능 유무 판단
		$.ajax({
			url: '/camp24/member/idCheck.json',
			type: 'post',
			dataType: 'json',
			data: {
				id: sid
			},
			success: function(data){
				var result = data.result;
				$('#idmsg').removeClass('w3-text-green w3-text-red');
				
				// 아이디 우선 정규식 검사							
				var idRegExp =/^[a-zA-Z0-9]{4,10}$/;
				
				if(idRegExp.test($('#id').val())){
					/*$(".id.idRegExp").html("");*/
					// 뷰에 출력					
					if(result == 'OK'){
						// 입력된 아이디가 사용 가능한 경우
						$('#idmsg').html('* 사용 가능한 아이디입니다! *');
						$('#idmsg').addClass('w3-text-green');
						$('#idCheck').val('Y');
					} else {
						// 입력된 아이디가 사용 불가능한 경우
						$('#idmsg').html('* 사용 불가능한 아이디입니다! *');
						$('#idmsg').addClass('w3-text-red');
					}
				} else {
					alert("아이디는 4 ~ 10개의 영문 대소문자, 숫자로 생성해야 합니다. 형식에 맞게 입력해주세요"); 
					if(true){
						$('#idmsg').html('');
						$('#idmsg').css('display', 'none');
						$("#id").val("");  
						$("#id").focus(); 
					}
				}
				$('#idmsg').css('display', 'block');			
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
		});
	});
	
	$('idmsg').css('display','none');
	$('#id').keyup(function(){
		var id = $('#id').val();
		
		if(id == ''){
			$('#idmsg').css('display', 'none');
		}
	});
	
	// 비밀번호 입력이벤트
	$('#repw').keyup(function(){
		// 할일
		// 입력된 데이터 가져오기
		var pw = $('#pw').val();
		var repw = $(this).val();
		if(repw != null){
			if(pw != repw){
				$('#repwmsg').html('* 비밀번호가 일치하지 않습니다. *');
				$('#repwmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red')
				$('#repwmsg').css('display', 'block');
				return;
			} else {
				$('#repwmsg').html('* 비밀번호가 일치합니다. *');
				$('#repwmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-green');
				$('#repwmsg').css('display', 'block');
			}
		}
	});
	
	$('repwmsg').css('display','none');
	$('#pw').keyup(function(){
		var id = $('#pw').val();
		
		if(id == ''){
			$('#repwmsg').css('display', 'none');
		}
	});
	
	$('#repw').keyup(function(){
		var id = $('#repw').val();
		
		if(id == ''){
			$('#repwmsg').css('display', 'none');
		}
	});
	
	$('#jbtn').click(function(){
		// 데이터 유효성 검사
		// 사용가능 유무 판단
		var name = $('#name').val();
		
		var gen = $('[name="gen"]:checked').val();
		var ano = $('[name="ano"]:checked').val();
		
		var el = $('#name');
		
		for(var i = 0 ; i < el.length ; i++ ){
			var txt = $(el).eq(i).val();
			if(!txt){
				alert('# 이름의 입력사항을 확인해주세요!');
				$(el).eq(i).focus();
				return;
			}
		}
		
		var idRegExp =/^[a-zA-Z0-9]{4,10}$/;
				
		if(idRegExp.test($('#id').val())){
			$('.id.idRegExp').html('');
		} else {
			alert('아이디는 4 ~ 10개의 영문 대소문자, 숫자로 생성해야 합니다. 형식에 맞게 입력해주세요'); 
			$('#id').val('');  
			$('#id').focus(); 
			return;
		}
		
		if($('#idCheck').val()!='Y'){
			alert('아이디 중복체크를 해주세요.');
			$('#idCheck').eq(0).focus();
			return false;
		}
		
		var pwdRegExp =/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		/*var pwdRegExp =/^[0-9]{4}$/;*/
		if(pwdRegExp.test($('#pw').val())){
			$('.pw.pwdRegExp').html('');
		} else {
			alert('비밀 번호는 8개 이상의 영문 대소문자, 숫자, 특수문자로 생성해야 합니다. 형식에 맞게 입력해주세요'); 
			$('#pw').val(''); 
			$('#pwck').val(''); 
			$('#pw').focus(); 
			return;
		}
		
		var mailRegExp =/^[a-zA-Z0-9]{4,10}@[a-zA-Z]{5,50}.[a-zA-Z]{2,5}[.]{0,1}[a-zA-Z]{0,5}$/;
		if(mailRegExp.test($('#mail').val())){
			$('.mail.pwdRegExp').html('');
		} else {
			alert('메일 아이디는 4 ~ 10개의 영문 대소문자, 숫자로 생성해야 합니다. 형식에 맞게 입력해주세요'); 
			$('#mail').val(''); 
			$('#mail').focus(); 
			return;
		}
		
		var telRegExp =/^01[0-9]{1}-[0-9]{3,4}-[0-9]{4}$/;
		if(telRegExp.test($('#tel').val())){
			$('.tel.pwdRegExp').html('');
		} else {
			alert('휴대전화번호는 01*-***-**** 또는 01*-****-**** 형태의 숫자로 생성해야 합니다. 형식에 맞게 입력해주세요'); 
			$('#tel').val(''); 
			$('#tel').focus(); 
			return;
		}
		
		if(!(gen && ano)){
			alert('# 성별과 아바타 입력사항을 확인해주세요!');
			return;
		}	
		$('#frm').attr('action', '/camp24/member/joinProc.cmp').submit();		
	});
	
	// 리셋 버튼
	$('#rbtn').click(function(){
		$(location).attr('href', '/camp24/member/join.cmp');
	});
	
	// 홈 버튼
	$('#hbtn').click(function(){
		$(location).attr('href', '/camp24/main.cmp');
	});
	
	var code = "";	// 메일전송 인증번호 저장 위한 코드
	
	// 메일 인증번호 전송
	$('.mail_check_button').click(function(){
		var email = $('.mail_input').val();	// 입력한 메일
		var checkBox = $('.mail_check_input'); // 인증번호 입력란
		var boxWrap = $('.mail_check_input_box'); // 인증번호 입력란 박스
		
		if(!email){
			$('.mail_input').focus();
			alert('메일을 입력해주세요.');
			return;
		}
		
			$.ajax({
				type: "GET",
				url: "mailCheck?email=" + email,
				success:function(data){
					
					
				// console.log("data : " + data);
				 checkBox.attr('disabled', false);
				 boxWrap.attr('id', 'mail_check_input_box_true');
				code = data;
				alert('인증번호가 전송되었습니다.');
			
			}
			
		});
	});
	
	// 인증번호 비교
	$('.mail_check_input').keyup(function(){
		
		var inputCode = $(this).val();		// 입력코드
		var checkResult = $('#mail_check_input_box_warn');  // 비교 결과
		
		if(inputCode == code){								// 일치할 경우
			checkResult.html('* 인증번호가 일치합니다. *');
			checkResult.attr('class', 'correct');
		} else {											// 일치하지 않을 경우
			checkResult.html('* 인증번호를 다시 확인해주세요. *');
			checkResult.attr('class', 'incorrect');
		}
	});
});