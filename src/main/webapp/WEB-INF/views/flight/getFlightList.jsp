<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">
	a{
		text-decoration: none;
	}

	.main_title {
		align-content: left;
		font-size: 40px;
		font-weight: 600;
	}

	.flight_products{
		width: 1000px;
		margin-right: auto;
		margin-bottom: 30px;
	}

	.flight_product {
		border-bottom: 1px solid gray;
		border-top: 1px solid gray;
		margin-right: auto;
		padding: 5px;
	}

	.flight_product_thumb {
		width: 200px;
		height: 200px;
		border: 1px solid gray;
	}

	.flight_product_title {
		width : 600px;
		height : 90px;
		padding: 10px;
	}

	.flight_product_title a{
		color: black;
		font-size: 2em;
		font-weight: 600;
	}

	.flight_product_title:hover {
		font-size: 1.2em;
	}

	.flight_product_detail {
		width : 600px;
		height : 90px;
		padding: 10px;
		color: gray;
	}

	.flight_product_departure{
		width: 150px;
		padding: 10px;
		text-align: right;
	}

	.flight_price {
		width: 150px;
		position: relative;
		box-sizing: border-box;
		color: black;
		text-align: center;
		font-weight: 600;
		line-height: 1.5em;
		padding: 0 1.25em;
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
	}

	.flight_price:hover{
		text-decoration: none;
		color: #fff !important;
		background: #383838;
		cursor: pointer;
	}

</style>

<!-- 페이징 JSP 추가작업 1 -->
<!-- 페이징 옵션 처리 자바스크립트 시작 -->
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "<c:url value='/flight/getFlightList.do?nowPage=${paging.nowPage}&cntPerPage="+sel+"'/>";
	}
</script>
<!-- 페이징 옵션 처리 자바스크립트 끝 -->

<main>
	<br>
	<div class="main_title">항공권</div>

	<!-- 페이징 JSP 추가작업 2 -->
	<!-- 페이징 옵션 시작 -->
	<select id="cntPerPage" name="sel" onchange="selChange()">
		<option value="10"
			<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개 보기</option>
		<option value="20"
			<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개 보기</option>
	</select>
	<!-- 페이징 옵션 끝 -->

	<table class="flight_products">
		<tr>
			<c:forEach items="${flightList}" var="flight">
			<table class="flight_product">
				<tr>
					<td rowspan="3"><img class="flight_product_thumb" src="<c:url value='/flightUpload/${flight.flight_thumb}'/>"></td>
					<td class="flight_product_title"><a href="<c:url value='getFlight.do?flight_no=${flight.flight_no}'/>">${flight.flight_title}</a></td>
					<td class="flight_product_departure">${flight.flight_departure}</td>
				</tr>
				<tr>
					<!-- CK 에디터 사용 시 삭제해야함 ! 목록에 이미지가 뜸
						<td class="flight_product_detail">${flight.flight_content}</td>
					-->
					<td class="flight_price" onclick="location.href='#'">${flight.flight_price}원에<br>구매하기</td>
				</tr>
			</table>
			</c:forEach>
		</tr>
	</table>

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
