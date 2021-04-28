<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">	
	.main_title {
		align-content: left;
		font-size: 40px;
		font-weight: 600;
		margin: 20px 0px;
	}
	
	.page_select_box {
		text-align: right;
	}
	
	.page_select {
		padding: 5px;
		border: 1px solid gray;
		margin-right: 20px;
	}

	.product_list {
		padding: 20px 0px;
	}
	
	.product {
		width: 270px;
		background-color: white;
		display: inline-block;
		margin: 20px 10px;
		border-radius: 5px;
		border: 1px solid gray;
		overflow: hidden;
	}
	
	.product:hover {
		box-shadow: 2px 2px 5px gray;
	}
	
	.product_thumb {
		width: 270px;
		height: 195px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 10px;
	}
	
	.product_area {
		color: gray;
		text-align: left;
		padding-left: 20px;
	}
	
	.product_title {
		color: black;
		font-size: 20px;
		font-weight: 600;
		margin: 5px;
		text-align: left;
		padding: 0px 15px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	
	.product_price {
		color: #58ccff;
		text-align: left;
		padding: 0px 20px 20px 20px;
	}
	
</style>

<!-- 페이징 JSP 추가작업 1 -->
<!-- 페이징 옵션 처리 자바스크립트 시작 -->
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="getFlightList.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<!-- 페이징 옵션 처리 자바스크립트 끝 -->

<main>	

	<div class="main_title">항공권</div>
	<hr>

	<!-- 페이징 JSP 추가작업 2 -->
	<!-- 페이징 옵션 시작 -->
	<div class="page_select_box">
	<select id="cntPerPage" name="sel" onchange="selChange()" class="page_select">
		<option value="5"
			<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5개씩 보기</option>
		<option value="10"
			<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개씩 보기</option>
		<option value="15"
			<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15개씩 보기</option>
		<option value="20"
			<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개씩 보기</option>
	</select>
	</div>
	<!-- 페이징 옵션 끝 -->
	
	<div	class="product_list">
		<c:forEach items="${flightList}" var="flight">
			<a href="<c:url value='getFlight.do?flight_no=${flight.flight_no}'/>">
				<div class="product">
					<img class="product_thumb" src="<c:url value='/flightUpload/${flight.flight_thumb}'/>">
					<div>
						<div class="product_area">${flight.flight_departure}</div>
						<div class="product_title">${flight.flight_title}</div>
						<div class="product_price">${flight.flight_price} 원</div>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
	
	<!-- 페이징 JSP 추가작업 3 -->
	<!-- 페이징 하단 숫자 시작 -->
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="<c:url value='/flight/getFlightList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">							
					<a href="<c:url value='/flight/getFlightList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">					
			<a href="<c:url value='/flight/getFlightList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
		</c:if>
	</div>
	
	<!-- 페이징 하단 숫자 끝 -->
	<br>

</main>

<%@ include file="../import/bottom.jsp" %>