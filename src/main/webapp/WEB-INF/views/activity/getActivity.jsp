<%@page import="com.tjoeunit.biz.activity.ActivityVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>


<style type="text/css">
	main {
		margin-left: 360px;
	}

	.activity_div{
		width: 1200px;
	}

	.activity_product_thumb{
		width: 400px;
		height: 300px;
	}

	.activity_product_title {
		display: inline-block;
		width: 1200px;
		font-size: 40px;
		font-weight: 600;
		text-align: left;
	}

	.activity_buy {
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

	.activity_buy:hover {
		color: #fff !important;
		background: #383838;
	}

	.activity_product_detail{
		width: 1200px;
		padding: 10px;
	}

	.activity_product_detail_area{
		color: gray;
		text-align: right;
	}

	.activity_product_img {
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
		$('#delete_activity').click(function() {
			var msg = confirm('${activity.activity_title} 을(를) 삭제하시겠습니까?');	
			if (msg) {
				//true
				location.href = "<c:url value ='/activity/deleteActivity.do?activity_no=${activity.activity_no}'/>";
			} else {
				//false
				event.preventDefault;
				location.href = "<c:url value='/activity/getActivity.do?activity_no=${activity.activity_no}'/>";
			}
		});
		
		$('#update_activity').click(function() {
			var msg = confirm('${activity.activity_title} 을(를) 수정하시겠습니까?');	
			if (msg) {
				//true
				location.href = "<c:url value='/activity/updateActivity.do?activity_no=${activity.activity_no}'/>";
			} else {
				//false
				event.preventDefault;
				location.href = "<c:url value='/activity/getActivity.do?activity_no=${activity.activity_no}'/>";
			}
		});	
	});	
</script>
<main>
	<div class="activity_div">
		<div class="info_div">
		<div class="edit_div">
				<input type="button" value="숙박권 수정하기" id="update_activity">			
			</div>
			<div class="delete_activity_div">
				<input type="button" value="숙박권 삭제하기" id="delete_activity">
			</div>
			<div class="thumb_div">
				<img class="activity_product_thumb" src="<c:url value='/activityUpload/${activity.activity_thumb}'/>">
			</div>

			<div class="title_div">
				<div>
					<span class="activity_product_title">${activity.activity_title}</span>
				</div>
				<div>
					<%-- <span>카테고리 : ${activity.activity_category}</span><br> --%>
					<span>지역 : ${activity.activity_area}</span><br>
					<span>가격 : ${activity.activity_price}원</span><br>
					

				</div>
				<div class="buy_div">
					<a href="#"><span class="activity_buy">구매하기</span></a>
				</div>
			</div>

		</div>

		<div class="clear_div">
		<!-- float: left 제거를 위함 -->
		</div>
		<!-- 숙박 상세 설명 -->
		<div class="activity_product_detail">
			설명 : ${activity.activity_content}
		</div>		
	</div>
<!-- 액티비티 제목 표현식에 있는 activity은 컨트롤러에서 model의 키값으로 정의한 것 사용 -->
	<div type="hidden" value="getActivity.do?activity_no=${ activity.activity_no }">
		<div class="activity_product_top">
			<span class="activity_product_title">${ activity.activity_title }</span>
			<span class="activity_price">${ activity.activity_price }원</span>
			<a href="#"><span class="activity_buy">구매하기</span></a>
		</div>

<!-- 액티비티 상세 설명 -->
	
		<div class="activity_product_detail">
			<div class="activity_product_detail_area">${ activity.activity_area }</div>
			<div>${ activity.activity_content }</div>
		</div>
		<div><img class="activity_product_thumb" src="<c:url value='/activityUpload/${ activity.activity_thumb }'/>"></div>
<%-- 		<div class="activity_video">
			<iframe width="854" height="480" src="${ activity.activity_video }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
			</iframe>
		</div>
 --%>	
	
	<br>
</main>
<%@ include file="../import/bottom.jsp" %>