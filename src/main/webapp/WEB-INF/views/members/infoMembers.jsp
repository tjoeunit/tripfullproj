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

<main>

아이디 : ${members.members_id}<br>
이름 : ${members.members_name}<br>
전화번호 : ${members.members_tel}<br>
이메일 : ${members.members_email}<br>
성별 : ${members.members_gender}<br>
우편번호 : ${members.members_zipcode}<br>
주소 : ${members.members_address}<br>
주소상세 : ${members.members_address_detail}<br>

<input type="button" id="editMembers" value="회원정보수정" >
<input type="button" id="pwChange" value="비밀번호변경">
<input type="button" id="outMembers" value="회원탈퇴">
</main>

<%@ include file="../import/bottom.jsp" %>