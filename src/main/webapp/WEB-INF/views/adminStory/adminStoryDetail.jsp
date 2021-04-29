<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import/admintop.jsp" %>

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
 
	<input type="hidden" id="story_writer" name="story_writer" value="${story.story_writer}">		<!-- 작성자 -->
	<input type="hidden" id="story_no" name="story_no" value="${story.story_no}" />
	<input type="hidden" id="members_id" name="members_id" value="${members_id}"> 		<!-- 세션 로그인된 id -->
	<input type="hidden" id="members_id" name="members_id" value="${reply.members_id}"> 		<!-- 세션 로그인된 id -->

	<div class="admin_subtitle">
		<span class="admin_subtitle_name">여행이야기 상세보기</span>
		<span class="update_delete">
			<a href="<c:url value='/adminFlight/adminStoryDelete.do?story_no=${story.story_no}'/>">상품삭제</a>
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

		<div id="reply">
			<ol class="replyList">
				<c:forEach items="${replyList}" var="replyList">
					<li>
						<p>
							작성자 : ${replyList.members_id}<br />
							작성 날짜 :  <fmt:formatDate value="${replyList.reply_date}" pattern="yyyy-MM-dd" />
						</p>
						<p>${replyList.reply_text}</p>
						<div>
							<a id="replyDeleteBtn" href="<c:url value='/adminStory/adminReplyDelete.do?reply_no=${replyList.reply_no}&story_no=${story.story_no}' />">사용자 댓글 삭제</a>
						</div>
					</li>
				</c:forEach>   
			</ol>
		</div>
	<div class="get_story_bottom" >
		<a id= "story_delete_a" href="adminStoryDelete.do?story_no=${story.story_no}">[부적절한 게시글 삭제]</a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="adminStory.do">목록보기</a>
	</div>
	<br><br>

</main>


<%@ include file="../import/bottom.jsp" %>