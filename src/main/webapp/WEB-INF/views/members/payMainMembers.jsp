<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<main>						
	<table>
		<tr>
			<td>결제번호</td>
			<td>상품종류</td>
			<td>상품명</td>			
			<td>예약일자</td>
			<td>수량</td>
			<td>가격</td>
			<td>결제일</td>
		</tr>
		
		<c:forEach items="${paymentList}" var="payment">
		
		<tr>
			<td><input type="text" id="payment_no" value="${payment.payment_no}"></td>
			<td><input type="text" id="product_category" value="${payment.product_category}"></td>			
			<td><input type="text" id="xx" value="${payment.flight_title}${payment.hotel_title}${payment.activity_title}${payment.lantrip_title}">			</td>
			<td><input type="text" id="payment_bookdate" value="${payment.payment_bookdate}"></td>
			<td><input type="text" id="payment_quantity" value="${payment.payment_quantity}"></td>
			<td><input type="text" id="payment_price" value="${payment.payment_price}"></td>
			<td><input type="text" id="payment_date" value="${payment.payment_date}"></td>
		</tr>	
		
		</c:forEach>
	</table>
	
</main>

<%@ include file="../import/bottom.jsp" %>
