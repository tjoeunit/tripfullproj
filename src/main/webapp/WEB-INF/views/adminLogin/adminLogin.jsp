<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>



<style type="text/css">
	.admin_login {
	  box-sizing: border-box;
	  width: 500px;
	  background-color: #EEEFF1;
	  padding: 20px;
	  margin: 50px auto;
	  border: none;
	  border-radius: 5px;
	}
	
	.admin_login_field {
	  font-size: 16px;
	  padding: 20px 10px;
	  margin: 20px 0px;
	  border-radius: 5px;
	  border: none;
	  width: 440px;
	}
	
	.admin_login_submit {
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
		<h1>관리자 로그인</h1>
		
		<!-- <form  name="form1" method="post"> -->
		<div class="admin_login">
			<form  action="adminLogin.do"  method="post">
				<input type="text" name="admin_id" class="admin_login_field" placeholder="아이디">
				<input type="password" name="admin_pw" class="admin_login_field" placeholder="비밀번호">
				<input type="submit" class="admin_login_submit" value="로그인" />
			</form>
		</div>
	</center>

</main>

<%@ include file="../import/bottom.jsp" %>