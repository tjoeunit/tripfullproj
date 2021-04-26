<%@page import="com.tjoeunit.biz.lantrip.LanTripVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">

	.lan_product {
		margin: 10px;
		width: 1200px;
	}

	.lan_product_top{
		padding: 10px;
		margin-bottom: 20px;
		width: 1200px;
		border-bottom: 1px solid gray;
	}

	.lan_product_thumb {
		width: 400px;
		height: 300px;
	}

	.lan_product_title {
		display: inline-block;
		font-size: 40px;
		font-weight: 600;
		text-align: left;
		padding: 10px;
	}

	.lan_product_city {
		text-align: left;
		padding: 0px 10px;
	}

	.lan_product_city span	{
		display: inline-block;
		margin: 0px 5px;
		text-align: center;
		border-radius: 5px;
		background-color: #D9E3E8;
		padding: 5px 10px;
	}

	.lan_product_price {
		display: inline-block;
		width: 350px;
		margin: 0px 10px;
		text-align: right;
	}

	.lan_product_buy {
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
		position: relative;
		display: inline-block;
		color: black;
		text-decoration: none;
		outline: 0;
		font-weight: 600;
		border-radius: 8px;
		border: 1px solid lightgray;
		color: black;
		height: 2.5em;
		line-height: 2.5em;
		width: 350px;
		background-color: white;
		text-align: center;
		margin: 0px 10px;
	}

	.lan_product_buy:hover{
		color: #fff !important;
		background: #383838;
		cursor: pointer;
	}

	.lan_video {

	}

	.lan_product_detail{
		border-bottom: 1px solid gray;
		padding: 10px;
		margin: 10px;
	}

	.lan_product_img {
		width: 1200px;
		background-color: #58CCFF;
	}

</style>

<main>

	<div class="lan_product">

		<!-- 랜선여행 제목 표현식에 있는 lantrip은 컨트롤러에서 model의 키값으로 정의한 것 사용 -->
		<div type="hidden" value="getLanTrip.do?lantrip_no=${ lantrip.lantrip_no }" ></div>
			<table class="lan_product_top">
				<tr>
					<td rowspan="3"><img class="lan_product_thumb" src="<c:url value='/lanTripUpload/${ lantrip.lantrip_thumb }'/>"></td>
					<td class="lan_product_title">${ lantrip.lantrip_title }</td>
				</tr>
				<tr>
					<td class="lan_product_city" headers="70">
						<span>#${ lantrip.lantrip_area }</span>
						<span>#랜선여행</span>
						<span>#코로나여행</span>
						<span>#안전여행</span>
					</td>
				</tr>
				<tr>
					<td height="70">
						<span class="lan_product_price">${lantrip.lantrip_price} 원</span>
						<span class="lan_product_buy">구매하기</span>
					</td>
				</tr>
			</table>

			<!-- 랜선여행 상세 설명 -->
			<div class="lan_video">
				<h3>랜선투어 맛보기 영상</h3>
				<iframe width="1200" height="675"
					src="${ lantrip.lantrip_video }"
					title="YouTube video player"
					frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen>
				</iframe>
			</div>
			<div class="lan_product_detail">${ lantrip.lantrip_content }</div>
			
	</div>
	<br>
</main>

<%@ include file="../import/bottom.jsp" %>
