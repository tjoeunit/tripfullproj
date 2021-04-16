<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>
	
	<center>
		<h1>관리자 로그인</h1>
		<hr>
		<form action="adminLogin.do" method="post">
			<table border="1" cellpadding = "0" cellspacing="0">
				<tr>
					<td bgcolor = "#58CCFF">아이디</td>
					<td><input type = "text" name = "members_id"/></td>
				</tr>
				<tr>
					<td  bgcolor = "#58CCFF">비밀번호</td>
					<td><input type = "password" name = "members_pw"/></td>
				</tr>
				<tr>
					<td bgcolor = "gray" colspan = "2" align = "center">
						<input type="submit" value="로그인">
					</td>					
				</tr>
			</table>
		</form>
	</center>
	
</body>
</html>