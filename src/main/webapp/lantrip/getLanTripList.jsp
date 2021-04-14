<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">	
	.MainTitle {
		align-content: left;
		margin-left: 360px;
	}
	
	.Lan_Filter {
		border: 1px solid #58CCFF;
		width: 1000px;
		margin-left: 360px;
		margin-right: auto;
		margin-bottom: 20px;
	}
	
	.Lan_Filter_Name {
		color: #58CCFF;
	}
	
	.Lan_Filter ul li {
		color: #000000;
		padding-left: 30px;
		display: inline;
	}
	
	.Lan_Products{
		width: 1000px;
		margin-left: 360px;
		margin-right: auto;
		margin-bottom: 30px;
	}
	
	.Lan_Product {
		border-bottom: 1px solid gray;
		border-top: 1px solid gray;
		margin-left: 360px;
		margin-right: auto;
		padding: 5px;
	}
	
	.Lan_Product_Thumb {
		width: 200px;
		height: 200px;
		border: 1px solid gray;
	}
	
	.Lan_Product_Title {
		width : 650px;
		height : 90px;
		padding: 5px;
	}
	
	.Lan_Product_Detail {
		width : 650px;
		height : 90px;
		padding: 5px;
	}
	
	.Lan_Product_City{
		width: 100px;
		padding: 5px;
	}
	
	.Lan_Price {
		width: 100px;
		padding: 5px;
		background-color: #58CCFF;
	}
	
</style>

<main>
	
	<br>
	<h1 class="MainTitle">	랜선여행</h1>
	
	<div class="Lan_Filter">
		<ul class="Lan_Filter_Name">카테고리
			<li>전체</li>
			<li><a href="#">사진 여행</a></li>
			<li><a href="#">영상 여행</a></li>
		</ul>
		<ul class="Lan_Filter_Name">가격대
			<li><input type="number">원 이하</li>
		</ul>
		<ul class="Lan_Filter_Name">평점
			<li><input type="radio" checked="checked">전체</li>
			<li><input type="radio">4점 이상</li>
			<li><input type="radio">5점만</li>
		</ul>
		<ul class="Lan_Filter_Name">여행지
			<li><input type="checkbox">아시아</li>
			<li><input type="checkbox">유럽</li>
			<li><input type="checkbox">북아메리카</li>
			<li><input type="checkbox">남아메리카</li>
			<li><input type="checkbox">아프리카</li>
			<li><input type="checkbox">오세아니아</li>
		</ul>
	</div>
	
	<table class="Lan_Products">
	
		<tr>
			
			<table class="Lan_Product">
			<c:forEach items="${ lanTripList }" var="lantrip">
				<tr>
					<td rowspan="3" class="Lan_Product_Thumb">${ lantrip.lantrip_thumb }</td>
					<td class="Lan_Product_Title"><a href="getLanTrip.do?lantrip_no=${ lantrip.lantrip_no }">${ lantrip.lantrip_title }</td></a>
					<td class="Lan_Product_City">${ lantrip.lantrip_area }</td>
				</tr>
				<tr>
					<td class="Lan_Product_Detail">${ lantrip.lantrip_content }</td>
					<td class="Lan_Price">${ lantrip.lantrip_price }</td>
				</tr>
			</c:forEach>
			</table>
			
		</tr>
	
	</table>
	<br>
</main>

<%@ include file="../import/bottom.jsp" %>