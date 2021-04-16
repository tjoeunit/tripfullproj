<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔 목록</title>
</head>
<body>
	<center>
		<!-- 검색 시작 -->
		<form action="getHotelList.do" method="get">
			<table class="hotel_search">
				<tr>
					<td align="right">
					<select name="hotelsearchCondition">
						<c:forEach items="${conditionMap }" var="option">
							<option value="${option.value }">${option.key }
						</c:forEach>							
					</select> 
					<input name="searchKeyword" type="text" /> 
					<input type="submit" value="검색"/>
					</td>
				</tr>
			</table>
		</form>
		<!-- 검색 종료 -->
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr class="top_hotel_list">
				<th>썸네일</th>
				<th>제목</th>
				<th>카테고리</th>
				<th>가격</th>
			</tr>
			<c:forEach items="${hotelList}" var="hotel">
				<tr>
					<td>${hotel.hotel_thumb }</td>
					<td>${hotel.hotel_title}</td>
					<td>${hotel.hotel_category }</td>
					<td>${hotel.hotel_price }</td>					
				</tr>
			</c:forEach>
		</table>
		<br><a href="<c:url value='/hotel/viewInsertHotel.do'/>">새글 등록</a>
	</center>
</body>
</html>