<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<main>
숙박권
	<form action="insertHotel.do" method="post" enctype="multipart/form-data">
		<table>
		<tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="hotel_title" /></td>
		</tr>
		<td>
			<select name="hotel_category">
				<option value="호텔" selected="selected">호텔</option>
				<option value="팬션">팬션</option>
				<option value="게스트하우스">게스트하우스</option>
				<option value="캠핑">캠핑</option>
			</select>
		</td>
			<tr>
				<td>내용</td>
				<td><textarea name="hotel_content" cols="80" rows="10"></textarea></td>
			</tr>
			<tr>
				<td>지역</td>
				<td><input type="text" name = "hotel_area"/></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" name = "hotel_price"/></td>
			</tr>
			<tr>
				<td>썸네일</td>
				<td><input type="file" name="hotelImgUpload"/></td>
			</tr>
			<tr>
				<td>설명파일</td>
				<td><input type="file" name="hotelImgUpload"/></td>
			</tr>
			<tr>
				<td><input type="submit"value="등록하기" /></td>
				<td><input type="button"value="뒤로가기" /></td>
		</tr>
		</table>
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>
