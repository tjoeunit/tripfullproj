<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<script type="text/javascript">
	$(function(){
		var dbtel = $('#dbtel').val();
		var tel1 = dbtel.substring(0,3);
		var tel2 = dbtel.substring(4,8);
		var tel3 = dbtel.substring(9,13);
		
		$('#tel1').val(tel1);
		$('#tel2').val(tel2);
		$('#tel3').val(tel3);
		
		//새로운 주소 입력을 위해 클릭 시 value 초기화		
		$('#search_address').click(function(){
			$('#members_zipcode').val("");
			$('#members_address').val("");
			$('#members_address_detail').val("");
		});
		
		// DB 저장된 값을 셀렉트 옵션으로 전송
		$('#members_gender').val($("#dbgender").val()).prop("selected", true);
		
		//전화번호 숫자 정규식!
		var numReg = /^[0-9]+$/;		

		$('#tel2').keyup(function(){
			$('#members_tel').val($('#tel1').val()+"-"+$('#tel2').val()+"-"+$('#tel3').val());
			
			if(!numReg.test($('#tel2').val())){
				$('#chkTel').html("전화번호는 숫자만 입력하세요").css('color', 'red');
			} else {
				$('#chkTel').html("");
			}			
		});
		
		$('#tel3').keyup(function(){
			$('#members_tel').val($('#tel1').val()+"-"+$('#tel2').val()+"-"+$('#tel3').val());
			
			if(!numReg.test($('#tel3').val())){
				$('#chkTel').html("전화번호는 숫자만 입력하세요").css('color', 'red');
			} else {
				$('#chkTel').html("");
			}
		});
		
		//이메일 정규식
		var emailReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		$('#members_email').keyup(function(){
			if (!emailReg.test($("#members_email").val())) {
				$('#chkEmail').html("이메일 형식에 맞춰서 작성하세요").css('color', 'red');
			} else {
				$('#chkEmail').html("");
			}
		});
		
		$('form[name=frm]').submit(function() {
			if ($('#members_name').val().length < 1) {
				alert('이름을 확인하세요');
				$('#members_name').focus();
				event.preventDefault();
				return false;
										
			} else if ($('#tel2').val().length < 4) {
				alert('전화번호를 확인하세요');
				$('#tel2').focus();
				event.preventDefault();
				return false;
				
			} else if ($('#tel3').val().length < 4) {
				alert('전화번호를 확인하세요');
				$('#tel3').focus();
				event.preventDefault();
				return false;
			
			} else if (!numReg.test($("#tel2").val())) {
				alert('전화번호를 확인하세요');
				$('#tel2').focus();
				event.preventDefault();
				return false;
			
			} else if (!numReg.test($("#tel3").val())) {
				alert('전화번호를 확인하세요');
				$('#tel3').focus();
				event.preventDefault();
				return false;		
				
			} else if ($('#members_email').val().length < 1) {
				alert('이메일을 확인하세요');
				$('#members_email').focus();
				event.preventDefault();
				return false;
				
			} else if (!emailReg.test($("#members_email").val())) {
				alert('이메일을 확인하세요');
				$('#members_email').focus();
				event.preventDefault();
				return false;		
				
			} else if ($('#members_zipcode').val().length < 1) {
				alert('우편번호를 확인하세요');
				$('#members_zipcode').focus();
				event.preventDefault();
				return false;
			
			} else if ($('#members_address').val().length < 1) {
				alert('주소를 확인하세요');
				$('#members_address').focus();
				event.preventDefault();
				return false;
				
			} else if ($('#members_address_detail').val().length < 1) {
				alert('주소상세를 확인하세요');
				$('#members_address_detail').focus();
				event.preventDefault();
				return false;
			}
		});	
	});
	
</script>

<!-- 주소검색 -->
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('members_zipcode').value = data.zonecode;
				document.getElementById('members_address').value = roadAddr;
			}
		}).open();
	}
</script>
<main>
	<input type="hidden" id="dbtel" value="${members.members_tel}">
	<input type="hidden" id="dbgender" value="${members.members_gender}">	

	<form name="frm" action="<c:url value='/members/updateMembers.do'/>" method="post">
		<input type="hidden" id="members_tel" name="members_tel" value="${members.members_tel}">
		<table>
			<tr>
				<td>아이디 : </td>
				<td><input type="text" name="members_id" value="${members.members_id}" readonly></td>
			</tr>
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="members_name" id="members_name" value="${members.members_name}"></td>
			</tr>
			<tr>
				<td>전화번호 : </td>
				<td>
					<input type="text" id="tel1" readonly>-<input type="text" id="tel2" maxlength="4">-<input type="text" id="tel3" maxlength="4">
				</td>
				<td>
					<div id="chkTel"></div>
				</td>
			</tr>
			<tr>
				<td>이메일 : </td>
				<td>
					<input type="text" name="members_email" id="members_email" value="${members.members_email}">
				</td>
				<td>
					<div id="chkEmail"></div>
				</td>
			</tr>
			<tr>
				<td>성별 : </td>
				<td>
					<select name="members_gender" id="members_gender">
						<option value="남자" selected>남자</option>
					    <option value="여자">여자</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>우편번호 : </td>
				<td>
					<input type="text" name="members_zipcode" id="members_zipcode" value="${members.members_zipcode}" readonly>
					<input type="button" id="search_address" onclick="sample4_execDaumPostcode()" value="주소검색">
				</td>			
			</tr>
			<tr>
				<td>주소 : </td>
				<td><input type="text" id="members_address" name="members_address" value="${members.members_address}"></td>
			</tr>
			<tr>
				<td>주소상세 : </td>
				<td><input type="text" id="members_address_detail" name="members_address_detail" value="${members.members_address_detail}"></td>
			</tr>		
		</table>
		<input type="submit" value="수정하기">
		<input type="button" value="뒤로가기" onclick="history.back()">
	</form>	
</main>

<%@ include file="../import/bottom.jsp" %>
