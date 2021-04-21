package com.tjoeunit.view.practice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tjoeunit.biz.practice.PracticeService;
import com.tjoeunit.biz.practice.PracticeVO;
import com.tjoeunit.biz.story.StoryVO;


@Controller
@RequestMapping("/practice")
public class PracticeController {
	
	@Autowired
	private PracticeService practiceService;
	
		//글 등록 페이지 불러오기
		@RequestMapping(value="/insertPractice.do", method=RequestMethod.GET)
		public String insertPracticePage() {
			System.out.println("연습 등록 페이지 호출");
			return "practice/insertPractice";
		}
		
		//글 등록
		@RequestMapping(value="/insertPractice.do", method=RequestMethod.POST)
		public String insertPractice(PracticeVO vo, Model model) {
			
			int cnt = practiceService.insertPractice(vo);

			String msg="글 등록 실패", url="/practice/insertPractice.do";

			if(cnt>0) {
				msg="글 등록 성공";
				url="/index.do";
			}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";			
		}
		
		//글 목록
		@RequestMapping(value="/getPracticeList.do",  method = RequestMethod.GET)
		public String getStoryList(PracticeVO vo, Model model) {	//ModelAndView의 Model 딴에 있는 변수를 매개변수로

			List<PracticeVO> practiceList = practiceService.getPracticeList(vo);
			
			model.addAttribute("practiceList", practiceList);		//key Value
			
			System.out.println("스토리 목록 보기");
			return "practice/getPracticeList";

		}
		
		//글 상세
		@RequestMapping(value="/getPractice.do",  method = RequestMethod.GET)
		public String getPractice(PracticeVO vo, Model model) {
			System.out.println("글 상세 조회 처리");
			
			PracticeVO practice = practiceService.getPractice(vo);
			
			model.addAttribute("practice", practice);			
			
			return "practice/getPractice";
		}
		
		
}
