<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<%@ include file="../import/admintop.jsp" %>
<script type="text/javascript">
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
			
		}else if ($('#activity_thumb').val().length < 1){
			alert('썸네일 파일을 확인하세요');
			$('#activity_thumb').focus();
			event.preventDefault();
			return false;	
			
		} else if ($('#ckeditor').val().length < 1){
			alert('내용을 확인하세요');
			$('#ckeditor').focus();
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

<main>

	<!-- ckeditor 4 -->	
	<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
	
	<form name="update_Activity" action="<c:url value='/adminActivity/insertActivity.do'/>" method="post"  enctype="multipart/form-data">
		<div class="admin_subtitle">
			<span class="admin_subtitle_name">액티비티 상품등록</span>
			<span class="new_upload">
				<input type="submit" class="insert_submit" value=" 새글 등록 " />
			</span>
		</div>
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td><input type="text" id="activity_title" class="insert_input" name="activity_title" /></td>
				</tr>
				
				<tr>
					<td class="table_td1">지역</td>
					<td>
					<select name="activity_area">
						<option value="서울" selected="selected">서울</option>
						<option value="부산">부산</option>
						<option value="군산">군산</option>
					</select>
				</td>				
				<tr>
					<td class="table_td1">가격</td>
					<td><input type="text" id="activity_price" class="insert_input" name="activity_price" placeholder="숫자만 입력해주세요"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">썸네일</td>
					<td><input type="file" id="activity_thumb" class="insert_input" name="activityImgUpload"/></td>
				</tr>
				
<!-- 				<tr>
					<td class="table_td1">영상url</td>
					<td><input type="text" class="insert_input" name="activity_video"/></td>
				</tr>
 -->				
				<tr>
					<td class="table_td1">내용</td>
					<td>
						<textarea name="activity_content" id="ckeditor" class="ckeditor"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('activity_content', {height: 700, width: 900, filebrowserUploadUrl:'/activityImage/imageUpload.do'});
						</script>
					</td>
				</tr>
								
			</table>
		</div>
	</form>
	

</main>

<%@ include file="../import/bottom.jsp" %>