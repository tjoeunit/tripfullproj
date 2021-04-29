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
<script type="text/javascript">
$(function(){
	
	var numReg = /^[0-9]+$/;
	
	$('form[name=frm]').submit(function(){ 
		if($('#flight_title').val().length < 1) {
			alert('제목을 확인하세요');
			$('#flight_title').focus();
			event.preventDefault();
			return false;
			
		}else if ($('#flight_price').val().length < 1){
			alert('가격을 확인하세요');
			$('#flight_price').focus();
			event.preventDefault();
			return false;		
			
		}else if (!numReg.test($("#flight_price").val())) {
			alert('가격을 확인하세요');
			$('#flight_price').focus();
			event.preventDefault();
			return false;		
			
		}else if ($('#flight_thumb').val().length < 1){
			alert('썸네일 파일을 확인하세요');
			$('#flight_thumb').focus();
			event.preventDefault();
			return false;
			
		}else if ($('#flight_content').val().length < 1){
			alert('내용을 확인하세요');
			$('#flight_content').focus();
			event.preventDefault();
			return false;
			
		}
	});
});	
</script>
<main>

	<!-- ckeditor 4 -->	
	<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
	
	<form name="frm "action="<c:url value='/adminFlight/insertFlight.do'/>" method="post" enctype="multipart/form-data">
		<div class="admin_subtitle">
			<span class="admin_subtitle_name">항공권 상품등록</span>
			<span class="new_upload">
				<input type="submit" class="insert_submit" value=" 새글등록 " />
			</span>
		</div>
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td><input type="text" class="insert_input" id="flight_title" name="flight_title" /></td>
				</tr>
				
				<tr>
					<td class="table_td1">출발</td>
					<td>
						<select name="flight_departure">
							<option value="인천">인천</option>
							<option value="김포">김포</option>
							<option value="김해">김해</option>
							<option value="제주">제주</option>
							<option value="청주">청주</option>
							<option value="대구">대구</option>
							<option value="무안">무안</option>
							<option value="양양">양양</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_td1">도착</td>
					<td>
						<select name="flight_arrival">
							<option value="인천">인천</option>
							<option value="김포">김포</option>
							<option value="김해">김해</option>
							<option value="제주">제주</option>
							<option value="청주">청주</option>
							<option value="대구">대구</option>
							<option value="무안">무안</option>
							<option value="양양">양양</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_td1">가격</td>
					<td><input type="text" class="insert_input" id="flight_price" name="flight_price" placeholder="숫자만 입력해주세요"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">썸네일</td>
					<td><input type="file" class="insert_input" name="flightImgUpload" id="flight_thumb"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">내용</td>
					<td>
						<textarea name="flight_content" id="flight_content" class="ckeditor"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('flight_content', {height: 700, filebrowserUploadUrl:'/flightImage/imageUpload.do'});
						</script>
					</td>
				</tr>
								
			</table>
		</div>
	</form>
	

</main>

<%@ include file="../import/bottom.jsp" %>