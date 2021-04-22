<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<%@ include file="../import/admintop.jsp" %>
   
<link rel="stylesheet" href="../css/admin/insertLanTrip.css">

<main>

  <div class="wrapper">
        <div class="wrap">
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                 	<h2>상품</h2>
	                  <ul>
	                      <li >
	                          <a class="admin_list_01" href="../admin/adminFlight.do">항공</a>
	                      </li>
	                      <li>
	                          <a class="admin_list_02" href="../admin/adminAccomodations.do">숙박</a>
	                      </li>
	                      <li>
	                          <a class="admin_list_03" href="../admin/adminActivity.do">액티비티</a>                            
	                      </li>
	                      <li>
	                          <a class="admin_list_04" href="../admin/adminLanTrip.do">랜선여행</a>                            
	                      </li>
	                    </ul>
	                <h2>고객</h2>
	                  <ul>
	                      <li >
	                          <a class="admin_list_05" href="/admin/memberEnroll">고객등록</a>
	                      </li>
	                      <li>
	                          <a class="admin_list_06" href="/admin/membersList">고객목록</a>
	                      </li>
	                      <li>
	                          <a class="admin_list_07" href="/admin/membersManage">고객관리</a>                            
	                      </li>                                                                                             
	                  </ul><br>
	                <h2>여행이야기</h2>                  
                </div> 
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>랜선여행 관리</span></div>
                    <div class="admin_content_wrap">
			<div class="admin_content_subject"><span>랜선여행 관리</span></div>
				<div class="admin_content_lantrip">
					<form  class="lan_table" action="insertLanTrip.do" method="post"  enctype="multipart/form-data">
						<table class="lan_enroll" border="1" cellpadding="0" cellspacing="0">
							<tr >
								<td bgcolor="#58CCFF" width="100px">제목</td>
								<td align="left" width="80%"><input type="text" name="lantrip_title" /></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF" width="70">지역</td>
								<td align="left">
									<select name="lantrip_area">
										<option value="아시아">아시아</option>
										<option value="유럽">유럽</option>
										<option value="북아메리카">북아메리카</option>
										<option value="남아메리카">남아메리카</option>
										<option value="아프리카">아프리카</option>
										<option value="오세아니아">오세아니아</option>
									</select>
								</td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF" width="70">가격</td>
								<td align="left"><input type="number" name="lantrip_price" />원</td>
							</tr>
							<tr>
						.		<td bgcolor="#58CCFF">내용</td>
								<td align="left"><textarea name="lantrip_content" cols="80" rows="10"></textarea></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">영상url</td>
								<td><input type="text" name="lantrip_video"/></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">썸네일</td>
								<td><input type="file" name="lanTripImgUpload"/></td>
							</tr>
							<tr>
								<td bgcolor="#58CCFF">상세설명 이미지</td>
								<td><input type="file" name="lanTripImgUpload"/></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
								<input type="submit"value=" 새글 등록 " /></td>
							</tr>
						</table>
					</form>
				</div>
	
					<div class="admin_content_goods_submit">                    
	                    <form action="./lanTripEnroll.do">
	                   		 <input type="submit" value="등록">
	                    </form>
	                </div>
	                <div class="admin_content_goods_submit">    
	                   <form action="updateLanTrip.do">
	                   		 <input type="submit" value="수정">
	                    </form>
	                </div>
	                <div class="admin_content_goods_submit">    
	                   <form action="deleteLanTrip.do">
	                   		 <input type="submit" value="삭제">
	                    </form>  
                     </div>                                     
                </div> 
                <div class="clearfix"></div> 
            </div>
        
    </div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->

</main>

<%@ include file="../import/bottom.jsp" %>