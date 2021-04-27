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
		
		//숫자 정규식
		var numReg = /^[0-9]+$/;		
		
		$('#delete_flight').click(function() {
			var msg = confirm('${flight.flight_title} 을(를) 삭제하시겠습니까?');	
			if (msg) {
				//true
				location.href = "<c:url value ='/flight/deleteFlight.do?flight_no=${flight.flight_no}'/>";
			} else {
				//false
				event.preventDefault;
				location.href = "<c:url value='/flight/getFlight.do?flight_no=${flight.flight_no}'/>";
			}
		});
		
		$('#update_flight').click(function() {
			var msg = confirm('${flight.flight_title} 을(를) 수정하시겠습니까?');	
			if (msg) {
				//true
				location.href = "<c:url value='/flight/updateFlight.do?flight_no=${flight.flight_no}'/>";
			} else {
				//false
				event.preventDefault;
				location.href = "<c:url value='/flight/getFlight.do?flight_no=${flight.flight_no}'/>";
			}
		});
				
		$('form[name=frm]').submit(function() {
			if (!$("#members_no").val()) {
				alert('로그인이 필요한 서비스입니다');
				event.preventDefault();
				return false;
				
			} else if (!numReg.test($("#payment_quantity").val())) {
				alert('수량은 숫자만 입력하세요');
				$('#payment_quantity').focus();
				event.preventDefault();
				return false;
			}
		});		
	});	
</script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<main>
	<div class="flight_div">
		<div class="info_div">
			<div class="thumb_div">
				<img class="flight_product_thumb" src="<c:url value='/flightUpload/${flight.flight_thumb}'/>">			
			</div>			
			<div class="title_div">
				<div>
					<span class="flight_product_title">${flight.flight_title}</span>
				</div>
				<div>
					<span>출발 : ${flight.flight_departure}</span><br>
					<span>도착 : ${flight.flight_arrival}</span><br>
					<span>가격 : ${flight.flight_price}원</span>					
				</div>
				<!-- 결제를 위해 form 태그 추가 -->
				<form name="frm" id="frm" action="<c:url value='/flight/flightPayment.do'/>" method="post" enctype="multipart/form-data">
					<div class="buy_div">
						<!-- 두개중에 무엇을 쓸지 고민중 일단 서브밋 버튼으로 구현해 봄 -->
						
						<input type="submit" id="flight_buy" value="구매하기">
						<a href="#"><span class="flight_buy">구매하기</span></a>
						
						<!-- post 방식을 통해 payment.jsp 로 넘길 자료 (유저 설정 o) -->
						예약일자 : <input type="date" name="payment_bookdate">
						수량 : <input type="text" name="payment_quantity" id="payment_quantity">
						<!-- post 방식을 통해 payment.jsp 로 넘길 자료 (유저 설정 x)-->
						<input type="hidden" name="members_no" id="members_no" value="${members_no}">
						<input type="hidden" name="flight_no" value="${flight.flight_no}">
						<input type="hidden" name="payment_price" value="${flight.flight_price}">
					</div>
				</form>				
			</div>			
		</div>		
		<div class="clear_div">
			<!-- float: left 제거를 위함 -->
		</div>
		<div class="flight_product_detail">
			${flight.flight_content}
		</div>
	</div>
	<br>	
</main>

<%@ include file="../import/bottom.jsp" %>