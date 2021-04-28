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



<!-- <script type="text/javascript">

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

</script> -->

 

<main>
 
	<input type="hidden" id="story_writer" name="story_writer" value="${story.story_writer}">		<!-- 작성자 -->
	<input type="hidden" id="story_no" name="story_no" value="${story.story_no}" />
	<input type="hidden" id="members_id" name="members_id" value="${members_id}"> 		<!-- 세션 로그인된 id -->
	<input type="hidden" id="members_id" name="members_id" value="${reply.members_id}"> 		<!-- 세션 로그인된 id -->

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

<!-- 너비와 정렬방식 설정 -->
<%-- 
	<div style="width:700px; text-align:center;">
	
	 <!-- 댓글 등록 (로그인 되어있을 시에만 보이도록) -->
	     <c:if test="${members_id != null}">
		     <form action="replyWrite.do" name="replyForm" method="post">
		         <textarea rows="2" cols="120" id="reply_text" name="reply_text" placeholder="댓글을 작성하세요."></textarea>
				 <input type="hidden" id="story_no" name="story_no" value="${story.story_no}" />
				 <input type="hidden" id="members_id" name="members_id" value="${members_id}">
	
		         <br>
		
		         <button type="submit" id="replyWriteBtn">댓글쓰기</button>
			</form>
	    </c:if>
	
	</div>
--%>

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
							<%-- <input type="button" class="replyDeleteBtn" onclick = "location.href ='/replyDelete?reply_no=${reply.reply_no}">삭제</button> --%>
							<input type="button" id="replyDeleteBtn" onclick = "location.href ='/replyDelete.do?reply_no='+${replyList.reply_no}" value="사용자 댓글 삭제"></input>
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