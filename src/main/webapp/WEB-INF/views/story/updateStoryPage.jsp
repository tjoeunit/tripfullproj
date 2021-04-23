<%@page contentType="text/html; charset=UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">

	.story_update{
		color: white;
		font: bold;
		width: 1000px;
		padding: 10px;
	}
	
	.story_update td{
		text-align: center;
	}
	
	.story_update td input{
		width: 100%;
	}
	
	.update_story_subject{
		background-color: #58CCFF;
		width: 120px;
	}
	.update_story_writer{
		background-color: #58CCFF;
	}
	
	.update_story_content{
		background-color: #58CCFF;
		height: 700px;
	}
	
	.updateStory_bottom{
		text-align: center;
		padding-right: 17%;
	}
	
	.updateStory_bottom input{
		width:65pt;
		height:30pt;
	}

</style>

<!-- 제목, 내용 null check -->
<script type="text/javascript">
	$(function() {
		$('form[name=enroll_updated_story]').submit(function() {
						
			if($('#story_title').val().length < 1) {
				alert('수정할 제목을 입력하세요.');
				$('#story_title').focus();
				event.preventDefault();
				return false;	
				
			} else if(CKEDITOR.instances['story_content'].getData()=="") {
				alert('수정할 내용을 입력하세요.');
				CKEDITOR.instances['story_content'].focus();
				event.preventDefault();
				return false;
			}
			
		});
	});
</script>


<main>

<!-- ckeditor 4 -->
 	<script type="text/javascript" src = "<c:url value = '/ckeditor/ckeditor.js' />"></script>
			<br><h1>여행 이야기 수정</h1><hr><br>
			<form action="updateStory.do?story_no=${story.story_no}" name="enroll_updated_story" method="post" enctype="multipart/form-data">
				<input type="hidden" name="members_no" value="${members_no}">
				<table class="story_update">
					<tr>
						<td class="update_story_subject">제목</td>
						<td><input type="text" id="story_title" name="story_title" value="${story.story_title}"/></td>
					</tr>
					
					<tr>
						<td class="update_story_writer">작성자</td>
						<td><input type="text" name="story_writer" value="${story.story_writer}" readonly></td>
					</tr>
					<tr>
						<td class="update_story_content">내용</td>
						<td>
							<textarea id="story_content" name="story_content">${story.story_content}</textarea>
							<script type="text/javascript">
								CKEDITOR.replace('story_content', {height: 700, width: 900, filebrowserUploadUrl:'/storyImage/imageUpload.do'});
							</script>
						</td>
					</tr>					
					
				</table>	<br><br>
						
					<div class = "updateStory_bottom">
						<input type="submit" value=" 수정하기 "/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" onclick="history.back()" value=" 뒤로가기 "/>
					</div>
					
			</form>
			
			<br><br>
			

</main>

<%@ include file="../import/bottom.jsp" %>