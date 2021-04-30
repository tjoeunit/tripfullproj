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

<!-- 제목, 내용 null check -->
<script type="text/javascript">
	$(function() {
		$('form[name=enroll_qna]').submit(function() {
						
			if($('#qna_title').val().length < 1) {
				alert('제목을 입력하세요.');
				$('#qna_title').focus();
				event.preventDefault();
				return false;	
				
			} else if(CKEDITOR.instances['qna_content'].getData()=="") {
				alert('내용을 입력하세요.');
				CKEDITOR.instances['qna_content'].focus();
				event.preventDefault();
				return false;
			}
			
		});
	});
</script>

<style type="text/css">

	.main_title {
		align-content: left;
		font-size: 40px;
		font-weight: 600;
		margin: 20px 0px;
	}
	
	.insert_table {
		width: 1200px;
		padding: 20px;
	}
	
	.table_td1 {
		width: 100px;
	}
	
	.insert_input {
		padding: 5px;
		width: 1052px;
		border: none;
		background-color: lightgray;
	}
	
	.ckeditor {
		width: 100%;
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
		background-color: white;
	}
	
	.new_post:hover {
		box-shadow: 1px 1px 3px gray;
		border: 1px solid gray;
	}
	
	
</style>

<main>

<!-- ckeditor 4 -->
 	<script type="text/javascript" src = "<c:url value = '/ckeditor/ckeditor.js' />"></script>
 	
 	<div class="main_title">QNA 등록</div>
	<hr>
	
	<form action="<c:url value='/qna/insertQna.do'/>" name="enroll_qna" method="post" enctype="multipart/form-data">
			
		<input type="hidden" name="members_no" value="${members_no}">
				
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td class="table_td2"><input type="text" name="qna_title" id="qna_title" class="insert_input" placeholder = "제목을 입력하세요"/></td>
				</tr>		
				
				<tr>
					<td class="table_td1">작성자</td>
					<td class="table_td2"><input type="text" name="qna_writer" class="insert_input" value="${members_id}" readonly></td>
				</tr>
				
				<tr>
					<td class="table_td1">내용</td>
					<td class="table_td2">
						<textarea name="qna_content" class="ckeditor"></textarea>
						<script type="text/javascript">
						CKEDITOR.replace('qna_content', {height: 700, filebrowserUploadUrl:'/qnaImage/imageUpload.do'});
						</script>
					</td>
				</tr>
			</table>
			
			<div class="new_post_button">
				<input type="submit" class=" new_post" value=" 등록하기 "/>
				<input type="button" onclick="history.back()" class=" new_post" value=" 뒤로가기 "/>
			</div>
					
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>