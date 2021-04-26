<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/admintop.jsp" %>

<style type="text/css">
	
	.admin_subtitle {
		background-color: lightgray;
		padding: 10px 10px 10px 20px;
	}
	
	.admin_subtitle_name {
		font-size: 30px;
		display: inline-block;
		width: 1000px;
		font-weight: 600;
	}
	
	.new_upload {
		width: 150px;
	}
	
	.new_upload a {
		display: inline-block;
		font-size: 25px;
		text-decoration: none;
		color: black;
		font-weight: 600;
		border-radius: 5px;
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
		padding: 10px;
	}
	
	.new_upload a:hover {
		color: #fff !important;
		background: #383838;
	}
	
	.list_table {
		width: 1160px;
		margin: 20px;
		border-collapse: collapse;
		border-bottom: 3px solid gray;
	}
	.list_table th{
		border-bottom: 3px solid gray;
		padding: 5px;
	}
	
	.list_th1 {
		width: 5%;
	}
	.list_th2 {
		width: 65%;
	}
	.list_th3 {
		width: 10%;
	}
	.list_th4 {
		width: 10%;
	}
	.list_th5 {
		width: 10%;
	}
	
	td {
		padding: 5px;
		text-align: center;
	}
	
	.list_product_title {
		text-align: left;
	}
	
	.list_product_title a {
		text-decoration: none;
		color: black;
	}
	
</style>

<main>
	<div class="admin_subtitle">
		<span class="admin_subtitle_name">숙박권 관리</span>
		<span class="new_upload">
			<a href="<c:url value='/adminHotel/insertHotel.do'/>">상품 등록</a>
		</span>
	</div>
	
	<table class=list_table>
		<tr>
			<th class="list_th1">번호</th>
			<th class="list_th2">제목</th>
			<th class="list_th3">출발</th>
			<th class="list_th4">도착</th>
			<th class="list_th5">가격</th>
		</tr>
		
		<c:forEach items="${ hotelList }" var="hotel">
			<tr>
				<td>${ hotel.hotel_no }</td>
				<td class="list_product_title"><a href="<c:url value='/adminHotel/adminHotelDetail.do?hotel_no=${ hotel.hotel_no }'/>">${ hotel.hotel_title }</a></td>
				<td>${ hotel.hotel_category }</td>
				<td>${ hotel.hotel_area }</td>
				<td>${ hotel.hotel_price }원</td>
			</tr>
		</c:forEach>
	</table>

</main>

<%@ include file="../import/bottom.jsp" %>