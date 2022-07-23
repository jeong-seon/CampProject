$(document).ready(function(){
	// 비밀번호 입력이벤트
	$('#repw').keyup(function(){
		// 할일
		// 입력된 데이터 가져오기
		var pw = $('#pw').val();
		var repw = $(this).val();
		if(repw != null){
			if(pw != repw){
				$('#repwmsg').html('# 비밀번호가 일치하지 않습니다.');
				$('#repwmsg').removeClass('w3-text-green w3-text-red').addClass('w3-text-red')
				$('#repwmsg').css('display', 'block');
				return;
			} else {
				$('#repwmsg').html('* # 비밀번호가 일치합니다. *');
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
	
	$('#editClose').click(function(){
		$('#editWin').css('display', 'none');
	});
	
	// 수정버튼 클릭이벤트
	$('#ebtn').click(function(){
		// 할일
		// 데이터 유효성 검사
		
		var nameBool = false;
		var pwBool = false;
		var mailBool = false;
		var telBool = false;
		var anoBool = false;
		var typeBool = false;
		var priceBool = false;
		var viewBool = false;
		var petBool = false;
		
		var el = $('#name');
		
		for(var i = 0 ; i < el.length ; i++ ){
			var txt = $(el).eq(i).val();
			if(!txt){
				alert('# 이름의 입력사항을 확인해주세요!');
				$(el).eq(i).focus();
				return;
			}
		}
		
		var sname = $('#name').val();
		if(sname == $('#tname').val() ){
			$('#name').prop('disabled', true);
		} else {
			nameBool = true;
		}
		
		
		var spw = $('#pw').val();
		var spw2 = $('#repw').val();
		if(spw != spw2){
			$('#repw').val('');
			$('#repw').focus();
			return;
		}
		
		if(!spw){
			// 비밀번호를 수정하지 않는 경우이므로 비밀번호는 전송하지 않는다.
			$('#pw').prop('disabled', true);
		} else if(spw && (spw == spw2)){
			var pwdRegExp =/^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			/*var pwdRegExp =/^[0-9]{4}$/;*/
			if(pwdRegExp.test($('#pw').val())){
				$('.pw.pwdRegExp').html('');
				pwBool = true;
			} else {
				alert('비밀 번호는 8개 이상의 영문 대소문자, 숫자, 특수문자로 생성해야 합니다. 형식에 맞게 입력해주세요'); 
				$("#pw").val(''); 
				$("#repw").val(''); 
				$('#repwmsg').css('display', 'none');
				$("#pw").focus(); 
				return;
			}
		}
		
		var mailRegExp =/^[a-zA-Z0-9]{4,10}@[a-zA-Z]{5,50}.[a-zA-Z]{2,5}[.]{0,1}[a-zA-Z]{0,5}$/;
		if(mailRegExp.test($('#mail').val())){
			$(".mail.pwdRegExp").html("");
		} else {
			alert('메일 아이디는 4 ~ 10개의 영문 대소문자, 숫자로 생성해야 합니다. 형식에 맞게 입력해주세요'); 
			$('#mail').val(""); 
			$('#mail').focus(); 
			return;
		}
		
		var smail = $('#mail').val();
		if(smail == $('#tmail').val() ){
			$('#mail').prop('disabled', true);
		} else {
			mailBool = true;
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
		
		var stel = $('#tel').val();
		if(stel == $('#ttel').val() ){
			$('#tel').prop('disabled', true);
		} else {
			telBool = true;
		}
		
		var sno = $('[name="ano"]:checked').val();
		if(sno == $('#tano').val()){
			$('[name="ano"]').prop('disabled', true);
		} else {
			anoBool = true;
		}
		
		var stype = $('[name="mtype"]:checked').val();
		if(stype == $('#tmtype').val()){
			$('[name="mtype"]').prop('disabled', true);
		} else {
			typeBool = true;
		}
		
		var sprice = $('[name="mprice"]:checked').val();
		if(sprice == $('#tmprice').val()){
			$('[name="mprice"]').prop('disabled', true);
		} else {
			priceBool = true;
		}
		
		var sview = $('[name="mview"]:checked').val();
		if(sview == $('#tmview').val()){
			$('[name="mview"]').prop('disabled', true);
		} else {
			viewBool = true;
		}
		
		var spet = $('[name="mpet"]:checked').val();
		if(spet == $('#tmpet').val()){
			$('[name="mpet"]').prop('disabled', true);
		} else {
			petBool = true;
		}
		
		if(!(nameBool || pwBool || mailBool || telBool || anoBool || typeBool || priceBool || viewBool || petBool)){
			// 수정 데이터가 없는 경우이므로 뷰로 돌려보낸다.
			$('#editWin').css('display', 'block');
			$('input').prop('disabled', false);
			return;
		}
		
		// 보낼 주소 설정하고
		$('#frm').attr('action', '/camp24/member/infoEditProc.cmp');
		$('#frm').submit();
	});
});