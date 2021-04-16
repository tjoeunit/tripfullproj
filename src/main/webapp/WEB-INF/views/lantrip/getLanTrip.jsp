<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">	
	
	.lan_product_top{
		margin-left: 360px;
		padding: 10px;
		margin-bottom: 20px;
		width: 1000px;
		border-bottom: 1px solid gray;
	}
	
	.lan_product_title {
		display: inline-block;
		width: 800px;
		font-size: 40px;
		font-weight: 600;
		text-align: left;
	}
	
	.lan_price {
		display: inline-block;
		position: relative;
		box-sizing: border-box;
		padding: 5px;
	}
	
	.lan_buy {
		display: inline-block;
		position: relative;
		box-sizing: border-box;
		color: black;
		text-decoration: none;
		text-align: center;
		font-weight: 600;
		border-radius: 8px;
		height: 2.5em;
		line-height: 2.5em;
		padding: 0 1.25em;
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
	}
	
	.lan_buy:hover {
		color: #fff !important;
		background: #383838;
	}
	
	.lan_video {
		margin-left: 360px;
	}
	
	.lan_product_detail{
		margin-left: 360px;
		width: 1000px;
		border-bottom: 1px solid gray;
		padding: 10px;
	}
	
	.lan_product_img {
		margin-left: 360px;
		width: 900px;
		height: 1000px; /* 나중에 삭제 */
		background-color: #58CCFF;
	}
	
	
</style>

<main>

<!-- 랜선여행 제목 표현식에 있는 lantrip은 컨트롤러에서 model의 키값으로 정의한 것 사용 -->
	<div type="hidden" value="getLanTrip.do?lantrip_no=${ lantrip.lantrip_no }">
		<div class="lan_product_top">
			<span class="lan_product_title">${ lantrip.lantrip_title }</span>
			<span class="lan_price">${ lantrip.lantrip_price }원</span>
			<a href="#"><span class="lan_buy">구매하기</span></a>
		</div>

<!-- 랜선여행 상세 설명 -->
		<div class="lan_product_detail">${ lantrip.lantrip_content }</div>
		<div class="lan_video">
			<iframe width="854" height="480" src="${ lantrip.lantrip_video }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
			</iframe>
		</div>
		<div class="lan_product_img">상품 상세 이미지 ${ lantrip.lantrip_img }
		</div>
	</div>
	
	
	
	
	<br>
</main>
<%@ include file="../import/bottom.jsp" %>