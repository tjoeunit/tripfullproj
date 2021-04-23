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
	.get_story_title{
		width: 500px;
		padding: 10px;
		padding-left: 3%;
		border-left: #d9c5c5 double 10px;
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
	.get_story_inform{
		width: 750px;
		padding: 10px;
		padding-left: 1%;
		border: #c4c4c4 dashed 1px;
		border-radius: 3em;
	}
	
	
</style>



<main>
			<input name="story_no" type="hidden" value="${story.story_no}" />
			<br><br>
			
			<div class="get_story_title">
				<h2>${story.story_title}</h2>
			</div>
			
			<br>
			
			<div class="get_story_inform">
				<b> 작성자&nbsp;&nbsp;&nbsp;${story.story_writer}</b>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<fmt:formatDate value="${ story.story_date }" dateStyle="full" timeStyle="full"/>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				조회수 <b>${story.story_cnt}</b>회
			</div>
			
			<br><br><br>
			
				${story.story_content}
				
			<br><br><br>
			
		<hr><br>
		
		<div class="get_story_bottom" >
			<a href="updateStoryPage.do?story_no=${story.story_no}">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="deleteStory.do?story_no=${story.story_no}">삭제하기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="getStoryList.do">목록보기</a>
		</div>
		
		<br><br>
</main>

<%@ include file="../import/bottom.jsp" %>