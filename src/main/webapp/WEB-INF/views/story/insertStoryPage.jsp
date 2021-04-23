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
	
	.insertStory_bottom{
		text-align: center;
		padding-right: 17%;
	}
	
	.insertStory_bottom input{
		width:65pt;
		height:30pt;
	}

</style>

<main>

<!-- ckeditor 4 -->
 	<script type="text/javascript" src = "<c:url value = '/ckeditor/ckeditor.js' />"></script>
			<br><h1>여행 이야기 등록</h1><hr><br>
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
							<textarea id="story_content"  class="ckeditor" name="story_content"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('story_content', {height: 700, width: 900, filebrowserUploadUrl:'/storyImage/imageUpload.do'});
							</script>
						</td>
					</tr>					
					
				</table>		<br>
						
					<div  class="insertStory_bottom">
						<input type="submit" value=" 등록하기 "/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" onclick="history.back()" value=" 뒤로가기 "/>
					</div>
					
			</form>
			
			<br>
			
</main>

<%@ include file="../import/bottom.jsp" %>