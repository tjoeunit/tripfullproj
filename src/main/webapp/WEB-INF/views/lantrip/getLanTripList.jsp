<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">	
	.main_title {
		align-content: left;
		margin-left: 360px;
	}
	
	.lan_filter {
		border: 1px solid #58CCFF;
		width: 1000px;
		margin-left: 360px;
		margin-right: auto;
		margin-bottom: 20px;
	}
	
	.lan_filter_name {
		color: #58CCFF;
	}
	
	.lan_filter ul li {
		color: #000000;
		padding-left: 30px;
		display: inline;
	}
	
	.lan_products{
		width: 1000px;
		margin-left: 360px;
		margin-right: auto;
		margin-bottom: 30px;
	}
	
	.lan_product {
		border-bottom: 1px solid gray;
		border-top: 1px solid gray;
		margin-left: 360px;
		margin-right: auto;
		padding: 5px;
	}
	
	.lan_product_thumb {
		width: 200px;
		height: 200px;
		border: 1px solid gray;
	}
	
	.lan_product_title {
		width : 650px;
		height : 90px;
		padding: 5px;
	}
	
	.Lan_Product_Detail {
		width : 650px;
		height : 90px;
		padding: 5px;
	}
	
	.lan_product_city{
		width: 100px;
		padding: 5px;
	}
	
	.lan_price {
		width: 100px;
		padding: 5px;
		background-color: #58CCFF;
	}
	
</style>

<main>
	
	<br>
	<h1 class="main_title">	랜선여행</h1>
	
	<div class="lan_filter">
		<ul class="lan_filter_name">카테고리
			<li>전체</li>
			<li><a href="#">사진 여행</a></li>
			<li><a href="#">영상 여행</a></li>
		</ul>
		<ul class="lan_filter_name">가격대
			<li><input type="number">원 이하</li>
		</ul>
		<ul class="lan_filter_name">평점
			<li><input type="radio" checked="checked">전체</li>
			<li><input type="radio">4점 이상</li>
			<li><input type="radio">5점만</li>
		</ul>
		<ul class="lan_filter_name">여행지
			<li><input type="checkbox">아시아</li>
			<li><input type="checkbox">유럽</li>
			<li><input type="checkbox">북아메리카</li>
			<li><input type="checkbox">남아메리카</li>
			<li><input type="checkbox">아프리카</li>
			<li><input type="checkbox">오세아니아</li>
		</ul>
	</div>
	
	<table class="lan_products">
	
		<tr>
			
			<table class="lan_product">
			<c:forEach items="${ lanTripList }" var="lantrip">
				<tr>
					<td rowspan="3" class="lan_product_thumb">${ lantrip.lantrip_thumb }</td>
					<td class="lan_product_title"><a href="<c:url value='getLanTrip.do?lantrip_no=${ lantrip.lantrip_no }'/>">${ lantrip.lantrip_title }</td></a>
					<td class="lan_product_city">${ lantrip.lantrip_area }</td>
				</tr>
				<tr>
					<td class="lan_product_detail">${ lantrip.lantrip_content }</td>
					<td class="lan_price">${ lantrip.lantrip_price }</td>
				</tr>
			</c:forEach>
			</table>
			
		</tr>
	
	</table>
	<br>
</main>

<%@ include file="../import/bottom.jsp" %>