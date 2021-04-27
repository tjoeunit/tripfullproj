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
					<li><a href="<c:url value='/index/cancelRefund.do'/>">취소 및 환불 정책</a></li>
					<li><a href="<c:url value='/qna/getQnaList.do'/>"class="serviceCheck">자주 묻는 질문</a></li>
				</ul>
			</div>

		</div>
	</nav>
</header>
<body>


<style>

	.qna_get{
		font: bold;
		width: 1000px;
		padding: 10px;
	}
	
	.qna_get h5{
		text-align: right;
		padding-top: 10px;
		padding-right: 20%;
	}
	.get_qna_title{
		width: 500px;
		padding: 10px;
		padding-left: 3%;
		border-left: #d9c5c5 double 10px;
	}
	
	.get_qna_content{
		background-color: #58CCFF;
		height: 700px;
	}
	.get_qna_date{
		background-color: #58CCFF;
	}
	.get_qna_cnt{	
		background-color: #58CCFF;
	}
	
	.get_qna_bottom{
		text-align: center;
	}
	.get_qna_inform{
		width: 750px;
		padding: 10px;
		padding-left: 1%;
		border: #c4c4c4 dashed 1px;
		border-radius: 3em;
	}
	
	
</style>



<script type="text/javascript">

	$(function(){
		$('#qna_modify_a').click(function() {
			if ($('#members_id').val() != $('#qna_writer').val()) {
				alert('수정 권한이 없습니다.');
				event.preventDefault();
				return false;
			}
		});
		
		$('#qna_delete_a').click(function() {
			if ($('#members_id').val() != $('#qna_writer').val()) {
				alert('삭제 권한이 없습니다.');
				event.preventDefault();
				return false;
			}
		});
	});
	
	
</script>

<main>

	<input type="hidden" id="qna_writer" value="${qna.qna_writer}">		<!-- 작성자 -->
	<input type="hidden" name="qna_no" value="${qna.qna_no}" />
	<input type="hidden" id="members_id" value="${members_id}"> 		<!-- 세션 로그인된 id -->
	
	<br><br>
	
	<div class="get_qna_title">
		<h2>${qna.qna_title}</h2>
	</div>
	
	<br>
	
	<div class="get_qna_inform">
		<b> 작성자&nbsp;&nbsp;&nbsp;${qna.qna_writer}</b>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<fmt:formatDate value="${ qna.qna_date }" dateStyle="full" timeStyle="full"/>
		
	</div>
	
	<br><br><br>
	
		${qna.qna_content}
		
	<br><br><br>
	
	<div class="get_qna_bottom" >
		<a id= "qna_modify_a" href="updateQnaPage.do?qna_no=${qna.qna_no}">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a id= "qna_delete_a" href="deleteQna.do?qna_no=${qna.qna_no}">삭제하기</a>&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="getQnaList.do">목록보기</a>
	</div>
	
	<br><br>
</main>

<%@ include file="../import/bottom.jsp" %>