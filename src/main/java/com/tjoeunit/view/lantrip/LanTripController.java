package com.tjoeunit.view.lantrip;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.hotel.HotelVO;
import com.tjoeunit.biz.lantrip.LanTripService;
import com.tjoeunit.biz.lantrip.LanTripVO;
import com.tjoeunit.biz.story.StoryVO;

@Controller
public class LanTripController {
	
	@Autowired
	private LanTripService lanTripService;
	
	// 랜선여행 결제 정보 받아서 결제 페이지로 보내기
	@RequestMapping(value="/lantrip/lantripPayment.do", method=RequestMethod.POST)
	public String flightPaymentPage(HttpServletRequest request, Model model) {
		
		String members_no = (String)request.getParameter("members_no");
		String lantrip_no = request.getParameter("lantrip_no");
		String payment_price = request.getParameter("payment_price");
		String payment_quantity = request.getParameter("payment_quantity");
		String payment_bookdate = request.getParameter("payment_bookdate");
		String lantrip_title = request.getParameter("lantrip_title");
		String product_category = request.getParameter("product_category");
		
		System.out.println("members_no="+members_no);
		System.out.println("lantrip_no="+lantrip_no);
		System.out.println("payment_price="+payment_price);
		System.out.println("payment_quantity="+payment_quantity);
		System.out.println("payment_bookdate="+payment_bookdate);
		System.out.println("lantrip_title="+lantrip_title);
		System.out.println("product_category="+product_category);
		
		model.addAttribute("members_no", members_no);
		model.addAttribute("lantrip_no", lantrip_no);
		model.addAttribute("payment_price", payment_price);
		model.addAttribute("payment_quantity", payment_quantity);
		model.addAttribute("payment_bookdate", payment_bookdate);
		model.addAttribute("lantrip_title", lantrip_title);
		model.addAttribute("product_category", product_category);
		
		return "payment/payment";
	}

/*관리자 컨트롤*/
// adminLanTripList로 이동
	/*
	@RequestMapping(value="/adminLanTrip/adminLanTrip.do", method=RequestMethod.GET)
	public String adminLanTrip(LanTripVO vo, Model model) {
		System.out.println("랜선투어 관리자 목록으로 이동");
			
		List<LanTripVO> lanTripList = lanTripService.getLanTripList(vo);
				
		model.addAttribute("lanTripList", lanTripList);
				
		return "adminLanTrip/adminLanTrip";
	}
	*/
	
	/*관리자 컨트롤*/
	// adminLanTripList로 이동 + 페이징처리
	@RequestMapping(value="/adminLanTrip/adminLanTrip.do", method=RequestMethod.GET)
	public String adminLanTrip(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
  
		int total = lanTripService.countLanTrip();
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
		model.addAttribute("lanTripList", lanTripService.selectLanTrip(vo));

		System.out.println("랜선여행 목록 뷰");
  
		return "adminLanTrip/adminLanTrip";
	}
	
