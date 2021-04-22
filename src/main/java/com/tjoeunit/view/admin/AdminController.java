package com.tjoeunit.view.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tjoeunit.biz.admin.AdminService;
import com.tjoeunit.biz.admin.AdminVO;
import com.tjoeunit.biz.lantrip.LanTripService;
import com.tjoeunit.biz.lantrip.LanTripVO;
import com.tjoeunit.view.lantrip.LanTripController;



@Controller
/* @RequestMapping("/adminLogin") */
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private LanTripController lanTrip;
	
	@Autowired
	private LanTripService lanTripService;
	
	//로깅을 위한 변수
   // private static final Logger logger= 
           // LoggerFactory.getLogger(AdminController.class);  
     

	@RequestMapping(value="/adminLogin/adminLogin_View.do", method=RequestMethod.GET)
	public String adminLoginPage() {
		System.out.println("관리자 로그인 페이지");
		return "adminLogin/adminLogin";
	}
	
	//관리자 로그인 처리
		@RequestMapping(value="/adminLogin/adminLogin.do", method=RequestMethod.POST)
		public ModelAndView adminLoginCheck(AdminVO vo, HttpSession session, ModelAndView mav) {
		System.out.println("관리자 로그인 확인");

		String result = adminService.adminLoginCheck(vo);
        
        if(result != null){//로그인이 성공했을시 출력되는 구문
            session.setAttribute("admin_id", vo.getAdmin_id());
            session.setAttribute("admin_name", vo.getAdmin_name());
            
            mav.setViewName("admin/adminIndex"); //admin페이지를 보여줌
            mav.addObject("message", "success"); //mav안에 있는 addObject()메소드를 사용해 message라는 키에 sucess라는 value를 담아 보낸다
            System.out.println("관리자 로그인 체크성공");
        }else { 
            //로그인이 실패했을 시에 다시 관리자 로그인 페이지로 이동함
            mav.setViewName("adminLogin/adminLogin");
            //뷰에 전달할 값
            mav.addObject("message", "관리자의 아이디 혹은 비밀번호가 일치하지 않습니다.");
        }
        		System.out.println("관리자 로그인 확인2");
                return mav;
        }
		

		@RequestMapping(value="/admin/adminAccomodations.do", method=RequestMethod.GET)
		public String adminAccomodations() {
			System.out.println("숙박 페이지 이동 ");
			return "admin/adminAccomodations";
		}
		

		@RequestMapping(value="/admin/adminFlight.do", method=RequestMethod.GET)
		public String adminFlight() {
			System.out.println("항공 페이지 이동 ");
			return "/admin/adminFlight";
		}
		

		@RequestMapping(value="/admin/adminActivity.do", method=RequestMethod.GET)
		public String adminActivity() {
			System.out.println("액티비티 페이지 이동 ");
			return "admin/adminActivity";
		}
		

		@RequestMapping(value="/admin/adminLanTrip.do", method=RequestMethod.GET)
		public String adminLanTrip() {
			System.out.println("랜선여행 페이지 이동 ");
			return "adminLanTrip/insertLanTrip";
		}
		
		@RequestMapping(value="/admin/membersManage.do", method=RequestMethod.GET)
		public String membersManage() {
			System.out.println("회원관리 페이지 이동 ");
			return "admin/membersManage";
		}
		
		
		 //관리자 로그아웃 
	    @RequestMapping("/adminLogin/adminLogout.do")
	    public String logout(HttpSession session) {
	        session.invalidate();
	        //로그아웃을 시키려면 session에 있는 데이터를 삭제시켜야 하기 때문에 invalidate()메소드를 사용해서
	        //안에 있는 데이터를 초기화 시킨다.
	        System.out.println("관리자 로그아웃 ");
	        return "redirect:/adminLogin/adminLogin_View.do";
	    }
	    
	 // 글 목록 보기
		@RequestMapping(value="/getLanTripList.do", method = RequestMethod.GET)
		public String getLanTripList(LanTripVO vo, Model model) {
			System.out.println("랜선여행 목록 뷰");
			
			List<LanTripVO> lanTripList = lanTripService.getLanTripList(vo);
			
			model.addAttribute("lanTripList", lanTripList);
			
			return "lantrip/getLanTripList";
		}
	
}