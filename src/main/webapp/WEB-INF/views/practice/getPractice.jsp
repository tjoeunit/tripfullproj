<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>
<main>

	<div>
		<span>제목</span><br>
		${practice.practice_title}
	</div><br>
	<div>
		<span>내용</span>
		${practice.practice_content}
	</div><br>

</main>
<%@ include file="../import/bottom.jsp" %>