<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ include file="../import/admintop.jsp" %>


<style type="text/css">

	.admin_subtitle {
		background-color: lightgray;
		padding: 10px 10px 10px 20px;
	}
	
	.admin_subtitle_name {
		display: inline-block;
		width: 85%;
		font-weight: 600;
		font-size: 30px;
	}
	
	table {
		width: 1200px;
		padding: 20px;
	}
	
	.table_td1 {
		width: 100px;
	}
	
	.insert_input {
		padding: 5px;
		width: 900px;
		border: none;
		background-color: lightgray;
	}
	
	.insert_submit {
		cursor: pointer;
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
		background-color: lightgray;
		border: none;
	}
	
	.insert_submit:hover {
		color: #fff !important;
		background: #383838;
	}
</style>

<script type="text/javascript">

// DB 1111오류 방지
	$(function(){
		$('form[name=update_Qna]').submit(function() { 
			if($('#qna_title').val().length < 1) {
				alert('제목을 확인하세요');
				$('#qna_title').focus();
				event.preventDefault();
				return false;
				
			} else if ($('#qna_content').val().length < 1) {
				alert('내용을 확인하세요');
				$('#qna_content').focus();
				event.preventDefault();
				return false;	
			
			}
	});
});
</script>

<main>

	<!-- ckeditor 4 -->	
	<script type="text/javascript" src="<c:url value='/ckeditor/ckeditor.js'/>"></script>
			
	<form name="update_Qna"action="<c:url value='/adminQna/adminQnaUpdate.do'/>" method="post"  enctype="multipart/form-data">
		<input type="hidden" name="qna_no" value="${ qna.qna_no }"/>
		
		<div class="admin_subtitle">
			<span class="admin_subtitle_name">QNA 답변하기</span>
			<span class="new_upload">
				<input type="submit" class="insert_submit" value=" 답변완료 " />
			</span>
		</div>
		
		<div>
			<table class="insert_table">
				<tr>
					<td class="table_td1">제목</td>
					<td><input type="text" class="insert_input" name="qna_title" id="qna_title" value="${ qna.qna_title }"/></td>
				</tr>
				
				<tr>
					<td class="table_td1">작성자</td>
					<td>${qna.qna_writer}</td>
				</tr>
				
				<tr>
					<td class="table_td1">내용</td>
					<td>
						<textarea name="qna_content" class="ckeditor" id="qna_content">${ qna.qna_content }</textarea>
						<script type="text/javascript">
							CKEDITOR.replace('qna_content', {height: 700, width: 900, filebrowserUploadUrl:'/qnaImage/imageUpload.do'});
						</script>
					</td>
				</tr>
								
			</table>
		</div>
	</form>
	
	

</main>

<%@ include file="../import/bottom.jsp" %>