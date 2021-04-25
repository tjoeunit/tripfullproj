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
	
	<form action="<c:url value='/adminLanTrip/adminLanTripUpdate.do'/>" method="post"  enctype="multipart/form-data">
		<div class="admin_subtitle">
			<span class="admin_subtitle_name">랜선투어 상품 수정</span>
			<span class="new_upload">
				<input type="submit" class="insert_submit" value=" 수정완료 " />
			</span>
		</div>
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td><input type="text" class="insert_input" name="lantrip_title" value="${ lantrip.lantrip_title }"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">지역</td>
					<td>
						<select name="lantrip_area">
							<option value="아시아">아시아</option>
							<option value="유럽">유럽</option>
							<option value="북아메리카">북아메리카</option>
							<option value="남아메리카">남아메리카</option>
							<option value="아프리카">아프리카</option>
							<option value="오세아니아">오세아니아</option>
						</select>
						
						<span>지역을 꼭 선택해주세요</span>
					</td>
				</tr>
				
				<tr>
					<td class="table_td1">가격</td>
					<td><input type="text" class="insert_input" name="lantrip_price" value="${lantrip.lantrip_price}"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">썸네일</td>
					<td><input type="file" class="insert_input" name="lanTripImgUpload" value="${ lantrip.lantrip_thumb }"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">영상url</td>
					<td><input type="text" class="insert_input" name="lantrip_video" value="${ lantrip.lantrip_video }"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">내용</td>
					<td>
						<textarea name="lantrip_content" class="ckeditor">${ lantrip.lantrip_content }</textarea>
						<script type="text/javascript">
							CKEDITOR.replace('lantrip_content', {height: 700, width: 900, filebrowserUploadUrl:'/lanTripImage/imageUpload.do'});
						</script>
					</td>
				</tr>
								
			</table>
		</div>
	</form>
	

</main>

<%@ include file="../import/bottom.jsp" %>