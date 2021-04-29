<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/admintop.jsp" %>

<style type="text/css">

	.admin_subtitle {
		background-color: lightgray;
		padding: 10px 10px 10px 20px;
	}
	
	.admin_subtitle_name {
		display: inline-block;
		width: 1000px;
		font-weight: 600;
		font-size: 30px;
	}
	
	.new_upload {
		width: 150px;
	}
	
	.insert_table {
		width: 1200px;
		padding: 20px;
	}
	
	.table_td1 {
		width: 100px;
	}
	
	.select_box {
		width: 100px;
		text-align: center;
		padding: 2px;
	}
	
	.insert_input {
		padding: 5px;
		width: 1052px;
		border: none;
		background-color: lightgray;
	}
	
	.ckeditor {
		width: 100%;
	}
	
	.insert_submit {
		cursor: pointer;
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
		background-color: lightgray;
		border: none;
	}
	
	.insert_submit:hover {
		color: #fff !important;
		background: #383838;
	}
	
	
</style>

<script type="text/javascript">
	$(function(){
		
		// Radio 를 이용하여 기존 썸네일 이용 또는 변경 썸네일 선택가능 
		$('#edRadio').click(function(){
			if($('#svDiv').length > 0){
				$('#svDiv').remove();
				$('#thumbDiv').append('<div id="edDiv">변경 썸네일 : <input type="file" name="flightImgUpload"></div>');
			}
		});		
		
		$('#svRadio').click(function(){
			if($('#edDiv').length > 0){
				$('#edDiv').remove();
				$('#thumbDiv').append('<div id="svDiv">현재 썸네일 : <input type="text" name="flightImgUpload" value="${flight.flight_thumb}" readonly></div>');
			}
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
	
	<form action="<c:url value='/adminFlight/adminFlightUpdate.do'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="flight_no" value="${flight.flight_no}">
		
		<div class="admin_subtitle">
			<span class="admin_subtitle_name">항공권 상품 수정</span>
			<span class="new_upload">
				<input type="submit" class="insert_submit" value=" 수정완료 " />
			</span>
		</div>
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td><input type="text" class="insert_input" name="flight_title" value="${flight.flight_title}"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">출발</td>
					<td>
						<select name="flight_departure" id="flight_departure" class="select_box">
							<option value="서울" selected="selected">서울</option>
							<option value="부산">부산</option>
						</select>						
						<span>지역을 꼭 선택해주세요</span>
					</td>
				</tr>
				
				<tr>
					<td class="table_td1">도착</td>
					<td>
						<select name="flight_arrival" id="flight_arrival" class="select_box">
							<option value="서울" selected="selected">서울</option>
							<option value="부산">부산</option>
						</select>						
						<span>지역을 꼭 선택해주세요</span>
					</td>
				</tr>
				
				<tr>
					<td class="table_td1">가격</td>
					<td><input type="text" class="insert_input" name="flight_price" value="${flight.flight_price}"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">썸네일</td>
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
					<td class="table_td1">내용</td>
					<td>
						<textarea name="flight_content" class="ckeditor" id="ckeditor"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('flight_content', {height: 700, filebrowserUploadUrl:'/flightImage/imageUpload.do'});
						</script>
						<!-- flight_content 값을 불러 들일 textarea 생성 (display: none = hidden 효과) -->
						<textarea id="serverContent" style="display: none">${flight.flight_content}</textarea>
					</td>
				</tr>
								
			</table>
		</div>
	</form>
	

</main>

<%@ include file="../import/bottom.jsp" %>