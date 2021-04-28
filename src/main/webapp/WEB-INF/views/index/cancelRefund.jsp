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
					<li><a href="<c:url value='/index/privacyPolicy.do'/>">개인정보 처리방침</a></li>
					<li><a href="<c:url value='/index/cancelRefund.do'/>" class="serviceCheck">취소 및 환불 정책</a></li>
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
	<div class="main_title">취소 및 환불 정책</div>
	<hr>
	
	<p>- 취소요청 접수기준은 당사의 운영시간 내 ‘환불요청서’가 접수된 시간 또는 마이리얼트립 플랫폼 내의 ‘1:1 문의하기’에 기록된 시간 혹은 ‘취소요청’이 접수된 시간을 기준으로 합니다.
	<br>- 예약 확정 후 파트너가 일정을 변경하여 드릴 수 없어서 발생하는 예약 취소에 관하여는 본 취소환불 정책에 따른 수수료가 부과됩니다.
	<br>- 여행 일정 변경과 관련한 사항은 파트너에게 직접 문의하여야 합니다. 변경요청하시는 내용에 따라서 요금이 추가되거나 일정 변경이 불가할 수 있습니다.
	<br>- 여행자가 여행 확정 후 24시간 이내에 예약 취소를 요청하더라도, 여행일이 24시간 이내인 경우 전액환불 대상에서 제외됩니다.
	<br>- 각 상품의 설명 내용에서 취소환불 정책이 별도 규정 있을 경우, 각 상품의 별도 기재 내용이 본 취소환불 정책보다 우선 적용됩니다.
	</p>
	
	<h3>가이드투어 취소/환불 안내</h3>
	<p>파트너약관 제16조 제2항과 같이 여행요금 지급이 이루어진 후 투어 개시일 이전에 여행계약을 임의로 해제되는 경우, 해제 통보 시점에 관한 다음 각 호의 기준에 따라 여행요금이 환불됩니다.
	<br>[국외여행의 경우]
	<br>- 여행시작 30일전까지 (~30) 통보시: 여행 요금 전액 환불
	<br>- 여행시작 20일 전까지 (29~20) 통보시: 여행요금에서 가이드 요금의 10%와 마이리얼트립 수수료 공제 후 환불
	<br>- 여행시작 6일 전까지 (19~6) 통보시: 여행요금에서 가이드 요금의 15%와 마이리얼트립 수수료 공제 후 환불
	<br>- 여행시작 1 일 전까지 (1~5) 통보시: 여행요금에서 가이드 요금의 20%와 마이리얼트립 수수료 공제 후 환불
	<br>- 여행시작 시간 기준 24시간 이내 통보시: 여행요금에서 가이드 요금의 50%와 마이리얼트립 수수료 공제 후 환불
	<br>
	<br>[국내여행의 경우]
	<br>- 여행자가 여행 개시일로부터 3일 이전 통보 시: 여행 요금 전액 환불
	<br>- 여행 개시일로부터 2일 이전 통보 시: 여행요금에서 가이드 요금의 10%와 마이리얼트립 수수료 공제 후 환불
	<br>- 여행 개시일로부터 여행 시작 시간 기준 24시간 이전 통보 시: 여행요금에서 가이드 요금의 20%와 마이리얼트립 수수료 공제 후 환불
	<br>- 여행 시작 시간으로부터 24시간 이내 통보 시: 여행요금에서 가이드 요금의 30%와 마이리얼트립 수수료 공제 후 환불
	<br>
	<br>다만, 위의 규정에도 불구하고 다음의 경우에는 예외로 합니다.
	<br>1) 여행자가 여행요금을 결제(지급)한 때로부터 24시간 이내에 여행계약을 철회(취소)하는 경우와 여행자가 투어 예약 후 가이드가 확정되기 전에 취소하는 경우는 여행요금을 전액 환불합니다.  단, 여행자가 여행요금을 결제하였다고 하더라도 해당 시점으로부터 24시간 이내 여행이 시작될 경우 (Instant Booking 예약에 해당하는 경우)는 전액 환불 대상에서 제외합니다.
	<br>2) 상품의 특성에 따라 현지 예약금으로 지불되어야 하는 금액이 있는 경우 해당 예약금의 환불에 대하여는 각 상품의 상세설명보기에서 별도로 고지한 취소환불 약관을 적용합니다.
	</p>
	
	<h3>티켓 취소/환불 안내</h3>
	<p>아래 내용이 적용되는 대상은 마이리얼트립의 플랫폼(웹사이트와 어플리케이션 포함)을 통하여 당사가 판매대행 또는 구매 대행하여 여행자에게 배송하는 실물티켓과 여행자로 하여금 출력할 수 있도록 제공한 E-바우처에 한합니다.
	<br>[실물티켓]
	<br>1. 환불신청가능기간
	<br>결제일 이후 7일 이내 환불 신청한 경우에 한하여 환불이 가능합니다.(티켓 유효기간의 1개월 이전에 환불을 신청한 경우에 한하여 환불이 가능합니다.)
	<br>
	<br>2. 환불진행시 유의사항
	<br>여행자가 반품한 실물티켓을 당사가 수령하여 확인한 후 환불 처리됩니다.
	<br>실물티켓 구매 시 동봉되었던 티켓 사용 가이드북, 현지 사용 쿠폰 및 사은품도 함께 반품되어야 정상 환불 처리됩니다.
	<br>환불요청 접수 후 5일 이내에 당사에 실물티켓이 수령 확인되는 경우에 한해 정상 환불 처리됩니다.
	<br>개인 과실로 인하여 실물티켓이 멸실되거나 훼손된 경우에는 환불이 불가하오니, 각별히 유의하여 주시기 바랍니다.
	<br>
	<br>3. 환불수수료
	<br>취소수수료(결제금액의 10%) 및 배송비가 환불수수료로 차감됩니다.
	<br>티켓제공업체에서 자체 규정하는 별도의 환불규정이 있는 경우 제공업체의 환불규정이 당사의 환불규정에 우선하여 적용됩니다. (상품상세페이지 기재)
	</p>
	
	<h3>[E-바우쳐]</h3>
	<p>티켓제공업체에서 자체 규정하는 별도의 환불규정에 따라 취소/환불이 진행됩니다. (상품상세페이지 기재)
	<br>티켓제공업체의 정책에 따라 환불이 원칙적으로 불가할 수 있으니, 신중히 구매하여 주시기를 당부 드립니다.
	<br>
	<br>특가여행/민박 상품 군 취소/환불 안내
	<br>당사 또는 여행자는 여행 출발 전 이 여행계약을 해제할 수 있습니다. 이 경우 발생하는 손해액은 ‘소비자분쟁해결기준’(공정거래위원회 고시)에 따라 배상합니다.
	<br>여행자의 여행계약 해제 요청이 있는 경우(여행자의 취소 요청 시)
	<br>- 여행출발일 ~30일전까지 취소 통보 시 - 계약금 환급
	<br>- 여행출발일 29~20일전까지 취소 통보 시 - 여행요금의 10% 배상
	<br>- 여행출발일 19~10일전까지 취소 통보 시 - 여행요금의 15% 배상
	<br>- 여행출발일 9~8일전까지 취소 통보 시 - 여행요금의 20% 배상
	<br>- 여행출발일 7~1일전까지 취소 통보 시 - 여행요금의 30% 배상
	<br>- 여행출발 당일 취소 통보 시 - 여행요금의 50% 배상
	<br>다만, 한인 민박의 경우 상품페이지에 별도 환불 규정이 있으면 해당 규정이 당사의 환불 규정보다 우선하여 적용됩니다.
	<br>상품의 특성이나 상품 제공업체의 환불규정이 당사의 취소환불 규정에 우선한 결과 위 ‘소비자분쟁해결기준’과는 다르게 배상되는 경우, 당사는 이에 관하여 일체의 책임을 지지 않습니다.
	</p>
	
	<h3>실시간 항공권 변경, 취소/환불 안내</h3>
	<p>여행자가 항공권을 구매한 뒤 변경 또는 취소하는 경우 해당 항공사의 변경, 취소/환불 규정이 적용됩니다. 또한 당사의 규정에 따른 취급 수수료가 별도로 부과됩니다.</p>
</main>

<%@ include file="../import/bottom.jsp" %>