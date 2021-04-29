<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../import/admintop.jsp" %>
<script type="text/javascript">
// DB 1111오류 방지
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
			
		}else if ($('#hotel_thumb').val().length < 1){
			alert('썸네일 파일을 확인하세요');
			$('#hotel_thumb').focus();
			event.preventDefault();
			return false;		
			
		}else if ($('#hotel_content').val().length < 1){
			alert('내용을 확인하세요');
			$('#hotel_content').focus();
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
	
	<!--/////////////////////////////////-->
	<!--/////// 1.form name 이름 설정 //////-->
	<!--//////////////////////////////////-->
	
	<form name="update_Hotel" action="<c:url value='/adminHotel/insertHotel.do'/>" method="post"  enctype="multipart/form-data">
		<div class="admin_subtitle">
			<span class="admin_subtitle_name">숙박권 등록</span>
			<span class="new_upload">
				<input type="submit" class="insert_submit" value=" 새글등록 " />
			</span>
		</div>
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td><input type="text" class="insert_input" name="hotel_title" id="hotel_title" /></td>
																				<!--/////////////////////////////////-->
				</tr>															<!--////////각 input 태그에 id 설정 ///////-->	
																				<!--//////////////////////////////////-->			
				
				<tr>
					<td class="table_td1">카테고리</td>
					<td>
						<select name="hotel_category">
							<option value="호텔">호텔</option>
							<option value="팬션">팬션</option>
							<option value="게스트하우스">게스트하우스</option>
							<option value="캠핑">캠핑</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class="table_td1">지역</td>
					<td>
						<select name="hotel_area">
							<option value="서울">서울</option>
							<option value="제주도">제주도</option>
							<option value="부산">부산</option>
							<option value="인천">인천</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class="table_td1">가격</td>
					<td><input type="text" class="insert_input" name="hotel_price" id="hotel_price" placeholder="숫자만 입력해주세요"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">썸네일</td>
					<td><input type="file" class="insert_input" name="hotelImgUpload" id="hotel_thumb"/></td>
				</tr>
					
				<tr>
					<td class="table_td1">내용</td>
					<td>
						<textarea name="hotel_content" class="ckeditor" id="hotel_content"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('hotel_content', {height: 700, filebrowserUploadUrl:'/hotelImage/imageUpload.do'});
						</script>
					</td>
				</tr>
								
			</table>
		</div>
	</form>
	

</main>

<%@ include file="../import/bottom.jsp" %>