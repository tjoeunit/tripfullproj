package com.tjoeunit.view.story;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tjoeunit.biz.members.MembersService;
import com.tjoeunit.biz.members.MembersVO;
import com.tjoeunit.biz.story.StoryService;
import com.tjoeunit.biz.story.StoryVO;

@Controller
@RequestMapping("/story")
public class StoryController {
	
	@Autowired
	private StoryService storyService;
	private MembersService membersService;

// 글 등록 페이지 불러오기
	@RequestMapping(value="/insertStoryPage.do", method=RequestMethod.GET)
	public String insertStoryPage() throws IOException {
		System.out.println("스토리 등록 페이지 호출");
		return null;
	}

	
// 글 등록
	@RequestMapping(value="/insertStory.do", method=RequestMethod.POST)
	public String insertStory(StoryVO vo, Model model) throws Exception {
		System.out.println("여행이야기 등록 처리");

		int cnt = storyService.insertStory(vo);
		
		String msg="여행이야기 등록 실패", url="/story/insertStoryPage.do";

		if(cnt>0) {
			msg="여행이야기 등록 성공";
			url="/story/getStoryList.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
// 글 수정
	@RequestMapping("/updateStory.do")
											//사용자로부터 전달 받은 TITLE과 CONTENT 값 업데이트
	public String updateStory(@ModelAttribute("story") StoryVO vo) {		//storyVO에 값을 담아 "story "에 담아줌
		System.out.println("스토리 수정 처리" +vo);
		// 1. 사용자 입력 정보 추출(Spring이 대신 해줌.생략 가능)
		
		// 2. DB 연동 처리
		storyService.updateStory(vo);
		// 3. 화면 전환
		return "redirect:getStoryList.do";
	}
	
// 글 삭제
	@RequestMapping("/deleteStory.do")
	public String deleteStory(StoryVO vo) {
		System.out.println("스토리 삭제 기능 처리");
				
		storyService.deleteStory(vo);
		
		return "redirect:getStoryList.do";
	}
	

	
// 글 목록 보기
	@RequestMapping(value="/getStoryList.do",  method = RequestMethod.GET)
	public String getStoryList(StoryVO vo, Model model) {	//ModelAndView의 Model 딴에 있는 변수를 매개변수로

		List<StoryVO> storyList = storyService.getStoryList(vo);
				
		model.addAttribute("storyList", storyList);		//key Value
		
		System.out.println("스토리 목록 보기");
		return "story/getStoryList";

	}

// 글 상세 조회
	@RequestMapping(value="/getStory.do",  method = RequestMethod.GET)
	public String getStory(StoryVO vo, Model model) {
		System.out.println("스토리 상세 조회 처리");
		
		storyService.viewCountStory(vo);
		
		StoryVO story = storyService.getStory(vo);
		
		model.addAttribute("story", story);
		
		
		return "story/getStory";
	}
}
