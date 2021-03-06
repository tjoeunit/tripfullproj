<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>
<script type="text/javascript">
	$(function(){		
		// Radio 를 이용하여 기존 썸네일 이용 또는 변경 썸네일 선택가능 
		$('#edRadio').click(function(){
			if($('#svDiv').length > 0){
				$('#svDiv').remove();
				$('#thumbDiv').append('<div id="edDiv">변경 썸네일 : <input type="file" id="hotel_thumb" name="hotelImgUpload"></div>');
			}		
		});		
		
		$('#svRadio').click(function(){
			if($('#edDiv').length > 0){
				$('#edDiv').remove();
				$('#thumbDiv').append('<div id="svDiv">현재 썸네일 : <input type="text" name="hotelImgUpload" value="${hotel.hotel_thumb}" readonly></div>')
			}
		});
		
		// DB 저장된 값을 셀렉트 옵션으로 전송
		$('#hotel_category').val($("#hidden_category").val()).prop("selected", true);
		$('#hotel_area').val($("#hidden_area").val()).prop("selected", true);
		
		// DB 저장된 값을 ckeditor 로 전송  
		var serverContent = $('#serverContent').val();
		$('#ckeditor').val(serverContent);		
	});	
	
	/////////////////////////////////////////////////////////////
	////////////////////db 1111입력 오류 방지////////////////////////
	/////////////////////////////////////////////////////////////
	$(function(){	
		
		$('form[name=update_Hotel]').submit(function(){ 
			if($('#hotel_title').val().length < 1) {
				alert('제목을 확인하세요');
				$('#hotel_title').focus();
				event.preventDefault();
				return false;
				
			}else if ($('#hotel_price').val().length < 1){
				alert('가격을 확인하세요');
				$('#hotel_price').focus();
				event.preventDefault();
				return false;
				
			}else if ($('#ckeditor').val().length < 1){
				alert('내용을 확인하세요');
				$('#ckeditor').focus();
				event.preventDefault();
				return false;	
				
			}else if ($('#hotel_thumb').val().length < 1){
				alert('썸네일 파일을 확인하세요');
				$('#hotel_thumb').focus();
				event.preventDefault();
				return false;						
			} 
		});
	});	
</script>
<main>
	<!-- DB 저장된 값을 hidden에 저장 -->
	<input type="hidden" id="hidden_category" value="${hotel.hotel_category}">
	<input type="hidden" id="hidden_area" value="${hotel.hotel_area}">	
	<!-- ckeditor 4 -->	
 	<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
 	<br>
	<span>숙박권 등록</span>
	<br>			
	<form name="update_Hotel" action="<c:url value='/hotel/updateHotel.do'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="hotel_no" value="${hotel.hotel_no}">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="hotel_title" id="hotel_title" value="${hotel.hotel_title}"/></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="hotel_category" id="hotel_category">
						<option value="호텔" selected="selected">호텔</option>
						<option value="팬션">팬션</option>
						<option value="게스트하우스">게스트하우스</option>
						<option value="캠핑">캠핑</option>
					</select>
					<span>지역을 꼭 선택해주세요</span>
				</td>
			</tr>
			<tr>
				<td>지역</td>
				<td>
					<select name="hotel_area" id="hotel_area">
						<option value="서울" selected="selected">서울</option>
						<option value="제주도">제주도</option>
						<option value="부산">부산</option>
						<option value="인천">인천</option>
					</select>
					<span>지역을 꼭 선택해주세요</span>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="hotel_price" id="hotel_price" value="${hotel.hotel_price}"/>원</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="hotel_content" class="ckeditor" id="ckeditor"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('hotel_content', {height: 700, width: 900, filebrowserUploadUrl:'/hotelImage/imageUpload.do'});						
					</script>					
					<!-- flight_content 값을 불러 들일 textarea 생성 (display: none = hidden 효과) -->
					<textarea id="serverContent" style="display: none">${hotel.hotel_content}</textarea>
				</td>				
			</tr>			
			<tr>
				<td>썸네일</td>
				<td>
					<!-- 라디오박스를 통해 svDiv edDiv 생성 및 삭제 가능 -->
					<!-- svDiv : type="text" 기존의 파일명을 받아오고 값을 DB로 전달 -->
					<!-- edDiv : type="file" 변경할 파일명을 사용하고 값을 DB로 전달 & 파일 업로드 -->
					<div id="thumbDiv">
						<input type="radio" name="radioThumb" value="기존 썸네일 사용" id="svRadio" checked="checked"><label for="기존 썸네일 사용">기존 썸네일 사용</label>
						<input type="radio" name="radioThumb" value="변경 썸네일 사용" id="edRadio"><label for="변경 썸네일 사용">변경 썸네일 사용</label><br>										
						<div id="svDiv">
							현재 썸네일 : <input type="text" name="hotelImgUpload" value="${hotel.hotel_thumb}" readonly>
						</div>						
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="등록하기" /></td>
				<td><input type="button" value="뒤로가기" /></td>
			</tr>
		</table>
	</form>
</main>
<%@ include file="../import/bottom.jsp" %>