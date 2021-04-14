<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../../import/top.jsp" %>

<style type="text/css">

.top_story_list{
	color: white;
	background-color: #58CCFF;
}
.story_top{
	cellpadding: "0";
	cellspacing: "0";
 	width: 1200px;
 	border: 1px solid gray;
}

.story_search{
	width: 700px;
	border: 2px solid gray;
	margin-bottom: 10px;
	align-content: right;
}

.story_no{
	width: 7%;
}
.story_pic{
	width: 10%;
}
.story_subject{
	width: 40%;
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

</style>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type">
<title>여행 이야기</title>
</head>
<body>
	<center>	
	
		<h1>여행 이야기</h1>
		
 		<!-- 검색 시작 -->
		<form action="getStoryList.do" method="post">
			<table class="story_search">
				<tr>
					<td align="right">
					<select name="storySearchCondition">
						<c:forEach items="${conditionMap}" var="option">
							<option value="${option.value}">${option.key }
						</c:forEach>
					</select> 
					<input name="storySearchKeyword" type="text" /> 
					<input type="submit" value="검색" /></td>
				</tr>
			</table>
		</form>
		<!-- 검색 종료 --> 
		
		<table class = "story_top">
			<tr class="top_story_list">
				<th class="story_no"> 번호</th>
				<th class="story_pic"> 사진</th>
				<th class="story_subject">제목</th>
				<th class="story_writer">작성자</th>
				<th class="story_date">등록일</th>
				<th class="story_views">조회수</th>
			</tr>
			<c:forEach items="${storyList}" var="story">
				<tr>
					<td>${story.story_no}</td>
					<td ><a href="getStory.do?story_no=${story.story_no}">
							${story.story_title}</a></td>
					<td>${story.members_no}</td>
					<td>${story.story_date}</td>
					<td>${story.story_cnt}</td>
				</tr>
			</c:forEach>
		</table>
		<br> <a href="insertStory.jsp">새글 등록</a>
	</center>
</body>
</html>
<%@ include file="../../import/bottom.jsp" %>