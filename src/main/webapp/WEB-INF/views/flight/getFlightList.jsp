<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">	
	a{
			text-decoration: none;
		}

	.main_title {
		align-content: left;
	}
	
	.flight_filter {
		border: 1px solid #58CCFF;
		width: 1000px;
		margin-right: auto;
		margin-bottom: 20px;
	}
	
	.flight_filter_name {
		color: #58CCFF;
	}
	
	.flight_filter ul li {
		color: #000000;
		padding-left: 30px;
		display: inline;
	}
	
	.flight_products{
		width: 1000px;
		margin-right: auto;
		margin-bottom: 30px;
	}
	
	.flight_product {
		border-bottom: 1px solid gray;
		border-top: 1px solid gray;
		margin-right: auto;
		padding: 5px;
	}

	.flight_product_thumb {
		width: 200px;
		height: 200px;
		border: 1px solid gray;
	}
	
	.flight_product_title {
		width : 600px;
		height : 90px;
		padding: 10px;
	}
	
	.flight_product_title a{
		color: black;
		font-size: 2em;
		font-weight: 600;
	}
	
	.flight_product_title:hover {
		font-size: 1.2em;
	}
	
	.flight_product_detail {
		width : 600px;
		height : 90px;
		padding: 10px;
		color: gray;
	}
	
	.flight_product_departure{
		width: 150px;
		padding: 10px;
		text-align: right;
	}
	
	.flight_price {
		width: 150px;
		position: relative;
		box-sizing: border-box;
		color: black;
		text-align: center;
		font-weight: 600;
		line-height: 1.5em;
		padding: 0 1.25em;
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
	}
	
	.flight_price:hover{
		text-decoration: none;
		color: #fff !important;
		background: #383838;
		cursor: pointer;
	}
	
</style>

<main>
	
	<br>
	<h1 class="main_title">	항공권</h1>
	<div style="text-align: right; width: 1000px;">
			<a href="<c:url value='/flight/insertFlight.do'/>">항공권 등록하기 ^^</a>
		</div>
	<div class="flight_filter">		
		<ul class="flight_filter_name">여행지
			<li><input type="checkbox">아시아</li>
			<li><input type="checkbox">유럽</li>
			<li><input type="checkbox">북아메리카</li>
			<li><input type="checkbox">남아메리카</li>
			<li><input type="checkbox">아프리카</li>
			<li><input type="checkbox">오세아니아</li>
		</ul>
		<ul class="flight_filter_name">평점
			<li><input type="radio" checked="checked">전체</li>
			<li><input type="radio">4점 이상</li>
			<li><input type="radio">5점만</li>
		</ul>
		<ul class="flight_filter_name">가격대
			<li><input type="number">원 이하</li>
		</ul>
	</div>
	
	<table class="flight_products">	
		<tr>
			<c:forEach items="${flightList}" var="flight">
			<table class="flight_product">			
				<tr>
					<td rowspan="3"><img class="flight_product_thumb" src="<c:url value='/flightUpload/${flight.flight_thumb}'/>"></td>
					<td class="flight_product_title"><a href="<c:url value='getFlight.do?flight_no=${flight.flight_no}'/>">${flight.flight_title}</td></a>
					<td class="flight_product_departure">${flight.flight_departure}</td>
				</tr>
				<tr>
					<td class="flight_product_detail">${flight.flight_content }</td>
					<td class="flight_price" onclick="location.href='#'">${flight.flight_price}원에<br>구매하기</td>
				</tr>
			</table>
			</c:forEach>
		</tr>
	</table>
	
	<br>
</main>


<%@ include file="../import/bottom.jsp" %>