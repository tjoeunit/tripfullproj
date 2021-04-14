<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">	

	.MainTitle {
		text-align: left;
		width: 600px;
		height: 50px;
		display: inline-block;
	}
	
	.Lan_Product_Top{
		margin-left: 360px;
		margin-bottom: 30px;
		width: 1000px;
		border-bottom: 1px solid gray;
	}
	
	.Lan_Product_Title {
		margin-left: 360px;
		width: 700px;
		float: left;
		box-sizing: border-box;
		padding-bottom: 20px;
		padding-right: 10px;
		font-size: 40px;
		font: bold;
	}
	
	.Lan_Price {
		width: 150px;
		float: left;
		box-sizing: border-box;
		padding: 5px;
	}
	
	.Lan_Buy {
		width: 100px;
		float: left;
		box-sizing: border-box;
		background-color: #58CCFF;
		padding: 5px;
		color: white;
	}
	
	.Top_Line{
		background-color: #58CCFF;
		width: 1000px;
		height: 3px;
	}
	
	.Lan_Video {
		margin-left: 360px;
	}
	
	.Lan_Product_Detail {
		margin-left: 360px;
		width: 900px;
		height: 1000px; /* 나중에 삭제 */
		background-color: #58CCFF;
	}
	
	
</style>

<main>
	
	
		<input name="lantrip_no" type="hidden" value="${ lantrip.lantrip_no }" />
		<div class="Lan_Product_Top">
			<div class="Lan_Product_Title">
				<input type="text" name="lantrip_title" value="${ lantrip.lantrip_title }">
			</div>
			<div class="Lan_Price">가격${ lantrip.lantrip_price }</div>
			<div class="Lan_Buy">구매하기</div>
		</div>
	<!-- <hr class="Top_Line"> -->
	<div class="Lan_Video">
		<iframe width="854" height="480" src="https://www.youtube.com/embed/msxK0k4NvcU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
		</iframe>
	</div>
	<div class="Lan_Product_Detail">상품 상세 이미지</div>
	
	<br>
	
	
	
	
</main>
<%@ include file="../import/bottom.jsp" %>