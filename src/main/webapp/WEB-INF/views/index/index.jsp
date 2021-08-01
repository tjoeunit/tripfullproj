<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<style>
	.mainDiv {
		margin-top: 10px;
		width: 1200px;
	}
	
	.productDiv {
		width: 270px;
		background-color: white;
		display: inline-block;
		margin: 20px 10px;
		border-radius: 5px;
		overflow: hidden;
		box-shadow: 2px 2px 5px gray;
	}
	
	.productThumDiv {
		width: 270px;
		height: 270px;
		margin-left: auto;
		margin-right: auto;
	}
	
	.productDivInfo {
		padding: 5px;
		text-align: center;
	}
	
	.productDivInfoName {
		color: #58595b;
		font-size: 32px;
		margin-top: 0;
		margin-bottom: 10px;
		font-weight: 600;
	}
	
</style>

<main>
	<div class="mainDiv">
		<img src="<c:url value='/img/indeximg1.jpg'/>" id="indexImage" style="width: 1200px;">		
		<script type="text/javascript">
			var myImage=document.getElementById("indexImage");
			var imageArray=["<c:url value='/img/indeximg1.jpg'/>", "<c:url value='/img/indeximg2.jpg'/>", "<c:url value='/img/indeximg3.jpg'/>"
				, "<c:url value='/img/indeximg4.jpg'/>", "<c:url value='/img/indeximg5.jpg'/>"];
			var imageIndex=0;
			
			function changeImage(){
				myImage.setAttribute("src", imageArray[imageIndex]);
				imageIndex++;
								
				if(imageIndex>=imageArray.length){
					imageIndex=0;
				}
			}
			
			setInterval(changeImage, 4000);		
		</script>

		<div>
			<a href="<c:url value='/flight/getFlightList.do'/>">	
				<div class="productDiv">
				    <img src="<c:url value='/img/indexthumb1.jpg'/>" class="productThumDiv">
				    	<div class="productDivInfo">
					      <div class="productDivInfoName">항공권</div>
					      <div>트립풀이 준비한 특가 항공권</div>
				    	</div>
				  </div>
			  </a>
			  
			  <a href="<c:url value='/hotel/getHotelList.do'/>">
				  <div class="productDiv">
				    <img src="<c:url value='/img/indexthumb2.jpg'/>" class="productThumDiv">
				    	<div class="productDivInfo">
					      <div class="productDivInfoName">숙박</div>
					      <div>호텔 예약 할인받고 떠나요!</div>
				    	</div>
				  </div>
			  </a>
			  
			  <a href="<c:url value='/activity/getActivityList.do'/>">
				  <div class="productDiv">
				    <img src="<c:url value='/img/indexthumb3.jpg'/>" class="productThumDiv">
				    	<div class="productDivInfo">
					      <div class="productDivInfoName">액티비티</div>
					      <div>전국 방방곡곡 액티비티</div>
				    	</div>
				  </div>
			  </a>
			  
			  <a href="<c:url value='/lantrip/getLanTripList.do'/>">
				  <div class="productDiv">
				    <img src="<c:url value='/img/indexthumb4.jpg'/>" class="productThumDiv">
				    	<div class="productDivInfo">
					      <div class="productDivInfoName">랜선투어</div>
					      <div>영상으로는 어디든 떠날 수 있다!</div>
				    	</div>
				  </div>
			  </a>
		</div>

		<div>
			<a href="<c:url value='/story/getStoryList.do'/>">
				<img src="<c:url value='/img/story01.jpg'/>" style="width:1200px">
			</a>
		</div>		
	</div>
</main>

<%@ include file="../import/bottom.jsp" %>