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
	
	a {
		text-decoration: none;
		color: black;
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
					<li><a href="<c:url value='/index/cancelRefund.do'/>">취소 및 환불 정책</a></li>
					<li><a href="<c:url value='/qna/getQnaList.do'/>"class="serviceCheck">QNA</a></li>
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
	
	.page_select_box {
		text-align: right;
	}
	
	.page_select {
		padding: 5px;
		border: 1px solid gray;
		margin-right: 20px;
	}
	
	.table_list {
		margin: 20px 0px;
		width: 100%;
		border-top: 3px solid black;
		border-collapse: collapse;
	}
	
	th {
		border-bottom: 3px solid black;
		padding: 10px 0px;
	}
	
	td {
		text-align: center;
		border-bottom: 1px solid gray;
		padding: 10px 0px;
		color: gray;
	}
	
	.table_top {
		padding: 5px;
	}
	
	.table_th1 {
		width: 10%;
	}
	
	.table_th2 {
		width: 70%;
	}
	
	.table_th3 {
		width: 10%;
	}
	
	.table_th4 {
		width: 10%;
	}
	
	.post_title {
		text-align: left;
	}
	
	.post_title a {
		text-decoration: none;
		color: black;
	}
	
	.new_post_button {
		text-align: right;
	}
	
	.new_post {
		text-decoration: none;
		display:inline-block;
		margin: 10px;
		padding: 10px;
		border-radius: 5px;
		border: 1px solid gray;
		color: black;
	}
	
	.new_post:hover {
		box-shadow: 1px 1px 3px gray;
		border: 1px solid gray;
	}
	
</style>

<script type="text/javascript">
 	$(function(){

		//세션에 로그인 된 아이디 값이 없다면
		if($("#sessionID").val() == ""){
			// 새글 등록 버튼 숨기기
			$("#new_post").hide();
		}

	});
</script>

<!-- 페이징 JSP 추가작업 1 -->
<!-- 페이징 옵션 처리 자바스크립트 시작 -->
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="getQnaList.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<!-- 페이징 옵션 처리 자바스크립트 끝 -->

<main>

	<div class="main_title">QNA</div>
	<hr>
	
	<!-- 페이징 JSP 추가작업 2 -->
	<!-- 페이징 옵션 시작 -->
	<div class="page_select_box">
	<select id="cntPerPage" name="sel" onchange="selChange()" class="page_select">
		<option value="10"
			<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개씩 보기</option>
		<option value="20"
			<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개씩 보기</option>
	</select>
	</div>
	<!-- 페이징 옵션 끝 -->
	
	<table class = "table_list">
		<tr class="table_top">
			<th class="table_th1">번호</th>
			<th class="table_th2">제목</th>
			<th class="table_th3">작성자</th>
			<th class="table_th4">등록일</th>
		</tr>

		<c:forEach items="${ qnaList }" var="qna">
			<tr>
				<td>${ qna.qna_no }</td>
				<td class="post_title"><a href="getQna.do?qna_no=${ qna.qna_no }"> ${ qna.qna_title }</a></td>
				<td>${ qna.qna_writer }</td>
				<td>
					<fmt:formatDate value="${ qna.qna_date }" pattern="yy-MM-dd"/>
				</td>
			</tr>
		</c:forEach>
	</table>
		
		<!-- 페이징 JSP 추가작업 3 -->
		<!-- 페이징 하단 숫자 시작 -->
		<div style="display: block; text-align: center;">		
			<c:if test="${paging.startPage != 1 }">
				<a href="<c:url value='/qna/getQnaList.do?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
			</c:if>
		
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">							
						<a href="<c:url value='/qna/getQnaList.do?nowPage=${p}&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			
			<c:if test="${paging.endPage != paging.lastPage}">					
				<a href="<c:url value='/qna/getQnaList.do?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
			</c:if>
		</div>
		<!-- 페이징 하단 숫자 끝 -->
		
		<div class="new_post_button">
			<a href="<c:url value='/qna/insertQnaPage.do'/>" id="new_post" class=" new_post">문의하기</a>
		</div>
	
	
	
	
</main>

<%@ include file="../import/bottom.jsp" %>
