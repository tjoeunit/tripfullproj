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
					<li><a href="<c:url value='/index/termService.do'/>">이용약관</a></li>
					<li><a href="<c:url value='/index/privacyPolicy.do'/>" class="serviceCheck">개인정보 처리방침</a></li>
					<li><a href="<c:url value='/index/cancelRefund.do'/>">취소 및 환불 정책</a></li>
					<li><a href="<c:url value='/qna/getQnaList.do'/>">QNA</a></li>
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
	<div class="main_title">개인정보 처리 방침</div>
	<hr>
	
	<p>
		주식회사 트립풀 (이하 "당사")은 고객의 개인정보를 중요시하며, 개인정보의 보호와 관련하여 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」 등
		관련법 상의 개인정보 보호 규정을 준수하며, 본 개인정보 처리방침을 따릅니다.
		본 개인정보 처리방침은 당사의 개인정보 처리와 관련된 정보를 제공하고 고객이 가진 권리와 그 권리를 행사할 수 있는 방법에 대해 설명하며,
		당사의 서비스 이용 중 개인정보와 관련하여 문의가 있을 경우 연락할 수 있는 개인정보 보호책임자 및 담당자의 연락처를 안내합니다.
	</p>
	
	<h3>1. 개인정보의 제공</h3>
	<p>
		회원의 개인정보를 ‘수집하는 개인정보 및 이용에 관한 안내’에서 고지한 범위 내에서 사용하며, 동 범위를 초과하여 타인에게 제공하지 않습니다.
		다만 양질의 서비스 제공을 위해 상품 예약 및 구매 단계에서 필요한 정보를 회원에게 동의를 구한 후 제3자에게 제공합니다.
	</p>
	
	<h3>2. 개인정보의 위탁</h3>
	<p>
		회사는 서비스의 제공, 서비스의 유지/관리, 이용자 편의 제공 등 원활한 업무 수행을 위하여 다음과 같이 개인정보 처리업무를 외부 전문업체에 위탁 운영하고 있습니다.
	</p>
	
	<h3>3. 개인정보의 보유 및 이용기간, 파기 절차 및 방법</h3>
	<p>
		수집된 개인정보의 보유•이용기간은 서비스 이용계약 체결(회원가입)시부터 서비스 이용계약 해지(탈퇴 신청)시까지 입니다.
		원칙적으로, 회사는 개인정보 수집 및 이용 목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.
	</p>
	<p>
		3.1 파기절차<br>
		이용자의 개인정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 보유 사유에 따라(4.1 참조)
		일정 기간 저장된 후 파기됩니다. 이때, 별도의 DB로 옮겨진 개인정보는 회원이 동의한 목적을 초과하거나 혹은 법률이 정한 경우 외의 다른 목적으로 이용되지 않습니다.
	</p>
	
	<p>
		3.2 파기방법<br>
		종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각 등을 통하여 파기하고, 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법 또는 물리적 방법을 사용하여 파기합니다.
	</p>
	
	<p>
		3.3 개인정보유효기간제 도입<br>
		트립풀을 최종 이용 후 1년 동안 이용 기록이 없는 고객(장기미이용회원)의 개인정보는 별도로 분리하여 안전하게 관리하게 되며,
		대상자에게는 분리 보관 처리일을 기준으로 하여 최소 30일 이전에 이메일 주소를 통해 안내를 합니다.
		분리 보관된 개인정보는 관련 법령에 의한 정보보호 보유 사유에 따라(4.1 참조) 일정 기간 저장된 후 파기됩니다.
		단, 관계 법령에 의해 보존할 필요가 있는 경우, 회사는 아래와 같이 관계 법령에서 정한 일정한 기간 동안 회원 정보를 보관합니다.
	</p>
	
	<h3>4. 고객의 권리와 의무</h3>
	<p>
		4.1 고객의 권리<br>
		고객은 언제든지 수집 정보에 대하여 수정, 동의 철회, 삭제, 열람을 요청할 수 있습니다.
		다만, 동의 철회, 삭제 시 서비스의 일부 또는 전부 이용이 제한될 수 있습니다. 트립풀이 수집한 개인정보는 아래와 같은 방법으로 확인할 수 있습니다.
		트립풀 웹 또는 앱을 통해 직접 확인하지 못하는 정보는 트립풀 고객센터에 요청하여 확인할 수 있습니다.
		개인정보 동의 철회 및 삭제, 처리 정지를 요청하고자 하는 경우에는 트립풀 고객센터를 통해 요청할 수 있습니다.
		또한, 고객은 언제든 회원 탈퇴를 통해 개인정보의 수집 및 이용 동의를 철회할 수 있습니다. 이러한 요청 시, 서비스의 일부 또는 전부 이용이 제한될 수 있습니다.
		또한, 법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우,
		다른 사람의 생명·신체를 해할 우려가 있거나 다른사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우,
		개인정보를 처리하지 아니하면 정보 주체와 약정한 서비스를 제공하지 못하는 등 계약의 이행이 곤란한 경우로서 정보주체가 그 계약의 해지 의사를 명확하게 밝히지 아니한 경우에는
		동의 철회, 삭제, 처리 정지가 어려울 수 있습니다.
		요청하신 처리가 완료될 때까지 해당 정보를 이용하거나 타인에게 제공하지 않습니다.
		또한, 합리적인 사유로 잘못된 개인정보를 제3자에게 이미 제공한 경우, 그 결과를 지체 없이 제3자에게 통지하여 동의 철회, 삭제, 처리 정지하도록 조치합니다.
	</p>
	<p>
		4.2 고객의 의무<br>
		고객은 자신의 개인정보를 보호할 의무가 있으며, 회사의 귀책사유가 없이 ID(이메일 주소), 비밀번호, 접근매체 등의 양도·대여·분실이나 로그인 상태에서 이석 등
		고객 본인의 부주의나 관계법령에 의한 보안조치로 차단할 수 없는 방법이나 기술을 사용한 해킹 등 회사가 상당한 주의에도 불구하고 통제할 수 없는 인터넷상의 문제 등으로
		개인정보가 유출되어 발생한 문제에 대해 회사는 책임을 지지 않습니다. 고객은 자신의 개인정보를 최신의 상태로 유지해야 하며,
		고객의 부정확한 정보 입력으로 발생하는 문제의 책임은 고객 자신에게 있습니다.
		타인의 개인정보를 도용한 회원가입 또는 ID 등을 도용하여 결제 처리 시 고객 자격 상실과 함께 관계법령에 의거하여 처벌될 수 있습니다.
		고객은 아이디, 비밀번호 등에 대해 보안을 유지할 책임이 있으며 제3자에게 이를 양도하거나 대여할 수 없습니다. 고객은 회사의 개인정보보호 정책에 따라 보안을 위한 주기적인 활동에 협조할 의무가 있습니다.
	</p>
	
	<h3>5. 인터넷접속정보 파일 설정 및 맞춤형 광고 안내</h3>
	<p>
		트립풀은 고객 개개인에게 간편하고 효율적인 개인 맞춤화된 서비스를 제공하기 위해서
		서비스 이용과정에서 자동으로 생성하는 정보나 개인식별이 불가능한 기기 정보를 수집하고 저장할 수 있습니다.
		<br>
		쿠키(Cookie)는 사용자의 효율적이고 안전한 웹 사용을 보장하기 위해 웹사이트 접속 시 사용자의 디바이스로 전송 및 저장되는 작은 텍스트 파일입니다.
		쿠키가 저장된 이후 다시 웹사이트를 방문할 경우 쿠키는 웹사이트 사용자의 디바이스를 인식하여 지난 설정과 과거 이용내역을 자동으로 불러옵니다. 
		또한 방문한 서비스 정보, 서비스 접속 시간 및 빈도, 서비스 이용 과정에서 생성된 또는 제공(입력)한 정보 등을 분석하여 고객의 취향과 관심에 특화된 서비스(광고 포함)를 제공할 수 있습니다.
		고객은 쿠키에 대한 선택권을 가지고 있으며, 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나,
		아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 현재 사용하는 브라우저의 쿠키 설정 확인 및 변경은 아래와 같은 방법을 통해 가능합니다.
	</p>
	
	<h3>6. 개인정보보호를 위한 기술적, 관리적 조치</h3>
	<p>
		트립풀에서는 여행자분들의 개인정보를 보호하기 위해 아래와 같은 대책을 시행하고 있습니다. 
		<br>암호화 보관 : 법령에서 암호화를 요구하는 고유식별정보, 비밀번호, 결제정보 외에도 전화번호, 이메일 등도 암호화하여 보관하고 있으며, 암호화된 통신구간을 이용하여 전송하고 있습니다.
		<br>안전한 관리 : 침입차단시스템, 위협 탐지 시스템을 이용하여 해킹이나 바이러스 등으로부터 개인정보의 유출과 훼손을 막기 위해 노력하고 있습니다. 최신 백신 프로그램을 이용하여 이용자들의 개인정보나 자료가 유출되거나 손상되지 않도록 방지하고 있으며, 암호화 통신 등을 통해 네트워크상에서 개인정보를 안전하게 송수신하고 있습니다.
		<br>개인정보취급자 최소화 : 개인정보를 처리하는 직원을 최소한으로 관리하며, 개인정보의 다운로드가 가능한 직원들의 업무용 PC 에 대해 인터넷망과 연결을 차단하여 개인정보 유출 가능성을 줄이고 있습니다. 또한 정기 및 비정기 교육을 실시하여 개인정보보호에 대한 임직원들의 인식 제고를 위해 노력하고 있습니다.
	</p>
	

</main>


<%@ include file="../import/bottom.jsp" %>