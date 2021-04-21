<%@page contentType="text/html; charset=UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">
.story_insert{
	color: white;
	font: bold;
	width: 1000px;
	padding: 10px;
}

.story_insert td{
	text-align: center;
}

.story_insert td input{
	width: 100%;
}

.insert_story_subject{
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
	text-align: center;
}

</style>

<main>

<!-- ckeditor 4 -->
 	<script type="text/javascript" src = "<c:url value = '/ckeditor/ckeditor.js' />"></script>
			<h1>여행 이야기</h1><hr>
			<form action="insertStory.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="members_no" value="${members_no}">
				<table class="story_insert">
					<tr>
						<td class="insert_story_subject">제목</td>
						<td><input type="text" name="story_title" placeholder = "제목을 입력하세요"/></td>
					</tr>
					
					<tr>
						<td class="insert_story_writer">작성자</td>
						<td><input type="text" name="story_writer" value="${members_id}" readonly></td>
					</tr>
					<tr>
						<td class="insert_story_content">내용</td>
						<td>
							<textarea id="story_content" name="story_content"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('story_content', {height: 700, width: 900, filebrowserUploadUrl:'/storyImage/imageUpload.do'});
							</script>
						</td>
					</tr>					
					
				</table>		
						
					<div  class="push_story">
						<input type="submit" value=" 새글 등록 "/>
					</div>
					
			</form>
			
			<br>
			
			<a href="getStoryList.do">글 목록 가기</a>
</main>

<%@ include file="../import/bottom.jsp" %>