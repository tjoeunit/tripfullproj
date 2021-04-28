<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>
<style>
	.indexMem_Div {
		
	}

	.account_Div {
		margin-top: 100px;
		margin-bottom: 100px;
		width: 600px;
		height: auto;
		float: left;
		text-align: center;
	}

	.shopping_Div {
		margin-top: 100px;
		margin-bottom: 100px;
		width: 600px;
		height: auto;
		float: left;
		text-align: center;
	}
	
	.dum_Div {
		clear: both;
	}
</style>

<main>
	<div class="indexMem_Div">
		<div class="account_Div">
			<a href="<c:url value='/members/infoMembers.do'/>">
				<img style="width: 450px; height: auto;" src="<c:url value='/img/account.png'/>">
			</a><br>
			<span>회원정보</span>
		</div>
		
		<div class="shopping_Div">
			<a href="<c:url value='/members/payMainMembers.do'/>">
				<img style="width: 450px; height: auto;" src="<c:url value='/img/shopping.png'/>">
			</a><br>
			<span>결제정보</span>
		</div>
		
		<div class="dum_Div"></div>
	</div>
</main>

<%@ include file="../import/bottom.jsp" %>
