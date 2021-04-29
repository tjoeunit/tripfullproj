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


<style type="text/css">
	
	.main_title {
		align-content: left;
		font-size: 40px;
		font-weight: 600;
		margin: 20px 0px;
	}
	
	.user_table {
		margin: 20px 0px;
		width: 100%;
		border-top: 3px solid black;
		border-collapse: collapse;
	}
	
	td {
		border-bottom: 1px solid gray;
		padding: 10px 0px;
		color: gray;
	}
	
	.user_table_td1 {
		width: 150px;
		padding-left: 20px;
	}

	.info_button_box {
		text-align: right;
	}
	
	.info_button {
		text-align: right;
		text-decoration: none;
		display:inline-block;
		margin: 10px;
		padding: 10px;
		border-radius: 5px;
		border: 1px solid gray;
		color: black;
		background-color: white;
	}
	
	.info_button:hover {
		box-shadow: 1px 1px 3px gray;
		border: 1px solid gray;
	}

</style>


<main>
	
	<div class="main_title">${members_id}님 비밀번호 변경</div>
	<hr>
	
	<form name="frm" action="<c:url value='/members/updatePw.do'/>" method="post">
		<table class="user_table">
			<tr>
				<td class="user_table_td1">현재 비밀번호 입력</td>
				<td class="user_table_td2"><input type="password" name="members_pw_use" id="usePw"></td>
				<td class="user_table_td3"></td>
			</tr>
			<tr>
				<td class="user_table_td1">새 비밀번호 입력</td>
				<td class="user_table_td2"><input type="password" name="members_pw" id="chgPw1"></td>
				<td class="user_table_td3"><div id="chkpw1div"></div></td>
			</tr>
			<tr>
				<td class="user_table_td1">새 비밀번호 확인</td>
				<td class="user_table_td2"><input type="password" id="chgPw2"></td>
				<td class="user_table_td3"><div id="chkpw2div"></div></td>
			</tr>	
		</table>
		
		<div class="info_button_box">
			<input type="submit" value="변경하기" class="info_button">
			<input type="button" value="뒤로가기" onclick="history.back()" class="info_button">
		</div>
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>
