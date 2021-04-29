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

<style type="text/css">
	.admin_subtitle {
		background-color: lightgray;
		padding: 10px 10px 10px 20px;
	}
	
	.admin_subtitle_name {
		display: inline-block;
		width: 1000px;
		font-weight: 600;
		font-size: 30px;
	}
	
	.update_delete input {
		display: inline-block;
		font-size: 25px;
		text-decoration: none;
		color: black;
		font-weight: 600;
		border-radius: 5px;
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
		padding: 10px 5px;
		background-color: lightgray;
		border: none;
		width: 125px;
		cursor: pointer;
	}
	
	.update_delete input:hover {
		color: #fff !important;
		background: #383838;
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
	
	input {
		padding: 5px;
		border: 1px solid gray;
		border-radius: 5px;
		width: 300px;
	}
	
	.select_box {
		padding: 5px;
		border: 1px solid gray;
		border-radius: 5px;
		width: 174px;
	}
</style>

<main>
	
	<form action="<c:url value='/adminMembers/adminUpdateMembers.do'/>" method="post">
		<input type="hidden" name="members_no" value="${members.members_no}">
		
		<div class="admin_subtitle">
			<span class="admin_subtitle_name">회원정보 수정하기</span>
			<span class="update_delete">
				<input type="submit" value="수정하기">
			</span>
		</div>
		
		<table class="user_table">
			<tr>
				<td class="user_table_td1">가입일</td>
				<td class="user_table_td2"><input type="text" name="members_regdate" value="${members.members_regdate}" readonly></td>
			</tr>
			
			<tr>
				<td class="user_table_td1">아이디</td>
				<td class="user_table_td2"><input type="text" name="members_id" value="${members.members_id}" readonly></td>
			</tr>
			
			<tr>
				<td class="user_table_td1">이름</td>
				<td class="user_table_td2"><input type="text" name="members_name" value="${members.members_name}"></td>
			</tr>
			
			<tr>
				<td class="user_table_td1">성별</td>
				<td class="user_table_td2"><input type="text" name="members_gender" value="${members.members_gender}"></td>
			</tr>
			
			<tr>
				<td class="user_table_td1">전화번호</td>
				<td class="user_table_td2"><input type="text" name="members_tel" value="${members.members_tel}"></td>
			</tr>
			
			<tr>
				<td class="user_table_td1">이메일</td>
				<td class="user_table_td2"><input type="text" name="members_email" value="${members.members_email}"></td>
			</tr>
			
			<tr>
				<td class="user_table_td1">우편번호</td>
				<td class="user_table_td2"><input type="text" name="members_zipcode" value="${members.members_zipcode}"></td>
			</tr>
			
			<tr>
				<td class="user_table_td1">주소</td>
				<td class="user_table_td2"><input type="text" name="members_address" value="${members.members_address}"></td>
			</tr>
			
			<tr>
				<td class="user_table_td1">상세주소</td>
				<td class="user_table_td2"><input type="text" name="members_address_detail" value="${members.members_address_detail}"></td>
			</tr>
		</table>
	</form>
</main>
<%@ include file="../import/bottom.jsp" %>