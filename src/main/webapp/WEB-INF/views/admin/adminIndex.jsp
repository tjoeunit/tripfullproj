<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/admintop.jsp" %>

<style type="text/css">
	
	.adminIndex1{
		text-decoration: none;
		width: 1130px;
		display: inline-block;
		margin: 20px 10px;
		border-radius: 5px;
		overflow: hidden;
		box-shadow: 2px 2px 5px gray;
	}
	
	.adminIndex2 {
		text-decoration: none;
		width: 550px;
		display: inline-block;
		margin: 20px 10px;
		border-radius: 5px;
		overflow: hidden;
		box-shadow: 2px 2px 5px gray;
	}
	
	
</style>


<main>

	<!-- 회원관리 -->
	<a href="<c:url value='/adminMembers/adminMembersList.do'/>"> 
		<img src="<c:url value='/img/adminindex01.jpg'/>" class="adminIndex1">
	</a>
	
	<!-- 항공권관리 -->
	<a href="<c:url value='/adminFlight/adminFlight.do'/>">
		<img src="<c:url value='/img/adminindex02.jpg'/>" class="adminIndex2">
	</a>
	
	<!-- 숙박관리 -->
	<a href="<c:url value='/adminHotel/adminHotel.do'/>">
		<img src="<c:url value='/img/adminindex03.jpg'/>" class="adminIndex2">
	</a>
	
	<!-- 렌터카&교통관리 -->
	<a href="<c:url value='#'/>">
		<img src="<c:url value='/img/adminindex04.jpg'/>" class="adminIndex2">
	</a>
	
	<!-- 액티비티관리 -->
	<a href="<c:url value='/adminActivity/adminActivity.do'/>">
		<img src="<c:url value='/img/adminindex05.jpg'/>" class="adminIndex2">
	</a>
	
	<!-- 랜선투어관리 -->
	<a href="<c:url value='/adminLanTrip/adminLanTrip.do'/>">
		<img src="<c:url value='/img/adminindex06.jpg'/>" class="adminIndex2">
	</a>
	
	<!-- 여행이야기관리 -->
	<a href="<c:url value='/adminStory/adminStory.do'/>">
		<img src="<c:url value='/img/adminindex07.jpg'/>" class="adminIndex2">
	</a>
	
</main>

<%@ include file="../import/bottom.jsp" %>
