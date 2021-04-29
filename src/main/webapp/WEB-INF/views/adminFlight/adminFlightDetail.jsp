<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<%@ include file="../import/admintop.jsp" %>

<style type="text/css">
	
	.admin_subtitle {
		background-color: lightgray;
		padding: 10px 10px 10px 20px;
	}
	
	.admin_subtitle_name {
		display: inline-block;
		width: 900px;
		font-weight: 600;
		font-size: 30px;
	}
	
	.update_delete {
		width: 150px;
	}
	
	.update_delete a {
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
	
	.update_delete a:hover {
		color: #fff !important;
		background: #383838;
	}
	
	table {
		width: 1200px;
		padding: 20px;
	}
	
	.table_td1 {
		width: 100px;
	}
	
	.table_td2{
		padding: 5px;
		width: 900px;
		border: none;
		background-color: lightgray;
	}
	
	
</style>


<main>

	<div class="admin_subtitle">
		<span class="admin_subtitle_name">항공권 상세보기</span>
		<span class="update_delete">
			<a href="<c:url value='/adminFlight/adminFlightUpdate.do?flight_no=${flight.flight_no}'/>">상품수정</a>
		</span>
		<span class="update_delete">
			<a href="<c:url value='/adminFlight/adminFlightDelete.do?flight_no=${flight.flight_no}'/>">상품삭제</a>
		</span>
	</div>

	<div>
		<table class="detail_table">
			<tr>
				<td class="table_td1">제목</td>
				<td class="table_td2">${flight.flight_title}</td>
			</tr>
			
			<tr>
				<td class="table_td1">출발</td>
				<td class="table_td2">${flight.flight_departure}</td>
			</tr>
			
			<tr>
				<td class="table_td1">도착</td>
				<td class="table_td2">${flight.flight_arrival}</td>
			</tr>
			
			<tr>
				<td class="table_td1">가격</td>
				<td class="table_td2">${flight.flight_price} 원</td>
			</tr>
			
			<tr>
				<td class="table_td1">썸네일</td>
				<td class="table_td2">${flight.flight_thumb}</td>
			</tr>
			
			<tr>
				<td class="table_td1">내용</td>
				<td></td>
			</tr>
		</table>
			
		<div class="ck_content">${flight.flight_content}</div>

	</div>
	
</main>

<%@ include file="../import/bottom.jsp" %>