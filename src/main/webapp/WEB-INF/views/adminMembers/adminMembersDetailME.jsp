<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/admintop.jsp" %>

<style type="text/css">

	.admin_subtitle {
		background-color: lightgray;
		padding: 10px 10px 10px 20px;
	}
	
	.admin_subtitle_name {
		font-size: 30px;
		display: inline-block;
		width: 1000px;
		font-weight: 600;
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
	
	input {
		padding: 5px;
		border: 1px solid gray;
		border-radius: 5px;
		width: 300px;
	}

</style>

<main>
	
	<div class="admin_subtitle">
		<span class="admin_subtitle_name">회원정보 상세보기</span>
	</div>
	
	<table class="user_table">
		<tr>
			<td class="user_table_td1">가입일</td>
			<td class="user_table_td2"><input type="text" value="${members.members_regdate}"></td>
		</tr>
		
		<tr>
			<td class="user_table_td1">아이디</td>
			<td class="user_table_td2"><input type="text" value="${members.members_id}"></td>
		</tr>
		
		<tr>
			<td class="user_table_td1">이름</td>
			<td class="user_table_td2"><input type="text" value="${members.members_name}"></td>
		</tr>
		
		<tr>
			<td class="user_table_td1">성별</td>
			<td class="user_table_td2"><input type="text" value="${members.members_gender}"></td>
		</tr>
		
		<tr>
			<td class="user_table_td1">전화번호</td>
			<td class="user_table_td2"><input type="text" value="${members.members_tel}"></td>
		</tr>
		
		<tr>
			<td class="user_table_td1">이메일</td>
			<td class="user_table_td2"><input type="text" value="${members.members_email}"></td>
		</tr>
		
		<tr>
			<td class="user_table_td1">우편번호</td>
			<td class="user_table_td2">${members.members_zipcode}</td>
		</tr>
		
		<tr>
			<td class="user_table_td1">주소</td>
			<td class="user_table_td2"><input type="text" value="${members.members_address}"></td>
		</tr>
		
		<tr>
			<td class="user_table_td1">상세주소</td>
			<td class="user_table_td2"><input type="text" value="${members.members_address_detail}"></td>
		</tr>
	</table>

</main>


<%@ include file="../import/bottom.jsp" %>