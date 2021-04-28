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
<title>Tripfull::서비스센터</title>
</head>

<style>
	.nav {
		background-color: white;
		width: 100%;
		top: 0;
		cursor: default;
		height: 130px;
		border-bottom: 1px solid gray;
		text-align: left;
	}

	.nav ul {
		margin-bottom: 0;
		list-style: none;
		padding-left: 0;
	}

	.nav li {
		display: inline-block;
		padding-left: 0;
	}

	.nav a {
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
		position: relative;
		display: block;
		color: black;
		text-decoration: none;
		outline: 0;
		font-weight: 600;
		border-radius: 8px;
		color: black;
		height: 2.5em;
		line-height: 2.5em;
		padding: 0 1.25em;
	}

	.nav a:hover {
		color: #fff !important;
		background: #383838;
	}

	.nav a.active {
		background: #484848;
	}

	.nav a.active:before {
		content: '';
		display: block;
		position: absolute;
		bottom: -0.6em;
		left: 50%;
		margin-left: -0.75em;
		border-left: solid 0.75em transparent;
		border-right: solid 0.75em transparent;
		border-top: solid 0.6em #282828;
	}
	
	.serviceCheck {
		color: #fff !important;
		background: #383838;
	}

	.navDiv {
		margin-left: 360px;
		width: 1200px;
	}

	.navImgDiv {
		margin-top: 15px;
		height: 70px;
		width: 240px;
		float: left;
	}

	.nav img {
		height: 60px;
	}

	.navAccDiv {
		float:right;
		height: 60px;

		text-align: center;
	}

	.navListDiv {
		clear: both;
	}

	main {
		margin-left: 360px;
		margin-bottom: 20px;
		width: 1200px;
	}

</style>

<script type="text/javascript">
	$(function(){

		//세션에 로그인 된 아이디 값이 없다면
		if($("#sessionID").val() == ""){
			//마이페이지x 로그아웃x 회원가입o 로그인o
			$("#mypage_li").hide();
			$("#logout_li").hide();

		//세션에 로그인 된 아이디 값이 있다면
		} else {
			//마이페이지o 로그아웃o 회원가입x 로그인x
			$("#signin_li").hide();
			$("#login_li").hide();
		}
	});

</script>

<body>
<header>
	<input type="hidden" id="sessionID" value="${members_id}">
	<nav class="nav">
		<div class="navDiv">
			<div class="navImgDiv">
				<a style="all: unset; cursor: pointer;" href="<c:url value='/index.do'/>">
					<img src="<c:url value='/img/tripfulllogo.png'/>">
				</a>
			</div>
			<div class="navAccDiv">
				<ul>
					<li id="signin_li"><a href="<c:url value='/members/insertMembers.do'/>">회원가입</a></li>
					<li id="login_li"><a href="<c:url value='/members/loginMembers.do'/>">로그인</a></li>
					<li id="mypage_li"><a href="<c:url value='/members/indexMembers.do'/>">마이페이지</a></li>
					<li id="logout_li"><a href="<c:url value='/members/logoutMembers.do'/>">로그아웃</a></li>
					<li><a href="<c:url value='/adminLogin/adminLogin_View.do'/>">관리자</a></li>
				</ul>
			</div>

			<div class="navListDiv">
				<ul>
					<li><a href="<c:url value='/index/termService.do'/>" class="serviceCheck">이용약관</a></li>
					<li><a href="<c:url value='/index/privacyPolicy.do'/>">개인정보 처리방침</a></li>
					<li><a href="<c:url value='/index/cancelRefund.do'/>">취소 및 환불 정책</a></li>
					<li><a href="<c:url value='/qna/getQnaList.do'/>">자주 묻는 질문</a></li>
				</ul>
			</div>

		</div>
	</nav>
</header>
<body>

<style type="text/css">
	
	.main_title {
		align-content: left;
		font-size: 40px;
		font-weight: 600;
		margin: 20px 0px;
	}
	
</style>

