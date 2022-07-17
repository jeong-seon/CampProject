$(document).ready(function(){

	
	$('#sbtn').click(function(){
		var input = $('#name').val();
		
		$('#editWin').css('display', 'block');
		
		$.ajax({
			post: 'get',
			url: 'http://api.visitkorea.or.kr/openapi/service/rest/GoCamping/basedList?',
			data: {
				ServiceKey: '6pAoN9O3ycxlmS7o5f7MvnwrkdKT8wZaKFSsUoVgnrgvUk8/qN3dGhpsRYTTGJ63LFtj/0kBFwzjL/y5pFa6xA==',
				numOfRows: '3015',
				pageNo: '1',
				MobileOS: 'ETC',
				MobileApp: 'appName',
				_type: 'json'
			},
			success: function(data){
				var markers = [];
				var infowindows = [];
				
				for(var i = 0; i < data.response.body.items.item.length; i++) {
					
					if(data.response.body.items.item[i].facltNm.includes(input) == true) {
						
						var map = new naver.maps.Map('map', {
							center: new naver.maps.LatLng(data.response.body.items.item[i].mapY , data.response.body.items.item[i].mapX),
							zoom: 17
						});
						
						var contentString = [
						    '<div class="iw_inner w3-center" style="margin-left: 10px; margin-right: 10px;">',
						    '   <h3>' + data.response.body.items.item[i].facltNm + '</h3>',
						    '   <p>' + data.response.body.items.item[i].addr1 + '<br>',
						    '       <img style="margin-top: 10px; margin-bottom: 10px;" src="' + data.response.body.items.item[i].firstImageUrl + '" width="100" height="100" alt="' + data.response.body.items.item[i].facltNm + '" class="thumb" /><br>',
						    '       <a href="' + data.response.body.items.item[i].homepage + '" target="_blank">' + data.response.body.items.item[i].homepage + '</a>',
						    '   </p>',
						    '</div>'
						].join('');
						
						var marker = new naver.maps.Marker({
							position: new naver.maps.LatLng(data.response.body.items.item[i].mapY, data.response.body.items.item[i].mapX),
							map: map
						});
						
						var infowindow = new naver.maps.InfoWindow({
						    content: contentString
						});
						
						naver.maps.Event.addListener(marker, "click", function(e) {
						    if (infowindow.getMap()) {
						        infowindow.close();
						    } else {
						        infowindow.open(map, marker);
						    }
						});
					}
				}
			},
			error: function(){
				alert('### 통신 에러 ###');
			}
		});
	});
	
	$('#editClose').click(function(){
		$('#editWin').css('display', 'none');
	});
	
});