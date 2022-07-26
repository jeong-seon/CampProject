$(document).ready(function(){
	$('#home').click(function(){
		$(location).attr('href', '/camp24/main.cmp');
	});
	$('#mapbtn').click(function(){
		$(location).attr('href', '/camp24/map/mapApi.cmp');
	});
	$('#joinbtn').click(function(){
		$(location).attr('href', '/camp24/member/join.cmp');
	});
	$('#loginbtn').click(function(){
		$(location).attr('href', '/camp24/member/login.cmp');
	});
	$('#loutbtn').click(function(){
		$(location).attr('href', '/camp24/member/logout.cmp');
	});
	$('#schbtn').click(function(){
		$(location).attr('href', '/camp24/board/searchBoardList.cmp');
	});
	$('#freebtn').click(function(){
		$(location).attr('href', '/camp24/freeBoard/freeBoardList.cmp');
	});
	$('#qnabtn').click(function(){
		$(location).attr('href', '/camp24/qnaBoard/qnaBoardList.cmp');
	});
	$('#faqbtn').click(function(){
		$(location).attr('href', '/camp24/board/faqList.cmp');
	});
	$('#sellbtn').click(function(){
		$(location).attr('href', '/camp24/trade/trade.cmp');
	});
	$('#schbtn').click(function(){
		$(location).attr('href', '/camp24/board/searchBoardList.cmp');
	});
	$('#cmpbtn').click(function(){
		$('#apinowPage').val('1');
		$('#hfrm').attr('action', '/camp24/campapi/campApi.cmp');
		$('#hfrm').submit();
	});
	$('#revbtn').click(function(){
		$(location).attr('href', '/camp24/reviewBoard/reviewBoardList.cmp');
	});
	$('#mypagebtn').click(function(){
		$('#hfrm').attr('action', '/camp24/member/myInfo.cmp');
		$('#hfrm').submit();
	});
	
	function getToday(){
	    var date = new Date();
	    var year = date.getFullYear();
	    var month = ("0" + (1 + date.getMonth())).slice(-2);
	    var day = ("0" + date.getDate()).slice(-2);

	    return year + month + day;
	}
	function getDate(){
		var date = new Date();
		var year = date.getFullYear();
		var month = ("0" + (1 + date.getMonth())).slice(-2);
		var day = ("0" + date.getDate()).slice(-2);
		
		return year + '-' + month + '-' + day;
	}
	function getTime(date){
		var hh = date.getHours() -1;
		hh = hh >= 10 ? hh : '0' + hh;
		
	    return hh;
	}
	$('#weather').click(function(){
		
		var todayDate = getToday();
		var todayTime = getTime(new Date());
		var date = getDate();
		
		$.ajax({
			url: 'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?',
			data: {
				serviceKey: '6pAoN9O3ycxlmS7o5f7MvnwrkdKT8wZaKFSsUoVgnrgvUk8/qN3dGhpsRYTTGJ63LFtj/0kBFwzjL/y5pFa6xA==',
				pageNo: '1',
				numOfRows: '8',
				dataType: 'JSON',
				base_date: todayDate,
				base_time: todayTime + '00',
				nx: '60',
				ny: '127'
			},
			success: function(data) {
				for(var i = 0; i < data.response.body.items.item.length; i++) {
					$('#weatherWin').css('display', 'block');
					$('#weathermsg1').text('현재 날짜 및 시간 : ' + date + ' / ' + (parseInt(todayTime) + 1) + '시');
					if(data.response.body.items.item[i].category == 'T1H'){
						$('#weathermsg2').text('서울 기온 : ' + data.response.body.items.item[i].obsrValue + ' °C');
					}
					if(data.response.body.items.item[i].category == 'PTY'){
						if(data.response.body.items.item[i].obsrValue == '0'){
							$('#weathermsg3').text('강수 형태 : 없음');
							$('#weathermsg3').append('<i class="fa-solid fa-sun" style="width: 50px; height:auto;"></i>');
						}
						if(data.response.body.items.item[i].obsrValue == '1'){
							$('#weathermsg3').text('강수 형태 : 비');
							$('#weathermsg3').append('<i class="fa-solid fa-cloud-rain" style="width: 50px; height:auto;"></i>');
						}
						if(data.response.body.items.item[i].obsrValue == '2'){
							$('#weathermsg3').text('강수 형태 : 비/눈');
							$('#weathermsg3').append('<i class="fa-solid fa-cloud-sleet" style="width: 50px; height:auto;"></i>');
						}
						if(data.response.body.items.item[i].obsrValue == '3'){
							$('#weathermsg3').text('강수 형태 : 눈');
							$('#weathermsg3').append('<i class="fa-solid fa-cloud-snow" style="width: 50px; height:auto;"></i>');
						}
						if(data.response.body.items.item[i].obsrValue == '5'){
							$('#weathermsg3').text('강수 형태 : 빗방울');
							$('#weathermsg3').append('<i class="fa-solid fa-raindrops" style="width: 50px; height:auto;"></i>');
						}
						if(data.response.body.items.item[i].obsrValue == '6'){
							$('#weathermsg3').text('강수 형태 : 빗방울/눈날림');
							$('#weathermsg3').append('<i class="fa-solid fa-cloud-hail-mixed" style="width: 50px; height:auto;"></i>');
						}
						if(data.response.body.items.item[i].obsrValue == '7'){
							$('#weathermsg3').text('강수 형태 : 눈날림');
							$('#weathermsg3').append('<i class="fa-solid fa-snow-blowing" style="width: 50px; height:auto;"></i>');
						}
					}
					if(data.response.body.items.item[i].category == 'RN1'){
						var rainmm = parseFloat(data.response.body.items.item[i].obsrValue);
						if(rainmm >= 50.0){
							$('#weathermsg4').text('1시간 강수량 : ' + '50.0mm 이상');
						}
						if(rainmm >= 30.0 && rainmm < 50.0){
							$('#weathermsg4').text('1시간 강수량 : ' + '30.0 ~ 50.0mm');
						}
						if(rainmm >= 1.0 && rainmm < 30.0){
							$('#weathermsg4').text('1시간 강수량 : ' + '1.0 ~ 29.0mm');
						}
						if(rainmm < 1.0){
							$('#weathermsg4').text('1시간 강수량 : ' + '1.0mm 미만');
						}
						if(rainmm == 0){
							$('#weathermsg4').text('1시간 강수량 : ' + '강수없음');
						}
					}
					if(data.response.body.items.item[i].category == 'REH'){
						$('#weathermsg5').text('습도 : ' + data.response.body.items.item[i].obsrValue + ' %');
					}
					if(data.response.body.items.item[i].category == 'WSD'){
						$('#weathermsg6').text('풍속 : ' + data.response.body.items.item[i].obsrValue + ' m/s');
					}
				}
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
		});
	});
	
	$('#weatherClose').click(function(){
		$('#weatherWin').css('display', 'none');
	});
	
	$('#msgClose').click(function(){
		$('#msgWin').css('display', 'none');
		
		$.ajax({
			url: '/camp24/mainMsgCheck.json',
			type: 'POST',
			dataType: 'json',
			success: function(data){
				if(data.result == 'OK'){
					// 처리에 성공한 경우
					$('#msgWin').remove();
				}
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
		});
	});
	
	var image = $('#img01').attr('src');
	if(!image){
		$('#img01').attr('src', '/camp24/resources/img/pic/noimage.png');
	}
	
	// Page top button
	$(window).scroll(function () {
		if ($(this).scrollTop() > 50) {
		    $('#back-to-top').fadeIn();
		} else {
			$('#back-to-top').fadeOut();
		}
	});
	// scroll body to 0px on click
	$('#back-to-top').click(function () {
	    $('#back-to-top').tooltip('hide');
	    $('body,html').animate({
	        scrollTop: 0
	    }, 800);
	    return false;
	});
	
	$('#back-to-top').tooltip('show');
	
	
});