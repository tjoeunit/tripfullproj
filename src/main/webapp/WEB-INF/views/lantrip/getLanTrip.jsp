<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">	
	
	.lan_product_top{
		margin-left: 360px;
		margin-bottom: 30px;
		width: 1000px;
		border-bottom: 1px solid gray;
	}
	
	.lan_product_title {
		margin-left: 360px;
		width: 700px;
		float: left;
		box-sizing: border-box;
		padding-bottom: 20px;
		padding-right: 10px;
		font-size: 40px;
		font: bold;
	}
	
	.lan_price {
		width: 150px;
		float: left;
		box-sizing: border-box;
		padding: 5px;
	}
	
	.lan_buy {
		width: 100px;
		float: left;
		box-sizing: border-box;
		background-color: #58CCFF;
		padding: 5px;
		color: white;
	}
	
	.lan_video {
		margin-left: 360px;
	}
	
	.lan_product_detail {
		margin-left: 360px;
		width: 900px;
		height: 1000px; /* 나중에 삭제 */
		background-color: #58CCFF;
	}
	
	
</style>

<main>
	
		<input name="lantrip_no" type="hidden" value="${ lantrip.lantrip_no }" />
		<div class="lan_product_top">
			<div class="lan_product_title">
				<input type="text" name="lantrip_title" value="${ lantrip.lantrip_title }">
			</div>
			<div class="lan_price">가격${ lantrip.lantrip_price }</div>
			<div class="lan_buy">구매하기</div>
		</div>
	
	<div class="lan_video">
		<iframe width="854" height="480" src="https://www.youtube.com/embed/msxK0k4NvcU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
		</iframe>
	</div>
	<div class="lan_product_detail">상품 상세 이미지</div>
	
	<br>
	
	
	
	
</main>
<%@ include file="../import/bottom.jsp" %>