<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminFight</title>

<link rel="stylesheet" href="../resources/css/admin/adminFlight.css">
 
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
                    <div class="admin_content_subject"><span>항공 관리</span></div>
                    <div class="admin_content_goods"></div>
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