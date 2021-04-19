<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminIndex</title>

<link rel="stylesheet" href="../resources/css/admin/lanTripEnroll.css">
 
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous">
</script>

</head>
<body>

  <div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->    
            <div class="top_gnb_area">
                <ul class="list">    
                    <li><a href="../index.jsp">메인 페이지</a></li>
                    <li><a href="/member/logout.do">로그아웃</a></li>
                    <li>고객센터</li>            
                </ul>
            </div>
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                 	<h2>상품</h2>
	                   <ul>
	                      <li >
	                          <a class="admin_list_01" href="./adminFlight.jsp">항공</a>
	                      </li>
	                      <li>
	                          <a class="admin_list_02" href="./adminAccomodations.jsp">숙박</a>
	                      </li>
	                      <li>
	                          <a class="admin_list_03" href="./adminActivity.jsp">액티비티</a>                            
	                      </li>
	                      <li>
	                          <a class="admin_list_04" href="/adminLanTrip.jsp">랜선여행</a>                            
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
                    <div class="admin_content_lantrip">
                    	<form  class="lan_table" action="insertLanTrip.do" method="post"  enctype="multipart/form-data">
							<table class="lan_enroll" border="1" cellpadding="0" cellspacing="0">
								<tr >
									<td bgcolor="#58CCFF" width="80%">제목</td>
									<td align="left" width="80%"><input type="text" name="lantrip_title" /></td>
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
        
        <!-- Footer 영역 -->
        <div class="footer_nav">
            <div class="footer_nav_container">
                <ul>
                    <li>회사소개</li>
                    <span class="line">|</span>
                    <li>이용약관</li>
                    <span class="line">|</span>
                    <li>고객센터</li>
                    <span class="line">|</span>
                </ul>
            </div>
        </div> <!-- class="footer_nav" -->
        
        <div class="footer">
            <div class="footer_container">
                
                <div class="footer_left">
                    <img src="../resources/img/Logo.png">
                </div>
                <div class="footer_right">
                    (주) TRIP FULL   대표이사 : OOO
                    <br>
                    사업자등록번호 : ooo-oo-ooooo
                    <br>
                    대표전화 : oooo-oooo(발신자 부담전화)
                    <br>
                    <br>
                    COPYRIGHT(C) <strong>www.tripfull.com</strong>    ALL RIGHTS RESERVED.
                </div>
                <div class="clearfix"></div>
            </div>
        </div> <!-- class="footer" -->        
        
    </div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->

</body>
</html>