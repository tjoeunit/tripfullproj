<%@page import="com.tjoeunit.biz.lantrip.LanTripVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">	
	main {
		margin-left: 360px;
	}
	
	.flight_div{
		width: 1200px;
	}
	
	.flight_product_thumb{
		width: 400px;
		height: 300px;
	}
	
	.flight_product_title {
		display: inline-block;
		width: 1200px;
		font-size: 40px;
		font-weight: 600;
		text-align: left;
	}
	
	.flight_buy {
		display: inline-block;
		position: relative;
		box-sizing: border-box;
		color: black;
		text-decoration: none;
		text-align: center;
		font-weight: 600;
		border-radius: 8px;
		height: 2.5em;
		width: 800px;
		line-height: 2.5em;
		padding: 0 1.25em;
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
	}
	
	.flight_buy:hover {
		color: #fff !important;
		background: #383838;
	}	
	
	.flight_product_detail{
		width: 1200px;
		padding: 10px;
	}
	
	.flight_product_detail_area{
		color: gray;
		text-align: right;
	}	
	
	.flight_product_img {
		width: 1200px;
		height: auto;
		background-color: #58CCFF;
	}
	
	.thumb_div {
		float: left;
		width: 400px;
		height: 300px;
	}
	
	.info_div {
		height: 300px;
		width: 1200px;
		margin-top: 10px;
	}
	
	.title_div {
		margin-top: 10px;
		float: left;
		width: 800px;
		height: 300px;		
	}
	
	.buy_div {
		margin-top: 10px;
		text-align: right;
	}
	
	.clear_div {
		clear: both;
	}
	
</style>

<main>
	<div class="hotel_div">
		<div class="info_div">
		
			<div class="thumb_div">
				<img class="hotel_product_thumb" src="<c:url value='/HotelUpload/${hotel.hotel_thumb}'/>">			
			</div>
			
			<div class="title_div">
				<div>
					<span class="hotel_product_title">${hotel.hotel_title}</span>
				</div>
				<div>
					<span>지역 : ${hotel.hotel_area}</span><br>
					<span>카테고리 : ${hotel.hotel_category}</span><br>
					<span>가격 : ${hotel.hotel_price}원</span>
					
				</div>
				<div class="buy_div">
					<a href="#"><span class="hotel_buy">구매하기</span></a>
				</div>
			</div>
			
		</div>
		
		<div class="clear_div"></div>
			
		<!-- 숙소 상세 설명 -->	
		<div class="hotel_product_detail">
						
		</div>		
		<div>
				설명 : ${hotel.hotel_content}
			</div>
		<div class="hotel_video">
			<iframe width="1200" height="675" src="https://www.youtube.com/embed/${hotel.hotel_video}" title="YouTube video player" 
				frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
			</iframe>
		</div>
		
		<!-- core의 if문 이용해서 코드 실행할 수 있게 함 null인 경우 skip될 수 있게 처리  jstl 이용해서  -->
		
		<div>
			<img class="hotel_product_img" src="<c:url value='/HotelUpload/${flight.flight_img1}'/>">
		</div>
	</div>
	<br>
</main>
<%@ include file="../import/bottom.jsp" %>