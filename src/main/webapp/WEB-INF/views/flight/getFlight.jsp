<%@page import="com.tjoeunit.biz.lantrip.LanTripVO"%>
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
<script>
	//전화번호 숫자 정규식!
	var numReg = /^[0-9]+$/;
	
	$(function(){
		$('form[name=frm]').submit(function() {
			if ($('#members_no').val().length < 1) {
				alert('로그인이 필요합니다');
				$('#members_id').focus();
				event.preventDefault();
				return false;				
			}else if (!numReg.test$('#payment_quantity').val()){
				alert('수량은 숫자만 입력하세요');
				$('#payment_quantity').focus();
				event.preventDefault();
				return false;
			}
		});
	});
</script>
<main>
	
	<div class="product">
	
	<table class="product_top">
				<tr>
					<td rowspan="3"><img class="product_thumb" src="<c:url value='/flightUpload/${flight.flight_thumb}'/>"></td>
					<td class="product_title">${flight.flight_title}</td>
				</tr>
				<tr>
				<td class="product_city" headers="70">
					<span>출발 : ${flight.flight_departure}</span>
					<span>도착 : ${flight.flight_arrival}</span>
				</td>
			</tr>
			<tr>
				<td height="70">
					<span class="product_price">${flight.flight_price} 원</span>
					<form name="frm" method="post" action="<c:url value='/flight/flightPayment.do'/>">
						예약일자 : <input type="date" name="payment_bookdate">
						수량 : <input type="text" id="payment_quantity" name="payment_quantity">
						<input type="submit" id="product_buy" class="product_buy" value="구매하기" />
						<input type="hidden" id="members_no" name="members_no" value="${members_no}">
						<input type="hidden" name="flight_no" value="${flight.flight_no}">
						<input type="hidden" name="payment_price" value="${flight.flight_price}">
						<input type="hidden" name="flight_title" value="${flight.flight_title}">
						<input type="hidden" name="product_category" value="항공">						
					</form>
				</td>
			</tr>
		</table>
		
		<!-- 항공권 상세 설명 -->	
		<div class="product_detail">${flight.flight_content}</div>
	</div>
	<br>
</main>

<%@ include file="../import/bottom.jsp" %>