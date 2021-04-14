<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../import/top.jsp" %>

<style type="text/css">	
	.MainTitle {
		margin-left: 360px;
	}
	
	.LanTable {
		margin-left: 360px;
	}
	
</style>

<main>
	
	<h1 class="MainTitle">	상품등록</h1>
	
	<form  class="LanTable" action="insertLanTrip.do" method="post"  enctype="multipart/form-data">
		<table border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="#58CCFF" width="70">제목</td>
				<td align="left"><input type="text" name="lantrip_title" /></td>
			</tr>
			<tr>
				<td bgcolor="#58CCFF" width="70">지역</td>
				<td align="left"><input type="text" name="lantrip_area" /></td>
			</tr>
			<tr>
				<td bgcolor="#58CCFF" width="70">가격</td>
				<td align="left"><input type="number" name="lantrip_price" />원</td>
			</tr>
			<tr>
				<td bgcolor="#58CCFF">내용</td>
				<td align="left"><textarea name="lantrip_content" cols="40" rows="10"></textarea></td>
			</tr>
			<tr>
				<td bgcolor="#58CCFF">썸네일</td>
				<td><input type="file" name="lantrip_thumb"/></td>
			</tr>
			<tr>
				<td bgcolor="#58CCFF">설명파일</td>
				<td><input type="file" name="lantrip_img" multiple="multiple"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value=" 새글 등록 " /><input type="submit"
					value=" 뒤로가기 " /></td>
			</tr>
		</table>
	</form>
		<hr>
		 
</main>
<%@ include file="../import/bottom.jsp" %>