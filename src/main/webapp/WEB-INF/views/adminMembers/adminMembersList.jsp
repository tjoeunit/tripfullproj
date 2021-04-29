<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/admintop.jsp" %>

<main>
	<span>회원목록</span>
	<table class = "table_list">
		<tr class="table_top">
			<th class="table_th1">아이디</th>
			<th class="table_th2">이름</th>
			<th class="table_th3">전화번호</th>
			<th class="table_th4">이메일</th>
			<th class="table_th5">가입일</th>
			<th class="table_th6">성별</th>
			<th class="table_th7">우편번호</th>
			<th class="table_th8">주소</th>
			<th class="table_th9">주소상세</th>
			<th></th>
		</tr>
		<c:forEach items="${membersList}" var="members">
		<tr>		
			<td>${members.members_id}</td>
			<td>${members.members_name}</td>
			<td>${members.members_tel}</td>
			<td>${members.members_email}</td>
			<td>${members.members_regdate}</td>
			<td>${members.members_gender}</td>
			<td>${members.members_zipcode}</td>
			<td>${members.members_address}</td>
			<td>${members.members_address_detail}</td>
			<td><a href="<c:url value='/adminMembers/adminMembersDetail.do?members_no=${members.members_no}'/>">상세보기</a></td>
		</tr>
		
		</c:forEach>
	</table>	
</main>


<%@ include file="../import/bottom.jsp" %>