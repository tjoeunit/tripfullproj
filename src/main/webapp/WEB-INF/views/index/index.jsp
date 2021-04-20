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
		height: 350px;
		border: 1px solid gray;
		margin: 11px;
		display: inline-block;
	}
	
	.productThumDiv {
		width: 270px;
		height: 300px;
		border: 1px solid gray;
	}
	
</style>

<main>
	<div class="mainDiv">
		<img src="<c:url value='/img/indeximg1.jpg'/>" id="indexImage" style="width: 1200px;">		
		<script type="text/javascript">
			var myImage=document.getElementById("indexImage");
			var imageArray=["<c:url value='/img/indeximg1.jpg'/>", "<c:url value='/img/indeximg2.jpg'/>", "<c:url value='/img/indeximg3.jpg'/>"];
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
			세션에 저장되었는지 보여주기 위해 임시로 생성
			<input type="text" value="${members_id}">
			<div>
				
				<div class="productDiv">
					<div class="productThumDiv">항공이미지</div>
					<div>설명</div>
				</div>
				<div class="productDiv">
					<div class="productThumDiv">숙박이미지</div>
					<div>설명</div>					
				</div>
				<div class="productDiv">
					<div class="productThumDiv">액티비티이미지</div>
					<div>설명</div>
				</div>
				<div class="productDiv">
					<div class="productThumDiv">랜선투어이미지</div>
					<div>설명</div>
				</div>
			</div>
		</div>
		
		<div>
			<img src="<c:url value='/img/tripstoryimg.png'/>" style="width:1200px">			
		</div>		
	</div>
</main>

<%@ include file="../import/bottom.jsp" %>