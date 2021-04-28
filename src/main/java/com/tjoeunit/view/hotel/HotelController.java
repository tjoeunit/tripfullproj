package com.tjoeunit.view.hotel;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.hotel.HotelService;
import com.tjoeunit.biz.hotel.HotelVO;
import com.tjoeunit.biz.payment.PaymentService;
import com.tjoeunit.biz.payment.PaymentVO;


@Controller
public class HotelController {
	
	@Autowired private HotelService hotelService;
	@Autowired private PaymentService paymentService;	
	
	// 항공권 결제 페이지 (카카오페이 이용)
	
	@RequestMapping(value="/hotel/hotelPayment.do", method=RequestMethod.POST)
	public String payment(HttpServletRequest request, Model model) {
		
		String members_no = request.getParameter("members_no");
		String hotel_no = request.getParameter("hotel_no");
		String hotel_title = request.getParameter("hotel_title");
		String payment_quantity = request.getParameter("payment_quantity");
		String payment_price = request.getParameter("payment_price");
		String payment_bookdate = request.getParameter("payment_bookdate");
		String product_category = request.getParameter("product_category");

		System.out.println("members_no = " + members_no);
		System.out.println("hotel_no = " + hotel_no);
		System.out.println("hotel_title = " + hotel_title);
		System.out.println("payment_quantity = " + payment_quantity);
		System.out.println("payment_price = " + payment_price);
		System.out.println("payment_bookdate = " + payment_bookdate);
		System.out.println("product_category = " + product_category);
		
		model.addAttribute("members_no", members_no);
		model.addAttribute("hotel_no", hotel_no);
		model.addAttribute("hotel_title", hotel_title);
		model.addAttribute("payment_quantity", payment_quantity);
		model.addAttribute("payment_price", payment_price);
		model.addAttribute("payment_bookdate", payment_bookdate);
		model.addAttribute("product_category", product_category);
		
		return "hotel/hotelPayment";
	}
	
	// 항공권 결제 처리
	@RequestMapping(value="/hotel/hotelPaymentDBEx.do", method=RequestMethod.POST)
	@ResponseBody
	public int paymentDBEx(HttpServletRequest request, PaymentVO vo) {	
		String members_no = request.getParameter("members_no");
		String hotel_no = request.getParameter("hotel_no");
		String hotel_title = request.getParameter("hotel_title");
		String payment_quantity = request.getParameter("payment_quantity");
		String payment_price = request.getParameter("payment_price");
		String payment_bookdate = request.getParameter("payment_bookdate");
		String product_category = request.getParameter("product_category");
		
		System.out.println("members_no = " + members_no);
		System.out.println("hotel_no = " + hotel_no);
		System.out.println("hotel_title = " + hotel_title);		
		System.out.println("payment_quantity = " + payment_quantity);
		System.out.println("payment_price = " + payment_price);
		System.out.println("payment_bookdate = " + payment_bookdate);
		System.out.println("product_category = " + product_category);
				
		vo.setMembers_no(Integer.parseInt(members_no));
		vo.setHotel_no(Integer.parseInt(hotel_no));
		vo.setFlight_title("");
		vo.setHotel_title(hotel_title);
		vo.setActivity_title("");
		vo.setLantrip_title("");		
		vo.setPayment_quantity(payment_quantity);
		vo.setPayment_price(payment_price);
		vo.setPayment_bookdate(payment_bookdate);
		vo.setProduct_category(product_category);
		
		int result = paymentService.insertPayment(vo);
		
		return result;
	}	
	
	
	//숙박권 등록 페이지
	@RequestMapping(value="/hotel/insertHotel.do", method = RequestMethod.GET)
		public String insertHotelPage(){
			System.out.println("숙박 등록 화면 보기 처리");
			return "hotel/insertHotel";
		}

