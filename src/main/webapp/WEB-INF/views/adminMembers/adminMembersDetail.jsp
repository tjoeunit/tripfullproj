<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/admintop.jsp" %>

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
	
	.update_delete {
		width: 150px;
	}
	
	.update_delete a {
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
		padding: 10px;
	}
	
	.update_delete a:hover {
		color: #fff !important;
		background: #383838;
	}
	
	table {
		width: 1200px;
		padding: 20px;
	}
	
	.table_td1 {
		width: 100px;
	}
	
	.table_td2{
		padding: 5px;
		width: 900px;
		border: none;
		background-color: lightgray;
	}	
	
</style>
<script type="text/javascript">
$(function(){	
	$('#update_btn').click(function() {
		location.href = "<c:url value='/adminMembers/adminMembersUpdate.do?members_no=${members.members_no}'/>";
	});
	
	$('#delete_btn').click(function() {
		var msg = confirm('${members.members_id} 회원님을 삭제하시겠습니까?');	
		if (msg) {
			//true
			location.href = "<c:url value='/adminMembers/adminMembersDelete.do?members_no=${members.members_no}'/>";
		} else {
			//false
			event.preventDefault;
			location.href = "<c:url value='/adminMembers/adminMembersDetail.do?members_no=${members.members_no}'/>";
		}
	});
})
</script>
<main>
	<div class="admin_subtitle">
		<span class="admin_subtitle_name">회원정보 상세페이지</span>
		<span class="update_delete">
			<input type="button" id="update_btn" value="수정">
		</span>
		<span class="update_delete">
			<input type="button" id="delete_btn" value="삭제">
		</span>
	</div>
	<div>
		<table class="detail_table">
			<tr>
				<td class="table_td1">아이디</td>
				<td class="table_td2">${members.members_id}</td>
			</tr>
			
			<tr>
				<td class="table_td1">이름</td>
				<td class="table_td2">${members.members_name}</td>
			</tr>
			
			<tr>
				<td class="table_td1">전화번호</td>
				<td class="table_td2">${members.members_tel}</td>
			</tr>
			
			<tr>
				<td class="table_td1">이메일</td>
				<td class="table_td2">${members.members_email} 원</td>
			</tr>
			
			<tr>
				<td class="table_td1">성별</td>
				<td class="table_td2">${members.members_gender}</td>
			</tr>			
			
			<tr>
				<td class="table_td1">우편번호</td>
				<td class="table_td2">${members.members_zipcode}</td>
			</tr>
			
			<tr>
				<td class="table_td1">주소</td>
				<td class="table_td2">${members.members_address}</td>
			</tr>
			
			<tr>
				<td class="table_td1">주소상세</td>
				<td class="table_td2">${members.members_address_detail}</td>
			</tr>
			
			<tr>
				<td class="table_td1">가입일</td>
				<td class="table_td2">${members.members_regdate}</td>
			</tr>
		</table>
	</div>	
</main>