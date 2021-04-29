<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	$(function(){
		var pp = $('#payment_price').val();
		var pq = $('#payment_quantity').val();
		var cat = $('#cat').val();
		var fno = $('#flight_no').val();
		var hno = $('#hotel_no').val();
		var ano = $('#activity_no').val();
		var lno = $('#lantrip_no').val();		
		var price = Number(pp) * Number(pq)
		
		var IMP = window.IMP;
		IMP.init('imp82469177');		
		IMP.request_pay({
				pg : 'kakaopay',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : 'Tripfull 상품결제',
				amount : parseInt(price),
		},	
		
		function(rsp) {
			if(rsp.success) {
				$.ajax({
					url: "<c:url value='/payment/payment.do' />",
					type: "post",
					dataType: 'json',
					data: $('#frmPayment').serialize(),
				})
				
				.done(function(result){
					if(result > 0) {
						alert("결제 성공");
						if(cat == '항공') {
							location.href = "<c:url value='/flight/getFlight.do?flight_no="+fno+"'/>";
						}else if(cat == '숙박'){
							location.href = "<c:url value='/hotel/getHotel.do?hotel_no="+hno+"'/>";
						}else if(cat == '액티비티'){
							location.href = "<c:url value='/activity/getActivity.do?activity_no="+ano+"'/>";
						}else if(cat == '랜선여행'){
							location.href = "<c:url value='/lantrip/getLantrip.do?lantrip_no="+lno+"'/>";
						}
						
					}else {
						alert("결제 실패");
						if(cat == '항공') {
							location.href = "<c:url value='/flight/getFlight.do?flight_no="+fno+"'/>";
						}else if(cat == '숙박'){
							location.href = "<c:url value='/hotel/getHotel.do?hotel_no="+hno+"'/>";
						}else if(cat == '액티비티'){
							location.href = "<c:url value='/activity/getActivity.do?activity_no="+ano+"'/>";
						}else if(cat == '랜선여행'){
							location.href = "<c:url value='/lantrip/getLantrip.do?lantrip_no="+lno+"'/>";
						}
					}
			
				});
				
			}else {
				alert(rsp.error_msg);
				if(cat == '항공') {
					location.href = "<c:url value='/flight/getFlight.do?flight_no="+fno+"'/>";
				}else if(cat == '숙박'){
					location.href = "<c:url value='/hotel/getHotel.do?hotel_no="+hno+"'/>";
				}else if(cat == '액티비티'){
					location.href = "<c:url value='/activity/getActivity.do?activity_no="+ano+"'/>";
				}else if(cat == '랜선여행'){
					location.href = "<c:url value='/lantrip/getLantrip.do?lantrip_no="+lno+"'/>";
				}
			}
		});     
	});
</script>
<main>
	<div style="height: 650px;">
		<form id="frmPayment" name="frmPayment">
			회원번호 : <input type="hidden" name="members_no" value="${members_no}"><br>
			항공번호 : <input type="hidden" name="flight_no" id="flight_no" value="${flight_no}"><br>
			호텔번호 : <input type="hidden" name="hotel_no" id="hotel_no" value="${hotel_no}"><br>
			액티번호 : <input type="hidden" name="activity_no" id="activity_no" value="${activity_no}"><br>
			랜선번호 : <input type="hidden" name="lantrip_no" id="lantrip_no" value="${lantrip_no}"><br>
			예약일자 : <input type="hidden" name="payment_bookdate" value="${payment_bookdate}"><br>
			수량수량 : <input type="hidden" name="payment_quantity" id="payment_quantity" value="${payment_quantity}"><br>
			가격가격 : <input type="hidden" name="payment_price" id="payment_price" value="${payment_price}"><br>
			항공제목 : <input type="hidden" name="flight_title" value="${flight_title}"><br>
			호텔제목 : <input type="hidden" name="hotel_title" value="${hotel_title}"><br>
			액티제목 : <input type="hidden" name="activity_title" value="${activity_title}"><br>
			랜선제목 : <input type="hidden" name="lantrip_title" value="${lantrip_title}"><br>
			상품종류 : <input type="hidden" name="product_category" id="cat" value="${product_category}"><br>
		</form>		
	</div>
</main>

<%@ include file="../import/bottom.jsp" %>