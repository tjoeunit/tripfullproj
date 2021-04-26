<%@page import="com.tjoeunit.biz.lantrip.LanTripVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">
	main {
		margin-left: 360px;
	}

	.hotel_div{
		width: 1200px;
	}

	.hotel_product_thumb{
		width: 400px;
		height: 300px;
	}

	.hotel_product_title {
		display: inline-block;
		width: 1200px;
		font-size: 40px;
		font-weight: 600;
		text-align: left;
	}

	.hotel_buy {
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

	.hotel_buy:hover {
		color: #fff !important;
		background: #383838;
	}

	.hotel_product_detail{
		width: 1200px;
		padding: 10px;
	}

	.hotel_product_detail_area{
		color: gray;
		text-align: right;
	}

	.hotel_product_img {
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

<script type="text/javascript">
	$(function(){
		$('#delete_hotel').click(function() {
			var msg = confirm('${hotel.hotel_title} 을(를) 삭제하시겠습니까?');	
			if (msg) {
				//true
				location.href = "<c:url value ='/hotel/deleteHotel.do?hotel_no=${hotel.hotel_no}'/>";
			} else {
				//false
				event.preventDefault;
				location.href = "<c:url value='/hotel/getHotel.do?hotel_no=${hotel.hotel_no}'/>";
			}
		});
		
		$('#update_hotel').click(function() {
			var msg = confirm('${hotel.hotel_title} 을(를) 수정하시겠습니까?');	
			if (msg) {
				//true
				location.href = "<c:url value='/hotel/updateHotel.do?hotel_no=${hotel.hotel_no}'/>";
			} else {
				//false
				event.preventDefault;
				location.href = "<c:url value='/hotel/getHotel.do?hotel_no=${hotel.hotel_no}'/>";
			}
		});	
	});	
</script>
<main>
	<div class="hotel_div">
		<div class="info_div">
		<div class="edit_div">
				<input type="button" value="숙박권 수정하기" id="update_hotel">			
			</div>
			<div class="delete_hotel_div">
				<input type="button" value="숙박권 삭제하기" id="delete_hotel">
			</div>
			<div class="thumb_div">
				<img class="hotel_product_thumb" src="<c:url value='/hotelUpload/${hotel.hotel_thumb}'/>">
			</div>

			<div class="title_div">
				<div>
					<span class="hotel_product_title">${hotel.hotel_title}</span>
				</div>
				<div>
					<span>카테고리 : ${hotel.hotel_category}</span><br>
					<span>지역 : ${hotel.hotel_area}</span><br>
					<span>가격 : ${hotel.hotel_price}원</span><br>
					

				</div>
				<div class="buy_div">
					<a href="#"><span class="hotel_buy">구매하기</span></a>
				</div>
			</div>

		</div>

		<div class="clear_div">
		<!-- float: left 제거를 위함 -->
		</div>
		<!-- 숙박 상세 설명 -->
		<div class="hotel_product_detail">
			설명 : ${hotel.hotel_content}
		</div>		
	</div>
	<br>
</main>
<%@ include file="../import/bottom.jsp" %>
