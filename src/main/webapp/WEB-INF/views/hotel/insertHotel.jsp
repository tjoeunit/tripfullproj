<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
		<form action="insertHotel.do" method="post" enctype="multipart/form-data">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="#58CCFF" width="70">사진1</td>
					<td><input type="file"  name = "HotelImgUpload"/></td>
					<!-- <input multiple="multiple" type="file"  name = "file"/>-->
				</tr>
					<tr>
					<td bgcolor="#58CCFF" width="70">사진2</td>
					<td><input type="file"  name = "HotelImgUpload"/></td>
					<!-- <input multiple="multiple" type="file"  name = "file"/>-->
				</tr>
					<tr>
					<td bgcolor="#58CCFF" width="70">사진3</td>
					<td><input type="file"  name = "HotelImgUpload"/></td>
					<!-- <input multiple="multiple" type="file"  name = "file"/>-->
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
					<td bgcolor="#58CCFF">내용</td>
					<td align="left"><input type="text" name="hotel_content" size="10" /></td>
				</tr>
				<tr>
					<td bgcolor="#58CCFF">지역</td>
					<td align="left"><input type="text" name="hotel_area" size="10" /></td>
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
		<a href="<c:url value='/hotel/getHotelList.do'/>">숙소 목록 보기</a>
	</center>
</body>
</html>