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
	
	.hotel_filter {
		border: 1px solid #58CCFF;
		width: 1000px;
		margin-right: auto;
		margin-bottom: 20px;
	}
	
	.hotel_filter_name {
		color: #58CCFF;
	}
	
	.hotel_filter ul li {
		color: #000000;
		padding-left: 30px;
		display: inline;
	}
	
	.hotel_products{
		width: 1000px;
		margin-right: auto;
		margin-bottom: 30px;
	}
	
	.hotel_product {
		border-bottom: 1px solid gray;
		border-top: 1px solid gray;
		margin-right: auto;
		padding: 5px;
	}

	.hotel_product_thumb {
		width: 200px;
		height: 200px;
		border: 1px solid gray;
	}
	
	.hotel_product_title {
		width : 600px;
		height : 90px;
		padding: 10px;
	}
	
	.hotel_product_title a{
		color: black;
		font-size: 2em;
		font-weight: 600;
	}
	
	.hotel_product_title:hover {
		font-size: 1.2em;
	}
	
	.hotel_product_detail {
		width : 600px;
		height : 90px;
		padding: 10px;
		color: gray;
	}
	
	.hotel_product_departure{
		width: 150px;
		padding: 10px;
		text-align: right;
	}
	
	.hotel_price {
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
	
	.hotel_price:hover{
		text-decoration: none;
		color: #fff !important;
		background: #383838;
		cursor: pointer;
	}
	
</style>

<main>
	
	<br>
	<h1 class="main_title">	숙박권</h1>
	<div style="text-align: right; width: 1000px;">
			<a href="<c:url value='/hotel/insertHotel.do'/>">숙박권 등록하기</a>
		</div>
	<div class="hotel_filter">		
		<ul class="hotel_filter_name">카테고리
			<li><input type="checkbox">호텔</li>
			<li><input type="checkbox">팬션</li>
			<li><input type="checkbox">게스트하우스</li>
			<li><input type="checkbox">캠핑</li>			
		</ul>
		<ul class="hotel_filter_name">평점
			<li><input type="radio" checked="checked">전체</li>
			<li><input type="radio">4점 이상</li>
			<li><input type="radio">5점만</li>
		</ul>
		<ul class="hotel_filter_name">가격대
			<li><input type="number">원 이하</li>
		</ul>
	</div>
	
	<table class="hotel_products">	
		<tr>
			<c:forEach items="${hotelList}" var="hotel">
			<table class="hotel_product">			
				<tr>
					<td rowspan="3"><img class="hotel_product_thumb" src="<c:url value='/hotelUpload/${hotel.hotel_thumb}'/>"></td>
					<td class="hotel_product_title"><a href="<c:url value='getHotel.do?hotel_no=${hotel.hotel_no}'/>">${hotel.hotel_title}</td></a>
					<td class="hotel_product_area">${hotel.hotel_area}</td>
				</tr>
				<tr>
					<td class="hotel_product_detail">${hotel.hotel_content }</td>
					<td class="hotel_price" onclick="location.href='#'">${hotel.hotel_price}원에<br>구매하기</td>
				</tr>
			</table>
			</c:forEach>
		</tr>
	</table>
	
	<br>
</main>


<%@ include file="../import/bottom.jsp" %>