		// 숙박 등록 처리
		@RequestMapping(value ="/hotel/insertHotel.do", method = RequestMethod.POST)
		public String insertHotel(HotelVO vo, HttpSession session, MultipartFile[] hotelImgUpload, Model model) throws Exception {
			System.out.println("숙박권 등록 처리");

		// 파일 업로드 처리
		String hotelImg = session.getServletContext().getRealPath("/hotelUpload/");
		System.out.println("==>"+hotelImgUpload.length);

		for(int i = 0; i < hotelImgUpload.length; i++) {
			System.out.println("==>"+hotelImgUpload[i].isEmpty());

			if(!hotelImgUpload[i].isEmpty()) {
				String hotelUploadName = hotelImgUpload[i].getOriginalFilename();
				hotelImgUpload[i].transferTo(new File(hotelImg+hotelUploadName));

				switch(i) {
					case 0 : vo.setHotel_thumb(hotelUploadName);
					break;
				}

				}else {
					switch(i) {
					case 0 : vo.setHotel_thumb(null);

					}
				}
			}

		// DB연동처리
		System.out.println(vo);

		int cnt = hotelService.insertHotel(vo);

		String msg="숙박권 등록 실패", url="/hotel/insertHotel.do";

		if(cnt>0) {
			msg="숙박권 등록 성공";
			url="/hotel/getHotelList.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}
		
	//  숙박권 목록 보기 : 페이징 처리 전 목록 컨트롤러
	/*@RequestMapping(value="/hotel/getHotelList.do", method = RequestMethod.GET)
	public String getHotelList(HotelVO vo, Model model){
		System.out.println("숙박 목록 검색 처리");
		List<HotelVO> hotelList = hotelService.getHotelList(vo);
		model.addAttribute("hotelList", hotelList);
		return "hotel/getHotelList";
	}	// 모델에는 2개의 값이 담긴다. 모델엔 뷰니까 모델값과 뷰값*/
	
	// 숙박권 목록 보기 : 페이징 처리 후 목록 컨트롤러
	@RequestMapping(value="/hotel/getHotelList.do", method = RequestMethod.GET)
	public String hotelListPaging(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		
		int total = hotelService.countHotel();
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
		model.addAttribute("hotelList", hotelService.selectHotel(vo));
		return "hotel/getHotelList";
	}	
	
	// 숙박권 상세 조회
	@RequestMapping(value="/hotel/getHotel.do", method = RequestMethod.GET)
	public String getHotel(HotelVO vo, Model model){
		//vo에 hotel_no 값이 저장되어 있는지 확인
		System.out.println("숙박권 상세 페이지 hotel_no = " + vo.getHotel_no());
		
		//hotel_no 를 이용하여 전체 정보를 flight에 저장
		HotelVO hotel = hotelService.getHotel(vo);
		
		System.out.println("숙박권 정보 " + hotel);
		
		//hotel에 저장된 값을 모델에 키 밸류로 저장
		model.addAttribute("hotel",hotel);
		
		//보여줄 페이지 리턴
		return "hotel/getHotel";
	}
	
	// 숙박권 수정 페이지
	@RequestMapping(value="/hotel/updateHotel.do", method = RequestMethod.GET)
	public String updateHotelPage(HotelVO vo,Model model){
		//vo에 hotel_no 값이 저장되어 있는지 확인
		System.out.println("숙박권 수정 화면 보기 처리");
		
		//hotel_no 를 이용하여 전체 정보를 hotel에 저장
		HotelVO hotel = hotelService.getHotel(vo);

		System.out.println("숙박권 정보 " + hotel);
		
		//flight에 저장된 값을 모델에 키 밸류로 저장
		model.addAttribute("hotel",hotel);
		
		return "hotel/updateHotel";
	}
	
	// 숙박권 수정 처리 
	@RequestMapping(value = "/hotel/updateHotel.do", method = RequestMethod.POST)
	public String updateHotel(HotelVO vo, HttpSession session, MultipartFile[] hotelImgUpload, HttpServletRequest request, Model model) throws Exception {
		System.out.println("수정 처리 전 숙박권 vo = " + vo);
		
		// 1. hotelImg 에 경로 지정
		String hotelImg = session.getServletContext().getRealPath("/hotelUpload/");
		
		// 2. 업로드 할 이미지 개수 확인
		System.out.println("==>"+hotelImgUpload.length);
		
		// 3. 업로드 할 사진이 존재하지 않을 때 (기존 썸네일 선택 시 input 태그의 type 설정을 text로 지정하고 페이지를 불러들일 때 부터 DB 저장된 값을 value 에 넣어둠)  
		if(hotelImgUpload.length < 1) {
			
			// DB 에서 읽어 온 값을 그대로 vo 에 저장시킴
			String hotel_thumb = request.getParameter("hotelImgUpload");
			System.out.println("기존 썸네일 사용 시 파일명 : " + hotel_thumb);
			vo.setHotel_thumb(hotel_thumb);
		
		// 4. 업로드 할 사진이 존재할 때
		}else {		
			for(int i = 0; i < hotelImgUpload.length; i++) {
				String hotelUploadName = hotelImgUpload[i].getOriginalFilename();
				hotelImgUpload[i].transferTo(new File(hotelImg+hotelUploadName));
				System.out.println("변경 썸네일 사용 시 파일명 : " + hotelUploadName);
			}
		}
		
		System.out.println("수정 처리 될 숙박권 vo = " + vo);
		
		int cnt = hotelService.updateHotel(vo);
		
		String msg="숙박권 수정 실패", url="/hotel/updateHotel.do?hotel_no="+vo.getHotel_no();		
		
		if(cnt>0) {
			msg="숙박권 수정 성공";
			url="/hotel/getHotel.do?hotel_no="+vo.getHotel_no();
		}
		  	model.addAttribute("msg", msg); 
		 	model.addAttribute("url", url);
		 
		 return "common/message";
	}
	
	// 숙박권 삭제  
	@RequestMapping(value ="/hotel/deleteHotel.do")
	public String deleteHotel(HotelVO vo,Model model){
		
		System.out.println("숙박권 삭제 처리 hotel_no = " + vo.getHotel_no());

		int cnt = hotelService.deleteHotel(vo);
		
		String msg="숙박권 삭제 실패", url="/hotel/getHotle.do?hotel_no="+vo.getHotel_no();

		if(cnt>0) {
			msg="숙박권 삭제 성공";
			url="/hotel/getHotelList.do";
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

	// 관리자 항공권 목록 페이지로 이동
	@RequestMapping(value="/adminHotel/adminHotel.do", method=RequestMethod.GET)
	public String adminHotel(HotelVO vo, Model model) {
		System.out.println("숙박권 관리자 목록으로 이동");
			
		List<HotelVO> hotelList = hotelService.getHotelList(vo);
				
		model.addAttribute("hotelList", hotelList);
				
		return "adminHotel/adminHotel";
	}	
	
	// 관리자 숙박권 등록 페이지로 이동
	@RequestMapping(value="/adminHotel/insertHotel.do", method = RequestMethod.GET)
	public String adminInsertHotelPage(){
		return "adminHotel/insertHotel";
	}

	// 관리자 숙박권 등록 처리
	@RequestMapping(value ="/adminHotel/insertHotel.do", method = RequestMethod.POST)
	public String adminInsertHotel(HotelVO vo, HttpSession session, MultipartFile[] hotelImgUpload, Model model) throws Exception {
		System.out.println("숙박권 등록 처리");

		// 파일 업로드 처리
		String hotelImg = session.getServletContext().getRealPath("/hotelUpload/");
		System.out.println("==>"+hotelImgUpload.length);

		for(int i = 0; i < hotelImgUpload.length; i++) {
			System.out.println("==>"+hotelImgUpload[i].isEmpty());

			if(!hotelImgUpload[i].isEmpty()) {
				String hotelUploadName = hotelImgUpload[i].getOriginalFilename();
				hotelImgUpload[i].transferTo(new File(hotelImg+hotelUploadName));

				switch(i) {
					case 0 : vo.setHotel_thumb(hotelUploadName);
					break;
				}

				}else {
					switch(i) {
					case 0 : vo.setHotel_thumb(null);

					}
				}
			}

		// DB연동처리
		System.out.println(vo);

		int cnt = hotelService.insertHotel(vo);

		String msg="숙박권 등록 실패", url="/adminHotel/insertHotel.do";

		if(cnt>0) {
			msg="숙박권 등록 성공";
			url="/adminHotel/adminHotel.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		// 화면전환
		return "common/message";

	}
	
	// 관리자 숙박권 상세보기
	@RequestMapping(value="/adminHotel/adminHotelDetail.do", method = RequestMethod.GET)
	public String getAdminHotel(HotelVO vo, Model model){
		System.out.println("숙박권 상세 페이지");

		HotelVO hotel = hotelService.getHotel(vo);

		model.addAttribute("hotel",hotel);

		return "adminHotel/adminHotelDetail";
	}
	
	
	// 관리자 숙박권 삭제 처리
	@RequestMapping(value="/adminHotel/adminHotelDelete.do")
	public String adminHotelDelete(HotelVO vo,Model model){
		
		System.out.println("숙박권 삭제 처리 hotle_no = " + vo.getHotel_no());
		
		int cnt = hotelService.deleteHotel(vo);

		String msg="숙박권 삭제 실패", url="/adminHotle/adminHotelDetail.do?hotel_no="+vo.getHotel_no();
		
		if(cnt>0) {
			msg="숙박권 삭제 성공";
			url="/adminHotel/adminHotel.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	// 관리자 숙박권 수정 페이지로 이동
	@RequestMapping(value ="/adminHotel/adminHotelUpdate.do", method = RequestMethod.GET)
	public String adminupdateHotel(HotelVO vo, Model model) {
		//vo에 hotel_no 값이 저장되어 있는지 확인
		System.out.println("숙박권 수정 페이지 hotel_no = " + vo.getHotel_no());
		
		//hotel_no 를 이용하여 전체 정보를 hotel에 저장
		HotelVO hotel = hotelService.getHotel(vo);
		
		System.out.println("숙박권 정보 " + hotel);
		
		//hotel에 저장된 값을 모델에 키 밸류로 저장
		model.addAttribute("hotel", hotel);
		
		return "adminHotel/adminHotelUpdate";
	}
	
	// 관리자 항공권 수정 처리
	@RequestMapping(value = "/adminHotel/adminHotelUpdate.do", method = RequestMethod.POST)
	public String adminHotelUpdate(HotelVO vo, HttpSession session, MultipartFile[] hotelImgUpload, HttpServletRequest request, Model model) throws Exception {
		System.out.println("수정 처리 전 숙박권 vo = " + vo);
				
		// 1. hotelImg 에 경로 지정 
		String hotelImg = session.getServletContext().getRealPath("/hotelUpload/");
		
		// 2. 업로드 할 이미지 개수 확인
		System.out.println("==>"+hotelImgUpload.length);
		
		// 3. 업로드 할 사진이 존재하지 않을 때 (기존 썸네일 선택 시 input 태그의 type 설정을 text로 지정하고 페이지를 불러들일 때 부터 DB 저장된 값을 value 에 넣어둠)  
		if(hotelImgUpload.length < 1) {
			
			// DB 에서 읽어 온 값을 그대로 vo 에 저장시킴
			String hotel_thumb = request.getParameter("hotelImgUpload");
			System.out.println("기존 썸네일 사용 시 파일명 : " + hotel_thumb);
			vo.setHotel_thumb(hotel_thumb);
			
		// 4. 업로드 할 사진이 존재할 때
		}else {
			for(int i=0; i<hotelImgUpload.length; i++) {
				String flightUploadName = hotelImgUpload[i].getOriginalFilename();
				hotelImgUpload[i].transferTo(new File(hotelImg+flightUploadName));
				System.out.println("변경 썸네일 사용 시 파일명 : " + flightUploadName);
				vo.setHotel_thumb(flightUploadName);
			}
		}
				
		System.out.println("수정 처리 될 항공권 vo = " + vo);
		
		int cnt = hotelService.updateHotel(vo);
		
		String msg="숙박권 수정 실패", url="/adminHotel/adminHotelUpdate.do?hotel_no="+vo.getHotel_no();		
		
		if(cnt>0) {
			msg="항공권 수정 성공";
			url="/adminHotel/adminHotelDetail.do?hotel_no="+vo.getHotel_no();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}		
}
