<%@page import="com.tjoeunit.biz.activity.ActivityVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">

	.product {
		margin: 10px;
		width: 1200px;
	}

	.product_top{
		padding: 10px;
		margin-bottom: 20px;
		width: 1200px;
		border-bottom: 1px solid gray;
	}

	.product_thumb {
		width: 400px;
		height: 300px;
	}

	.product_title {
		display: inline-block;
		font-size: 40px;
		font-weight: 600;
		text-align: left;
		padding: 10px;
	}

	.product_city {
		text-align: left;
		padding: 0px 10px;
	}

	.product_city span	{
		display: inline-block;
		margin: 0px 5px;
		text-align: center;
		border-radius: 5px;
		background-color: #D9E3E8;
		padding: 5px 10px;
	}

	.product_price {
		display: inline-block;
		width: 350px;
		margin: 0px 10px;
		text-align: right;
	}

	.product_buy {
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
		font-size: 15px;
	}

	.product_buy:hover{
		color: #fff !important;
		background: #383838;
		cursor: pointer;
	}

	.product_detail{
		border-bottom: 1px solid gray;
		padding: 10px;
		margin: 10px;
	}

	.product_img {
		width: 1200px;
		background-color: #58CCFF;
	}

</style>

<main>

	<div class="product">

		<table class="product_top">
				<tr>
					<td rowspan="3"><img class="product_thumb" src="<c:url value='/activityUpload/${ activity.activity_thumb }'/>"></td>
					<td class="product_title">${ activity.activity_title }</td>
				</tr>
				<tr>
					<td class="product_city" headers="70">
						<span>#${ activity.activity_area }</span>
						<span>#액티비티</span>
						<span>#지역명소</span>
						<span>#안전여행</span>
					</td>
				</tr>
				<tr>
					<td height="70">
						<span class="product_price">${ activity.activity_price } 원</span>
						<input type="button" class="product_buy" value="구매하기" />
					</td>
				</tr>
			</table>

<!-- 액티비티 상세 설명 -->
<!-- 영상 관련 기능 없음
			<div class="video">
				<h3>액티비티 맛보기 영상</h3>
				<iframe width="1200" height="675"
					src="${ activity.activity_video }"
					title="YouTube video player"
					frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen>
				</iframe>
			</div>
 -->
			<div class="product_detail">${ activity.activity_content }</div>
			
	</div>
	<br>
</main>
	

<%@ include file="../import/bottom.jsp" %>