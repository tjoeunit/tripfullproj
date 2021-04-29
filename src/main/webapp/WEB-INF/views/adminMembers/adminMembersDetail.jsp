<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/admintop.jsp" %>

<main>
회원정보
<input type="text" value="${members.members_id}"><br>
<input type="text" value="${members.members_name}"><br>
<input type="text" value="${members.members_tel}"><br>
<input type="text" value="${members.members_email}"><br>
<input type="text" value="${members.members_regdate}"><br>
<input type="text" value="${members.members_gender}"><br>
<input type="text" value="${members.members_zipcode}"><br>
<input type="text" value="${members.members_address}"><br>
<input type="text" value="${members.members_address_detail}">
</main>


<%@ include file="../import/bottom.jsp" %>