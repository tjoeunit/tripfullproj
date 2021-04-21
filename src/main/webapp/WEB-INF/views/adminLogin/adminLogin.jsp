<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../import/top.jsp" %>

<script>
//button을 클릭하면 아이디와 비밀번호를 처리해서 Controller에 있는 login_check로 맵핑시킨다.
//아이디와 비밀번호를 받아 처리하는 자바스크립트 구문
/* $(function(){
    $("#btnLogin").click(function(){       //밑에 있는 button태그로 쓴 id값이  이쪽으로 맵핑되서 넘어오고, click()메소드 안에 함수가 실행 
        var admin_id=$("#admin_id").val();     
        var admin_pw=$("#admin_pw").val();     
        if(admin_id == ""){                   //admin_id에 아무것도 입력이 되지 않으면
            alert("아이디를 입력하세요.");       //경고창 출력
            $("#admin_id").focus();          //focus()메소드는 커서를 옮겨놓는 효과, 그러니까 아이디 입력창에 자동으로 커서가 옮겨져 있는다. 깜빡이게끔
            return;
        }
        
        if(admin_pw==""){                    
            alert("비밀번호를 입력하세요.");   
            $("#admin_pw").focus();        
            return;
        }
        
        document.form1.action = "${path}/admin/adminLogin.do";  // form1 폼을 Controller의 adminLogin에 맵핑
        document.form1.submit(); //자료전송
    });
});
  */
</script>

<style type="text/css">
	.admin_login {
	  box-sizing: border-box;
	  width: 500px;
	  background-color: #EEEFF1;
	  padding: 20px;
	  margin: 50px auto;
	  border: none;
	  border-radius: 5px;
	}
	
	.admin_login_field {
	  font-size: 16px;
	  padding: 20px 10px;
	  margin: 20px 0px;
	  border-radius: 5px;
	  border: none;
	  width: 440px;
	}
	
	.admin_login_submit {
	  font-size: 16px;
	  padding: 20px 10px;
	  margin: 30px 0px;
	  border-radius: 5px;
	  border: none;
	  width: 100%;
	  text-align: center;
	  background-color: #58CCFF;
	  cursor: pointer;
	}
</style>

<main>
	<center>
		<h1>관리자 로그인</h1>
		
		<!-- <form  name="form1" method="post"> -->
		<div class="admin_login">
			<form  action="adminLogin.do"  method="post">
				<input type="text" class="admin_login_field" placeholder="아이디">
				<input type="password" class="admin_login_field" placeholder="비밀번호">
				<input type="submit" class="admin_login_submit" value="로그인" />
					<!-- 	<button type="button" id="btnLogin" >로그인</button> -->
<%-- 						
						<c:if test="${param.message == 'nologin' }">
                        	<div style="color: red;">먼저 로그인하세요.</div>
                    	</c:if> 
                    	
                    	<c:if test="${message == 'error' }">
                        	<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
                    	</c:if> 
                    	
                    	<c:if test="${message == 'logout' }">
                        	<div style="color: red;">로그아웃되었습니다.</div>
                    	</c:if> 
  --%>
			</form>
		</div>
	</center>

</main>

<%@ include file="../import/bottom.jsp" %>