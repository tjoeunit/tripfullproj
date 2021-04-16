<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style>
	.getStory_table td{
		border: 2px solid #58CCFF;
		padding: 10px;
	}
	
	.getStory_content{
		height: 900px;
		width: 900px;
	}
	
	.getStory_submit{ /* 안먹음 */
		text-align: center;
	}
	
	
	
</style>

<main>
	<center>
		<h1>스토리 상세</h1>
		<hr>
		<form action="updateStory.do" method="post">
			<input name="story_no" type="hidden" value="${story.story_no}" />
			<table class="getStory_table">
				<tr>
					<td>제목</td>
					<td>${story.story_title}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${members_no}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td class="getStory_content">	${story.story_content}</td>
				</tr>
				<tr>
					<td>등록일</td>
					<td>${story.story_date}</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td>${story.story_cnt}</td>
				</tr>
				<tr>
					<td class="getStory_submit"><input type="submit" value="글 수정"></td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="insertStoryPage.do">글등록</a>&nbsp;&nbsp;&nbsp; 
		<a href="deleteStory.do?seq=${story.story_no}">글삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="getStoryList.do">글목록</a>
	</center>
</main>

<%@ include file="../import/bottom.jsp" %>