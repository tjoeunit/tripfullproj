<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<main>
항공권
	<form action="insertFlight.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="flight_title" /></td>
			</tr>
			<tr>
				<td>출발지</td>
				<td>
					<select name="flight_departure">
						<option value="서울" selected="selected">서울</option>
						<option value="부산">부산</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>도착지</td>
				<td>
					<select name="flight_arrival">
						<option value="서울" selected="selected">서울</option>
						<option value="부산">부산</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="flight_price"/>원</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="flight_content" cols="80" rows="10"></textarea></td>
			</tr>			
			<tr>
				<td>썸네일</td>
				<td><input type="file" name="flightImgUpload"/></td>
			</tr>
			<tr>
				<td>설명파일</td>
				<td><input type="file" name="flightImgUpload"/></td>
			</tr>
			<tr>
				<td><input type="submit"value="등록하기" /></td>
				<td><input type="button"value="뒤로가기" /></td>
			</tr>
		</table>
	</form>
</main>

<%@ include file="../import/bottom.jsp" %>