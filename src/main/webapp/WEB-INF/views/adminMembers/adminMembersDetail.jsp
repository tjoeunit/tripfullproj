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


<main>
회원정보<br>


아이디 : <input type="text" value="${members.members_id}" readonly><br>
이름 : <input type="text" value="${members.members_name}" readonly><br>
전화번호 : <input type="text" value="${members.members_tel}" readonly><br>
이메일 : <input type="text" value="${members.members_email}" readonly><br>
성별 : <input type="text" value="${members.members_gender}" readonly><br>
우편번호 : <input type="text" value="${members.members_zipcode}" readonly><br>
주소 : <input type="text" value="${members.members_address}" readonly><br>
주소상세 : <input type="text" value="${members.members_address_detail}" readonly><br>
가입일 : <input type="text" value="${members.members_regdate}" readonly><br>

<input type="button" id="updateBtn" value="수정하기">
<input type="button" id="deleteBtn" value="삭제하기">

</main>
<%@ include file="../import/bottom.jsp" %>