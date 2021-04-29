<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import/admintop.jsp" %>

<style type="text/css">
	
	.admin_subtitle {
		background-color: lightgray;
		padding: 10px 10px 10px 20px;
	}
	
	.admin_subtitle_name {
		display: inline-block;
		width: 900px;
		font-weight: 600;
		font-size: 30px;
	}
	
	.update_delete {
		width: 150px;
	}
	
	.update_delete a {
		display: inline-block;
		font-size: 25px;
		text-decoration: none;
		color: black;
		font-weight: 600;
		border-radius: 5px;
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
		padding: 10px;
	}
	
	.update_delete a:hover {
		color: #fff !important;
		background: #383838;
	}
	
	table {
		width: 1200px;
		padding: 20px;
	}
	
	.table_td1 {
		width: 100px;
	}
	
	.table_td2{
		padding: 5px;
		width: 900px;
		border: none;
		background-color: lightgray;
	}
	
	.ck_content {
		border-bottom: 1px solid gray;
	}
	
	.reply_list {
		display: block;
		padding: 10px;
		border-bottom: 1px solid lightgray;
		width: 1100px;
	}
	
	.reply_list_member {
		font-weight: 600;
		font-size: 16px;
	}
	
	.reply_list_content {
		display: block;
		padding: 10px;
		width: 1100px;
	}
	
	.reply_list_delete {
		color: gray;
		text-align: right;
		font-size: 14px;
	}
	
	.reply_list_delete span {
		margin: 0px 10px;
	}
	
	.reply_list_delete span a {
		color: gray;
		text-decoration: none;
	}
	
	
</style>

<main>
 
	<input type="hidden" id="story_writer" name="story_writer" value="${story.story_writer}">		<!-- 작성자 -->
	<input type="hidden" id="story_no" name="story_no" value="${story.story_no}" />
	<input type="hidden" id="members_id" name="members_id" value="${members_id}"> 		<!-- 세션 로그인된 id -->
	<input type="hidden" id="members_id" name="members_id" value="${reply.members_id}"> 		<!-- 세션 로그인된 id -->

	<div class="admin_subtitle">
		<span class="admin_subtitle_name">여행이야기 상세보기</span>
		<span class="update_delete">
			<a id= "story_delete_a" href="adminStoryDelete.do?story_no=${story.story_no}">부적절한 게시글 삭제</a>
		</span>
	</div>

	<div>
		<table class="detail_table">
			<tr>
				<td class="table_td1">제목</td>
				<td class="table_td2">${story.story_title}</td>
			</tr>
			
			<tr>
				<td class="table_td1">작성자</td>
				<td class="table_td2">${story.story_writer}</td>
			</tr>
			
			<tr>
				<td class="table_td1">조회수</td>
				<td class="table_td2">${story.story_cnt}회</td>
			</tr>
			
			<tr>
				<td class="table_td1">가격</td>
				<td class="table_td2">${flight.flight_price} 원</td>
			</tr>
			
			<tr>
				<td class="table_td1">작성날짜</td>
				<td class="table_td2"><fmt:formatDate value="${ story.story_date }" dateStyle="full" timeStyle="full"/></td>
			</tr>
			
			<tr>
				<td class="table_td1">내용</td>
				<td></td>
			</tr>
		</table>
			
		<div class="ck_content">${story.story_content}</div>

	</div>
	
<!-- 댓글 조회 -->
	
	<c:forEach items="${replyList}" var="replyList">
			<div id="story_reply" class="reply_list">
				<div class="reply_list_member">${replyList.members_id}</div>
				<div class="reply_list_content">${replyList.reply_text}</div>
				<div class="reply_list_delete">
					<span><fmt:formatDate value="${replyList.reply_date}" pattern="yyyy-MM-dd" /></span>
					<span>
						<a href="<c:url value='/adminStory/adminReplyDelete.do?reply_no=${replyList.reply_no}&story_no=${story.story_no}' />">삭제</a>
					</span>
				</div>
			</div>
		</c:forEach>


</main>


<%@ include file="../import/bottom.jsp" %>