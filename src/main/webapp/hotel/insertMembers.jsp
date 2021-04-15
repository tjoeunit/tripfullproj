<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../import/top.jsp" %>
<main>
	<div style="margin-left: 360px;">
		호텔등록<br>
		<form action="insertHotel.do" method="post">
			<table>
				<tr>
					<td>제목 :</td>
					<td><input type="text" name="hotel_title"></td>
				</tr>
				<tr>
					<td>사진 :</td>
					<td><input type="image" name="hotel_img"></td>
				</tr>
				<tr>
					<td>썸네일 :</td>
					<td><input type="image" name="hotel_thumb"></td>
				</tr>
				<tr>
					<td>카테고리 :</td>
					<td><input type="text" name="hotel_category"></td>
				</tr>
				<tr>
					<td>가격 :</td>
					<td><input type="number" name="hotel_price"></td>
				</tr>
				<tr>
					<td>지역 :</td>
					<td><input type="text" name="hotel_area"></td>
				</tr>
		
			</table>
			<input type="submit" value="등록하기">
			<input type="button" value="뒤로가기">
		</form>
	</div>
	
</main>
<%@ include file="../import/bottom.jsp" %>