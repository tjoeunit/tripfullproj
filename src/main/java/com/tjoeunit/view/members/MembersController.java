package com.tjoeunit.view.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tjoeunit.biz.members.MembersService;
import com.tjoeunit.biz.members.MembersVO;

@Controller
public class MembersController {

	@Autowired
	private MembersService membersService;
	
	@RequestMapping(value="/insertMembers.do", method=RequestMethod.GET)
	public String insertMembersPage() {
		System.out.println("회원가입뷰");
		return "members/insertMembers";
	}
	
	//회원 등록
	@RequestMapping(value="/insertMembers.do", method=RequestMethod.POST)
	public String insertMembers(MembersVO vo, Model model) throws Exception {
	System.out.println("회원가입처리");		
		
		int cnt = membersService.insertMembers(vo);
		
		String msg="회원 가입 실패", url="insertMembers.do";
		
		if(cnt>0) {
			msg="회원 가입 성공";
			url="index.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}
		
}



