<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호텔등록</title>
</head>
<body>
	<center>
		<h1>호텔 등록</h1>
		<hr>
		<form action="/hotel/insertHotel.do" method="post" enctype="multipart/form-data">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="#58CCFF" width="70">썸네일</td>
					<td><input type="file" name = "hotel_thumb"/></td>
				</tr>
				<tr>
					<td bgcolor="#58CCFF">제목</td>
					<td align="left"><input type="text" name="hotel_title" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="#58CCFF">카테고리</td>
					<td align="left"><input type="text" name="hotel_category" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="#58CCFF">가격</td>
					<td><input type="number" name = "hotel_price"/></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="호텔 등록" /></td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="getHotelList.jsp">호텔 목록 가기</a>
	</center>
</body>
</html>