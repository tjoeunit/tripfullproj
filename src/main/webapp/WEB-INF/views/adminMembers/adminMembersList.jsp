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
	
	.table_list {
		width: 1160px;
		margin: 20px;
		border-collapse: collapse;
		border-bottom: 3px solid gray;
	}
	
	.table_list th{
		border-bottom: 3px solid gray;
		padding: 5px;
	}
	
	.table_th1 {
		width: 15%;
	}
	.table_th2 {
		width: 10%;
	}
	.table_th3 {
		width: 5%;
	}
	.table_th4 {
		width: 15%;
	}
	.table_th5 {
		width: 20%;
	}
	.table_th6 {
		width: 25%;
	}
	.table_th7 {
		width: 10%;
	}
	
	td {
		padding: 10px 5px;
		text-align: center;
	}
	
	a {
		text-decoration: none;
		color: gray;
	}
	
	.info_detail {
		border: 1px solid gray;
		border-radius: 5px;
		padding: 5px;
	}
	
</style>

<main>
	
	<div class="admin_subtitle">
		<span class="admin_subtitle_name">회원관리</span>
	</div>
	
	<table class = "table_list">
		<tr class="table_top">
			<th class="table_th1">아이디</th>
			<th class="table_th2">이름</th>
			<th class="table_th3">성별</th>
			<th class="table_th4">전화번호</th>
			<th class="table_th5">이메일</th>
			<th class="table_th6">가입일</th>
			<th class="table_th7">상세보기</th>
		</tr>
		<c:forEach items="${membersList}" var="members">
		<tr>		
			<td>${members.members_id}</td>
			<td>${members.members_name}</td>
			<td>${members.members_gender}</td>
			<td>${members.members_tel}</td>
			<td>${members.members_email}</td>
			<td>${members.members_regdate}</td>
			<td><a href="<c:url value='/adminMembers/adminMembersDetail.do?members_no=${members.members_no}'/>" class="info_detail">상세보기</a></td>
		</tr>
		
		</c:forEach>
	</table>	
</main>


<%@ include file="../import/bottom.jsp" %>