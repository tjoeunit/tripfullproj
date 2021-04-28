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
	});	
</script>
<main>
	<div class="flight_div">
		<div class="info_div">
			<!-- 사용하지 않음 -->
			<!-- 
			<div class="edit_div">
				<input type="button" value="항공권 수정하기" id="update_flight">			
			</div>
			<div class="delete_flight_div">
				<input type="button" value="항공권 삭제하기" id="delete_flight">
			</div>
			-->
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
				<div class="buy_div">
					<a href="#"><span class="flight_buy">구매하기</span></a>
				</div>
			</div>			
		</div>		
		<div class="clear_div">
			<!-- float: left 제거를 위함 -->
		</div>			
		<!-- 항공권 상세 설명 -->	
		<div class="flight_product_detail">
			설명 : ${flight.flight_content}
		</div>		
		<!-- 씨케이 에디터 사용으로 삭제 (img태그) -->
		<!-- 주석처리만으로는 오류나서 지워놨습니다 -->
	</div>
	<br>
</main>

<%@ include file="../import/bottom.jsp" %>