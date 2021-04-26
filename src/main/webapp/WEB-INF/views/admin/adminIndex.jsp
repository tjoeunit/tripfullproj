<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../import/admintop.jsp" %>

<!-- <link rel="stylesheet" href="../css/admin/adminIndex.css"> -->

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
                    <div class="admin_content_subject"><span>관리자 메인화면</span></div>
                    <div class="admin_content_goods"></div>
					<div class="admin_content_goods_submit">
	<!--                     <form action="">
	                   		 <input type="submit" value="등록">
	                    </form>
	                </div>
	                <div class="admin_content_goods_submit">
	                   <form action="">
	                   		 <input type="submit" value="수정">
	                    </form>
	                </div>
	                <div class="admin_content_flight_submit">
	                   <form action="">
	                   		 <input type="submit" value="삭제">
	                    </form>   -->
                     </div>
                </div>
                <div class="clearfix"></div>
            </div>
    </div>    <!-- class="wrap" -->
</div>    <!-- class="wrapper" -->

</main>

<%@ include file="../import/bottom.jsp" %>
