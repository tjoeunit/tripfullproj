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
		$("#replyWriteBtn").on("click", function(){
			var formObj = $("form[name='replyForm']");
			formObj.attr("action", "<c:url value='/story/replyWrite.do'/>");
			formObj.submit();
		});
		
	});
	
	
</script>

<main>

	<input type="hidden" id="story_writer" name="story_writer" value="${story.story_writer}">		<!-- 작성자 -->
	<input type="hidden"  id="story_no" name="story_no" value="${story.story_no}" />
	<input type="hidden" id="members_id" name="members_id" value="${members_id}"> 		<!-- 세션 로그인된 id -->
	
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
	
	
<!-- 댓글 쓰기 (버튼을 눌러서 id값이 넘어와 실행되는 자바스크립트 구문) -->

<!-- 너비와 정렬방식 설정 -->
<div style="width:700px; text-align:center;">
 
	<!-- 로그인을 한 상태이어야만 댓글 입력창이 보임. -->
     <c:if test="${members_id != null}">
     
	   	<form name="replyForm" method="post">  
	   		<input type="hidden"  id="story_no" name="story_no" value="${story.story_no}" />
	   		<input type="hidden" id="members_id" name="members_id" value="${members_id}">
	         <textarea rows="2" cols="120" id="reply_text" name="reply_text" placeholder="댓글을 작성하세요."></textarea>
	         <br>
			 <div>
				<button type="button" id="replyWriteBtn">작성</button>
			 </div>
		</form>
	
		<!-- 댓글 등록 기능 처리 -->
		<script type="text/javascript">	
			
		</script>
  
    </c:if>
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
						<a id= "replyDeleteBtn" href="replyDeleteView.do?reply_no=${reply.reply_no}">삭제</a>
					</div>
				</li>
			</c:forEach>   
		</ol>
	</div>
	
    
	
	<div class="get_story_bottom" >
		<a id= "story_modify_a" href="updateStoryPage.do?story_no=${story.story_no}">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a id= "story_delete_a" href="deleteStory.do?story_no=${story.story_no}">삭제하기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="getStoryList.do">목록보기</a>
	</div>
	
	<br><br>
</main>

<%@ include file="../import/bottom.jsp" %>