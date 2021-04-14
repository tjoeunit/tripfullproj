<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="../img/favicon16.ico">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
/* body{
		padding-top: 130px;
	} */
	
	.nav {
		background-color: white;
		position: fixed;
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
	
	.navBackDiv {
		height: 120px;
		width: 100%;
		clear: both;
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
					<img src="../img/tripfulllogo.png">					
				</div>
				
				<div class="navAccDiv">
					<ul>
						<li><a href="members/insertMembers.jsp">회원가입</a></li>
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
						<li><a href="getLanTripList.do">랜선투어</a></li>
						<li><a href="#">여행이야기</a></li>
					</ul>
				</div>				
			</div>
		</nav>
		<div class="navBackDiv">
			
		</div>
</header>