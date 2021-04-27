package com.tjoeunit.view.qna;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.lantrip.LanTripVO;
import com.tjoeunit.biz.qna.QnaReplyService;
import com.tjoeunit.biz.qna.QnaReplyVO;
import com.tjoeunit.biz.qna.QnaService;
import com.tjoeunit.biz.qna.QnaVO;
import com.tjoeunit.biz.story.StoryVO;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	private QnaReplyService qnaReplyService;
	
	// 글 목록 보기
	@RequestMapping(value="/qna/getQnaList.do", method = RequestMethod.GET)
	public String qnaListPaging(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		
		int total = qnaService.countQna();
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
		model.addAttribute("qnaList", qnaService.selectQna(vo));

		System.out.println("QNA 목록 뷰");
		
		return "qna/getQnaList";
	}
	
	// 글 상세 조회
	@RequestMapping(value="/qna/getQna.do", method = RequestMethod.GET)
		 public String getQna(QnaVO vo, Model model) {
			 System.out.println("QNA 상세 조회 처리");
			 
			 QnaVO qna = qnaService.getQna(vo);
			 model.addAttribute("qna", qna);
			 
			 return "qna/getQna";
		 }

	// 글 등록 페이지 불러오기
		@RequestMapping(value="/qna/insertQnaPage.do", method=RequestMethod.GET)
		public String insertStoryPage() throws IOException {
			System.out.println("QNA 등록 페이지 호출");
			return "qna/insertQnaPage";
		}	
	
	// 글 등록
		@RequestMapping(value="/qna/insertQna.do", method=RequestMethod.POST)
		public String insertQna(QnaVO vo, Model model) throws Exception {
			System.out.println("QNA 등록 처리");

			int cnt = qnaService.insertQna(vo);
			
			String msg="QNA 등록 실패", url="/qna/insertQnaPage.do";

			if(cnt>0) {
				msg="등록되었습니다.";
				url="/qna/getQnaList.do";
			}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}

		
	// 글 수정 페이지 불러오기
		@RequestMapping(value="/qna/updateQnaPage.do", method=RequestMethod.GET)
		public String updateQnaPage(QnaVO vo, Model model) throws IOException {
			
			System.out.println("QNA 수정 페이지 호출");
			QnaVO qna = qnaService.getQna(vo);
			
			model.addAttribute("qna", qna);
			return "qna/updateQnaPage";
		}

		
	// 글 수정
		@RequestMapping(value="/qna/updateQna.do", method = RequestMethod.POST)
		
		public String updateQna(QnaVO vo, Model model) throws Exception {
			
			System.out.println("QNA 수정 처리");

			int cnt = qnaService.updateQna(vo);
			
			String msg="수정 실패", url="/qna/updateQnaPage.do";

			if(cnt>0) {
				msg="수정되었습니다.";
				url="/qna/getQna.do?qna_no="+vo.getQna_no();
			}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
		
	// 글 삭제
		@RequestMapping("/qna/deleteQna.do")
		public String deleteQna(QnaVO vo, Model model) throws Exception {
			System.out.println("QNA 삭제 처리");
			
			qnaService.deleteQna(vo);
			
			String msg="삭제되었습니다.";
			String url="/qna/getQnaList.do";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
		
/* 관리자 컨트롤 ========================== */
	//관리자 QNA 목록보기
		@RequestMapping(value="/adminQna/adminQna.do", method = RequestMethod.GET)
		public String adminQnaListPaging(PagingVO vo, Model model,
				@RequestParam(value="nowPage", required=false) String nowPage,
				@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
			
			int total = qnaService.countQna();
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
			model.addAttribute("qnaList", qnaService.selectQna(vo));

			System.out.println("관리자 QNA 목록 뷰");
			
			return "adminQna/adminQna";
		}
	
	//관리자 QNA 상세보기
	@RequestMapping(value="/adminQna/adminQnaDetail.do", method = RequestMethod.GET)
		public String adminQnaDetail(QnaVO vo, Model model) {
			System.out.println("관리자 QNA 상세 조회 처리");
				 
				 QnaVO qna = qnaService.getQna(vo);
				 model.addAttribute("qna", qna);
				 
				 return "adminQna/adminQnaDetail";
			 }
	
	//관리자 QNA 수정페이지로 이동
	@RequestMapping(value="/adminQna/adminQnaUpdate.do", method = RequestMethod.GET)
	public String adminQnaUpdatePage(QnaVO vo, Model model) {
		System.out.println("관리자 답변 페이지 호출");
		
		QnaVO qna = qnaService.getQna(vo);
		model.addAttribute("qna", qna);
		
		return "adminQna/adminQnaUpdate";
	}
	
	//관리자 QNA 수정하기
	@RequestMapping(value="/adminQna/adminQnaUpdate.do", method = RequestMethod.POST)
			
	public String adminQnaUpdate(QnaVO vo, Model model) throws Exception {
				
		System.out.println("관리자 QNA 답변 처리");
		
		int cnt = qnaService.updateQna(vo);
				
		String msg="답변 실패", url="/adminQna/adminQna.do";

		if(cnt>0) {
			msg="답변했습니다.";
			url="/adminQna/adminQnaDetail.do?qna_no="+vo.getQna_no();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	// 관리자 QNA 삭제하기
	@RequestMapping("/adminQna/adminQnaDelete.do")
	public String adminQnaDelete(QnaVO vo, Model model) throws Exception {
		
		System.out.println("관리자 QNA 삭제 처리");
				
		qnaService.deleteQna(vo);
				
		String msg="삭제되었습니다.";
		String url="/adminQna/adminQna.do";
				
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
		
		
		
		
/* 하단 서비스센터 컨트롤 ===========================================*/
		@RequestMapping(value = "/index/termService.do", method = RequestMethod.GET)
		public String termService() {
			System.out.println("이용약관 보기");
			return "index/termService";
		}
		
		@RequestMapping(value = "/index/privacyPolicy.do", method = RequestMethod.GET)
		public String privacyPolicy() {
			System.out.println("개인정보 처리방침 보기");
			return "index/privacyPolicy";
		}
		
		@RequestMapping(value = "/index/cancelRefund.do", method = RequestMethod.GET)
		public String cancelRefund() {
			System.out.println("취소 및 환불 정책 보기");
			return "index/cancelRefund";
		}
		
}
