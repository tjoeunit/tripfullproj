<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">
	.member_login {
	  box-sizing: border-box;
	  width: 500px;
	  background-color: #EEEFF1;
	  padding: 20px;
	  margin: 50px auto;
	  border: none;
	  border-radius: 5px;
	}

	.member_login_field {
	  font-size: 16px;
	  padding: 20px 10px;
	  margin: 20px 0px;
	  border-radius: 5px;
	  border: none;
	  width: 440px;
	}

	.member_login_submit {
	  font-size: 16px;
	  padding: 20px 10px;
	  margin: 30px 0px;
	  border-radius: 5px;
	  border: none;
	  width: 100%;
	  text-align: center;
	  background-color: #58CCFF;
	  cursor: pointer;
	}
</style>

<main>
	<center>
		<h1>로그인<br></h1>

		<div class="member_login">
			<form name="frm" action="<c:url value='/members/loginMembers.do'/>" method="post">
				<input type="text" name="members_id" class="member_login_field" placeholder="아이디">
				<input type="password" name="members_pw" class="member_login_field" placeholder="비밀번호">
				<input type="submit" value="로그인" class="member_login_submit">
			</form>
		</div>
	</center>
</main>

<%@ include file="../import/bottom.jsp" %>
