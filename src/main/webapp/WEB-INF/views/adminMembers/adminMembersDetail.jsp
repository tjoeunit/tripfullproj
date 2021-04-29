<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/admintop.jsp" %>

<script type="text/javascript">
	
	$(function(){
		$('#updateBtn').click(function(){
			location.href="<c:url value='/adminMembers/updateMembers.do?members_no=${members.members_no}'/>";
		});
		
		$('#deleteBtn').click(function(){
			var msg = confirm('${members.members_id} 회원을 삭제하시겠습니까?');
			if(msg){
				location.href="<c:url value='/adminMembers/deleteMembers.do?members_no=${members.members_no}'/>";
			}else{
				event.preventDefault;
				location.href = "<c:url value='/adminMembers/adminMembersDetail.do?members_no=${members.members_no}'/>";
			}
			
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
		width: 900px;
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
		color: black;
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
		<span class="update_delete">
			<input type="button" id="updateBtn" value="수정하기">
		</span>
		<span class="update_delete">
			<input type="button" id="deleteBtn" value="삭제하기">
		</span>
	</div>
	
	<table class="user_table">
		<tr>
			<td class="user_table_td1">가입일</td>
			<td class="user_table_td2">${members.members_regdate}</td>
		</tr>
		
		<tr>
			<td class="user_table_td1">아이디</td>
			<td class="user_table_td2">${members.members_id}</td>
		</tr>
		
		<tr>
			<td class="user_table_td1">이름</td>
			<td class="user_table_td2">${members.members_name}</td>
		</tr>
		
		<tr>
			<td class="user_table_td1">성별</td>
			<td class="user_table_td2">${members.members_gender}</td>
		</tr>
		
		<tr>
			<td class="user_table_td1">전화번호</td>
			<td class="user_table_td2">${members.members_tel}</td>
		</tr>
		
		<tr>
			<td class="user_table_td1">이메일</td>
			<td class="user_table_td2">${members.members_email}</td>
		</tr>
		
		<tr>
			<td class="user_table_td1">우편번호</td>
			<td class="user_table_td2">${members.members_zipcode}</td>
		</tr>
		
		<tr>
			<td class="user_table_td1">주소</td>
			<td class="user_table_td2">${members.members_address}</td>
		</tr>
		
		<tr>
			<td class="user_table_td1">상세주소</td>
			<td class="user_table_td2">${members.members_address_detail}</td>
		</tr>
	</table>

</main>


<%@ include file="../import/bottom.jsp" %>