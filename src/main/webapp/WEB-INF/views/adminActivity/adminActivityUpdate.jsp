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
		width: 85%;
		font-weight: 600;
		font-size: 30px;
	}
	
	table {
		width: 1200px;
		padding: 20px;
	}
	
	.table_td1 {
		width: 100px;
	}
	
	.insert_input {
		padding: 5px;
		width: 900px;
		border: none;
		background-color: lightgray;
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
				$('#thumbDiv').append('<div id="edDiv">변경 썸네일 : <input type="file" name="activityImgUpload"></div>');
			}
		});		
		
		$('#svRadio').click(function(){
			if($('#edDiv').length > 0){
				$('#edDiv').remove();
				$('#thumbDiv').append('<div id="svDiv">현재 썸네일 : <input type="text" name="activityImgUpload" value="${activity.activity_thumb}" readonly></div>');
			}
		});
		
		// DB 저장된 값을 셀렉트 옵션으로 전송
		/* $('#activity_category').val($("#hidden_category").val()).prop("selected", true); */
		$('#activity_area').val($("#hidden_area").val()).prop("selected", true);
		
		// DB 저장된 값을 ckeditor 로 전송  
		var serverContent = $('#serverContent').val();
		$('#ckeditor').val(serverContent);		
	});	
	
	/////////////////////////////////////////////////////////////
	////////////////////db 1111입력 오류 방지////////////////////////
	/////////////////////////////////////////////////////////////
	$(function(){	
		
		$('form[name=update_Activity]').submit(function(){ 
			if($('#activity_title').val().length < 1) {
				alert('제목을 확인하세요');
				$('#activity_title').focus();
				event.preventDefault();
				return false;
				
			}else if ($('#activity_price').val().length < 1){
				alert('가격을 확인하세요');
				$('#activity_price').focus();
				event.preventDefault();
				return false;
				
			}else if ($('#ckeditor').val().length < 1){
				alert('내용을 확인하세요');
				$('#ckeditor').focus();
				event.preventDefault();
				return false;	
				
			}else if ($('#activity_thumb').val().length < 1){
				alert('썸네일 파일을 확인하세요');
				$('#activity_thumb').focus();
				event.preventDefault();
				return false;						
			} 
		});
	});	
	
</script>

<main>
	<!-- DB 저장된 값을 hidden에 저장 -->
	<%-- <input type="hidden" id="hidden_category" value="${activity.activity_category}"> --%>
	<input type="hidden" id="hidden_area" value="${activity.activity_area}">
	<!-- ckeditor 4 -->	
	<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
	
	<form name="update_Activity" action="<c:url value='/adminActivity/adminActivityUpdate.do'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="activity_no" value="${activity.activity_no}">
		<div class="admin_subtitle">
			<span class="admin_subtitle_name"> 액티비티 상품 수정</span>
			<span class="new_upload">
				<input type="submit" class="insert_submit" value=" 수정완료 " />
			</span>
		</div>
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td><input type="text" class="insert_input" name="activity_title" id="activity_title" value="${activity.activity_title}"/></td>
				</tr>
				
				<!-- <tr>
					<td class="table_td1">카테고리</td>
					<td>
						<select name="activity_category" id="activity_category">
							<option value="호텔" selected="selected">호텔</option>
							<option value="팬션">팬션</option>
							<option value="게스트하우스">게스트하우스</option>
							<option value="캠핑">캠핑</option>
						</select>						
						<span>지역을 꼭 선택해주세요</span>
					</td>
				</tr> -->
				
				<tr>
					<td class="table_td1">지역</td>
					<td>
						<select name="activity_area" id="activity_area">
							<option value="서울" selected="selected">서울</option>
						<option value="부산">부산</option>
						<option value="군산">군산</option>
						<!-- <option value="인천">인천</option> -->
						</select>						
						<span>지역을 꼭 선택해주세요</span>
					</td>
				</tr>
				
				<tr>
					<td class="table_td1">가격</td>
					<td><input type="text" class="insert_input" name="activity_price" id="activity_price" value="${activity.activity_price}"/></td>
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
							현재 썸네일 : <input type="text" name="activityImgUpload" value="${activity.activity_thumb}" readonly>
							</div>						
						</div>
					</td>
				</tr>			
				
				<tr>
					<td class="table_td1">내용</td>
					<td>
						<textarea name="activity_content" class="ckeditor" id="ckeditor"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('activity_content', {height: 700, width: 900, filebrowserUploadUrl:'/activityImage/imageUpload.do'});
						</script>
						<!-- flight_content 값을 불러 들일 textarea 생성 (display: none = hidden 효과) -->
						<textarea id="serverContent" style="display: none">${activity.activity_content}</textarea>
					</td>
				</tr>
								
			</table>
		</div>
	</form>
	

</main>

<%@ include file="../import/bottom.jsp" %>