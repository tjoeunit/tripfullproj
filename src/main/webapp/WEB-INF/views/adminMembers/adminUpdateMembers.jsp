<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/admintop.jsp" %>

<script type="text/javascript">	
	$(function(){
		$('#backBtn').click(function(){
			location.href = "<c:url value='/adminMembers/adminMembersDetail.do?members_no=${members.members_no}'/>";
		});
	});
</script>
<main>
회원정보수정페이지<br>

	<form action="<c:url value='/adminMembers/adminUpdateMembers.do'/>" method="post">
		<input type="hidden" name="members_no" value="${members.members_no}">
		아이디 : <input type="text" name="members_id" value="${members.members_id}" readonly><br>
		이름 : <input type="text" name="members_name" value="${members.members_name}"><br>
		전화번호 : <input type="text" name="members_tel" value="${members.members_tel}"><br>
		이메일 : <input type="text" name="members_email" value="${members.members_email}"><br>
		성별 : <input type="text" name="members_gender" value="${members.members_gender}"><br>
		우편번호 : <input type="text" name="members_zipcode" value="${members.members_zipcode}"><br>
		주소 : <input type="text" name="members_address" value="${members.members_address}"><br>
		주소상세 : <input type="text" name="members_address_detail" value="${members.members_address_detail}"><br>
		가입일 : <input type="text" name="members_regdate" value="${members.members_regdate}" readonly><br>		
		<input type="submit" value="수정하기">
		<input type="button" id="backBtn" value="뒤로가기">
	</form>
</main>
<%@ include file="../import/bottom.jsp" %>