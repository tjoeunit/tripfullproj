<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/admintop.jsp" %>
<style type="text/css">	
	.admin_subtitle {
		background-color: lightgray;
		padding: 10px 10px 10px 20px;
	}
	
	.admin_subtitle_name {
		font-size: 30px;
		display: inline-block;
		width: 1000px;
		font-weight: 600;
	}
	
	.new_upload {
		width: 150px;
	}
	
	.new_upload a {
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
	
	.new_upload a:hover {
		color: #fff !important;
		background: #383838;
	}
	
	.list_table {
		width: 1160px;
		margin: 20px;
		border-collapse: collapse;
		border-bottom: 3px solid gray;
	}
	.list_table th{
		border-bottom: 3px solid gray;
		padding: 5px;
	}
	
	.list_th1 {
		width: 18%;
	}
	.list_th2 {
		width: 18%;
	}
	.list_th3 {
		width: 18%;
	}
	.list_th4 {
		width: 18%;
	}
	.list_th5 {
		width: 18%;
	}
	.list_th6 {
		width: 10%;
	}
	
	td {
		padding: 5px;
		text-align: center;
	}
	
	.list_product_title {
	
	}
	
	.list_product_title a {
		text-decoration: none;
		color: black;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		var mno = $('#mno').val();		
		$('#detail_btn').click(function(){
			location.href = "<c:url value='/adminMembers/adminMembersDetail.do?members_no="+mno+"'/>";
		});
	});
</script>

<!-- 페이징 JSP 추가작업 1 -->
<!-- 페이징 옵션 처리 자바스크립트 시작 -->
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "<c:url value='/adminMembers/adminMembers.do?nowPage=${paging.nowPage}&cntPerPage="+sel+"'/>";		
	}
</script>
<!-- 페이징 옵션 처리 자바스크립트 끝 -->

<main>
	<div class="admin_subtitle">
		<span class="admin_subtitle_name">회원관리</span>
		<!-- 관리자는 회원을 등록하지 않음 -->
		<!--
		<span class="new_upload">
			<a href="<c:url value='/adminFlight/insertFlight.do'/>">상품 등록</a>
		</span>
		-->
	</div>
	
	<!-- 페이징 JSP 추가작업 2 -->
	<!-- 페이징 옵션 시작 -->
	<select id="cntPerPage" name="sel" onchange="selChange()">
		<option value="10"
			<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개 보기</option>
		<option value="20"
			<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개 보기</option>
	</select>
	<!-- 페이징 옵션 끝 -->
	
	<table class=list_table>
		<tr>
			<th class="list_th1">회원번호</th>
			<th class="list_th2">아이디</th>
			<th class="list_th3">이름</th>
			<th class="list_th4">전화번호</th>
			<th class="list_th5">이메일</th>
			<th class="list_th6"></th>
		</tr>
		
		<c:forEach items="${membersList}" var="members">
				<input type="hidden" id="mno" value="${members.members_no}">
			<tr>
				<td>${members.members_no}</td>
				<td>${members.members_id}</td>
				<td>${members.members_name}</td>
				<td>${members.members_tel}</td>
				<td>${members.members_email}</td>
				<td><input type="button" id="detail_btn" value="상세보기"></td>
			</tr>
		
		</c:forEach>
	</table>
	
	<!-- 페이징 JSP 추가작업 3 -->
	<!-- 페이징 하단 숫자 시작 -->
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="<c:url value='/adminMembers/adminMembers.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">							
					<a href="<c:url value='/adminMembers/adminMembers.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">					
			<a href="<c:url value='/adminMembers/adminMembers.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
		</c:if>
	</div>
	<!-- 페이징 하단 숫자 끝 -->

</main>

<%@ include file="../import/bottom.jsp" %>
