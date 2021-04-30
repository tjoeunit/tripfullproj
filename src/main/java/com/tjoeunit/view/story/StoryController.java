package com.tjoeunit.view.story;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

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
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "20";
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
			
			storyService.viewCountStory(vo);
			StoryVO story = storyService.getStory(vo);
			model.addAttribute("story", story);
			
			//댓글 목록 조회
			List<StoryReplyVO> replyList = replyService.getReplyList(vo.getStory_no());
			model.addAttribute("replyList", replyList);
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

		
	// 댓글 삭제
	@RequestMapping(value= "/story/replyDelete.do", method=RequestMethod.GET)
	public String replyDelete(StoryReplyVO rvo, Model model, StoryVO vo, HttpSession session) throws Exception {
		System.out.println("댓글 삭제 처리");
		
		// 댓글을 보여줄 때 c:foreach로 보여주기 때문에 jsp x 컨트롤러 o
		// 로그인 중인 회원의 아이디와 댓글 작성자의 아이디를 비교 세션에 아이디 값이 없는 경우도 처리
		System.out.println("스토리 번호 = "+vo.getStory_no());
		System.out.println("코멘트 번호 = "+rvo.getReply_no());

		// 세션을 통해 로그인 중인 회원의 아이디를 추출
		String session_id = "";
		
		if(session.getAttribute("members_id") != null) {
			session_id = (String)session.getAttribute("members_id");
		}
		
		System.out.println("로그인 회원 아이디 = "+session_id);
				
		// 댓글번호를 통해 댓글 작성자의 아이디를 추출
		String reply_id = replyService.selectIdByReplyNo(rvo.getReply_no());
		System.out.println("댓글 작성자 아이디 = "+reply_id);
						
		String msg = "";
		String url = "";
		
		// 세션에 아이디 없음
		if(session_id.isEmpty()) {
			System.out.println("로그인 중인 아이디 없음");
			msg = "로그인이 필요한 서비스입니다";
			url = "/story/getStory.do?story_no="+vo.getStory_no();
			
		// 아이디가 같은 경우 (메서드 실행)
		}else if(session_id.equals(reply_id)) {
			System.out.println("아이디 일치");
			msg = "댓글이 삭제되었습니다";
			url = "/story/getStory.do?story_no="+vo.getStory_no();			
			replyService.deleteReply(rvo);
		
		// 아이디가 다른 경우
		}else {
			System.out.println("아이디 불일치");
			msg = "아이디가 일치하지 않습니다";
			url = "/story/getStory.do?story_no="+vo.getStory_no();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
 
		return "common/message";
	}
		
		
		
		
/* 관리자 관련 컨트롤러 */
		
	// adminStory로 이동
		@RequestMapping(value="/adminStory/adminStory.do", method=RequestMethod.GET)
		public String adminStory(PagingVO vo, Model model,
				@RequestParam(value="nowPage", required=false) String nowPage,
				@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
			
			System.out.println("여행이야기 관리자 목록으로 이동");
		
			int total = storyService.countStory();
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "20";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "20";
			}
			
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", vo);
			model.addAttribute("storyList", storyService.selectStory(vo));
			return "/adminStory/adminStory";
		}
		
	// 글 상세 조회
		@RequestMapping(value="/adminStory/adminStoryDetail.do",  method = RequestMethod.GET)
		public String adminStoryDetail(StoryVO vo, Model model) {
			System.out.println("여행 이야기 관리자 상세 조회 처리");
				
				StoryVO story = storyService.getStory(vo);
				model.addAttribute("story", story);
				
				//댓글 목록 조회
				List<StoryReplyVO> replyList = replyService.getReplyList(vo.getStory_no());
				model.addAttribute("replyList", replyList);
				return "adminStory/adminStoryDetail";
			}
		
	// 사용자 댓글 삭제
		@RequestMapping(value= "/adminStory/adminReplyDelete.do", method=RequestMethod.GET)
		public String adminReplyDelete(StoryReplyVO rvo, Model model, StoryVO vo) throws Exception {
			System.out.println("댓글 삭제 처리");
			
			replyService.deleteReply(rvo);
			
			String msg="[관리자] 댓글을 삭제했습니다.";
			String url="/adminStory/adminStoryDetail.do?story_no="+vo.getStory_no();
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
	 
			return "common/message";
		}

	// 부적합한 게시글 삭제
		@RequestMapping("/adminStory/adminStoryDelete.do")
		public String adminStoryDelete(StoryVO vo, Model model, StoryReplyVO rvo) throws Exception {
			System.out.println("여행 이야기 관리자 게시글 삭제 기능 처리");
			
			replyService.deleteReply(rvo);
			storyService.deleteStory(vo);
			
			String msg="[관리자] 게시글을 삭제했습니다.";
			String url="/adminStory/adminStory.do";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			

			return "common/message";

		}
		
}
