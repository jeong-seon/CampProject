$(document).ready(function(){
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.3595704, 127.105399),
	    zoom: 17
	});

	var marker = new naver.maps.Marker({
	    position: new naver.maps.LatLng(37.3595704, 127.105399),
	    map: map
	});

	naver.maps.Event.addListener(map, 'click', function(e) {
	    marker.setPosition(e.latlng);
	});
	
	$('#sbtn').click(function(){
		var mapX = $('#mapX').text();
		var mapY = $('#mapY').text();
		
		$('#X').val(mapX);
		$('#Y').val(mapY);
		
		$.ajax({
			url: '/camp24/map/mapXY.json',
			type: 'post',
			dataType: 'json',
			success: function(arr){
				var map = new naver.maps.Map('map', {
					center: new naver.maps.LatLng(items[0].x , items[0].y),
					zoom: 17
				});
				
				var marker = new naver.maps.Marker({
					position: new naver.maps.LatLng(mapY, mapX),
					map: map
				});
				
				$('#frm').submit();
			},
			error: function(){
				alert('### 통신에러 ###');
			}
		});
		
	});
});