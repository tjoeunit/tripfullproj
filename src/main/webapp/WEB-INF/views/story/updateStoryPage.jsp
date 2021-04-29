<%@page contentType="text/html; charset=UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">

	.main_title {
		align-content: left;
		font-size: 40px;
		font-weight: 600;
		margin: 20px 0px;
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
	
	.input_readonly {
		padding: 5px;
		width: 1052px;
		border: none;
		background-color: white;
	}
	
	.ckeditor {
		width: 100%;
	}
	
	.new_post_button {
		text-align: right;
	}
	
	.new_post {
		text-decoration: none;
		display:inline-block;
		margin: 10px;
		padding: 10px;
		border-radius: 5px;
		border: 1px solid gray;
		color: black;
		background-color: white;
	}
	
	.new_post:hover {
		box-shadow: 1px 1px 3px gray;
		border: 1px solid gray;
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
			} else if($("#sessionID").val() == ""){
				// 새글 등록 버튼 숨기기
				$("#new_story_post").hide();
			}
			
		});
	});
</script>


<main>

<!-- ckeditor 4 -->
 	<script type="text/javascript" src = "<c:url value = '/ckeditor/ckeditor.js' />"></script>
 	
 	<div class="main_title">여행이야기 수정하기</div>
	<hr>
			
	<form action="updateStory.do?story_no=${story.story_no}" name="enroll_updated_story" method="post" enctype="multipart/form-data">
		<input type="hidden" name="members_no" value="${members_no}">
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td class="table_td2"><input type="text" id="story_title" name="story_title" class="insert_input" value="${story.story_title}"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">작성자</td>
					<td class="table_td2"><input type="text" name="story_writer" class="input_readonly" value="${story.story_writer}" readonly></td>
				</tr>
				
				<tr>
					<td class="table_td1">내용</td>
					<td class="table_td2">
						<textarea name="story_content" class="ckeditor">${story.story_content}</textarea>
						<script type="text/javascript">
						CKEDITOR.replace('story_content', {height: 700, filebrowserUploadUrl:'/storyImage/imageUpload.do'});
						</script>
					</td>
				</tr>
			</table>
			
			<div class="new_post_button">
				<input type="submit" class=" new_post" value=" 수정하기 "/>
				<input type="button" onclick="history.back()" class=" new_post" value=" 뒤로가기 "/>
			</div>
			
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>