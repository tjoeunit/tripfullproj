<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>
<style>

</style>

<script type="text/javascript">
	$(function(){
		
		$('#fno').val();
		$('#hno').val();
		$('#ano').val();
		$('#lno').val();
		
	});

</script>


<main>

	<input type="hidden" id="fno" value="${payment.flight_no}">
	<input type="hidden" id="hno" value="${payment.hotel_no}">
	<input type="hidden" id="ano" value="${payment.activity_no}">
	<input type="hidden" id="lno" value="${payment.lantrip_no}">
	
	
	<table>
		<tr>
			<td>결제번호</td>			
			<td>상품명</td>
			<td>예약일자</td>
			<td>수량</td>
			<td>가격</td>
			<td>결제일</td>
		</tr>	
		<c:forEach items="${paymentList}" var="payment">			
		<tr>
			<td>${payment.payment_no}</td>
			<td></td>
			<td>${payment.payment_bookdate}</td>
			<td>${payment.payment_quantity}</td>
			<td>${payment.payment_price}</td>
			<td>${payment.payment_date}</td>
		</tr>
		</c:forEach>	
	</table>
	
</main>

<%@ include file="../import/bottom.jsp" %>
