<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% String members_id = (String)session.getAttribute("members_id"); %>
<% int members_no = (Integer)session.getAttribute("members_no"); %>
<!DOCTYPE html>
<html>
<head>
<!-- 파비콘 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon16.ico'/>">

<!-- 제이쿼리 -->
<script type="text/javascript" src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>

<meta charset="UTF-8">
<title>Tripfull::회원가입</title>
</head>

<script type="text/javascript">
	$(function() {
		$("#checkbox1").change(function(){
			if($("#checkbox1").is(":checked")){
				$("#checkyn1").val('yes');
			} else {
				$("#checkyn1").val('no');
			}
		});
		
		$("#checkbox2").change(function(){
			if($("#checkbox2").is(":checked")){
				$("#checkyn2").val('yes');
			} else {
				$("#checkyn2").val('no');
			}
		});
		
		//전화번호 숫자 정규식!
		var numReg = /^[0-9]+$/;		

		$('#members_tel2').keyup(function(){
			$('#members_tel').val($('#members_tel1').val()+"-"+$('#members_tel2').val()+"-"+$('#members_tel3').val());
			
			if(!numReg.test($('#members_tel2').val())){
				$('#chkTel').html("전화번호는 숫자만 입력하세요").css('color', 'red');
			} else {
				$('#chkTel').html("");
			}			
		});
		
		$('#members_tel3').keyup(function(){
			$('#members_tel').val($('#members_tel1').val()+"-"+$('#members_tel2').val()+"-"+$('#members_tel3').val());
			
			if(!numReg.test($('#members_tel3').val())){
				$('#chkTel').html("전화번호는 숫자만 입력하세요").css('color', 'red');
			} else {
				$('#chkTel').html("");
			}
		});
		
		//전화번호 인증
		$('#sendTelNumBtn').click(function(){
			var phoneNumber = $('#members_tel').val();
			phoneNumber = phoneNumber.replace(/\-/g,''); //변경작업
			
			if(!numReg.test(phoneNumber) || phoneNumber.length != 11){
				alert('전화번호를 확인하세요');
				$('#members_tel2').focus();
				
			}else{
				alert(phoneNumber + ' 인증번호를 전송합니다');
			
				$.ajax({
					url : "<c:url value='/members/sendSMS.do' />",
					type : "get",
					data : "phoneNumber=" + phoneNumber,
					dataType : "json",
					success : function(data) {
						$('#certNumBtn').click(function(){
							if (data == $('#certNum').val()) {
								alert('휴대폰 인증 성공');
								$('#certFlag').val('Y');
							} else {
								alert('휴대폰 인증 실패');
								$('#members_tel2').val('');
								$('#members_tel3').val('');							
							}
						});
					},
					error : function(xhr, status, error) {
						alert(status + ", " + error);
					}
				}); //ajax
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
		
		$('#members_pw').keyup(function(){
			if ($('#members_pw').val().length < 8) {
				$('#chkpw1').html("비밀번호는 8자 이상 입력하세요").css('color', 'red');
			} else {
				$('#chkpw1').html("사용 가능한 비밀번호입니다").css('color', 'green');
			}
		});
		
		$('#members_pw2').keyup(function() {
			if ($('#members_pw').val() != $('#members_pw2').val()) {
				$('#chkpw2').html("비밀번호가 일치하지 않습니다").css('color', 'red');
			} else {
				$('#chkpw2').html("비밀번호가 일치합니다").css('color', 'green');
			}
		});
		
		//아이디 정규식
		var idReg = /^[a-z]+[0-9a-z]{5,10}$/;
		
		$('#members_id').keyup(function() {
			if (!idReg.test($("#members_id").val())) {
				$('#chkId2').html("아이디는 영문자로 시작하는 6~15자 영문자 또는 숫자이어야 합니다").css('color', 'red')
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
			if ($('#members_id').val().length < 6) {
				alert('아이디를 확인하세요');
				$('#members_id').focus();
				event.preventDefault();
				return false;
				
			} else if ($('#members_pw').val().length < 8) {
				alert('비밀번호를 확인하세요 (8자 이상)');
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
										
			} else if ($('#members_tel2').val().length < 4) {
				alert('전화번호를 확인하세요');
				$('#members_tel2').focus();
				event.preventDefault();
				return false;
				
			} else if ($('#members_tel3').val().length < 4) {
				alert('전화번호를 확인하세요');
				$('#members_tel3').focus();
				event.preventDefault();
				return false;
			
			} else if (!numReg.test($("#members_tel2").val())) {
				alert('전화번호를 확인하세요');
				$('#members_tel2').focus();
				event.preventDefault();
				return false;
			
			} else if (!numReg.test($("#members_tel3").val())) {
				alert('전화번호를 확인하세요');
				$('#members_tel3').focus();
				event.preventDefault();
				return false;		
			
			} else if ($('#certFlag').val() != 'Y') {
				alert('휴대폰 인증을 확인하세요');
				$('#members_tel2').focus();
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
			
			} else if ($('#checkyn1').val().length < 3) {
				alert('이용약관 동의가 필요합니다');
				$('#checkbox1').focus();
				event.preventDefault();
				return false;
				
			} else if ($('#checkyn2').val().length < 3) {
				alert('개인정보보호 수집 및 이용 동의가 필요합니다');
				$('#checkbox2').focus();
				event.preventDefault();
				return false;
				
			} else if ($('#chkId').val() != 'Y') {
				alert('아이디를 확인하세요');
				$('#members_id').focus();
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


<style type="text/css">
	body {
		background-color: #F2F2F2;
		
	}
	
	.logo_box {
		width: 460px;
		margin: 0px auto;
		text-align: center;
	}
	
	.logo {
		margin: 80px auto 30px auto;
		height: 70px;
		width: 240px;
	}
	
	.join_box {
		width: 460px;
		margin: 0px auto;
	}
	
	.check_agree {
		margin: 10px 0px;
		text-align: left;
	}
	
	.policy {
		position: relative;
	    overflow: auto;
	    height: 88px;
	    margin-top: 8px;
	    margin-bottom: 20px;
	    padding: 12px;
	    border: 1px solid #dadada;
	    background: #fff;
	    box-sizing: border-box;
	}
	
	.join_info {
		text-align: left;
		margin: 5px 0px;
	}
	
	.input_st {
		width: 100%;
	    height: 51px;
	    border: solid 1px #dadada;
	    padding: 10px;
	    background: #fff;
	    box-sizing: border-box;
	    vertical-align: top;
	    margin-bottom: 10px;
	}
	
	.join_warning {
		font-size: 14px;
    	text-align: left;
    	margin-bottom: 10px;
	}
	
	.input_tel {
		width: 148px;
	    height: 51px;
	    border: solid 1px #dadada;
	    padding: 10px;
	    background: #fff;
	    box-sizing: border-box;
	    vertical-align: top;
	    margin-bottom: 10px;
	}
	
	.btn_button {
		width: 100%;
	    height: 51px;
	    border: none;
	    padding: 10px;
	    background-color: #58CCFF;
	    box-sizing: border-box;
	    vertical-align: top;
	    margin: 10px 0px;
	    color: white;
	    font-size: 17px;
	}
	
	.btn_button:hover {
		color: #fff !important;
		background: #383838;
		cursor: pointer;
	}
	
	.descDiv {
		margin-top: 20px;
		color: gray;
		font-size: 13px;
		text-align: center;
	}
	
</style>

<body>
	<div class="logo_box">
		<a style="all: unset; cursor: pointer;" href="<c:url value='/index.do'/>">
			<img class="logo" src="<c:url value='/img/tripfulllogo.png'/>">
		</a>
	</div>
	
	<div class="join_box">
		<form name="frm" action="<c:url value='/members/insertMembers.do'/>" method="post">
			<div class="check_agree">
				<input type="checkbox" id="checkbox1" name="checkbox1"> 이용약관에 동의합니다
			</div>
			<div name="policy" class="policy">
				제1조(목적)
				이 약관은 트립풀(전자거래 사업자)이 운영하는 홈페이지(이하 "쇼핑몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 트립풀와 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
				※ 「PC통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」
				
				제2조(정의)
				① "쇼핑몰" 이란 사업자가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 쇼핑몰을 운영하는 사업자의 의미로도 사용합니다.
				② "이용자"란 "쇼핑몰"에 접속하여 이 약관에 따라 "쇼핑몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
				③ "회원"이라 함은 "쇼핑몰"에 개인정보를 제공하여 회원등록을 한 자로서, "쇼핑몰"의 정보를 지속적으로 제공받으며, "쇼핑몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
				④ "비회원"이라 함은 회원에 가입하지 않고 "쇼핑몰"이 제공하는 서비스를 이용하는 자를 말합니다.
				
				제3조 (약관의 명시와 개정)
				① "쇼핑몰"은 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 사이트의 초기 서비스화면(전면)에 게시합니다.
				② "쇼핑몰"은 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률, 방문판매 등에 관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
				③ "쇼핑몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 홈페이지의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
				④ "쇼핑몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "쇼핑몰"에 송신하여 "쇼핑몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
				⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
				
				제4조(서비스의 제공 및 변경)
				① "쇼핑몰"은 다음과 같은 업무를 수행합니다.
				1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
				2. 구매계약이 체결된 재화 또는 용역의 배송
				3. 기타 "쇼핑몰"이 정하는 업무
				② "쇼핑몰"은 재화의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화·용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화·용역의 내용 및 제공일자를 명시하여 현재의 재화·용역의 내용을 게시한 곳에 그 제공일자 이전 7일부터 공지합니다.
				③ "쇼핑몰"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 "쇼핑몰"은 이로 인하여 이용자가 입은 손해를 배상합니다. 단, "쇼핑몰"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
				
				제5조(서비스의 중단)
				① "쇼핑몰"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
				② 제1항에 의한 서비스 중단의 경우에는 "쇼핑몰"은 제8조에 정한 방법으로 이용자에게 통지합니다.
				③ "쇼핑몰"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단 "쇼핑몰"에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
				
				제6조(회원가입)
				① 이용자는 "쇼핑몰"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
				② "쇼핑몰"은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
				1. 가입신청자가 이 약관 제7조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "쇼핑몰"의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
				2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
				3. 기타 회원으로 등록하는 것이 "쇼핑몰"의 기술상 현저히 지장이 있다고 판단되는 경우
				③ 회원가입계약의 성립 시기는 "쇼핑몰"의 승낙이 회원에게 도달한 시점으로 합니다.
				④ 회원은 제15조 제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "쇼핑몰"에 대하여 그 변경사항을 알려야 합니다.
				
				제7조(회원 탈퇴 및 자격 상실 등)
				① 회원은 "쇼핑몰"에 언제든지 탈퇴를 요청할 수 있으며 "쇼핑몰"은 즉시 회원탈퇴를 처리합니다.
				② 회원이 다음 각 호의 사유에 해당하는 경우, "쇼핑몰"은 회원자격을 제한 및 정지시킬 수 있습니다.
				1. 가입 신청 시에 허위 내용을 등록한 경우
				2. "쇼핑몰"을 이용하여 구입한 재화·용역 등의 대금, 기타 "쇼핑몰" 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
				3. 다른 사람의 "쇼핑몰" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우
				4. "쇼핑몰"을 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
				③ "쇼핑몰"이 회원 자격을 제한·정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 "쇼핑몰"은 회원자격을 상실시킬 수 있습니다.
				④ "쇼핑몰"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.
				
				제8조(회원에 대한 통지)
				① "쇼핑몰"이 회원에 대한 통지를 하는 경우, 회원이 "쇼핑몰"에 제출한 전자우편 주소로 할 수 있습니다.
				② "쇼핑몰"은 불특정다수 회원에 대한 통지의 경우 1주일이상 "쇼핑몰" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다.
				
				제9조(구매신청)
				"쇼핑몰" 이용자는 "쇼핑몰"상에서 이하의 방법에 의하여 구매를 신청합니다.
				1. 성명, 비밀번호, 전화번호, 핸드폰번호, 주소, E-MAIL 입력
				2. 재화 또는 용역의 선택
				3. 결제방법의 선택
				4. 이 약관에 동의한다는 표시(예, 마우스 클릭)
				
				제10조 (계약의 성립)
				① "쇼핑몰"은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하지 않는 한 승낙합니다.
				1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
				2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
				3. 기타 구매신청에 승낙하는 것이 "쇼핑몰" 기술상 현저히 지장이 있다고 판단하는 경우
				② "쇼핑몰"의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
				
				제11조(지급방법)
				"쇼핑몰"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 하나로 할 수 있습니다.
				1. 계좌이체
				2. 신용카드결제
				3. 온라인무통장입금
				4. 전자화폐에 의한 결제
				5. 수령 시 대금지급 등
				
				제12조(수신확인통지·구매신청 변경 및 취소)
				① "쇼핑몰"은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
				② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있습니다.
				③ "쇼핑몰"은 배송 전 이용자의 구매신청 변경 및 취소 요청이 있는 때에는 지체 없이 그 요청에 따라 처리합니다.
				
				제13조(배송)
				"쇼핑몰"은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "쇼핑몰"의 고의·과실로 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상합니다.
				
				제14조(환급, 반품 및 교환)
				① "쇼핑몰"은 이용자가 구매 신청한 재화 또는 용역이 품절 등의 사유로 재화의 인도 또는 용역의 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고, 사전에 재화 또는 용역의 대금을 받은 경우에는 대금을 받은 날부터 3일 이내에, 그렇지 않은 경우에는 그 사유발생일로부터 3일 이내에 계약해제 및 환급절차를 취합니다.
				② 다음 각 호의 경우에는 "쇼핑몰"은 배송된 재화일지라도 재화를 반품 받은 다음 영업일 이내에 이용자의 요구에 따라 즉시 환급, 반품 및 교환 조치를 합니다. 다만 그 요구기한은 배송된 날로부터 20일 이내로 합니다.
				1. 배송된 재화가 주문내용과 상이하거나 "쇼핑몰"이 제공한 정보와 상이할 경우
				2. 배송된 재화가 파손, 손상되었거나 오염되었을 경우
				3. 재화가 광고에 표시된 배송기간보다 늦게 배송된 경우
				4. 방문판매 등에 관한 법률 제18조에 의하여 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 이용자의 청약이 이루어진 경우
				
				제15조(개인정보보호)
				① "쇼핑몰"은 이용자의 정보 수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다.
				다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.
				1. 희망ID(회원의 경우)
				2. 비밀번호(회원의 경우)
				3. 이름
				4. 별명
				5. E-MAIL
				6. 주소
				7. 전화번호
				8. 휴대번호
				9. 메일링서비스
				10. SMS 수신여부
				② "쇼핑몰"이 이용자의 개인 식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
				③ 제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 "쇼핑몰"이 집니다. 다만, 다음의 경우에는 예외로 합니다.
				1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우
				2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
				④ "쇼핑몰"이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공 받는자, 제공목적 및 제공할 정보의 내용)등 정보통신망이용촉진 등에 관한 법률 제16조 제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
				⑤ 이용자는 언제든지 "쇼핑몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "쇼핑몰"은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "쇼핑몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
				⑥ "쇼핑몰"은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
				⑦ "쇼핑몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
				
				제16조("쇼핑몰"의 의무)
				① "쇼핑몰"은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는 데 최선을 다하여야 합니다.
				② "쇼핑몰"은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
				③ "쇼핑몰"이 상품이나 용역에 대하여 「표시·광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
				④ "쇼핑몰"은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
				
				제17조( 회원의 ID 및 비밀번호에 대한 의무)
				① 제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.
				② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안 됩니다.
				③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "쇼핑몰"에 통보하고 "쇼핑몰"의 안내가 있는 경우에는 그에 따라야 합니다.
				
				제18조(이용자의 의무)
				이용자는 다음 행위를 하여서는 안 됩니다.
				1. 신청 또는 변경 시 허위내용의 등록
				2. "쇼핑몰"에 게시된 정보의 변경
				3. "쇼핑몰"이 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시
				4. "쇼핑몰" 기타 제3자의 저작권 등 지적재산권에 대한 침해
				5. "쇼핑몰" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
				6. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 홈페이지에 공개 또는 게시하는 행위
				
				제19조(연결"쇼핑몰"과 피연결"쇼핑몰" 간의 관계)
				① 상위 "쇼핑몰"과 하위 "쇼핑몰"이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 "쇼핑몰"(웹 사이트)이라고 하고 후자를 피연결 "쇼핑몰"(웹사이트)이라고 합니다.
				② 연결 "쇼핑몰"은 피연결 "쇼핑몰"이 독자적으로 제공하는 재화·용역에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결 "쇼핑몰"의 사이트에서 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.
				
				제20조(저작권의 귀속 및 이용제한)
				① "쇼핑몰"이 작성한 저작물에 대한 저작권 기타 지적재산권은 "쇼핑몰"에 귀속합니다.
				② 이용자는 "쇼핑몰"을 이용함으로써 얻은 정보를 "쇼핑몰"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안 됩니다.
				
				제21조(분쟁해결)
				① "쇼핑몰"은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.
				② "쇼핑몰"은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
				③ "쇼핑몰"과 이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.
				
				제22조(재판권 및 준거법)
				① "쇼핑몰"과 이용자간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다.
				② "쇼핑몰"과 이용자간에 제기된 전자거래 소송에는 한국법을 적용합니다.
			</div>

			<div class="check_agree">
				<input type="checkbox" id="checkbox2" name="checkbox2"> 개인정보 수집 및 이용에 동의합니다
			</div>
			<div name="personalInfo" class="policy">
				정보통신망법 규정에 따라 트립풀에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
				
				1. 수집하는 개인정보
				이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 트립풀 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 트립풀는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
				
				회원가입 시점에 트립풀가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
				- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
				- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 가입인증 휴대폰번호를 필수항목으로 수집합니다. 그리고 단체 대표자명, 비밀번호 발급용 멤버 이름 및 이메일주소를 선택항목으로 수집합니다.
				서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
				트립풀 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
				
				서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다.
				구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 
				2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다.
				트립풀 위치기반서비스 이용 시 수집·저장되는 위치정보의 이용 등에 대한 자세한 사항은 ‘트립풀 위치정보 이용약관’에서 규정하고 있습니다.
				
				2. 수집한 개인정보의 이용
				트립풀 및 트립풀 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
				- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
				- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
				- 법령 및 트립풀 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
				- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
				- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
				- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
				- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
				
				3. 개인정보의 파기
				회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
				단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
				
				이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우는 아래와 같습니다.
				부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.
				결제도용, 불법할인대출(일명 '카드깡') 등 관련 법령 및 이용약관을 위반하는 트립풀페이의 부정거래기록(아이디, 이름, 휴대폰번호, 배송지 주소, IP주소, 쿠키, 기기정보)은 부정거래 방지 및 다른 선량한 이용자의 보호, 안전한 거래 환경 보장을 위하여 수집 시점으로부터 3년간 보관하고 파기합니다.
				부정이용으로 징계를 받기 전에 회원 가입 및 탈퇴를 반복하며 서비스를 부정 이용하는 사례를 막기 위해 탈퇴한 이용자의 휴대전화번호를 복호화가 불가능한 일방향 암호화(해시 처리)하여 6개월간 보관합니다.
				
				전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 트립풀는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
				- 전자상거래 등에서 소비자 보호에 관한 법률 
				계약 또는 청약철회 등에 관한 기록: 5년 보관 
				대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 
				소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
				- 전자금융거래법 
				전자금융에 관한 기록: 5년 보관
				- 통신비밀보호법
				로그인 기록: 3개월
			</div>
		
			<input type="hidden" name="chkId" id="chkId">
			<input type="hidden" name="members_tel" id="members_tel">
			<input type="hidden" id="checkyn1" name="checkyn1" value="no">
			<input type="hidden" id="checkyn2" name="checkyn2" value="no">
			<input type="hidden" id="certFlag" value="N">
			
			<div class="join_info">아이디</div>
			<div>
				<input type="text" name="members_id" id="members_id" class="input_st">
			</div>
			<div id="chkId2" class="join_warning"></div>
			
			<div class="join_info">비밀번호</div>
			<div>
				<input type="password" name="members_pw" id="members_pw" class="input_st">
			</div>
			<div id="chkpw1" class="join_warning"></div>
			
			<div class="join_info">비밀번호 확인</div>
			<div>
				<input type="password" name="members_pw2" id="members_pw2" class="input_st">
			</div>
			<div id="chkpw2" class="join_warning"></div>
			
			<div class="join_info">이름</div>
			<div>
				<input type="text" name="members_name" id="members_name" class="input_st">
			</div>
			<div id="chkName" class="join_warning"></div>
			
			<div class="join_info">성별</div>
			<div>
				<select name="members_gender" id="members_gender" class="input_st">
					<option value="남자" selected>남자</option>
				    <option value="여자">여자</option>
				</select>
			</div>
			
			<div class="join_info">휴대전화</div>
			<div>
				<input type="text" name="members_tel1" id="members_tel1" class="input_tel" maxlength="3" value="010" readonly>
				<input type="text" name="members_tel2" id="members_tel2" class="input_tel" maxlength="4">
				<input type="text" name="members_tel3" id="members_tel3" class="input_tel" maxlength="4">
			</div>
			<div id="chkTel" class="join_warning"></div>
			
			<!-- 전화번호 보내기 버튼 -->			 
			<div>
				<input type="button" id="sendTelNumBtn" value="인증하기">
			</div>			
			<!-- 인증번호 입력 공간 -->
			<div>
				<input type="text" id="certNum">
			</div>
			<!-- 인증하기 버튼  -->
			<div>
				<input type="button" id="certNumBtn" value="인증완료">
			</div>
			
			<div class="join_info">이메일</div>
			<div>
				<input type="text" name="members_email" id="members_email" class="input_st">
			</div>
			<div id="chkEmail" class="join_warning"></div>
			
			<div class="join_info">우편번호</div>
			<div>
				<input type="text" id="members_zipcode" name="members_zipcode" class="input_st" onclick="sample4_execDaumPostcode()" placeholder="주소검색" Readonly>
			</div>
			
			<div class="join_info">주소</div>
			<div>
				<input type="text" id="members_address" name="members_address" class="input_st">
			</div>
			
			<div class="join_info">상세주소</div>
			<div>
				<input type="text" id="members_address_detail" name="members_address_detail" class="input_st">
			</div>
			
			<div><input type="submit" value="가입하기" class="btn_button"></div>
			<div><input type="button" value="뒤로가기" class="btn_button" onclick="history.back()"></div>
					
		</form>
	</div>
	
<footer>

	<div class="descDiv">
	<hr>		
	상호명 (주)트립풀 | 대표 이종로 | 개인정보보호책임자 정종로 | 사업자등록번호 000-00-00000 사업자정보확인 | 통신판매업신고번호 0000-종로종로-0000<br>
	주소 서울특별시 종로구 종로대로 000, 종로종로타워 18층(종로동) | 이메일 tripfull@tripfull.com | 마케팅/제휴 문의 tripfull@tripfull.com<br>
	자사는 서울특별시종로협회 종로영업종로보험에 가입되어 있습니다. 트립풀은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 상품·거래정보 및 거래에 대하여 책임을 지지않습니다.<br>
	</div>
</footer>
</body>

</html>