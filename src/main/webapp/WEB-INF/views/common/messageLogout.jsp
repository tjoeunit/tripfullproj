<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>common/messageLogout.jsp</title>
</head>

<!-- 로그아웃을 컨트롤러를 통해 세션정보가 삭제되고 보여주는 페이지 -->
<!-- 뒤로가기를 막아줌 -->
<script type="text/javascript">
	window.history.forward();
	function noBack(){window.history.forward();}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

	<script type="text/javascript">
		alert('${msg}');
		location.href="<c:url value='${url}'/>";
	</script>
	
</body>
</html>