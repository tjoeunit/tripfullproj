<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../import/top.jsp" %>
<main>
	<div style="margin-left: 360px;">
		회원가입<br>
		<form action="insertMembers.do" method="post">
			<table>
				<tr>
					<td>아이디 :</td>
					<td><input type="text" name="members_id"></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="members_pw"></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td><input type="text" name="members_name"></td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td><input type="text" name="members_tel"></td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td><input type="text" name="members_email"></td>
				</tr>
				<tr>
					<td>성별 :</td>
					<td>
						<select name="members_gender">
							<option value="남자">남자</option>
						    <option value="여자">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>우편번호 :</td>
					<td><input type="text" name="members_zipcode"></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><input type="text" name="members_address"></td>
				</tr>
				<tr>
					<td>주소상세 :</td>
					<td><input type="text" name="members_address_detail"></td>
				</tr>
			</table>
			<input type="submit" value="가입하기">
			<input type="button" value="뒤로가기">
		</form>
	</div>
	
</main>
<%@ include file="../import/bottom.jsp" %>