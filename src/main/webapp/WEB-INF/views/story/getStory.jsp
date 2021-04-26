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
	});
	
	
</script>

<main>

	<input type="hidden" id="story_writer" value="${story.story_writer}">		<!-- 작성자 -->
	<input type="hidden" name="story_no" value="${story.story_no}" />
	<input type="hidden" id="members_id" value="${members_id}"> 		<!-- 세션 로그인된 id -->
	
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
 
<!-- 세션에 저장되어있는 members_id가 null이 아닐때 -->
<!-- 그러니까 로그인을 한 상태이어야만 댓글을 작성 할 수 있다.-->
     <c:if test="${members_id != null}">
     
     
         <textarea rows="2" cols="120" id="reply_text" placeholder="댓글을 작성하세요."></textarea>
         <br>
         <!-- 댓글쓰기 버튼을 누르면 id값인 btnReply값이 넘어가서 -->
         <!-- 밑에 있는 스크립트 구문이 실행되고 -->
         <!-- 내가 댓글을 작성한 값이 스크립트문을 거쳐서 컨트롤러로 맵핑되게 된다. -->
         <button type="button" id="btnReply">댓글쓰기</button>

	<script type="text/javascript">	
	    $("#btnReply").click(function(){
	        var reply_text=$("#reply_text").val(); //댓글 내용
	        var param={"reply_text": reply_text, "story_no": $('#story_no')};
	        $.ajax({
	            type: "post", //데이터를 보낼 방식
	            url: "${path}/story/storyReplyinsert.do", //데이터를 보낼 url
	            data: param, //보낼 데이터
	
	            success: function(){ //데이터를 보내는것이 성공했을시 출력되는 메시지
	                alert("댓글이 등록되었습니다.");
	                listReply2(); //댓글 목록 출력
	            }
	        });
	    });
	    
	</script>
  
    </c:if>
    </div>
    
    
    <!-- 댓글 목록 -->
    <!-- 댓글이 등록이 되면 listReply에 댓글이 쌓이게 된다 -->
    <div id="listReply"></div>
    
    <script type="text/javascript">	
		function listReply(){
		    $.ajax({
		        type: "get", //get방식으로 자료를 전달한다
		        url: "${path}/story/storyReplylist.do?story_no="+$('#story_no'), //컨트롤러에 있는 storyReplylist.do로 맵핑하고 게시판 번호도 같이 보낸다.
		        success: function(result){ //자료를 보내는것이 성공했을때 출력되는 메시지
		            //result : responseText 응답텍스트(html)
		            $("#listReply").html(result);
		        }
		    });
		}
    
    
		function listReply(num){
	    $.ajax({
	        type: "post", //post방식으로 자료를 전달
	        url: "${path}/story/storyReplylist.do?story_no="+$('#story_no'), //컨트롤러에 있는 storyReplylist.do로 맵핑
	        success: function(result){ //자료를 보내는것이 성공했을때 출력되는 메시지
	            //result : responseText 응답텍스트(html)
	            console.log(result);
	            $("#listReply").html(result);
	        }
	    });
	}
		
	</script>
	
	<div class="get_story_bottom" >
		<a id= "story_modify_a" href="updateStoryPage.do?story_no=${story.story_no}">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a id= "story_delete_a" href="deleteStory.do?story_no=${story.story_no}">삭제하기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="getStoryList.do">목록보기</a>
	</div>
	
	<br><br>
</main>

<%@ include file="../import/bottom.jsp" %>