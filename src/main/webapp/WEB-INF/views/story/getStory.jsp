<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="../import/top.jsp" %>

<script type="text/javascript">

	$(function(){
		$('#story_modify_a').click(function() {
			if ($('#members_id').val() != $('#story_writer').val()) {
				alert('수정 권한이 없습니다.');
				event.preventDefault();
				return false;
			}
		});
		$('#story_delete_a').click(function() {
			if ($('#members_id').val() != $('#story_writer').val()) {
				alert('삭제 권한이 없습니다.');
				event.preventDefault();
				return false;
			}
		});
	});
	
	$(function(){
		if ($('#members_id').val() != $('#reply_id').val()) {
			$("#delete_story_reply").hide();
		}
	});
</script>

<style type="text/css">
	
	.post_box {
		border: 1px solid gray;
		border-radius: 5px;
		margin: 20px;
		padding: 20px;
	}
	
	.post_title {
		font-size: 40px;
		font-weight: 600;
		text-align: left;
		padding: 10px;
	}
	
	.post_info_box {
		text-align: right;
	}
	
	.post_info {
		font-size: 14px;
		color: gray;
		margin: 0px 10px;
	}
	
	.post_content {
		padding: 20px;
	}
	
	.update_delete {
		text-align: right;
	}
	
	.update_delete_botton {
		font-size: 14px;
		color: gray;
		margin: 0px 10px;
	}
	
	.post_reply_box {
	    border: 2px solid gray;
	    border-radius: 5px;
	    padding: 20px;
	}
	
	.post_reply_writer {
		display: inline-block;
		width: 90%;
	}
	
	.post_reply_button {
		text-decoration: none;
		display:inline-block;
		margin: 0px 10px;
		padding: 2px 10px;
		border-radius: 5px;
		border: 1px solid gray;
		color: black;
		background-color: white;
		cursor: pointer;
	}
	
	.post_reply {
		display: block;
	    width: 100%;
	    border: 0;
	    font-size: 13px;
	    -webkit-appearance: none;
	    resize: none;
	    outline: 0;
	    margin: 20px 0px;
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
	}
	
}
	
</style>

<main>

	<input type="hidden" id="story_writer" name="story_writer" value="${story.story_writer}">		<!-- 작성자 -->
	<input type="hidden" id="story_no" name="story_no" value="${story.story_no}" />
	<input type="hidden" id="members_id" name="members_id" value="${members_id}"> 		<!-- 세션 로그인된 id -->
	<input type="hidden" id="reply_id" name="reply_id" value="${reply.members_id}">

	<div class="post_box">
		<div class="post_title">${story.story_title}</div>
		<div class="post_info_box">
			<span class="post_info">${story.story_writer}</span>
			<span class="post_info"><fmt:formatDate value="${ story.story_date }" pattern="yy.MM.dd HH:mm"/></span>
			<span class="post_info">조회 ${story.story_cnt}</span>
		</div>
		
		<hr>
		
		<div class="post_content">${story.story_content}</div>

<!-- c:if를 통해 로그인 한 경우에만 보이도록 설정 -->
		<c:if test="${members_id != null}">
			<div class="update_delete" >
				<a class="update_delete_botton" id= "story_modify_a" href="updateStoryPage.do?story_no=${story.story_no}">수정하기</a>
				<a class="update_delete_botton" id= "story_delete_a" href="deleteStory.do?story_no=${story.story_no}">삭제하기</a>
				<a class="update_delete_botton" href="getStoryList.do">목록보기</a>
			</div>
			
			<hr>

<!-- 댓글 쓰기 -->
			<div class="post_reply_box">
				<form action="replyWrite.do" name="replyForm" method="post">
					<span class="post_reply_writer">${ members_id }</span>
					<span><button type="submit" id="replyWriteBtn" class="post_reply_button">댓글쓰기</button></span>
					<textarea rows="2" cols="120" id="reply_text" name="reply_text" class="post_reply" placeholder="댓글을 작성하세요."></textarea>
					<input type="hidden" id="story_no" name="story_no" value="${story.story_no}" />
					<input type="hidden" id="members_id" name="members_id" value="${members_id}">
				</form>
			</div>
		</c:if>

<!-- 댓글 조회 -->
		<c:forEach items="${replyList}" var="replyList">
			<div id="story_reply" class="reply_list">
				<div class="reply_list_member">${replyList.members_id}</div>
				<div class="reply_list_content">${replyList.reply_text}</div>
				<div class="reply_list_delete">
					<span><fmt:formatDate value="${replyList.reply_date}" pattern="yyyy-MM-dd" /></span>
					<span>
						<a href="<c:url value='/story/replyDelete.do?reply_no=${replyList.reply_no}&story_no=${story.story_no}' />">삭제</a>
					</span>
				</div>
			</div>
		</c:forEach>
	</div>

</main>


<%@ include file="../import/bottom.jsp" %>
