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
	
}
	
</style>


<main>
	<input type="hidden" id="story_writer" value="${story.story_writer}">		<!-- 작성자 -->
	<input type="hidden" name="story_no" value="${story.story_no}" />
	<input type="hidden" id="members_id" value="${members_id}"> 		<!-- 세션 로그인된 id -->
	
	<div class="post_box">
		<div class="post_title">${story.story_title}</div>
		<div class="post_info_box">
			<span class="post_info">${story.story_writer}</span>
			<span class="post_info"><fmt:formatDate value="${ story.story_date }" pattern="yy.MM.dd HH:mm"/></span>
			<span class="post_info">조회 ${story.story_cnt}</span>
		</div>
		
		<hr>
		
		<div class="post_content">${story.story_content}</div>
		
		<c:if test="${members_id != null}">
			<div class="update_delete" >
				<a class="update_delete_botton" id= "story_modify_a" href="updateStoryPage.do?story_no=${story.story_no}">수정하기</a>
				<a class="update_delete_botton" id= "story_delete_a" href="deleteStory.do?story_no=${story.story_no}">삭제하기</a>
				<a class="update_delete_botton" href="getStoryList.do">목록보기</a>
			</div>
			
			<hr>
		
		
			<div class="post_reply_box">
				<div>
					<span class="post_reply_writer">${ members_id }</span>
					<span><button type="button" id="btnReply" class="post_reply_button">댓글쓰기</button></span>
				</div>
				<textarea rows="2" cols="120" id="reply_text" class="post_reply" placeholder="댓글을 작성하세요."></textarea>
			</div>
		</c:if>
	</div>


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
	
	
	
	<br><br>
</main>

<%@ include file="../import/bottom.jsp" %>