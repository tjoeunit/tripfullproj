<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/admintop.jsp" %>

<style type="text/css">
	
	.admin_subtitle {
		background-color: lightgray;
		padding: 10px 10px 10px 20px;
	}
	
	.admin_subtitle_name {
		font-size: 30px;
		display: inline-block;
		width: 1000px;
		font-weight: 600;
	}
	
	.new_upload {
		width: 150px;
	}
	
	.new_upload a {
		display: inline-block;
		font-size: 25px;
		text-decoration: none;
		color: black;
		font-weight: 600;
		border-radius: 5px;
		-moz-transition: background-color .2s ease-in-out;
		-webkit-transition: background-color .2s ease-in-out;
		-ms-transition: background-color .2s ease-in-out;
		transition: background-color .2s ease-in-out;
		padding: 10px;
	}
	
	.new_upload a:hover {
		color: #fff !important;
		background: #383838;
	}
	
	.list_table {
		width: 1160px;
		margin: 20px;
		border-collapse: collapse;
		border-bottom: 3px solid gray;
	}
	.list_table th{
		border-bottom: 3px solid gray;
		padding: 5px;
	}
	
	.list_th1 {
		width: 5%;
	}
	.list_th2 {
		width: 65%;
	}
	.list_th3 {
		width: 10%;
	}
	.list_th4 {
		width: 10%;
	}
	.list_th5 {
		width: 10%;
	}
	
	td {
		padding: 5px;
		text-align: center;
	}
	
	.list_product_title {
		text-align: left;
	}
	
	.list_product_title a {
		text-decoration: none;
		color: black;
	}
	
</style>

<!-- 페이징 JSP 추가작업 1 -->
<!-- 페이징 옵션 처리 자바스크립트 시작 -->
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "<c:url value='/adminFlight/adminFlight.do?nowPage=${paging.nowPage}&cntPerPage="+sel+"'/>";		
	}
</script>
<!-- 페이징 옵션 처리 자바스크립트 끝 -->

<main>
	<div class="admin_subtitle">
		<span class="admin_subtitle_name">항공권 관리</span>
		<span class="new_upload">
			<a href="<c:url value='/adminFlight/insertFlight.do'/>">상품 등록</a>
		</span>
	</div>
	
	<!-- 페이징 JSP 추가작업 2 -->
	<!-- 페이징 옵션 시작 -->
	<select id="cntPerPage" name="sel" onchange="selChange()">
		<option value="10"
			<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개 보기</option>
		<option value="20"
			<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개 보기</option>
	</select>
	<!-- 페이징 옵션 끝 -->
	
	<table class=list_table>
		<tr>
			<th class="list_th1">번호</th>
			<th class="list_th2">제목</th>
			<th class="list_th3">출발</th>
			<th class="list_th4">도착</th>
			<th class="list_th5">가격</th>
		</tr>
		
		<c:forEach items="${ flightList }" var="flight">
			<tr>
				<td>${ flight.flight_no }</td>
				<td class="list_product_title"><a href="<c:url value='/adminFlight/adminFlightDetail.do?flight_no=${ flight.flight_no }'/>">${ flight.flight_title }</a></td>
				<td>${ flight.flight_departure }</td>
				<td>${ flight.flight_arrival }</td>
				<td>${ flight.flight_price }원</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 페이징 JSP 추가작업 3 -->
	<!-- 페이징 하단 숫자 시작 -->
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="<c:url value='/adminFlight/adminFlight.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}'/>">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">							
					<a href="<c:url value='/adminFlight/adminFlight.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}'/>">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">					
			<a href="<c:url value='/adminFlight/adminFlight.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}'/>">&gt;</a>
		</c:if>
	</div>
	<!-- 페이징 하단 숫자 끝 -->

</main>

<%@ include file="../import/bottom.jsp" %>
