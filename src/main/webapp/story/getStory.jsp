<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세</title>
</head>
<body>
	<center>
		<h1>글 상세</h1>
		<hr>
		<form action="updateStory.do" method="post">
			<input name="story_no" type="hidden" value="${story.story_no}" />
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="#58CCFF" width="70">제목</td>
					<td align="left">
						<input name="title" type="text" value="${story.story_title}" />
					</td>
				</tr>
				<tr>
					<td bgcolor="#58CCFF">작성자</td>
					<td align="left">${members_no}</td>
				</tr>
				<tr>
					<td bgcolor="#58CCFF">내용</td>
					<td align="left"><textarea name="content" cols="40" rows="10">
						${story.story_content}</textarea></td>
				</tr>
				<tr>
					<td bgcolor="#58CCFF">등록일</td>
					<td align="left">${story.story_date}</td>
				</tr>
				<tr>
					<td bgcolor="#58CCFF">조회수</td>
					<td align="left">${story.story_cnt}</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="글 수정"></td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="insertStory.jsp">글등록</a>&nbsp;&nbsp;&nbsp; 
		<a href="deleteStory.do?seq=${story.story_no}">글삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="getStoryList.do">글목록</a>
	</center>
</body>
</html>
