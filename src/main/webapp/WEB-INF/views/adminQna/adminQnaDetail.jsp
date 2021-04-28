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
		width: 900px;
		font-weight: 600;
		font-size: 30px;
	}
	
	.update_delete {
		width: 150px;
	}
	
	.update_delete a {
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
	
	.update_delete a:hover {
		color: #fff !important;
		background: #383838;
	}
	
	table {
		width: 1200px;
		padding: 20px;
	}
	
	.table_td1 {
		width: 100px;
	}
	
	.table_td2{
		padding: 5px;
		width: 900px;
		border: none;
		background-color: lightgray;
	}
	
</style>


<main>

	<input type="hidden" id="qna_writer" value="${qna.qna_writer}">		<!-- 작성자 -->
	<input type="hidden" name="qna_no" value="${qna.qna_no}" />
	<input type="hidden" id="members_id" value="${members_id}"> 		<!-- 세션 로그인된 id -->

	<div class="admin_subtitle">
		<span class="admin_subtitle_name">문의사항 상세보기</span>
		<span class="update_delete">
			<a href="<c:url value='/adminQna/adminQnaUpdate.do?qna_no=${ qna.qna_no }'/>">답변하기</a>
		</span>
		<span class="update_delete">
			<a href="<c:url value='/adminQna/adminQnaDelete.do?qna_no=${ qna.qna_no }'/>">삭제하기</a>
		</span>
	</div>
	
	<div>
		<div type="hidden" value="adminQnaDetail.do?qna_no=${ qna.qna_no }" ></div>
			<table class="detail_table">
				<tr>
					<td class="table_td1">제목</td>
					<td class="table_td2">${ qna.qna_title }</td>
				</tr>
				
				<tr>
					<td class="table_td1">작성자</td>
					<td class="table_td2">${ qna.qna_writer }</td>
				</tr>
				
				<tr>
					<td class="table_td1">등록일</td>
					<td class="table_td2">${ qna.qna_date }</td>
				</tr>
				
				<tr>
					<td class="table_td1">내용</td>
					<td></td>
				</tr>
			</table>
			
			<div class="ck_content">${ qna.qna_content }</div>

	</div>

</main>

<%@ include file="../import/bottom.jsp" %>