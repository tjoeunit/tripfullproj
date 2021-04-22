<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./adminBasic.jsp" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminIndex</title>

<link rel="stylesheet" href="../css/admin/adminIndex.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

</head>
<body>
		<div class="admin_content_wrap">
                  <div class="admin_content_subject"><span>관리자 메인</span></div>

	관리자 메인 페이지 입니다. 무슨 내용을 여기 올릴까요????
		<div>
			<img class="lan_product_img" src="<c:url value='/lanTripUpload/${ lantrip.lantrip_img1 }'/>">
			<img class="lan_product_img" src="<c:url value='/lanTripUpload/${ lantrip.lantrip_img2 }'/>">
			<img class="lan_product_img" src="<c:url value='/lanTripUpload/${ lantrip.lantrip_img3 }'/>">
			<img class="lan_product_img" src="<c:url value='/lanTripUpload/${ lantrip.lantrip_img4 }'/>">
			<img class="lan_product_img" src="<c:url value='/lanTripUpload/${ lantrip.lantrip_img5 }'/>">
		</div>
	
</body>
</html>