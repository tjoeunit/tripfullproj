<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<main>
	<span>${members_id} 님의 결제정보</span>
	<table class = "table_list">
		<tr class="table_top">
			<th class="table_th1">결제번호</th>
			<th class="table_th2">상품종류</th>
			<th class="table_th3">상품명</th>
			<th class="table_th4">가격</th>
			<th class="table_th5">수량</th>
			<th class="table_th6">예약일</th>
			<th class="table_th7">결제일</th>	
		</tr>
		<c:forEach items="${paymentList}" var="payment">
		<tr>
			<td>${payment.payment_no}</td>
			<td>${payment.product_category}</td>
			<td>${payment.flight_title}${payment.hotel_title}${payment.activity_title}${payment.lantrip_title}</td>
			<td>${payment.payment_price}</td>
			<td>${payment.payment_quantity}</td>
			<td>${payment.payment_bookdate}</td>
			<td><fmt:formatDate value="${payment.payment_date}" pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach>
	</table>	
</main>

<%@ include file="../import/bottom.jsp" %>
