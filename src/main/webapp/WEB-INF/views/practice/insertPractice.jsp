<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<script type="text/javascript" src = "<c:url value='/ckeditor/ckeditor.js'/>"></script>

<!-- 이미지 업로드 코드를 연결  -->



<main>
	
	<form action="insertPractice.do" method="post">
		제목<br>
		<input type="text" name="practice_title"><br>
		내용<br>
		<textarea id="practice_content" name="practice_content" cols="10" rows="10"></textarea>
		<script> 
			CKEDITOR.replace( 'practice_content', {
				filebrowserUploadUrl: "<c:url value='/file/fileUpload.do'/>" });
		</script>
		<input type="submit" value="등록하기">
		<button type="button" onclick="history.back()">뒤로가기</button>
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>