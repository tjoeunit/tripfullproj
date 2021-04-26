<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>
<script type="text/javascript">
	$(function(){		
		// Radio 를 이용하여 기존 썸네일 이용 또는 변경 썸네일 선택가능 
		$('#edRadio').click(function(){
			$('#svDiv').remove();
			$('#thumbDiv').append('<div id="edDiv">변경 썸네일 : <input type="file" name="flightImgUpload"></div>');
		});		
		$('#svRadio').click(function(){
			$('#edDiv').remove();
			$('#thumbDiv').append('<div id="svDiv">현재 썸네일 : <input type="text" name="flightImgUpload" value="${flight.flight_thumb}" readonly></div>')
		});
		
		// DB 저장된 값을 셀렉트 옵션으로 전송
		$('#flight_departure').val($("#hidden_departure").val()).prop("selected", true);
		$('#flight_arrival').val($("#hidden_arrival").val()).prop("selected", true);
		
		// DB 저장된 값을 ckeditor 로 전송  
		var serverContent = $('#serverContent').val();
		$('#ckeditor').val(serverContent);		
	});	
</script>
<main>
	<!-- DB 저장된 값을 hidden에 저장 -->
	<input type="hidden" id="hidden_departure" value="${flight.flight_departure}">
	<input type="hidden" id="hidden_arrival" value="${flight.flight_arrival}">	
	<!-- ckeditor 4 -->	
 	<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
 	<br>
	<span>항공권 등록</span>
	<br>			
	<form action="<c:url value='/flight/updateFlight.do'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="flight_no" value="${flight.flight_no}">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="flight_title" value="${flight.flight_title}"/></td>
			</tr>
			<tr>
				<td>출발지</td>
				<td>
					<select name="flight_departure" id="flight_departure">
						<option value="서울" selected="selected">서울</option>
						<option value="부산">부산</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>도착지</td>
				<td>
					<select name="flight_arrival" id="flight_arrival">
						<option value="서울" selected="selected">서울</option>
						<option value="부산">부산</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="flight_price" value="${flight.flight_price}"/>원</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="flight_content" class="ckeditor" id="ckeditor"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('flight_content', {height: 700, width: 900, filebrowserUploadUrl:'/flightImage/imageUpload.do'});						
					</script>					
					<!-- flight_content 값을 불러 들일 textarea 생성 (display: none = hidden 효과) -->
					<textarea id="serverContent" style="display: none">${flight.flight_content}</textarea>
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
							현재 썸네일 : <input type="text" name="flightImgUpload" value="${flight.flight_thumb}" readonly>
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