<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>
<main>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
	$(function(){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp82469177'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		var msg;
		var quantity = $('#payment_quantity').val();
		var price = $('#payment_price').val();
		var payment_price = Number(quantity) * Number(price) ;
				
		var flight_no = $('#flight_no').val()
		
		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : 'Tripfull 여행 상품 결제',
			amount : parseInt(payment_price),
		}, function(rsp) {
		//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			$.ajax({
				url: "<c:url value='/flight/flightPaymentDBEx.do'/>",
				type: "post",
				data: $('#formPayment').serialize(),
				success: function(result){
					if(result > 0){
						alert("결제 성공했습니다");
						location.href = "<c:url value='/flight/getFlight.do?flight_no="+flight_no+"'/>";
					}else{
						alert("결제 실패했습니다");
						location.href = "<c:url value='/flight/getFlight.do?flight_no="+flight_no+"'/>";
					}
				},
				error : function(xhr, status, error) {
					alert(status + ", " + error);
				}			
			});
		})
	});
	</script>
	<form id="formPayment" name="formPayment">
		멤버번호 : <input type="text" name="members_no" id="members_no" value="${members_no}"><br>
		항공번호 : <input type="text" name="flight_no" id="flight_no" value="${flight_no}"><br>		
		결제수량 : <input type="text" name="payment_quantity" id="payment_quantity" value="${payment_quantity}"><br>
		결제금액 : <input type="text" name="payment_price" id="payment_price" value="${payment_price}"><br>
		예약일 : <input type="text" name="payment_bookdate" id="payment_bookdate" value="${payment_bookdate}">
		결제일 : 자동생성
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>
