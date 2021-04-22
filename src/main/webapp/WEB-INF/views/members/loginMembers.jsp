<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<main>
	
	<div style="width: 500px; height: 300px; margin-top: 200px; margin-left: 500px;">
		<form name="frm" action="<c:url value='/members/loginMembers.do'/>" method="post">
			로그인<br>
			<input type="text" name="members_id"><br>
			<input type="password" name="members_pw"><br>
			<input type="submit" value="로그인">
			<button type="button" onclick="history.back()">뒤로가기</button>
		</form>		
	</div>
</main>
<%@ include file="../import/bottom.jsp" %>