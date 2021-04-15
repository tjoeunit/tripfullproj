<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">
.story_insert{
	color: white;
	font: bold;
	width: 1200px;
}
.insert_story_subject{
	border-style: black thick;
	background-color: #58CCFF;
	width: 120px;
}
.insert_story_writer{
	background-color: #58CCFF;
}

.insert_story_content{
	background-color: #58CCFF;
	height: 700px;
}
.insert_story_file{
	background-color: #58CCFF;
}
.push_story{	/* 안먹음 */
	align-content: center;
}

</style>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행 이야기 등록</title>
</head>
<body>

<!-- ckeditor 4 -->
 	<script type="text/javascript" src = "<c:url value = '../ckeditor/ckeditor.js' />"></script>
	<script type='text/javascript'>	
		
	    var editorConfig = { filebrowserUploadUrl : "../storyUpload/storyFileUpload.do" };
	    
	    var ck = null;

	    window.onload = function(){
	        ck = CKEDITOR.replace("story_editor1" , editorConfig,{height:700});
	    };
	</script>
	
		<center>
			<h1>여행 이야기</h1>
			<form action="insertStory.do" method="post" enctype="multipart/form-data">
				<table class="story_insert">
					<tr>
						<td class="insert_story_subject">제목</td>
						<td><input type="text" size=80/></td>
					</tr>
					<tr>
						<td class="insert_story_writer">작성자</td>
						<td><input type="text" size=80/></td>
					</tr>
					<tr>
						<td class="insert_story_content">내용</td>
						<td>
						<!-- id -> class 수정 예정 -->
							<textarea id="story_editor1"></textarea>
						</td>
					</tr>
					<tr>
						<hr>
						<div  class="push_story">
							<td><input type="submit" value=" 새글 등록 "/></td>
						</div>
					</tr>
				</table>
			</form>
			
			<br>
			
			<a href="getStoryList.jsp">글 목록 가기</a>
	</center>

    <script type = "text/javascript">
        window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}','${filePath}', '업로드완료');
    </script>
    
</body>
</html>

<%@ include file="../import/bottom.jsp" %>