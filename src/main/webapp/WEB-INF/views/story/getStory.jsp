<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style>

	.story_get{
		font: bold;
		width: 1000px;
		padding: 10px;
	}
	
	.story_get td{
	}
	
	.get_story_subject{
		background-color: #58CCFF;
		width: 120px;
	}
	
	.get_story_writer{
		background-color: #58CCFF;
	}
	
	.get_story_content{
		background-color: #58CCFF;
		height: 700px;
	}
	.get_story_date{
		background-color: #58CCFF;
	}
	.get_story_cnt{	
		background-color: #58CCFF;
	}
	.get_story_submit{
		text-align: center;
	}
	
	.get_story_bottom{
		text-align: center;
	}

	
	
</style>

<main>
		<h1>스토리 상세</h1>
		<hr>
		<form action="updateStory.do" method="post">
			<input name="story_no" type="hidden" value="${story.story_no}" />
			<table class="story_get">
				<tr>
					<td class="get_story_subject">제목</td>
					<td>${story.story_title}</td>
				</tr>
				<tr>
					<td class="get_story_writer">작성자</td>
					<td>${story.story_writer}</td>
				</tr>
				<tr>
					<td class="get_story_content">내용</td>
					<td>	${story.story_content}</td>
				</tr>
				<tr>
					<td class="get_story_date">등록일</td>
					<td><fmt:formatDate value="${ story.story_date }" dateStyle="full" timeStyle="full"/></td>
				</tr>
				<tr>
					<td class="get_story_cnt">조회수</td>
					<td>${story.story_cnt}</td>
				</tr>
			</table><br><br>
			
			<div class="get_story_submit">
				<td><input type="submit" value="글 수정"></td>
			</div>
			
		</form>
		<br><hr><br>
		<div class="get_story_bottom">
			<a href="insertStoryPage.do">글등록</a>&nbsp;&nbsp;&nbsp; 
			<a href="deleteStory.do?seq=${story.story_no}">글삭제</a>&nbsp;&nbsp;&nbsp;
			<a href="getStoryList.do">글목록</a>
		</div>
		<br><br>
</main>

<%@ include file="../import/bottom.jsp" %>