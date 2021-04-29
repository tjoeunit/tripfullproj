package com.tjoeunit.view.flight;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.flight.FlightService;
import com.tjoeunit.biz.flight.FlightVO;
import com.tjoeunit.biz.lantrip.LanTripVO;

@Controller
public class FlightController {
	
	@Autowired
	private FlightService flightService;
	
	// 항공권 결제 정보 받아서 결제 페이지로 보내기
	@RequestMapping(value="/flight/flightPayment.do", method=RequestMethod.POST)
	public String flightPaymentPage(HttpServletRequest request, Model model) {
		
		String members_no = (String)request.getParameter("members_no");
		String flight_no = request.getParameter("flight_no");
		String payment_price = request.getParameter("payment_price");
		String payment_quantity = request.getParameter("payment_quantity");
		String payment_bookdate = request.getParameter("payment_bookdate");
		String flight_title = request.getParameter("flight_title");
		String product_category = request.getParameter("product_category");
		
		System.out.println("members_no="+members_no);
		System.out.println("flight_no="+flight_no);
		System.out.println("payment_price="+payment_price);
		System.out.println("payment_quantity="+payment_quantity);
		System.out.println("payment_bookdate="+payment_bookdate);
		System.out.println("flight_title="+flight_title);
		System.out.println("product_category="+product_category);
		
		model.addAttribute("members_no", members_no);
		model.addAttribute("flight_no", flight_no);
		model.addAttribute("payment_price", payment_price);
		model.addAttribute("payment_quantity", payment_quantity);
		model.addAttribute("payment_bookdate", payment_bookdate);
		model.addAttribute("flight_title", flight_title);
		model.addAttribute("product_category", product_category);
		
		return "payment/payment";
	}
	
	
	
	
	// 항공권 등록 페이지
	@RequestMapping(value="/flight/insertFlight.do", method = RequestMethod.GET)
	public String insertFlightPage() {
		return "flight/insertFlight";
	}	
	
