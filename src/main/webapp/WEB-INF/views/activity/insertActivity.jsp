<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

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
	<!-- ckeditor 4 -->	
 	<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
	
	<form action="insertActivity.do" method="post" enctype="multipart/form-data">
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
					<td><input type="text" class="insert_input" name="lantrip_title" /></td>
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
				</tr>
				
				<tr>
					<td class="table_td1">가격</td>
					<td><input type="text" class="insert_input" name="activity_price" placeholder="숫자만 입력해주세요"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">썸네일</td>
					<td><input type="file" class="insert_input" name="activityImgUpload"/></td>
				</tr>
<!-- 
				<tr>
					<td class="table_td1">영상url</td>
					<td><input type="text" class="insert_input" name="activity_video"/></td>
				</tr>
 -->			
				<tr>
					<td class="table_td1">내용</td>
					<td>
						<textarea name="activity_content" class="ckeditor"></textarea>
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