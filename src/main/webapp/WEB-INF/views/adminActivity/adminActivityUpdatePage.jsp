<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<%@ include file="../import/admintop.jsp" %>

<script type="text/javascript">
//Radio 를 이용하여 기존 썸네일 이용 또는 변경 썸네일 선택가능 
	$(function(){	
		$('#edRadio').click(function(){
			if($('#svDiv').length > 0){
				$('#svDiv').remove();
				$('#thumbDiv').append('<div id="edDiv">변경 썸네일 : <input type="file" id="activity_thumb" name="activityImgUpload"></div>');
			}
		});		
		
		$('#svRadio').click(function(){
			if($('#edDiv').length > 0){
				$('#edDiv').remove();
				$('#thumbDiv').append('<div id="svDiv">현재 썸네일 : <input type="text" id="activity_thumb" name="activityImgUpload" value="${activity.activity_thumb}" readonly></div>');
			}
		});
		
		// DB 저장된 값을 셀렉트 옵션으로 전송
		$('#activity_area').val($("#hidden_area").val()).prop("selected", true);
		
		var numReg = /^[0-9]+$/;
		
		$('form[name=frm]').submit(function(){ 
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
				
			}else if (!numReg.test($("#activity_price").val())) {
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

<main>
	<!-- DB 저장된 값을 hidden에 저장 -->
	<input type="hidden" id="hidden_area" value="${activity.activity_area}">
	<!-- ckeditor 4 -->	
	<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>	
	<form name="frm" action="<c:url value='/adminActivity/adminActivityUpdate.do'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="activity_no" value="${activity.activity_no}">
		<div class="admin_subtitle">
			<span class="admin_subtitle_name">액티비티 상품 수정</span>
			<span class="new_upload">
				<input type="submit" class="insert_submit" value=" 수정완료 " />
			</span>
		</div>
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td><input type="text" class="insert_input" id="activity_title" name="activity_title" value="${ activity.activity_title }"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">지역</td>
					<td>
						<select name="activity_area" id="activity_area">
							<option value="서울" selected="selected">서울</option>
							<option value="부산">부산</option>
							<option value="강원">강원</option>
							<option value="경기">경기</option>
							<option value="충청">충청</option>
							<option value="경상">경상</option>
							<option value="전라">전라</option>
							<option value="제주">제주</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class="table_td1">가격</td>
					<td><input type="text" class="insert_input" id="activity_price" name="activity_price" value="${activity.activity_price}"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">썸네일</td>
					<td>
						<div id="thumbDiv">
							<input type="radio" name="radioThumb" value="기존 썸네일 사용" id="svRadio" checked="checked"><label for="기존 썸네일 사용">기존 썸네일 사용</label>
							<input type="radio" name="radioThumb" value="변경 썸네일 사용" id="edRadio"><label for="변경 썸네일 사용">변경 썸네일 사용</label><br>
						
							<div id="svDiv">
								현재 썸네일 : <input type="text" id="activity_thumb" name="activityImgUpload" value="${ activity.activity_thumb }" readonly="readonly">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="table_td1">내용</td>
					<td>
						<textarea name="activity_content" id="ckeditor" class="ckeditor">${ activity.activity_content }</textarea>
						<script type="text/javascript">
							CKEDITOR.replace('activity_content', {height: 700, filebrowserUploadUrl:'/activityImage/imageUpload.do'});
						</script>
					</td>
				</tr>
								
			</table>
		</div>
	</form>
	

</main>

<%@ include file="../import/bottom.jsp" %>