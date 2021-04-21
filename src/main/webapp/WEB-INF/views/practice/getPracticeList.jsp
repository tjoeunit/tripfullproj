<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>
<main>
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
		</tr>
	
	<c:forEach items="${practiceList}" var="practice">
		<tr>
			<td>${practice.practice_no}</td>
			<td ><a href="getPractice.do?practice_no=${practice.practice_no}">${practice.practice_title}</a></td>
		</tr>
	</c:forEach>
	</table>
</main>
<%@ include file="../import/bottom.jsp" %>