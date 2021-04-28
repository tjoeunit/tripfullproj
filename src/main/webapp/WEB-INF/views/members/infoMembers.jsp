<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<script type="text/javascript">
	$(function(){
		
		// 회원정보 수정
		$('#editMembers').click(function() {
			var msg = confirm('${members.members_id}님 회원정보를 수정하시겠습니까?');	
			if (msg) {
				//true
				location.href = "<c:url value='/members/updateMembers.do?members_no=${members.members_no}'/>";
			} else {
				//false
				event.preventDefault;
				location.href = "<c:url value='/members/infoMembers.do'/>";
			}
		});
		
		// 비밀번호 변경
		$('#pwChange').click(function() {
			var msg = confirm('${members.members_id}님 비밀번호를 변경하시겠습니까?');	
			if (msg) {
				//true
				location.href = "<c:url value='/members/updatePw.do'/>";
			} else {
				//false
				event.preventDefault;
				location.href = "<c:url value='/members/infoMembers.do'/>";
			}
		});
		
		// 회원 탈퇴
		$('#outMembers').click(function() {
			var msg = confirm('${members.members_id}님 탈퇴 하시겠습니까?');	
			if (msg) {
				//true
				location.href = "<c:url value='/members/deleteMembers.do?members_no=${members.members_no}'/>";
			} else {
				//false
				event.preventDefault;
				location.href = "<c:url value='/members/infoMembers.do'/>";
			}
		});	
	});	
</script>

<style type="text/css">
	
	.small_navi {
		display: inline-block;
		margin: 5px;
		padding: 5px;
		text-decoration: none;
		font-size: 12px;
	}
	
	.main_title {
		align-content: left;
		font-size: 40px;
		font-weight: 600;
		margin: 20px 0px;
	}
	
	.info_change_button {
		
	}
	
	.user_table {
		margin: 20px;
	}
	
	.user_table_th1 {
		width: 100px;
	}
	
	.user_table_th2 {
	
	}
	
	
</style>

<main>

	<span class="small_navi"><a href="<c:url value='/members/indexMembers.do'/>">마이페이지</a></span>
	>
	<span class="small_navi"><a href="<c:url value='/members/infoMembers.do'/>">회원정보</a></span>
	
	<div class="main_title">회원정보</div>
	<hr>
	
	<table class="user_table">
		<tr>
			<td class="user_table_th1">아이디</td>
			<td class="user_table_th2">${members.members_id}</td>
		</tr>
		
		<tr>
			<td class="user_table_th1">비밀번호</td>
			<td class="user_table_th2"><input type="button" id="pwChange" value="비밀번호변경" class="info_change_button"></td>
		</tr>
		
		<tr>
			<td class="user_table_th1">이름</td>
			<td class="user_table_th2">${members.members_name}</td>
		</tr>
		
		<tr>
			<td class="user_table_th1">성별</td>
			<td class="user_table_th2">${members.members_gender}</td>
		</tr>
		
		<tr>
			<td class="user_table_th1">전화번호</td>
			<td class="user_table_th2">${members.members_tel}</td>
		</tr>
		
		<tr>
			<td class="user_table_th1">이메일</td>
			<td class="user_table_th2">${members.members_email}</td>
		</tr>
		
		<tr>
			<td class="user_table_th1">우편번호</td>
			<td class="user_table_th2">${members.members_zipcode}</td>
		</tr>
		
		<tr>
			<td class="user_table_th1">주소</td>
			<td class="user_table_th2">${members.members_address}, ${members.members_address_detail}</td>
		</tr>
		
	</table>

	<input type="button" id="editMembers" value="회원정보수정" >
	<input type="button" id="outMembers" value="회원탈퇴">
	
</main>

<%@ include file="../import/bottom.jsp" %>