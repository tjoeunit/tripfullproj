<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminFight</title>

<link rel="stylesheet" href="../css/admin/adminMemberEnroll.css">
 
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
                    <li><a href="<c:url value='../index.do'/>">메인 페이지</a></li>
                    <li><a href="../adminLogin/adminLogout.do">로그아웃</a></li>
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
	                          <a class="admin_list_05" href="/adminMemberEnroll.jsp">고객등록</a>
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
                    <div class="admin_content_subject"><span>고객 등록</span></div>
                    <div class="admin_content_goods">
				    	<form action="/members/insertMembers.do" method="post">
							<table class="memberEnroll" border="1" cellpadding="0" cellspacing="0">
								<tr>
									<td>아이디</td>
									<td><input type="text" name="members_id"></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" name="members_pw"></td>
								</tr>
								<tr>
									<td>이름</td>
									<td><input type="text" name="members_name"></td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td><input type="text" name="members_tel"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" name="members_email"></td>
								</tr>
								<tr>
									<td>성별</td>
									<td>
										<select name="members_gender">
											<option value="남자">남자</option>
										    <option value="여자">여자</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>우편번호</td>
									<td><input type="text" name="members_zipcode"></td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" name="members_address"></td>
								</tr>
								<tr>
									<td>주소상세</td>
									<td><input type="text" name="members_address_detail"></td>
								</tr>
							</table>
							<input type="submit" value="가입하기">
							<input type="button" value="뒤로가기">
					  </form>                
				    </div>              
                    
					<div class="admin_content_goods_submit">                    
	                    <form action="flightEnroll.do">
	                   		 <input type="submit" value="등록">
	                    </form>
	                </div>
	                <div class="admin_content_goods_submit">    
	                   <form action="flightUpdate.do">
	                   		 <input type="submit" value="수정">
	                    </form>
	                </div>
	                <div class="admin_content_goods_submit">    
	                   <form action="flightDelete.do">
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