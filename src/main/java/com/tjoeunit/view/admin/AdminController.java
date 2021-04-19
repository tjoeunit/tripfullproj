package com.tjoeunit.view.admin;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tjoeunit.biz.admin.AdminService;
import com.tjoeunit.biz.admin.AdminVO;

@Controller
@RequestMapping("/adminLogin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//로깅을 위한 변수
   // private static final Logger logger= 
           // LoggerFactory.getLogger(AdminController.class);  
     

	@RequestMapping(value="/adminLogin_View.do", method=RequestMethod.GET)
	public String adminLoginPage() {
		System.out.println("관리자 로그인 페이지");
		return "adminLogin/adminLogin";
	}
	
	//관리자 로그인 처리
		@RequestMapping(value="/adminLogin.do", method=RequestMethod.POST)
		public ModelAndView adminLoginCheck(AdminVO vo, HttpSession session, ModelAndView mav) {
		System.out.println("관리자 로그인 확인");

		String result = adminService.adminLoginCheck(vo);
        
        if(result != null){//로그인이 성공했을시 출력되는 구문
            session.setAttribute("admin_id", vo.getAdmin_id());
            session.setAttribute("admin_name", vo.getAdmin_name());
            
            mav.setViewName("admin/adminIndex"); //admin페이지를 보여줌
            mav.addObject("message", "success"); //mav안에 있는 addObject()메소드를 사용해 message라는 키에 sucess라는 value를 담아 보낸다
            
            }else { 
                //로그인이 실패했을 시에 다시 관리자 로그인 페이지로 이동함
                mav.setViewName("adminLogin/adminLogin");
                //뷰에 전달할 값
                mav.addObject("message", "관리자의 아이디 혹은 비밀번호가 일치하지 않습니다.");
            }
        
                return mav;
        }
	
}