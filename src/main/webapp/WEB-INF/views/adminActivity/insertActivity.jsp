<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<main>
	<!-- ckeditor 4 -->	
 	<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
	<br>
	<span>액티비티 등록</span>
	<br>

	<form action="insertActivity.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="activity_title" /></td>
			</tr>
			<tr>
				<td>장소</td>
				<td>
					<select name="activity_area">
						<option value="서울" selected="selected">서울</option>
						<option value="부산">부산</option>
						<option value="군산">군산</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="activity_price"/>원</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="activity_content" cols="80" rows="10"></textarea>
					<script type="text/javascript">						
						<!-- CKEDITOR 사용 시 VO에 IMG 사용하지 않으므로 VO 수정 필요 -->
						<!-- VO 수정하므로 xxxxx-mapping.xml 수정 필요 -->
						<!-- 인서트 POST 컨트롤러 수정 필요-->
						<!-- filebrowserUploadUrl 을 통해 .do 요청 (패키지에 업로드에 대한 자신의 xxxxxCkeditorController.java 생성과 매핑) -->
						<!-- getActivity에서 사용중인 이미지 영역 주석처리 -->
						<!-- getActivityList에서 content를 보여주기 때문에 getActivityList 부분 컨텐트 주석처리 -->
						CKEDITOR.replace('activity_content', {height: 700, width: 900, filebrowserUploadUrl:'/activityImage/imageUpload.do'});
					</script>	
				</td>
			</tr>
			<tr>
				<td>썸네일</td>
				<td><input type="file" name="activityImgUpload"/></td>
			</tr>
<!-- 		<tr>
				<td>영상</td>
				<td><input type="text" name="activity_video"/></td>
			</tr>
			<tr>
				<td>설명파일</td>
				<td><input type="file" name="activityImgUpload"/></td>
			</tr> -->
			<tr>
				<td><input type="submit"value="등록하기" /></td>
				<td><input type="button"value="뒤로가기" /></td>
			</tr>
		</table>
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>