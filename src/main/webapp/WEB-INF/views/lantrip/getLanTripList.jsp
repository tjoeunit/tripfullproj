<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">	
	a{
			text-decoration: none;
		}

	.main_title {
		align-content: left;
		margin-left: 360px;
		width: 15%;
		font-weight: 600;
		font-size: 48px;
	}
	
	.lan_filter {
		margin-bottom: 20px;
	}
	
	.lan_filter_name {
		color: black;
		text-align: center;
		font-weight: 600;
		width: 15%;
		
	}
	
	.lan_filter ul li {
		color: #000000;
		padding-right: 30px;
		display: inline;
	}
	
	.lan_products{
		width: 1000px;
		margin-right: auto;
		margin-bottom: 30px;
	}
	
	.lan_product {
		border-bottom: 1px solid gray;
		border-top: 1px solid gray;
		margin-right: auto;
		padding: 5px;
	}

	.lan_product_thumb {
		width: 200px;
		height: 200px;
		border: 1px solid gray;
	}
	
	.lan_product_title {
		width : 600px;
		height : 90px;
		padding: 10px;
	}
	
	.lan_product_title a{
		color: black;
		font-size: 2em;
		font-weight: 600;
	}
	
	.lan_product_title:hover {
		font-size: 1.2em;
	}
	
	.lan_product_detail {
		width : 600px;
		height : 90px;
		padding: 10px;
		color: gray;
		overflow: hidden;
	}
	
	.lan_product_city{
		width: 150px;
		padding: 10px;
		text-align: right;
	}
	
	.lan_price {
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
	
	.lan_price:hover{
		text-decoration: none;
		color: #fff !important;
		background: #383838;
		cursor: pointer;
	}
	
</style>

<main>
	
	<br>
	<span class="main_title">랜선투어</span>
	
	<span class="lan_filter">
		<span>아시아</span>
		<span>유럽</span>
		<span>북아메리카</span>
		<span>남아메리카</span>
		<span>아프리카</span>
		<span>오세아니아</span>
	</span>
	
	<table class="lan_products">
	
		<tr>
			<c:forEach items="${ lanTripList }" var="lantrip">
			<table class="lan_product">
			
				<tr>
					<td rowspan="3"><img class="lan_product_thumb" src="<c:url value='/lanTripUpload/${ lantrip.lantrip_thumb }'/>"></td>
					<td class="lan_product_title"><a href="<c:url value='getLanTrip.do?lantrip_no=${ lantrip.lantrip_no }'/>">${ lantrip.lantrip_title }</td></a>
					<td class="lan_product_city">${ lantrip.lantrip_area }</td>
				</tr>
				<tr>
					<td class="lan_product_detail">${ lantrip.lantrip_content }</td>
					<td class="lan_price" onclick="location.href='#'">${ lantrip.lantrip_price }원에<br>구매하기</td>
				</tr>
			</table>
			</c:forEach>
		</tr>
	</table>
	<br>
</main>


<%@ include file="../import/bottom.jsp" %>