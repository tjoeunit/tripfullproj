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
		$('#lantrip_area').val($("#test").val()).prop("selected", true);
	});

	$(function(){
		
// 영상 url 변경 시 변경된 주소값으로 변경 저장하는 기능
		$('#lantrip_video_view').keyup(function(){
			var url = $('#lantrip_video_view').val();
			//https://youtu.be/Y4ALU0B561g
			
			var url1 = "http://youtube.com/embed";
			var url2 = url.substring(16);
			var chgurl = url1+url2;
			$('#lantrip_video').val(chgurl);
		});
		
// Radio 를 이용하여 기존 썸네일 이용 또는 변경 썸네일 선택가능 
		$('#edRadio').click(function(){
			if($('#svDiv').length > 0){
				$('#svDiv').remove();
				$('#thumbDiv').append('<div id="edDiv">변경 썸네일 : <input type="file" id="lantrip_thumb" name="lanTiripImgUpload"></div>');
			}
		});		
		
		$('#svRadio').click(function(){
			if($('#edDiv').length > 0){
				$('#edDiv').remove();
				$('#thumbDiv').append('<div id="svDiv">현재 썸네일 : <input type="text" id="lantrip_thumb" name="lanTiripImgUpload" value="${lantrip.lantrip_thumb}" readonly></div>');
			}
		});
		
	});	
	
	//db 1111입력 오류 방지
	$(function(){
		
		var numReg = /^[0-9]+$/;
		
		$('form[name=update_LanTrip]').submit(function() { 
			if($('#lantrip_title').val().length < 1) {
				alert('제목을 확인하세요');
				$('#lantrip_title').focus();
				event.preventDefault();
				return false;
			
			} else if ($('#lantrip_area').val().length < 1) {
				alert('지역을 확인하세요');
				$('#lantrip_area').focus();
				event.preventDefault();
				return false;	
			
			} else if ($('#lantrip_price').val().length < 1) {
				alert('가격을 확인하세요');
				$('#lantrip_price').focus();
				event.preventDefault();
				return false;
				
			}else if (!numReg.test($("#lantrip_price").val())) {
				alert('가격을 확인하세요');
				$('#lantrip_price').focus();
				event.preventDefault();
				return false;		
				
			} else if ($('#lantrip_thumb').val().length < 1) {
				alert('썸네일 파일을 확인하세요');
				$('#lantrip_thumb').focus();
				event.preventDefault();
				return false;	
				
			} else if ($('#lantrip_video_view').val().length < 1) {
				alert('영상 url 주소를 확인하세요');
				$('#lantrip_video_view').focus();
				event.preventDefault();
				return false;				
			
			} else if ($('#lantrip_content').val().length < 1) {
				alert('내용을 확인하세요');
				$('#lantrip_content').focus();
				event.preventDefault();
				return false;
			}	
	});
});
</script>


<main>

	<!-- ckeditor 4 -->	
	<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
	
	<form name="update_LanTrip"action="<c:url value='/adminLanTrip/adminLanTripUpdate.do'/>" method="post"  enctype="multipart/form-data">
		<input type="hidden" id="test" value="${lantrip.lantrip_area}">
		<input type="hidden" name="lantrip_no" value="${ lantrip.lantrip_no }"/>
				
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
					<td><input type="text" class="insert_input" name="lantrip_title" id="lantrip_title"value="${ lantrip.lantrip_title }"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">지역</td>
					<td>
						<select id="lantrip_area" name="lantrip_area">
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
					<td><input type="text" class="insert_input" name="lantrip_price" id="lantrip_price"value="${lantrip.lantrip_price}"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">썸네일</td>
					<td>
						<div id="thumbDiv">
							<input type="radio" name="radioThumb" value="기존 썸네일 사용" id="svRadio" checked="checked"><label for="기존 썸네일 사용">기존 썸네일 사용</label>
							<input type="radio" name="radioThumb" value="변경 썸네일 사용" id="edRadio"><label for="변경 썸네일 사용">변경 썸네일 사용</label><br>
						
							<div id="svDiv">
								현재 썸네일 : <input type="text" name="lanTripImgUpload" id="lantrip_thumb" value="${ lantrip.lantrip_thumb }" readonly="readonly">
							</div>
						</div>
					</td>
				</tr>
				
				<tr>
					<td class="table_td1">영상url</td>
					<td>
						<input type="text" class="insert_input" name="lantrip_video_view" id="lantrip_video_view" value="${ lantrip.lantrip_video }"/>
						<input type="hidden" name="lantrip_video" id="lantrip_video" value="${ lantrip.lantrip_video }">
					</td>
				</tr>
				
				<tr>
					<td class="table_td1">내용</td>
					<td>
						<textarea name="lantrip_content" class="ckeditor" id="lantrip_content">${ lantrip.lantrip_content }</textarea>
						<script type="text/javascript">
							CKEDITOR.replace('lantrip_content', {height: 700, filebrowserUploadUrl:'/lanTripImage/imageUpload.do'});
						</script>
					</td>
				</tr>
								
			</table>
		</div>
	</form>
	

</main>

<%@ include file="../import/bottom.jsp" %>