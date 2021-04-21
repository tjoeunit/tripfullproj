<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">

	.top_story_list{
		color: white;
		background-color: #58CCFF;
	}
	.story_top{
		width: 1200px;
	 	border: 1px solid gray;
	 	text-align: center;
	 	padding: 7px;
	}
	
	.story_subject_title{
		text-align: left;
	}
	
	.story_no{
		width: 7%;
	}
	.story_subject{
		width: 50%;
	}
	.story_writer{
		width: 15%;
	}
	.story_date{
		width: 15%;
	}
	.story_views{
		width: 10%;
	}
	.new_story_post{
		text-align: center;
	}
/*	.story_top a:hover {
		color: #fff !important;
		background: #58CCFF;
	}
*/

</style>

<main>
	
		<h1>여행 이야기</h1>
		
		<table class = "story_top">
			
			<tr class="top_story_list">
				<th class="story_no"> 번호</th>
				<th class="story_subject">제목</th>
				<th class="story_writer">작성자</th>
				<th class="story_date">등록일</th>
				<th class="story_views">조회수</th>
			</tr>
			
			<c:forEach items="${ storyList }" var="story">
				<tr>
					<td>${ story.story_no }</td>
					<td class="story_subject_title"><a href="getStory.do?story_no=${ story.story_no }">${ story.story_title }</a></td>
					<td>${ story.story_writer }</td>
					<td><fmt:formatDate value="${ story.story_date }" pattern="yy-MM-dd"/>
					</td>
					<td>${ story.story_cnt }</td>
				</tr>
			</c:forEach>
			
		</table>
		
		<br>
		
		<div class="new_story_post">
		 	<a href="insertStoryPage.do">새글 등록</a><br><br>
		</div>
</main>

<%@ include file="../import/bottom.jsp" %>