<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <table class = "story_top">

		<tr class="top_story_list">
			<th class="story_subject">제목</th>
			<th class="story_writer">작성자</th>
			<th class="story_views">조회수</th>
		</tr>

		<c:forEach items="${ reply }" var="reply">
			<tr>
				<td > ${ reply.reply_text }</td>
				<td>${ reply.members_id }</td>
				<td>${ reply.reply_date }</td>
			</tr>
		</c:forEach>

	</table>
