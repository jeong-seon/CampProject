$(document).ready(function(){
	
	 var title = $('#title').val();
	 var price =$('#price').val();
	 var tno = $('#tno').val();
    
    
    
	$('#kakaopay').click(function(){
			
		IMP.init('imp81420847') //가맹점 식별 코드\
		IMP.request_pay({
			pg : 'kakaopay.TC0ONETIME',
			pay_method: "card",//지불방법
			merchant_uid : tno, //가맹점 주문번호
			name: "dj",
			amount: 12000,
			buyer_email : "testiamport@naver.com",
			buyer_name : "몰랑",
			buyer_tel :"01000000000"
		},function(data){
			if (data.success){
				
				alert("완료 -> imp_uid : " +data.imp_uid+" / merchant_uid(orderkey) :" +data.merchant_uid);
			} else{
				alert("실패 : 코드("+data.error_code+") / 메세지 ("+data.error_msg+")");
			}
		}
		);
	});
 });