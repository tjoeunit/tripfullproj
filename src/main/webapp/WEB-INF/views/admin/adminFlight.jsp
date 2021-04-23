<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../import/admintop.jsp" %>

<link rel="stylesheet" href="<c:url value='/css/admin/adminLanTrip.css'/>">

<main>
<div class="wrapper">
	<div class="wrap">	
		<!-- contents-area -->
		<div class="admin_wrap">
			<!-- 네비영역 -->
				<div class="admin_navi_wrap">
					<h2>상품</h2>
						<ul>
							<li>
							    <a class="admin_list_01" href="../admin/adminFlight.do">항공</a>
							</li>
							<li>
							    <a class="admin_list_02" href="../admin/adminAccomodations.do">숙박</a>
							</li>
							<li>
							    <a class="admin_list_03" href="../admin/adminActivity.do">액티비티</a>
							</li>
							<li>
							    <a class="admin_list_04" href="../admin/adminLanTrip.do">랜선여행</a>
							</li>
						</ul>
					<h2>고객</h2>
						<ul>
							<li>
								<a class="admin_list_05" href="/admin/memberEnroll">고객등록</a>
							</li>
							<li>
								<a class="admin_list_06" href="/admin/membersList">고객목록</a>
							</li>
							<li>
								<a class="admin_list_07" href="/admin/membersManage">고객관리</a>
							</li>
						</ul><br>
					<h2>여행이야기</h2>
				</div>
				<div class="admin_content_wrap">
					<div class="admin_content_top">
						<span class="admin_content_subject">랜선여행 관리</span>
						<span class="admin_content_goods_submit">
							<a href="<c:url value='/adminLanTrip/insertLanTrip.do'/>">등록</a>
						</span>
					</div>
		
					<div class="admin_content_goods">
		
						<table class=lan_list_table>
							<tr class="top_lan_list">
								<th class="lan_no">번호</th>
								<th class="lan_title">제목</th>
								<th class="lan_area">지역</th>
								<th class="lan_price">가격</th>
							</tr>
		
						<c:forEach items="${ lanTripList }" var="lantrip">
							<tr>
								<td>${ lantrip.lantrip_no }</td>
								<td><a href="<c:url value='getLanTrip.do?lantrip_no=${ lantrip.lantrip_no }'/>">${ lantrip.lantrip_title }</td></a>
								<td>${ lantrip.lantrip_area }</td>
								<td>${ lantrip.lantrip_price }원</td>
							</tr>
						</c:forEach>
						</table>		
					</div>
				</div>
			<div class="clearfix"></div>
		</div>	
	</div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->

</main>

<%@ include file="../import/bottom.jsp" %>