<main>
	<div class="main_title">이용약관</div>
	<hr>
	
	<h3>제 1 조 (목적)</h3>
	<p>이 약관은 주식회사 트립풀(이하 "당사"이라 합니다)이 운영하는 웹사이트(https://www.myrealtrip.com/) 및 어플리케이션(Application,
	이하 웹사이트와 어플리케이션을 통칭하여 "트립풀 플랫폼")에서 제공하는 서비스(이하 "서비스"라 합니다)를 이용함에 있어 "당사"와 이용자의 권리 및 의무 및 책임사항을
	규정함을 목적으로 합니다.</p>
	
	<h3>제 2 조 (정의)</h3>
	<p>1. "당사"란 서비스를 제공하는 (주)트립풀을 말하며, (주)트립풀이 중개 및 판매하는 재화 또는 용역(이하 "재화 등"이라 합니다)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장인 사이버 몰의 의미로도 사용합니다.
	<br>2. "이용자"란 "당사"에 접속하여 이 약관에 따라 "당사"가 제공하는 서비스를 받는 회원을 말합니다.
	<br>3. "회원"이라 함은 "당사"에 개인정보를 제공하여 회원등록을 한 자로서,"당사"의 정보를 지속적으로 제공받으며,"당사"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
	<br>4. “파트너"라고 함은 당사가 여행자에게 중개한 자로서 여행자에게 각종 여행 서비스를 제공하는 자를 말합니다.
	<br>5. "가이드"라고 함은 파트너 중 트립풀 플랫폼을 통해 직접 여행지에서 여행자에게 투어 서비스를 제공하는 자를 말합니다.
	</p>
	
	<h3>제 3 조 (약관의 명시와 개정)</h3>
	<p>1. "당사"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지, 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 “당사” 웹사이트의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
	<br>2. "당사"는 전자상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용 촉진 등에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
	<br>3. "당사"가 약관을 개정할 경우에는 적용일자 및 개정내용, 개정사유 등을 명시하여 현행 약관과 함께 "당사" 웹사이트의 초기화면이나 초기화면과의 연결화면에 그 적용일자 7 일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30 일 이전의 유예기간을 두고 공지합니다. 이 경우 "당사"는 중요내용에 관하여 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
	<br>4. "당사"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제 3 항에 의한 개정 약관의 공지기간 내에 "당사"에 송신하여 동의를 받은 경우에는 개정일자부터 개정약관 조항이 적용됩니다.
	<br>5. “당사”가 약관을 개정하는 경우 이용자는 개정약관에 동의하지 않을 권리가 있습니다. 이용자가 개정약관에 동의하지 않을 경우에는 서비스 이용을 중단하고 “당사”에 탈퇴를 요청할 수 있습니다. 다만 이용자가 제3항의 방법 등으로 고지한 개정약관의 개정 유예기간 내에 “당사”의 개정약관에 동의하지 않겠다는 명시적인 의사표시를 하지 않는 경우 개정 약관에 동의한 것으로 간주합니다.
	<br>6. 이 약관은 “당사”와 이용자간에 성립되는 서비스 이용 관련 기본약정입니다. “당사”는 필요한 경우 특정 서비스에 관하여 적용될 사항(이하 "개별약관"이라고 합니다)을 정하여 미리 공지할 수 있으며, 이러한 개별약관에 동의하고 특정 서비스를 이용하는 경우에는 개별약관이 우선적으로 적용되고, 이 약관은 보충적인 효력을 갖습니다. 개별약관의 변경에 관해서는 위 제 3 항 및 제 4 항을 준용합니다.
	<br>7. 이용자가 가입시 동의한 약관에 관하여 열람을 요구할 경우, “당사”는 이용자가 가입시 기재한 전자우편 주소로 링크형태로 전송합니다.
	<br>8. "당사"는 제공하는 서비스의 구체적 내용에 따라 개별 서비스에 대한 약관 및 이용조건을 각 개별 서비스마다 별도로 정하여 회원의 동의를 얻을 수 있습니다. 이 경우 개별 서비스에 대한 이용약관 등이 본 약관에 우선합니다.
	<br>9. 이 약관과 개별약관에도 정하지 아니한 사항과 “당사" 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 정부가 제정한 전자 상거래 등에서의 소비자보호 지침 등 관계법령, 정부기관의 해석 또는 상관례에 따릅니다.
	</p>
	
	<h3>제 4 조 (서비스의 제공 및 변경)</h3>
	<p>1. "당사"는 다음과 같은 업무를 수행합니다.
	<br>(1) "당사”가 직접 판매하는 재화 등에 대한 정보 제공, 및 재화 등의 판매계약 체결
	<br>(2) 가이드와의 여행계약 체결 중개를 포함한 재화 등의 판매계약의 중개
	<br>(3) 기타 "당사"가 정하는 업무 등
	<br>
	<br>2. 중개 서비스의 경우 “당사”는 가이드 및 판매자와 이용자 간의 거래의 신뢰도 및 안정성을 증진시키는 도구(플랫폼)만을 제공하며, 가이드 및 판매자와 이용자 간에 성립된 거래에 관련된 책임은 거래의 당사들 스스로가 부담하여야 합니다.
	<br>3. "당사"는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
	<br>4. "당사"가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
	<br>5. "당사”는 필요하다고 판단하는 경우 서비스의 일부를 제휴업체 등 제3자에 위탁할 수 있습니다.
	</p>
	
	<h3>제 5 조 (서비스의 중단)</h3>
	<p>1. "당사"는 컴퓨터 등 정보통신설비의 보수 점검, 교체 및 고장, 통신의 두절, 서비스 이용의 폭주 및 국가비상사태, 정전, 천재지변 등의 불가항력적인 사유가 있는 경우 등, 정상적인 서비스 이용에 지장이 있는 경우 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
	<br>2. 사업종목의 전환, 사업의 포기, 업체간 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "당사”는 제 8 조에 정한 방법으로 이용자에게 통지합니다.
	</p>
	
	<h3>제 6 조 (회원가입)</h3>
	<p>1. 이용자는 "당사"가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로써 회원가입을 신청합니다.
	<br>2. "당사"는 제 1 항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
	<br>(1) 가입신청자가 이 약관 제 7 조 제 3 항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제 7 조 제 3 항에 의한 회원자격 상실 후 3 년이 경과한 자로서 "당사"의 회원 재가입 승낙을 얻은 경우에는 예외로 합니다.
	<br>(2) 등록 내용에 허위, 기재누락, 오기가 있는 경우
	<br>(3) 기타 회원으로 등록하는 것이 "당사"의 기술상 현저히 지장이 있다고 판단되는 경우
	<br>
	<br>3. 회원가입의 성립시기는 "당사"의 승낙이 회원에게 도달한 시점으로 합니다.
	<br>4. 회원은 제 1 항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 및 기타 방법으로 “당사”에 그 변경사항을 알려야 합니다.
	</p>
</main>

<%@ include file="../import/bottom.jsp" %>