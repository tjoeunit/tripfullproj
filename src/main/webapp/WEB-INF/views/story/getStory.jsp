<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style>

	.story_get{
		font: bold;
		width: 1000px;
		padding: 10px;
	}
	
	.story_get h5{
		text-align: right;
		padding-top: 10px;
		padding-right: 20%;
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
	
	.get_story_bottom{
		text-align: center;
	}

	
	
</style>

<main>
		<br><h1>스토리 상세</h1><hr>
			<input name="story_no" type="hidden" value="${story.story_no}" />
			
					<h2>${story.story_title}</h2>
					<h5>작성자: ${story.story_writer}</h5>
			
				<table class="story_get">
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
			
		<br><hr><br>
		<div class="get_story_bottom">
			<a href="updateStoryPage.do?story_no=${story.story_no}">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="deleteStory.do?story_no=${story.story_no}">삭제하기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="getStoryList.do">목록보기</a>
		</div>
		<br><br>
</main>

<%@ include file="../import/bottom.jsp" %>