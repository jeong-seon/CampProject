$(document).ready(function(){

	$('#kakaopay').click(function(){
		var price = document.getElementById('price').value;
		var title = document.getElementById('title').value;
		var tno = document.getElementById('tno').value;
		var id = document.getElementById('id').value;
        
		
		IMP.init('imp81420847') //가맹점 식별 코드\
		IMP.request_pay({
			pg : 'kakaopay.TC0ONETIME',
			pay_method: "card",//지불방법
			merchant_uid : tno, //가맹점 주문번호
			name: title,
			amount: price,
			id : id,
			buyer_email : "testiamport@naver.com",
			buyer_name : "몰랑",
			buyer_tel :"01000000000"
		},function(data){	
			if (data.success){
				
			var	msg = '결제가 완료되었습니다.';
                msg += '\n고유ID : ' + data.imp_uid;
                msg += '\n상점 거래ID : ' + data.merchant_uid;
                msg += '\결제 금액 : ' + data.paid_amount +'원';
                
                alert(msg);
                
                document.location.href="/camp24/trade/trade.cmp"; //alert창 확인 후 이동할 url 설정
			} else{
				
				alert("실패 : 코드("+data.error_code+") / 메세지 ("+data.error_msg+")");
				
			}
		}
		);
	});
 });