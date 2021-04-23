<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>		
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">

	$(function(){
		$('#hotel_category').val($("#test").val()).prop("selected", true);
	});
	
	//db 1111입력 오류 방지
	$(function(){	
	
	$('form[name=update_Hotel]').submit(function() { 
		if($('#hotel_title').val().length < 1) {
			alert('제목을 확인하세요');
			$('#hotel_title').focus();
			event.preventDefault();
			return false;
			
		} else if ($('#hotel_content').val().length < 1) {
			alert('내용을 확인하세요');
			$('#hotel_content').focus();
			event.preventDefault();
			return false;	
			
		} else if ($('#hotel_area').val().length < 1) {
			alert('지역을 확인하세요');
			$('#hotel_area').focus();
			event.preventDefault();
			return false;

		} else if ($('#hotel_price').val().length < 1) {
			alert('가격을 확인하세요');
			$('#hotel_price').focus();
			event.preventDefault();
			return false;
			
		} else if ($('#hotel_thumb').val().length < 1) {
			alert('썸네일 파일을 확인하세요');
			$('#hotel_thumb').focus();
			event.preventDefault();
			return false;			
			
		} else if ($('#hotelImgUpload').val().length < 1) {
			alert('사진 파일을 확인하세요');
			$('#hotelImgUpload').focus();
			event.preventDefault();
			return false;	
		}
	});
});
	
	
	
</script>

<main>
숙박권 수정
	<form name="update_Hotel" action="updateHotel.do" method="post" enctype="multipart/form-data" >
		<input type="hidden" id="test" value="${hotel.hotel_category}">		
		
		<table>
		<tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="hotel_title" id="hotel_title" value ="${hotel.hotel_title}" /></td>
		</tr>				
		<td>		
			<select id="hotel_category" name="hotel_category">				
				<option value="호텔">호텔</option>
				<option value="팬션">팬션</option>
				<option value="게스트하우스">게스트하우스</option>
				<option value="캠핑">캠핑</option>
			</select>
		</td>	
			<tr>
				<td>내용</td>
				<td><textarea name="hotel_content" id="hotel_content" cols="80" rows="10">${hotel.hotel_content}</textarea></td>
			</tr>
			<tr>
				<td>지역</td>
				<td><input type="text" name = "hotel_area" id="hotel_area" value="${hotel.hotel_area}"/></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name = "hotel_price" id="hotel_price" value="${hotel.hotel_price}"/></td>
			</tr>
			<tr>
				<td>썸네일</td>
				<td><input type="file" name="hotelImgUpload" id="hotel_thumb" /><span>현재 '${hotel.hotel_thumb}'파일이 업로드 되어있습니다.</span>		
				</td>
				
			</tr>
			<tr>
				<td>설명파일</td>
				<td><input type="file" name="hotelImgUpload" id="hotelImgUpload" /><span>현재 '${hotel.hotel_img}'파일이 업로드 되어있습니다.</span>
				</td>		
			</tr>
			<tr>
				<td><input type="submit"value="등록하기" /></td>
				<td><input type="button"value="뒤로가기" /></td>
		</tr>
		</table>
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>
