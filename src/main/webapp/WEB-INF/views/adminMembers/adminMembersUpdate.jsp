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
		width: 85%;
		font-weight: 600;
		font-size: 30px;
	}
	
	table {
		width: 1200px;
		padding: 20px;
	}
	
	.table_td1 {
		width: 100px;
	}
	
	.insert_input {
		padding: 5px;
		width: 900px;
		border: none;
		background-color: lightgray;
	}
	
	.insert_submit {
		cursor: pointer;
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
		background-color: lightgray;
		border: none;
	}
	
	.insert_submit:hover {
		color: #fff !important;
		background: #383838;
	}
	
	
</style>
<script type="text/javascript">
	$(function(){
		//DB 저장된 값을 셀렉트 옵션으로 전송
		$('#members_gender').val($("#hidden_gender").val()).prop("selected", true);
	});
</script>
<main>
	<!-- DB 저장된 값을 hidden에 저장 -->
	<input type="hidden" id="hidden_gender" value="${members.members_gender}">

	<form action="<c:url value='/adminMembers/adminMembersUpdate.do'/>" method="post" enctype="multipart/form-data">
		<input type="hidden" name="members_no" value="${members.members_no}">
		<div class="admin_subtitle">
			<span class="admin_subtitle_name">항공권 상품 수정</span>
			<span class="new_upload">
				<input type="submit" class="insert_submit" value=" 수정완료 " />
			</span>
		</div>
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">아이디</td>
					<td><input type="text" class="insert_input" name="members_id" value="${members.members_id}" readonly/></td>
				</tr>
				
				<tr>
					<td class="table_td1">이름</td>
					<td><input type="text" class="insert_input" name="members_name" value="${members.members_name}"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">전화번호</td>
					<td><input type="text" class="insert_input" name="members_tel" value="${members.members_tel}" maxlength="13"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">이메일</td>
					<td><input type="text" class="insert_input" name="members_email" value="${members.members_email}"/></td>
				</tr>
						
				<tr>
					<td class="table_td1">성별</td>
					<td>
						<select name="members_gender" id="members_gender">
							<option value="남자" selected="selected">남자</option>
							<option value="여자">여자</option>
						</select>					
					</td>
				</tr>
				
				<tr>
					<td class="table_td1">우편번호</td>
					<td><input type="text" class="insert_input" name="members_zipcode" value="${members.members_zipcode}"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">주소</td>
					<td><input type="text" class="insert_input" name="members_address" value="${members.members_address}"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">주소상세</td>
					<td><input type="text" class="insert_input" name="members_address_detail" value="${members.members_address_detail}"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">가입일</td>
					<td><input type="text" class="insert_input" value="${members.members_regdate}" readonly/></td>
				</tr>
				
			</table>
		</div>
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>