<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<!-- 파비콘 -->
<link rel="shortcut icon" href="<c:url value='/img/favicon16.ico'/>">

<!-- 제이쿼리 -->
<script type="text/javascript" src="<c:url value='/lib/js/jquery-3.5.1.min.js'/>"></script>

<meta charset="UTF-8">
<title>Tripfull</title>
</head>

<style>
	.nav {
		background-color: white;
		/*position: fixed;*/
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
	
</style>

<body>
<header>	
		<nav class="nav">
			<div class="navDiv">			
				<div class="navImgDiv">								
					<a style="all: unset; cursor: pointer;" href="<c:url value='/index.do'/>">
						<img src="<c:url value='/img/tripfulllogo.png'/>">
					</a>
				</div>
				
				<div class="navAccDiv">
					<ul>
						<li><a href="<c:url value='/members/insertMembers.do'/>">회원가입</a></li>
						<li><a href="#">로그인</a></li>
						<li><a href="#">관리자</a></li>
					</ul>
				</div>
				
				<div class="navListDiv">	
					<ul>
						<li><a href="#">항공권</a></li>
						<li><a href="#">숙소</a></li>
						<li><a href="#">렌터카 & 교통</a></li>
						<li><a href="#">액티비티</a></li>
						<li><a href="getLTList.jsp">랜선투어</a></li>
						<li><a href="#">여행이야기</a></li>
					</ul>
				</div>				
			</div>
		</nav>
</header>