	// 항공권 등록 처리
	@RequestMapping(value = "/flight/insertFlight.do", method = RequestMethod.POST)
	public String insertFlight(FlightVO vo, HttpSession session, MultipartFile[] flightImgUpload, Model model) throws Exception {
		System.out.println("항공권 등록 처리");
		
		// 파일 업로드 처리
		String flightImg = session.getServletContext().getRealPath("/flightUpload/");
		System.out.println("==>"+flightImgUpload.length);
		
		for(int i = 0; i < flightImgUpload.length; i++) {
			System.out.println("==>"+flightImgUpload[i].isEmpty());
			
			if(!flightImgUpload[i].isEmpty()) {
				String flightUploadName = flightImgUpload[i].getOriginalFilename();
				flightImgUpload[i].transferTo(new File(flightImg+flightUploadName));
				
				switch(i) {
					case 0 : vo.setFlight_thumb(flightUploadName);
					break;
					/* CKEDITOR 사용으로 img 사용하지 않음
					case 1 : vo.setFlight_img1(flightUploadName);
					break;
					*/
				}		
				
			}else {
				
				switch(i) {
					case 0 : vo.setFlight_thumb(null);
					/* CKEDITOR 사용으로 img 사용하지 않음
					case 1 : vo.setFlight_img1(null);
					break;
					*/
				}
			}
		}
				
		System.out.println(vo);
		
		int cnt = flightService.insertFlight(vo);
		
		String msg="항공권 등록 실패", url="/flight/insertFlight.do";

		if(cnt>0) {
			msg="항공권 등록 성공";
			url="/flight/getFlightList.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";		
		
	}	
		
	/* 항공권 목록 보기 : 페이징 처리 전 목록 컨트롤러
	@RequestMapping(value="/getFlightList.do", method = RequestMethod.GET)
	public String getFlightList(FlightVO vo, Model model) {
		System.out.println("항공권 목록 페이지");
		List<FlightVO> flightList = flightService.getFlightList(vo);		
		model.addAttribute("flightList", flightList);		
		return "flight/getFlightList";
	}
	*/
	
	// 항공권 목록 보기 : 페이징 처리 후 목록 컨트롤러
	@RequestMapping(value="/flight/getFlightList.do", method = RequestMethod.GET)
	public String flightListPaging(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		
		int total = flightService.countFlight();
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
		model.addAttribute("flightList", flightService.selectFlight(vo));
		return "flight/getFlightList";
	}	
	
	// 항공권 상세 조회
	@RequestMapping(value="/flight/getFlight.do", method = RequestMethod.GET)
	public String getFlight(FlightVO vo, Model model) {
		//vo에 flight_no 값이 저장되어 있는지 확인
		System.out.println("항공권 상세 페이지 flight_no = " + vo.getFlight_no());
				
		//flight_no 를 이용하여 전체 정보를 flight에 저장
		FlightVO flight = flightService.getFlight(vo);
		
		System.out.println("항공권 정보 " + flight);
		
		//flight에 저장된 값을 모델에 키 밸류로 저장
		model.addAttribute("flight", flight);
		
		//보여줄 페이지 리턴
		return "flight/getFlight";
	}
	
	// 항공권 수정 페이지
	@RequestMapping(value="/flight/updateFlight.do", method=RequestMethod.GET)
	public String updateFlightPage(FlightVO vo, Model model) {
		//vo에 flight_no 값이 저장되어 있는지 확인
		System.out.println("항공권 수정 페이지 flight_no = " + vo.getFlight_no());
		
		//flight_no 를 이용하여 전체 정보를 flight에 저장
		FlightVO flight = flightService.getFlight(vo);
		
		System.out.println("항공권 정보 " + flight);
		
		//flight에 저장된 값을 모델에 키 밸류로 저장
		model.addAttribute("flight", flight);
		
		return "flight/updateFlight";
	}
	
	// 항공권 수정 처리
	@RequestMapping(value = "/flight/updateFlight.do", method = RequestMethod.POST)
	public String updateFlight(FlightVO vo, HttpSession session, MultipartFile[] flightImgUpload, HttpServletRequest request, Model model) throws Exception {
		System.out.println("수정 처리 전 항공권 vo = " + vo);
				
		// 1. flightImg 에 경로 지정 
		String flightImg = session.getServletContext().getRealPath("/flightUpload/");
		
		// 2. 업로드 할 이미지 개수 확인
		System.out.println("==>"+flightImgUpload.length);
		
		// 3. 업로드 할 사진이 존재하지 않을 때 (기존 썸네일 선택 시 input 태그의 type 설정을 text로 지정하고 페이지를 불러들일 때 부터 DB 저장된 값을 value 에 넣어둠)  
		if(flightImgUpload.length < 1) {
			
			// DB 에서 읽어 온 값을 그대로 vo 에 저장시킴
			String flight_thumb = request.getParameter("flightImgUpload");
			System.out.println("기존 썸네일 사용 시 파일명 : " + flight_thumb);
			vo.setFlight_thumb(flight_thumb);
			
		// 4. 업로드 할 사진이 존재할 때
		}else {
			for(int i=0; i<flightImgUpload.length; i++) {
				String flightUploadName = flightImgUpload[i].getOriginalFilename();
				flightImgUpload[i].transferTo(new File(flightImg+flightUploadName));
				System.out.println("변경 썸네일 사용 시 파일명 : " + flightUploadName);
				vo.setFlight_thumb(flightUploadName);
			}
		}
				
		System.out.println("수정 처리 될 항공권 vo = " + vo);
		
		int cnt = flightService.updateFlight(vo);
		
		String msg="항공권 수정 실패", url="/flight/updateFlight.do?flight_no="+vo.getFlight_no();		
		
		if(cnt>0) {
			msg="항공권 수정 성공";
			url="/flight/getFlight.do?flight_no="+vo.getFlight_no();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}
	
	// 항공권 삭제
	@RequestMapping("/flight/deleteFlight.do")
	public String deleteFlight(FlightVO vo, Model model) {
		
		System.out.println("항공권 삭제 처리 flight_no = " + vo.getFlight_no());
		
		int cnt = flightService.deleteFlight(vo);
		
		String msg="항공권 삭제 실패", url="/flight/getFlight.do?flight_no="+vo.getFlight_no();
		
		if(cnt>0) {
			msg="항공권 삭제 성공";
			url="/flight/getFlightList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
//////////////////////////////////////////////////관리자////////////////////////////////////////////////////////
//////////////////////////////////////////////////관리자////////////////////////////////////////////////////////
//////////////////////////////////////////////////관리자////////////////////////////////////////////////////////
//////////////////////////////////////////////////관리자////////////////////////////////////////////////////////
//////////////////////////////////////////////////관리자////////////////////////////////////////////////////////
//////////////////////////////////////////////////관리자////////////////////////////////////////////////////////
	
	// 관리자 항공권 목록 페이지
	/*
	@RequestMapping(value="/adminFlight/adminFlight.do", method=RequestMethod.GET)
	public String adminFlightPage(FlightVO vo, Model model) {
		System.out.println("항공권 관리자 목록으로 이동");
			
		List<FlightVO> flightList = flightService.getFlightList(vo);
				
		model.addAttribute("flightList", flightList);
				
		return "adminFlight/adminFlight";
	}
	*/
	
	// 관리자 항공권 목록 페이지 : 페이징 처리 후 목록 컨트롤러
	@RequestMapping(value="/adminFlight/adminFlight.do", method = RequestMethod.GET)
	public String adminFlightListPaging(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		
		int total = flightService.countFlight();
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
		model.addAttribute("flightList", flightService.selectFlight(vo));
		return "adminFlight/adminFlight";
	}	
	
	// 관리자 항공권 등록 페이지로 이동
	@RequestMapping(value="/adminFlight/insertFlight.do", method=RequestMethod.GET)
	public String adminInsertFlightPage() {
		return "adminFlight/insertFlight";
	}
	
	// 관리자 항공권 등록 처리
	@RequestMapping(value="/adminFlight/insertFlight.do", method=RequestMethod.POST)
	public String adminInsertFlight(FlightVO vo, HttpSession session, MultipartFile[] flightImgUpload, Model model) throws Exception {
		System.out.println("항공권 등록 처리");
				
		// 파일 업로드 처리
		String flightImg = session.getServletContext().getRealPath("/flightUpload/");
		System.out.println("==>"+flightImgUpload.length);
				
		for(int i = 0; i < flightImgUpload.length; i++) {
			System.out.println("==>"+flightImgUpload[i].isEmpty());
					
			if(!flightImgUpload[i].isEmpty()) {
				String flightUploadName = flightImgUpload[i].getOriginalFilename();
				flightImgUpload[i].transferTo(new File(flightImg+flightUploadName));
				switch(i) {
					case 0 : vo.setFlight_thumb(flightUploadName);
					break;					
				}
			}else {
				switch(i) {
					case 0 : vo.setFlight_thumb(null);
					break;					
				}
			}
		}				
				
		// DB연동처리
		System.out.println(vo);
		int cnt = flightService.insertFlight(vo);
		
		String msg="항공권 등록 실패", url="/adminFlight/insertFlight.do";

		if(cnt>0) {
			msg="항공권 등록 성공";
			url="/adminFlight/adminFlight.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		// 화면전환
		return "common/message";		
	}
	
	// 관리자 항공권 상세보기
	@RequestMapping(value="/adminFlight/adminFlightDetail.do", method = RequestMethod.GET)
	 public String adminFlightDetail(FlightVO vo, Model model) {
		 System.out.println("항공권 상세 페이지");
		 
		 FlightVO flight = flightService.getFlight(vo);
		 
		 model.addAttribute("flight", flight);
		 
		 return "adminFlight/adminFlightDetail";
	 }
	
	// 관리자 항공권 삭제 처리
	@RequestMapping("/adminFlight/adminFlightDelete.do")
	public String adminFlightDelete(FlightVO vo, Model model) {
		
		System.out.println("항공권 삭제 처리 flight_no = " + vo.getFlight_no());
		
		int cnt = flightService.deleteFlight(vo);
		
		String msg="항공권 삭제 실패", url="/adminFlight/adminFlightDetail.do?flight_no="+vo.getFlight_no();
		
		if(cnt>0) {
			msg="항공권 삭제 성공";
			url="/adminFlight/adminFlight.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	// 관리자 항공권 수정 페이지로 이동
	@RequestMapping(value="/adminFlight/adminFlightUpdate.do", method=RequestMethod.GET)
	public String adminFlightUpdatePage(FlightVO vo, Model model) {
		//vo에 flight_no 값이 저장되어 있는지 확인
		System.out.println("항공권 수정 페이지 flight_no = " + vo.getFlight_no());
		
		//flight_no 를 이용하여 전체 정보를 flight에 저장
		FlightVO flight = flightService.getFlight(vo);
		
		System.out.println("항공권 정보 " + flight);
		
		//flight에 저장된 값을 모델에 키 밸류로 저장
		model.addAttribute("flight", flight);
		
		return "adminFlight/adminFlightUpdate";
	}
	
	// 관리자 항공권 수정 처리
	@RequestMapping(value = "/adminFlight/adminFlightUpdate.do", method = RequestMethod.POST)
	public String adminFlightUpdate(FlightVO vo, HttpSession session, MultipartFile[] flightImgUpload, HttpServletRequest request, Model model) throws Exception {
		System.out.println("수정 처리 전 항공권 vo = " + vo);
				
		// 1. flightImg 에 경로 지정 
		String flightImg = session.getServletContext().getRealPath("/flightUpload/");
		
		// 2. 업로드 할 이미지 개수 확인
		System.out.println("==>"+flightImgUpload.length);
		
		// 3. 업로드 할 사진이 존재하지 않을 때 (기존 썸네일 선택 시 input 태그의 type 설정을 text로 지정하고 페이지를 불러들일 때 부터 DB 저장된 값을 value 에 넣어둠)  
		if(flightImgUpload.length < 1) {
			
			// DB 에서 읽어 온 값을 그대로 vo 에 저장시킴
			String flight_thumb = request.getParameter("flightImgUpload");
			System.out.println("기존 썸네일 사용 시 파일명 : " + flight_thumb);
			vo.setFlight_thumb(flight_thumb);
			
		// 4. 업로드 할 사진이 존재할 때
		}else {
			for(int i=0; i<flightImgUpload.length; i++) {
				String flightUploadName = flightImgUpload[i].getOriginalFilename();
				flightImgUpload[i].transferTo(new File(flightImg+flightUploadName));
				System.out.println("변경 썸네일 사용 시 파일명 : " + flightUploadName);
				vo.setFlight_thumb(flightUploadName);
			}
		}
				
		System.out.println("수정 처리 될 항공권 vo = " + vo);
		
		int cnt = flightService.updateFlight(vo);
		
		String msg="항공권 수정 실패", url="/adminFlight/adminFlightUpdate.do?flight_no="+vo.getFlight_no();		
		
		if(cnt>0) {
			msg="항공권 수정 성공";
			url="/adminFlight/adminFlightDetail.do?flight_no="+vo.getFlight_no();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}	
	
}