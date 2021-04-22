<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>		
<script type="text/javascript">	

	/* var hotel_category = "${hotel.hotel_category}";
	$("#hotel_category").val(hotel_category).prop("selected", true); */

</script>
<main>
숙박권 수정
	<form action="updateHotel.do" method="post" enctype="multipart/form-data">
	
		<table>
		<tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="hotel_title" value ="${hotel.hotel_title}" /></td>
		</tr>				
		<td>		
			<select id="hotel_category" name="hotel_category">				
				<option value="사용자지정">${hotel.hotel_category}</option>
				<option value="호텔">호텔</option>
				<option value="팬션">팬션</option>
				<option value="게스트하우스">게스트하우스</option>
				<option value="캠핑">캠핑</option>
			</select>
		</td>	
			<tr>
				<td>내용</td>
				<td><textarea name="hotel_content" cols="80" rows="10">${hotel.hotel_content}</textarea></td>
			</tr>
			<tr>
				<td>지역</td>
				<td><input type="text" name = "hotel_area" value="${hotel.hotel_area}"/></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" name = "hotel_price" value="${hotel.hotel_price}"/></td>
			</tr>
			<tr>
				<td>썸네일</td>
				<td><input type="file" name="hotelImgUpload"/><span>${hotel.hotel_thumb}</span></td>
			</tr>
			<tr>
				<td>설명파일</td>
				<td><input type="file" name="hotelImgUpload" value="${hotel.hotel_img}"/></td>
			</tr>
			<tr>
				<td><input type="submit"value="등록하기" /></td>
				<td><input type="button"value="뒤로가기" /></td>
		</tr>
		</table>
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>
