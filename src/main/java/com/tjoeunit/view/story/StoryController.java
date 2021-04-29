package com.tjoeunit.view.story;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.story.StoryReplyService;
import com.tjoeunit.biz.story.StoryReplyVO;
import com.tjoeunit.biz.story.StoryService;
import com.tjoeunit.biz.story.StoryVO;

@Controller
public class StoryController {
	
	@Autowired
	private StoryService storyService;
	
	@Autowired
	private StoryReplyService replyService;

// 글 등록 페이지 불러오기
	@RequestMapping(value="/story/insertStoryPage.do", method=RequestMethod.GET)
	public String insertStoryPage() throws IOException {
		System.out.println("여행 이야기 등록 페이지 호출");
		return null;
	}

	
// 글 등록
	@RequestMapping(value="/story/insertStory.do", method=RequestMethod.POST)
	public String insertStory(StoryVO vo, Model model) throws Exception {
		System.out.println("여행이야기 등록 처리");

		int cnt = storyService.insertStory(vo);
		
		String msg="여행 이야기 등록 실패", url="/story/insertStoryPage.do";

		if(cnt>0) {
			msg="등록되었습니다.";
			url="/story/getStoryList.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	
// 글 수정 페이지 불러오기
	@RequestMapping(value="/story/updateStoryPage.do", method=RequestMethod.GET)
	public String updateStoryPage(StoryVO vo, Model model) throws IOException {
		
		System.out.println("여행 이야기 수정 페이지 호출");
		StoryVO story = storyService.getStory(vo);
		
		model.addAttribute("story", story);
		return null;
	}

	
// 글 수정
	@RequestMapping("/story/updateStory.do")
	
	public String updateStory(StoryVO vo, Model model) throws Exception {
		
		System.out.println("여행 이야기 수정 처리");

		int cnt = storyService.updateStory(vo);
		
		String msg="수정 실패", url="/story/updateStoryPage.do";

		if(cnt>0) {
			msg="수정되었습니다.";
			url="/story/getStory.do?story_no="+vo.getStory_no();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
// 글 삭제
	@RequestMapping("/story/deleteStory.do")
	public String deleteStory(StoryVO vo, Model model) throws Exception {
		System.out.println("여행 이야기 삭제 기능 처리");
		
		storyService.deleteStory(vo);
		
		String msg="삭제되었습니다.";
		String url="/story/getStoryList.do";
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	

	
/* 글 목록 보기 : 페이징 처리 전
	@RequestMapping(value="/getStoryList.do",  method = RequestMethod.GET)
	public String getStoryList(StoryVO vo, Model model) {	//ModelAndView의 Model 딴에 있는 변수를 매개변수로

		List<StoryVO> storyList = storyService.getStoryList(vo);
				
		model.addAttribute("storyList", storyList);		//key Value
		
		System.out.println("여행 이야기 목록 보기");
		return "story/getStoryList";

	}
*/
	
// 글 목록 보기 : 페이징 처리 후
	@RequestMapping(value="/story/getStoryList.do", method = RequestMethod.GET)
	public String storyListPaging(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		
		int total = storyService.countStory();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("storyList", storyService.selectStory(vo));
		return "story/getStoryList";
	}		
	

// 글 상세 조회
	@RequestMapping(value="/story/getStory.do",  method = RequestMethod.GET)
	public String getStory(StoryVO vo, Model model) {
		System.out.println("여행 이야기 상세 조회 처리");
		
		//조회수 처리
		storyService.viewCountStory(vo);
		
		StoryVO story = storyService.getStory(vo);
		
		//댓글 처리
		List<StoryReplyVO> replyList = replyService.getReplyList(story.getStory_no());
		
		model.addAttribute("replyList", replyList);
		model.addAttribute("story", story);
		
		return "story/getStory";
	}

	
// 댓글 작성
	@RequestMapping(value="/story/replyWrite.do", method = RequestMethod.POST)
	public String replyWrite(StoryVO vo, StoryReplyVO rvo, Model model) throws Exception {
		System.out.println("댓글 등록 처리");

		int cnt = replyService.createReply(rvo);
		
		String msg="댓글 등록 실패", url="/story/getStory.do?story_no="+vo.getStory_no();

		if(cnt>0) {
			msg="댓글이 등록되었습니다.";
			url="/story/getStory.do?story_no="+vo.getStory_no();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}

// 댓글 삭제 뷰 get
	@RequestMapping(value="/story/replyDeleteView.do", method = RequestMethod.GET)
	public String replyDeleteView(StoryReplyVO rvo, Model model){
		System.out.println("댓글 삭제 뷰 호출");
		return null;
	}
	
//댓글 삭제
	@RequestMapping(value="/story/replyDelete.do", method = RequestMethod.POST)
	public String replyDelete(StoryReplyVO rvo, Model model, StoryVO vo) throws Exception {
		System.out.println("댓글 삭제 기능 처리");
		
		replyService.deleteReply(rvo);
		
		String msg="댓글이 삭제되었습니다.";
		String url="/story/getStory.do?story_no="+vo.getStory_no();
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
}
