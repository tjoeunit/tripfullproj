package com.tjoeunit.view.admin;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tjoeunit.biz.admin.AdminService;
import com.tjoeunit.biz.admin.AdminVO;

@Controller
@RequestMapping("/adminLogin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//로깅을 위한 변수
    private static final Logger logger= 
            LoggerFactory.getLogger(AdminController.class);  
     

	@RequestMapping(value="/adminLogin.do", method=RequestMethod.GET)
	public String adminLoginPage() {
		System.out.println("관리자 로그인 페이지");
		return "adminLogin/adminLogin";
	}
	
	//관리자 로그인 처리
		@RequestMapping(value="/adminLogin.do", method=RequestMethod.POST)
		public String adminLoginCheck(AdminVO vo, HttpSession session) throws Exception {
		System.out.println("관리자 로그인 확인");

		AdminVO admin = adminService.adminLoginCheck(vo);
		
		session.setAttribute("admin_id", admin.getMembers_id());
		session.setAttribute("admin_pw", admin.getMembers_pw());
		
		//로그인 체크를 하기위한 메소드, 로그인 체크후 결과를 result 변수에 넣는다.
       // boolean result = adminService.adminLogin(vo);
		
		if(admin.getMembers_id() != null){
			if(admin.getMembers_pw().equals(vo)) {
			return "admin/adminIndex";
			}
		}else {
			//alert("아이디 와 비밀번호를 다시 확인해 주세요.");
			return "adminLogin/adminLogin";
		}

	}
}