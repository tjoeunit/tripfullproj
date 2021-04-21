<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style type="text/css">	
	a{
			text-decoration: none;
		}

	.main_title {
		align-content: left;
	}
	
	.lan_filter {
		border: 1px solid #58CCFF;
		width: 1000px;
		margin-right: auto;
		margin-bottom: 20px;
	}
	
	.lan_filter_name {
		color: #58CCFF;
	}
	
	.lan_filter ul li {
		color: #000000;
		padding-left: 30px;
		display: inline;
	}
	
	.lan_products{
		width: 1000px;
		margin-right: auto;
		margin-bottom: 30px;
	}
	
	.lan_product {
		border-bottom: 1px solid gray;
		border-top: 1px solid gray;
		margin-right: auto;
		padding: 5px;
	}

	.lan_product_thumb {
		width: 200px;
		height: 200px;
		border: 1px solid gray;
	}
	
	.lan_product_title {
		width : 600px;
		height : 90px;
		padding: 10px;
	}
	
	.lan_product_title a{
		color: black;
		font-size: 2em;
		font-weight: 600;
	}
	
	.lan_product_title:hover {
		font-size: 1.2em;
	}
	
	.lan_product_detail {
		width : 600px;
		height : 90px;
		padding: 10px;
		color: gray;
	}
	
	.lan_product_city{
		width: 150px;
		padding: 10px;
		text-align: right;
	}
	
	.lan_price {
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
	
	.lan_price:hover{
		text-decoration: none;
		color: #fff !important;
		background: #383838;
		cursor: pointer;
	}
	
</style>

<main>
	
	<br>
	<h1 class="main_title">	랜선여행</h1>
	
	<div class="lan_filter">
		<ul class="lan_filter_name">여행지
			<li><input type="checkbox">아시아</li>
			<li><input type="checkbox">유럽</li>
			<li><input type="checkbox">북아메리카</li>
			<li><input type="checkbox">남아메리카</li>
			<li><input type="checkbox">아프리카</li>
			<li><input type="checkbox">오세아니아</li>
		</ul>
		<ul class="lan_filter_name">평점
			<li><input type="radio" checked="checked">전체</li>
			<li><input type="radio">4점 이상</li>
			<li><input type="radio">5점만</li>
		</ul>
		<ul class="lan_filter_name">가격대
			<li><input type="number">원 이하</li>
		</ul>
	</div>
	
	<table class="lan_products">
	
		<tr>
			<c:forEach items="${ lanTripList }" var="lantrip">
			<table class="lan_product">
			
				<tr>
					<td rowspan="3"><img class="lan_product_thumb" src="<c:url value='/lanTripUpload/${ lantrip.lantrip_thumb }'/>"></td>
					<td class="lan_product_title"><a href="<c:url value='getLanTrip.do?lantrip_no=${ lantrip.lantrip_no }'/>">${ lantrip.lantrip_title }</td></a>
					<td class="lan_product_city">${ lantrip.lantrip_area }</td>
				</tr>
				<tr>
					<td class="lan_product_detail">${ lantrip.lantrip_content }</td>
					<td class="lan_price" onclick="location.href='#'">${ lantrip.lantrip_price }원에<br>구매하기</td>
				</tr>
			</table>
			</c:forEach>
		</tr>
	</table>
	<br>

<!-- 랜선여행 등록 페이지 ============================================================================== -->
		<div class="admin_content_wrap">
			<div class="admin_content_subject"><span>랜선여행 관리</span></div>
				<div class="admin_content_lantrip">
					<form  class="lan_table" action="insertLanTrip.do" method="post"  enctype="multipart/form-data">
						<table class="lan_enroll" border="1" cellpadding="0" cellspacing="0">
							<tr >
								<td bgcolor="#58CCFF" width="100px">제목</td>
								<td align="left" width="80%"><input type="text" name="lantrip_title" /></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF" width="70">지역</td>
								<td align="left">
									<select name="lantrip_area">
										<option value="아시아">아시아</option>
										<option value="유럽">유럽</option>
										<option value="북아메리카">북아메리카</option>
										<option value="남아메리카">남아메리카</option>
										<option value="아프리카">아프리카</option>
										<option value="오세아니아">오세아니아</option>
									</select>
								</td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF" width="70">가격</td>
								<td align="left"><input type="number" name="lantrip_price" />원</td>
							</tr>
							<tr>
						.		<td bgcolor="#58CCFF">내용</td>
								<td align="left"><textarea name="lantrip_content" cols="80" rows="10"></textarea></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">영상url</td>
								<td><input type="text" name="lantrip_video"/></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">썸네일</td>
								<td><input type="file" name="lanTripImgUpload"/></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">상세설명 이미지</td>
								<td><input type="file" name="lanTripImgUpload"/></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
								<input type="submit"value=" 새글 등록 " /></td>
							</tr>
						</table>
					</form>
				</div>
	
</main>


<%@ include file="../import/bottom.jsp" %>