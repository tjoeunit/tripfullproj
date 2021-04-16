package com.tjoeunit.view.adminLogin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tjoeunit.biz.members.MembersService;
import com.tjoeunit.biz.members.MembersVO;

@Controller
@RequestMapping("/adminLogin")
public class adminLoginController {

	@Autowired
	private MembersService membersService;

	@RequestMapping(value="/adminLogin.do", method=RequestMethod.GET)
	public String insertMembersPage() {
		System.out.println("관리자 로그인 페이지");
		return "adminLogin/adminLogin";
	}
	
	//관리자 로그인
		@RequestMapping(value="/adminLogin.do", method=RequestMethod.POST)
		public String getMembers(MembersVO vo, HttpSession session) throws Exception {
		System.out.println("관리자 로그인 확인");

		MembersVO members = membersService.getMembers(vo);
		
		if(members.equals(members.getMembers_id())=="admin"){
			session.setAttribute("membersName", members.getMembers_name());
			return "admin/adminIndex";
		}else {
			return "adminLogin/adminLogin";
		}

	}
}