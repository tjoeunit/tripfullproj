<%@page import="com.tjoeunit.biz.activity.ActivityVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>


<style type="text/css">	
	main {
		margin-left: 360px;
	}
	
	.activity_product_top{
		padding: 10px;
		margin-bottom: 20px;
		width: 1000px;
		border-bottom: 1px solid gray;
	}
	
	.activity_product_title {
		display: inline-block;
		width: 800px;
		font-size: 40px;
		font-weight: 600;
		text-align: left;
	}
	
	.activity_price {
		display: inline-block;
		position: relative;
		box-sizing: border-box;
		padding: 5px;
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
	
	.activity_video {
		
	}
	
	.activity_product_detail{
		width: 1000px;
		border-bottom: 1px solid gray;
		padding: 10px;
	}
	
	.activity_product_detail_area{
		color: gray;
		text-align: right;
	}
	
	.activity_product_thumb{
		width: 900px;
	}
	
	.activity_product_img {
		width: 900px;
		height: 1000px; /* 나중에 삭제 */
		background-color: #58CCFF;
	}
	
</style>

<main>

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
		<div class="activity_video">
			<iframe width="854" height="480" src="${ activity.activity_video }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>
			</iframe>
		</div>
		
		<!-- core의 if문 이용해서 코드 실행할 수 있게 함 null인 경우 skip될 수 있게 처리  jstl 이용해서  -->
		
		<div>
			<img class="activity_product_img" src="<c:url value='/activityUpload/${ activity.activity_img1 }'/>">
			<img class="activity_product_img" src="<c:url value='/activityUpload/${ activity.activity_img2 }'/>">
			<img class="activity_product_img" src="<c:url value='/activityUpload/${ activity.activity_img3 }'/>">
			<img class="activity_product_img" src="<c:url value='/activityUpload/${ activity.activity_img4 }'/>">
			<img class="activity_product_img" src="<c:url value='/activityUpload/${ activity.activity_img5 }'/>">
		</div>

<!-- =================================================================================== -->
		<div class="admin_content_wrap">
			<div class="admin_content_subject"><span>액티비티 관리</span></div>
				<div class="admin_content_activity">
					<form  class="activity_table" action="insertActivity.do" method="post"  enctype="multipart/form-data">
						<table class="activity_enroll" border="1" cellpadding="0" cellspacing="0">
							<tr >
								<td bgcolor="#58CCFF" width="100px">제목</td>
								<td align="left" width="80%"><input type="text" name="activity_title" /></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF" width="70">지역</td>
								<td align="left">
									<select name="activity_area">
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
								<td align="left"><input type="number" name="activity_price" />원</td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">내용</td>
								<td align="left"><textarea name="activity_content" cols="80" rows="10"></textarea></td>
							</tr>
<!-- 							<tr>
								<td bgcolor="#58CCFF">영상url</td>
								<td><input type="text" name="activity_video"/></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">썸네일</td>
								<td><input type="file" name="activityImgUpload"/></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">설명파일1</td>
								<td><input type="file" name="activityImgUpload"/></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">설명파일2</td>
								<td><input type="file" name="activityImgUpload"/></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">설명파일3</td>
								<td><input type="file" name="activityImgUpload"/></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">설명파일4</td>
								<td><input type="file" name="activityImgUpload"/></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">설명파일5</td>
								<td><input type="file" name="activityImgUpload"/></td>
							</tr> -->
							<tr>
								<td colspan="2" align="center">
								<input type="submit"value=" 새글 등록 " /></td>
							</tr>
						</table>
					</form>
				</div>
	
	
	
	<br>
</main>
<%@ include file="../import/bottom.jsp" %>