package com.tjoeunit.view.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjoeunit.biz.members.MembersService;
import com.tjoeunit.biz.members.MembersVO;

@Controller
@RequestMapping("/members")
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

		String msg="회원 가입 실패", url="/members/insertMembers.do";

		if(cnt>0) {
			msg="회원 가입 성공";
			url="/index.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("member_id", vo.getMembers_id());

		return "common/message";

	}
	
	//회원 등록 시 아이디 중복 확인
	@RequestMapping("/checkIdDup.do")
	@ResponseBody
	public int checkIdDup(@RequestParam String members_id) {
		System.out.println("members_id = "+members_id);
		int cnt = membersService.checkIdDup(members_id);
		System.out.println("cnt = "+cnt);
		return cnt;
	}
	
/*	
	// 글 수정
		@RequestMapping("/updateMembers.do")
												//사용자로부터 전달 받은 TITLE과 CONTENT 값 업데이트
		public String updateMembers(@ModelAttribute("members") MembersVO vo) {		
			System.out.println("고객정보 수정 처리" +vo);
			// 1. 사용자 입력 정보 추출(Spring이 대신 해줌.생략 가능)
			
			// 2. DB 연동 처리
			membersService.updateMembers(vo);
			// 3. 화면 전환
			return "redirect:getMembersList.do";
		}
		
	// 글 삭제
		@RequestMapping("/deleteMembers.do")
		public void deleteMembers(MembersVO vo) {
			System.out.println("고객 삭제 기능 처리");
					
			membersService.deleteMembers(vo);
			
			return;
		}
	
	// RequestMapping이 실행되기 직전에 이 메소드가 먼저 호출 되어진다.(model에 값이 들어감)
		@ModelAttribute("/conditionMap.do")		//"conditionMap"에 return 값을 저장
		public Map<String, String> searchConditionMap() {
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("제목", "TITLE");
			conditionMap.put("내용", "CONTENT");
			return conditionMap;
		}

	// 고객 목록 보기
		@RequestMapping("/getMembersList.do")
//		public String getMembersList(MembersVO vo, Model model) {	//ModelAndView의 Model 딴에 있는 변수를 매개변수로
			System.out.println("글 목록 검색 처리");
		// 검색 기능 추가 Null check

			if(vo.getMembersSearchCondition() == null) {
				vo.setMembersSearchCondition("TITLE");
			}
			
			if(vo.getMembersSearchKeyword() == null) {
				vo.setMembersSearchKeyword("");
			}
			
			model.addAttribute("membersList", membersService.getMembersList(vo));		//key Value
			
			return "/members/getMembersList.jsp";

		}

	// 글 상세 조회
		@RequestMapping("/getMembers.do")
		public String getMembers(MembersVO vo, Model model) {
			System.out.println("글 상세 조회 처리");
			
	//		MembersVO members = membersService.getMembers(vo);
			
	//		model.addAttribute("members", members);
			
			return "/members/getMembers.jsp";
		}
	}	
*/
}