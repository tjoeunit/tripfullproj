<%@page contentType="text/html; charset=UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">

	.main_title {
		align-content: left;
		font-size: 40px;
		font-weight: 600;
		margin: 20px 0px;
	}
	
	.insert_table {
		width: 1200px;
		padding: 20px;
	}
	
	.table_td1 {
		width: 100px;
	}
	
	.insert_input {
		padding: 5px;
		width: 1052px;
		border: none;
		background-color: lightgray;
	}
	
	.ckeditor {
		width: 100%;
	}
	
	.new_post_button {
		text-align: right;
	}
	
	.new_post {
		text-decoration: none;
		display:inline-block;
		margin: 10px;
		padding: 10px;
		border-radius: 5px;
		border: 1px solid gray;
		color: black;
		background-color: white;
	}
	
	.new_post:hover {
		box-shadow: 1px 1px 3px gray;
		border: 1px solid gray;
	}
		
	/* 별점별점 #2 */
	.starR1 {
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	
	/* 별점별점 #2 */
	.starR2 {
	    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	    background-size: auto 100%;
	    width: 15px;
	    height: 30px;
	    float:left;
	    text-indent: -9999px;
	    cursor: pointer;
	}
	
	/* 별점별점 #2 */
	.starR1.on{background-position:0 0;}
	.starR2.on{background-position:-15px 0;}
	
	
</style>

<!-- 제목, 내용 null check -->
<script type="text/javascript">
	$(function() {
		$('form[name=enroll_story]').submit(function() {
						
			if($('#story_title').val().length < 1) {
				alert('제목을 입력하세요.');
				$('#story_title').focus();
				event.preventDefault();
				return false;	
				
			} else if(CKEDITOR.instances['story_content'].getData()=="") {
				alert('내용을 입력하세요.');
				CKEDITOR.instances['story_content'].focus();
				event.preventDefault();
				return false;
			}
			
		});
	});	

	// 별점별점 #2 출력		
	$(function() {
		if($('#pcount').val() == 10){
			$('.xx:lt(10)').addClass('on');
		}else if($('#pcount').val() == 9){
			$('.xx:lt(9)').addClass('on');
		}else if($('#pcount').val() == 8){
			$('.xx:lt(8)').addClass('on');
		}else if($('#pcount').val() == 7){
			$('.xx:lt(7)').addClass('on');
		}else if($('#pcount').val() == 6){
			$('.xx:lt(6)').addClass('on');
		}else if($('#pcount').val() == 5){
			$('.xx:lt(5)').addClass('on');
		}else if($('#pcount').val() == 4){
			$('.xx:lt(4)').addClass('on');
		}else if($('#pcount').val() == 3){
			$('.xx:lt(3)').addClass('on');
		}else if($('#pcount').val() == 2){
			$('.xx:lt(2)').addClass('on');
		}else if($('#pcount').val() == 1){
			$('.xx:lt(1)').addClass('on');
		}
	});
	
	/*
	// 별점별점 입력
	$(function() {
		$('.starRev span').click(function(){
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});
	});
	
	$(function() {
		$('#starZeroHalf').click(function(){
			$('#starcount').val(1);	
		});
		
		$('#starOne').click(function(){
			$('#starcount').val(2);
		});
		
		$('#starOneHalf').click(function(){
			$('#starcount').val(3);
		});
		
		$('#starTwo').click(function(){
			$('#starcount').val(4);
		});
		
		$('#starTwoHalf').click(function(){
			$('#starcount').val(5);
		});
		
		$('#starThree').click(function(){
			$('#starcount').val(6);
		});
		
		$('#starThreeHalf').click(function(){
			$('#starcount').val(7);
		});
		
		$('#starFour').click(function(){
			$('#starcount').val(8);
		});
		
		$('#starFourHalf').click(function(){
			$('#starcount').val(9);
		});
		
		$('#starFive').click(function(){
			$('#starcount').val(10);
		});
		
	}); 
	*/
	
	
</script>

<main>

<!-- ckeditor 4 -->
 	<script type="text/javascript" src = "<c:url value = '/ckeditor/ckeditor.js' />"></script>
 	
 	<div class="main_title">여행이야기</div>
	<hr>
 	
 	<form action="insertStory.do" name="enroll_story" method="post" enctype="multipart/form-data">
 		
		<input type="hidden" name="members_no" value="${members_no}">
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td class="table_td2"><input type="text" name="story_title" id="story_title" class="insert_input" placeholder = "제목을 입력하세요"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">작성자</td>
					<td class="table_td2"><input type="text" name="story_writer" class="insert_input" value="${members_id}" readonly></td>
				</tr>
				
				<tr>
					<td class="table_td1">내용</td>
					<td class="table_td2">
						<textarea name="story_content" class="ckeditor"></textarea>
						<script type="text/javascript">
						CKEDITOR.replace('story_content', {height: 700, filebrowserUploadUrl:'/storyImage/imageUpload.do'});
						</script>
					</td>
				</tr>
			</table>			
			
			<!-- 별점별점 #2 -->
			<div class="starRev">
				<span id="starZeroHalf" class="xx starR1">별1_왼쪽</span>
				<span id="starOne" class="xx starR2">별1_오른쪽</span>
				<span id="starOneHalf" class="xx starR1">별2_왼쪽</span>
				<span id="starTwo" class="xx starR2">별2_오른쪽</span>
				<span id="starTwoHalf" class="xx starR1">별3_왼쪽</span>
				<span id="starThree" class="xx starR2">별3_오른쪽</span>
				<span id="starThreeHalf" class="xx starR1">별4_왼쪽</span>
				<span id="starFour" class="xx starR2">별4_오른쪽</span>
				<span id="starFourHalf" class="xx starR1">별5_왼쪽</span>
				<span id="starFive" class="xx starR2">별5_오른쪽</span>
				
				
			</div>
			<br>
			<br>
			<input type="text" id="starcount" value="1"><span>입력</span>
			<br>
			<input type="text" id="pcount" value="5"><span>출력</span>		
				
			
			
			<div class="new_post_button">
				<input type="submit" class=" new_post" value=" 등록하기 "/>
				<input type="button" onclick="history.back()" class=" new_post" value=" 뒤로가기 "/>
			</div>
					
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>