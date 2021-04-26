<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<script type="text/javascript">
$(function(){
	$('#chgPw1').keyup(function(){
		if ($('#chgPw1').val().length < 8) {
			$('#chkpw1div').html("비밀번호는 8자 이상 입력하세요").css('color', 'red');
		} else {
			$('#chkpw1div').html("사용 가능한 비밀번호입니다").css('color', 'green');
		}
	});
		
	$('#chgPw2').keyup(function() {
		if ($('#chgPw1').val() != $('#chgPw2').val()) {
			$('#chkpw2div').html("비밀번호가 일치하지 않습니다").css('color', 'red');
		} else {
			$('#chkpw2div').html("비밀번호가 일치합니다").css('color', 'green');
		}
	});
	
	$('form[name=frm]').submit(function() {
		if ($('#chgPw1').val() != $('#chgPw2').val()) {
			alert('비밀번호를 확인하세요');
			$('#chgPw1').focus();
			event.preventDefault();
			return false;
			
		} else if ($('#chgPw1').val().length < 8) {
			alert('비밀번호를 확인하세요');
			$('#chgPw1').focus();
			event.preventDefault();
			return false;
		}
	});		
});
</script>
<main>
	${members_id}님 비밀번호 변경<br>
	
	<form name="frm" action="<c:url value='/members/updatePw.do'/>" method="post">
		<table>
			<tr>
				<td>현재 비밀번호 입력 : </td>
				<td><input type="password" name="members_pw_use" id="usePw"></td>
				<td></td>
			</tr>
			<tr>
				<td>새 비밀번호 입력 : </td>
				<td><input type="password" name="members_pw" id="chgPw1"></td>
				<td><div id="chkpw1div"></div></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인 : </td>
				<td><input type="password" id="chgPw2"></td>
				<td><div id="chkpw2div"></div></td>
			</tr>	
		</table>
		<div>
			<input type="submit" value="변경하기">
			<input type="button" value="뒤로가기" onclick="history.back()">
		</div>
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>
