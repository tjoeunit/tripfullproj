<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../import/top.jsp" %>

<script type="text/javascript">
	$(function() {
		
		$('#members_tel1').keyup(function(){
			$('#members_tel').val($('#members_tel1').val()+"-"+$('#members_tel2').val()+"-"+$('#members_tel3').val());
		});
		$('#members_tel2').keyup(function(){
			$('#members_tel').val($('#members_tel1').val()+"-"+$('#members_tel2').val()+"-"+$('#members_tel3').val());
		});		
		$('#members_tel3').keyup(function(){
			$('#members_tel').val($('#members_tel1').val()+"-"+$('#members_tel2').val()+"-"+$('#members_tel3').val());
		});
		
		$('#members_pw2').keyup(function() {
			if ($('#members_pw').val() != $('#members_pw2').val()) {
				$('#chkpw2').html("비밀번호가 일치하지 않습니다").css('color', 'red');
			} else {
				$('#chkpw2').html("비밀번호가 일치합니다").css('color', 'green');
			}
		});
		
		$('#members_id').keyup(function() {
			if ($('#members_id').val().length < 4) {
				$('#chkId2').html("아이디는 4글자 이상 사용할 수 있습니다").css('color', 'red')
				$('#chkId').val("N");
	
			} else {
				var members_id = $('#members_id').val();
				console.log(members_id);
	
				$.ajax({
					url : "<c:url value='/members/checkIdDup.do' />",
					type : "get",
					data : "members_id=" + members_id,
					dataType : "json",
					success : function(data) {
						if (data > 0) {
							$('#chkId2').html("중복된 아이디가 있습니다").css('color', 'red');
							$('#chkId').val("N");
						} else {
							$('#chkId2').html("사용 가능한 아이디입니다").css('color','green');
							$('#chkId').val("Y");
						}
					},
					error : function(xhr, status, error) {
						alert(status + ", " + error);
					}
				});	
			}
		});

		$('form[name=frm]').submit(function() {
			if ($('#members_id').val().length < 1) {
				alert('아이디를 확인하세요');
				$('#members_id').focus();
				event.preventDefault();
				return false;
			} else if ($('#members_pw').val().length < 1) {
				alert('비밀번호를 확인하세요');
				$('#members_pw').focus();
				event.preventDefault();
				return false;
			} else if ($('#members_pw').val() != $('#members_pw2').val()) {
				alert('비밀번호가 일치하지 않습니다');
				$('#members_pw2').focus();
				event.preventDefault();
				return false;
			} else if ($('#members_name').val().length < 1) {
				alert('이름을 확인하세요');
				$('#members_name').focus();
				event.preventDefault();
				return false;
			} else if ($('#chkId').val() != 'Y') {
				alert('아이디를 확인하세요');
				$("#members_id").focus();
				event.preventDefault();
			} else if ($('#members_email').val().length < 1) {
				alert('이메일을 확인하세요');
				$("#members_email").focus();
				event.preventDefault();
			} else if ($('#members_tel').val().length < 13) {
				alert('전화번호를 확인하세요');
				$("#members_tel").focus();
				event.preventDefault();
			} else if ($('#members_zipcode').val().length < 1) {
				alert('우편번호를 확인하세요');
				$("#members_zipcode").focus();
				event.preventDefault();
			} else if ($('#members_address').val().length < 1) {
				alert('주소를 확인하세요');
				$("#members_address").focus();
				event.preventDefault();
			} else if ($('#members_detail_address').val().length < 1) {
				alert('주소상세를 확인하세요');
				$("#members_detail_address").focus();
				event.preventDefault();
			}
				

		

		});
		
		/*
		// 이미지 업로드 쿼리
		document.getElementById('imageUpload').onchange = function() {
			readImage();
		};

		function readImage() {
			var file = document.getElementById('imageUpload');
			if (file.files && file.files[0]) {
				var reader = new FileReader();

				//이미지 읽기
				reader.readAsDataURL(file.files[0]);

				//이미지 전부 읽어들였으면 호출
				reader.onload = function() {
					var image = document.getElementById('image');
					image.src = reader.result;
					//img 태그 노출
					image.style.display = '';
				};
			}
		}
		*/
		
		
		
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
	<div style="margin-left: 360px;">
		<div>
			회원가입
		</div>
		<div>
			이용약관
			<input type="checkbox" id="chk1">
			<input type="checkbox" id="chk2">
			<input type="checkbox" id="chk3">
		</div>
		
		<form name="frm" action="insertMembers.do" method="post">
			<input type="hidden" name="chkId" id="chkId">
			<input type="text" name="members_tel" id="members_tel">
			<table>
				<tr>
					<td>아이디 :</td>
					<td><input type="text" name="members_id" id="members_id"></td>
					<td><div id="chkId2"></div></td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td><input type="password" name="members_pw" id="members_pw"></td>
				</tr>
				<tr>
					<td>비밀번호확인 :</td>
					<td><input type="password" name="members_pw2" id="members_pw2"></td>
					<td><div id="chkpw2"></div></td>			
				</tr>
				<tr>
					<td>이름 :</td>
					<td><input type="text" name="members_name" id="members_name"></td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td>
						<input type="text" name="members_tel1" id="members_tel1" maxlength="3">-
						<input type="text" name="members_tel2" id="members_tel2" maxlength="4">-
						<input type="text" name="members_tel3" id="members_tel3" maxlength="4">
					</td>
				</tr>
				<tr>
					<td>이메일 :</td>
					<td><input type="text" name="members_email"></td>
				</tr>
				<tr>
					<td>성별 :</td>
					<td>
						<select name="members_gender">
							<option value="남자" selected>남자</option>
						    <option value="여자">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>우편번호 :</td>
					<td><input type="text" id="members_zipcode" name="members_zipcode" onclick="sample4_execDaumPostcode()" placeholder="주소검색" Readonly></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><input type="text" id="members_address" name="members_address"></td>
				</tr>
				<tr>
					<td>주소상세 :</td>
					<td><input type="text" name="members_address_detail"></td>
				</tr>
			</table>
			
			<input type="submit" value="가입하기">
			<input type="button" value="뒤로가기">
		</form>
	</div>
	
</main>
<%@ include file="../import/bottom.jsp" %>