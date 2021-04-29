<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">

	.top_story_list{
		color: white;
		background-color: #58CCFF;
	}
	.story_top{
		width: 1000px;
	 	border: 1px solid gray;
	 	text-align: center;
	 	padding: 7px;
	}

	.story_subject_title{
		text-align: left;
		padding: 5px;
		padding-left: 20px;
	}

	.story_subject{
		width: 60%;
	}
	.story_writer{
		width: 15%;
	}
	.story_date{
		width: 15%;
	}
	.story_views{
		width: 10%;
	}
	.new_story_post{
		text-align: center;
	}
/*	.story_top a:hover {
		color: #fff !important;
		background: #58CCFF;
	}
*/

</style>

<script type="text/javascript">
 	$(function(){

		//세션에 로그인 된 아이디 값이 없다면
		if($("#sessionID").val() == ""){
			// 새글 등록 버튼 숨기기
			$("#new_post").hide();
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

	<br><h1>여행 이야기</h1>

	<!-- 페이징 JSP 추가작업 2 -->
	<!-- 페이징 옵션 시작 -->
	<select id="cntPerPage" name="sel" onchange="selChange()" class="StorycntPerPage">
		<option value="5"
			<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5개 보기</option>
		<option value="10"
			<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개 보기</option>
		<option value="15"
			<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15개 보기</option>
		<option value="20"
			<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개 보기</option>
	</select>
	<!-- 페이징 옵션 끝 -->

	<br><br>

	<table class = "story_top">

		<tr class="top_story_list">
			<th class="story_subject">제목</th>
			<th class="story_writer">작성자</th>
			<th class="story_date">등록일</th>
			<th class="story_views">조회수</th>
		</tr>

		<c:forEach items="${ storyList }" var="story">
			<tr>
				<td class="story_subject_title"><a href="<c:url value='/story/getStory.do?story_no=${ story.story_no }'/>"> ${ story.story_title }</a></td>
				<td>${ story.story_writer }</td>
				<td><fmt:formatDate value="${ story.story_date }" pattern="yy-MM-dd"/>
				</td>
				<td>${ story.story_cnt }</td>
			</tr>
		</c:forEach>

	</table>

	<br><br>

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

	
	<div id="new_story_post" class="new_story_post">
		<br>
	 	<a href="insertStoryPage.do">새글 등록</a>
	</div><br><br>
</main>

<%@ include file="../import/bottom.jsp" %>