	// 랜선여행 관리자 등록 페이지 이동
	@RequestMapping(value="/adminLanTrip/insertLanTrip.do", method=RequestMethod.GET)
	public String insertLanTrip(LanTripVO vo, Model model) {
		System.out.println("랜선투어 등록하기");
		return "adminLanTrip/insertLanTrip";
	}

	
// 랜선여행 새글 등록
	@RequestMapping( value = "/adminLanTrip/insertLanTrip.do", method = RequestMethod.POST)
	public String insertLanTrip(LanTripVO vo, HttpSession session, MultipartFile[] lanTripImgUpload, Model model) throws Exception {
		System.out.println("랜선여행 등록 처리");
				
		// 파일 업로드 처리
		String lanTripImg = session.getServletContext().getRealPath("/lanTripUpload/");
		System.out.println("==>"+lanTripImgUpload.length);
				
		for(int i = 0; i < lanTripImgUpload.length; i++) {
			System.out.println("==>"+lanTripImgUpload[i].isEmpty());
					
			if(!lanTripImgUpload[i].isEmpty()) {
				String lanTripUploadName = lanTripImgUpload[i].getOriginalFilename();
				lanTripImgUpload[i].transferTo(new File(lanTripImg+lanTripUploadName));
				switch(i) {
					case 0 : vo.setLantrip_thumb(lanTripUploadName);
					break;
					
				}
			}else {
				switch(i) {
					case 0 : vo.setLantrip_thumb(null);
					break;
					
				}
			}
		}
				
		// 영상주소 처리 : DB에 저장할 때 변경된 주소로 저장하기 위함
		String lan_url = vo.getLantrip_video();
		lan_url = "https://www.youtube.com/embed"+lan_url.substring(16);
				
		vo.setLantrip_video(lan_url); // 변경된 주소 저장
				
		System.out.println(lan_url);
				
		// DB연동처리
		System.out.println(vo);
		int cnt = lanTripService.insertLanTrip(vo);
		
		String msg="랜선투어 등록 실패", url="/adminLanTrip/insertLanTrip.do";

		if(cnt>0) {
			msg="랜선투어 등록 성공";
			url="/adminLanTrip/adminLanTrip.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		// 화면전환
		return "common/message";		
	}

	
// 관리자에서 글 상세보기
	@RequestMapping(value="/adminLanTrip/adminLanTripDetail.do", method = RequestMethod.GET)
	 public String getAdminLanTrip(LanTripVO vo, Model model) {
		 System.out.println("랜선여행 관리자 상세 조회 처리");
		 
		 LanTripVO lanTrip = lanTripService.getLanTrip(vo);
		 
		 model.addAttribute("lantrip", lanTrip);
		 
		 return "adminLanTrip/adminLanTripDetail";
	 }
	
// 글 수정 페이지 불러오기
	@RequestMapping(value="/adminLanTrip/adminLanTripUpdatePage.do", method = RequestMethod.GET)
	public String updateLanTripPage(LanTripVO vo, Model model) {
		
		System.out.println("랜선투어 수정 페이지 호출");
		LanTripVO lanTrip = lanTripService.getLanTrip(vo);
		
		model.addAttribute("lantrip", lanTrip);
		return "adminLanTrip/adminLanTripUpdatePage";
	}

	
// 글 수정
	@RequestMapping(value="/adminLanTrip/adminLanTripUpdate.do", method = RequestMethod.POST)
	public String updateLanTrip(LanTripVO vo, HttpSession session, MultipartFile[] lanTripImgUpload, HttpServletRequest request, Model model) throws Exception {
		System.out.println("랜선투어 수정 처리");
		
		// 파일 업로드 처리
		String lanTripImg = session.getServletContext().getRealPath("/lanTripUpload/");
		System.out.println("==>"+lanTripImgUpload.length);
		
		if(lanTripImgUpload.length<1) {
			
			String lantrip_thumb = request.getParameter("lanTripImgUpload");
			System.out.println("기존 썸네일 사용 시 파일명 : " + lantrip_thumb);
			vo.setLantrip_thumb(lantrip_thumb);
		}else {		
			for(int i = 0; i < lanTripImgUpload.length; i++) {
				System.out.println("==>"+lanTripImgUpload[i].isEmpty());
				
				String lanTripUploadName = lanTripImgUpload[i].getOriginalFilename();
				lanTripImgUpload[i].transferTo(new File(lanTripImg+lanTripUploadName));
				System.out.println("변경 썸네일 사용 시 파일명 : " + lanTripUploadName);
				vo.setLantrip_thumb(lanTripUploadName);
			}
		}
		
		// DB연동처리
		System.out.println(vo);
			
		lanTripService.updateLanTrip(vo);
				
		String msg="랜선투어 수정 성공", url="/adminLanTrip/adminLanTrip.do";
				
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
				
		// 화면전환
		return "common/message";		
	}
	
// 글 삭제
	@RequestMapping(value="/adminLanTrip/adminLanTripDelete.do")
	public String deleteLanTrip(LanTripVO vo, Model model) {
		System.out.println("랜선투어 삭제 처리");
		
		lanTripService.deleteLanTrip(vo);
		
		String msg="랜선투어 삭제 성공", url="/adminLanTrip/adminLanTrip.do";
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
	
		return "common/message";
	}

/*고객이 보는 화면 컨트롤*/	
// 글 목록 보기
	@RequestMapping(value="/lantrip/getLanTripList.do", method = RequestMethod.GET)
	public String lanTripListPaging(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		
		int total = lanTripService.countLanTrip();
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
		model.addAttribute("lanTripList", lanTripService.selectLanTrip(vo));

		System.out.println("랜선여행 목록 뷰");
		
		return "lantrip/getLanTripList";
	}
	

// 글 상세 조회
	 @RequestMapping(value="/lantrip/getLanTrip.do", method = RequestMethod.GET)
	 public String getLanTrip(LanTripVO vo, Model model) {
		 System.out.println("랜선여행 상세 조회 처리");
		 
		 LanTripVO lanTrip = lanTripService.getLanTrip(vo);
		 
		 model.addAttribute("lantrip", lanTrip);
		 
		 return "lantrip/getLanTrip";
	 }
	
}
