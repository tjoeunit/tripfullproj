package com.tjoeunit.view.story;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.story.StoryService;
import com.tjoeunit.biz.story.StoryVO;

@Controller
@SessionAttributes("story")
public class StoryController {
	@Autowired
	private StoryService storyService;
	
// 글 등록
	@RequestMapping("/insertStory.do")
	public String insertStory(StoryVO vo, HttpSession session) throws IOException {
		System.out.println("글 등록 처리");
		
		// 파일 업로드 처리
		String storyFileSaveFolder = session.getServletContext().getRealPath("/storyUpload/");
		
		MultipartFile storyUploadFile = vo.getStoryUploadFile();
		if(!storyUploadFile.isEmpty()) {
			String storyFileName = storyUploadFile.getOriginalFilename();
			storyUploadFile.transferTo(new File(storyFileSaveFolder+storyFileName));
			
		}
		
		// JavaBean의 필드 이름과, JSP 내의 파라미터 이름이 동일하다면 Annotation으로 등록할 시에 따로 추출할 필요없이 Spring이 알아서 추출해서 값을 담아준다.
		// 즉 전의 프로젝트와 달리 따로 코드를 적을 필요가 없어진다.
		
		
		// 2. DB 연동 처리
		storyService.insertStory(vo);
		
	/*	BoardVO vo = new BoardVO();
		
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContent(content);
		
		boardDAO.insertBoard(vo);
		*/
		
		// 3. 화면 전환
		return "redirect:getStoryList.do";
	}
	
// 글 수정
	@RequestMapping("/updateStory.do")
											//사용자로부터 전달 받은 TITLE과 CONTENT 값 업데이트
	public String updateStory(@ModelAttribute("story") StoryVO vo) {		//boardVO에 값을 담아 "board"에 담아줌
		System.out.println("글 수정 처리" +vo);
		// 1. 사용자 입력 정보 추출(Spring이 대신 해줌.생략 가능)
		
		// 2. DB 연동 처리
		storyService.updateStory(vo);
		// 3. 화면 전환
		return "redirect:getStoryList.do";
	}
	
// 글 삭제
	@RequestMapping("/deleteStory.do")
	public String deleteStory(StoryVO vo) {
		System.out.println("글 삭제 기능 처리");
				
		storyService.deleteStory(vo);
		
		return "redirect:getStoryList.do";
	}
	
// RequestMapping이 실행되기 직전에 이 메소드가 먼저 호출 되어진다.(model에 값이 들어감)
	@ModelAttribute("conditionMap.do")		//"conditionMap"에 return 값을 저장
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	
// 글 목록 보기
	@RequestMapping("/getStoryList.do")
	public String getStoryList(StoryVO vo, Model model) {	//ModelAndView의 Model 딴에 있는 변수를 매개변수로
		System.out.println("글 목록 검색 처리");
	// 검색 기능 추가 Null check

		if(vo.getStorySearchCondition() == null) {
			vo.setStorySearchCondition("TITLE");
		}
		
		if(vo.getStorySearchKeyword() == null) {
			vo.setStorySearchKeyword("");
		}
		
		model.addAttribute("storyList", storyService.getStoryList(vo));		//key Value
		
		return "getStoryList.jsp";

	}

// 글 상세 조회
	@RequestMapping("/getStory.do")
	public String getStory(StoryVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
		
		StoryVO story = storyService.getStory(vo);
		
		model.addAttribute("story", story);
		
		return "getStory.jsp";
	}
}
