<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">

	.main_title {
		align-content: left;
		font-size: 40px;
		font-weight: 600;
		margin: 20px 0px;
	}
	
	.page_select_box {
		text-align: right;
	}
	
	.page_select {
		padding: 5px;
		border: 1px solid gray;
		margin-right: 20px;
	}
	
	.table_list {
		margin: 20px 0px;
		width: 100%;
		border-top: 3px solid black;
		border-collapse: collapse;
	}
	
	th {
		border-bottom: 3px solid black;
		padding: 10px 0px;
	}
	
	td {
		text-align: center;
		border-bottom: 1px solid gray;
		padding: 10px 0px;
		color: gray;
	}
	
	.table_top {
		padding: 5px;
	}
	
	.table_th1 {
		width: 5%;
	}
	
	.table_th2 {
		width: 70%;
	}
	
	.table_th3 {
		width: 10%;
	}
	
	.table_th4 {
		width: 10%;
	}

	.table_th5 {
		width: 5%;
	}
		
	.post_title {
		text-align: left;
	}
	
	.post_title a {
		text-decoration: none;
		color: black;
	}
	
	.new_post_button {
		text-align: right;
	}
	
	.new_post {
		text-decoration: none;
		display:inline-block;
		margin: 10px;
		padding: 10px;
		border-radius: 5px;
		border: 1px solid gray;
		color: black;
	}
	
	.new_post:hover {
		box-shadow: 1px 1px 3px gray;
		border: 1px solid gray;
	}
	
</style>

<script type="text/javascript">
 	$(function(){

		//세션에 로그인 된 아이디 값이 없다면
		if($("#sessionID").val() == ""){
			// 새글 등록 버튼 숨기기
			$("#new_story_post").hide();
		}

	});
</script>

<!-- 페이징 JSP 추가작업 1 -->
<!-- 페이징 옵션 처리 자바스크립트 시작 -->
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="getStoryList.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<!-- 페이징 옵션 처리 자바스크립트 끝 -->

<main>

	<div class="main_title">여행이야기</div>
	<hr>

	<!-- 페이징 JSP 추가작업 2 -->
	<!-- 페이징 옵션 시작 -->
	<div class="page_select_box">
	<select id="cntPerPage" name="sel" onchange="selChange()" class="page_select">
		<option value="10"
			<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개씩 보기</option>
		<option value="20"
			<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개씩 보기</option>
	</select>
	</div>
	<!-- 페이징 옵션 끝 -->
	
	<table class = "table_list">
		<tr class="table_top">
			<th class="table_th1">번호</th>
			<th class="table_th2">제목</th>
			<th class="table_th3">작성자</th>
			<th class="table_th4">등록일</th>
			<th class="table_th5">조회수</th>
		</tr>

		<c:forEach items="${ storyList }" var="story">
			<tr>
				<td>${ story.story_no }</td>
				<td class="post_title"><a href="getStory.do?story_no=${ story.story_no }"> ${ story.story_title }</a></td>
				<td>${ story.story_writer }</td>
				<td><fmt:formatDate value="${ story.story_date }" pattern="yy-MM-dd"/>
				</td>
				<td>${ story.story_cnt }</td>
			</tr>
		</c:forEach>

	</table>
	
<!-- 페이징 JSP 추가작업 3 -->
	<!-- 페이징 하단 숫자 시작 -->
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="<c:url value='/story/getStoryList.do?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">							
					<a href="<c:url value='/story/getStoryList.do?nowPage=${p}&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">					
			<a href="<c:url value='/story/getStoryList.do?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
		</c:if>
	</div>
	<!-- 페이징 하단 숫자 끝 -->
	
	<div class="new_post_button">
			<a href="<c:url value='/story/insertStory.do'/>" id="new_post" class=" new_post">새글등록</a>
	</div>
	
	
</main>

<%@ include file="../import/bottom.jsp" %>
