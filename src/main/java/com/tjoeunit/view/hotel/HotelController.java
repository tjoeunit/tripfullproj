package com.tjoeunit.view.hotel;
import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.hotel.HotelService;
import com.tjoeunit.biz.hotel.HotelVO;

@Controller

public class HotelController {
	@Autowired
	private HotelService hotelService;

	//글 등록 페이지
	@RequestMapping(value="/hotel/insertHotel.do", method = RequestMethod.GET)
	public String insertHotelPage(){
		System.out.println("숙박 등록 화면 보기 처리");
		return "hotel/insertHotel";
	}

	// 글 등록 처리
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

					case 1 : vo.setHotel_img(hotelUploadName);
					break;
				}

				}else {
					switch(i) {
					case 0 : vo.setHotel_thumb(null);

					case 1 : vo.setHotel_img(null);
					break;
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

	//WEB-INF 폴더에 있는 jsp는 직접적으로 view를 볼 수 없다.
	//또한 직접적으로 볼 수 없기 때문에 <a> 앵커 태그로 이동이 불가하며 Controller를 통해서만 이동을 해야 한다.

	// 글 수정 페이지
	@RequestMapping(value="/hotel/updateHotel.do", method = RequestMethod.GET)
	public String updateHotelPage(HotelVO vo,Model model){
		System.out.println("숙박권 수정 화면 보기 처리");
		HotelVO hotel = hotelService.getHotel(vo);

		model.addAttribute("hotel",hotel);
		return "hotel/updateHotel";
	}



	// 글 수정
	@RequestMapping(value = "/hotel/updateHotel.do", method = RequestMethod.POST)
	public String updateHotel(HotelVO vo, HttpSession session, MultipartFile[] hotelImgUpload, Model model) throws Exception {
		System.out.println("숙박권 수정 처리");

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

					case 1 : vo.setHotel_img(hotelUploadName);
					break;
				}

				}else {
					switch(i) {
					case 0 : vo.setHotel_thumb(null);

					case 1 : vo.setHotel_img(null);
					break;
					}
				}
			}

		// DB연동처리
		System.out.println(vo);

		int cnt = hotelService.insertHotel(vo);

		String msg="숙박권 수정 실패", url="/hotel/insertHotel.do";

		if(cnt>0) {
			msg="숙박권 수정 성공";
			url="/hotel/getHotelList.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

	}

	// 글 삭제
	@RequestMapping(value ="/hotel/deleteHotel.do")
	public String deleteBoard(HotelVO vo,Model model){
		System.out.println("숙박권 삭제 처리");

		hotelService.deleteHotel(vo);

		String msg="숙박권 삭제 성공", url="/hotel/getHotelList.do";

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}


	//  글 목록 보기 : 페이징 처리 전 목록 컨트롤러
	/*@RequestMapping(value="/hotel/getHotelList.do", method = RequestMethod.GET)
	public String getHotelList(HotelVO vo, Model model){
		System.out.println("숙박 목록 검색 처리");

		List<HotelVO> hotelList = hotelService.getHotelList(vo);

		model.addAttribute("hotelList", hotelList);

		return "hotel/getHotelList";
	}	// 모델에는 2개의 값이 담긴다. 모델엔 뷰니까 모델값과 뷰값*/
	
	// 글 목록 보기 : 페이징 처리 후 목록 컨트롤러
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

	// 글 상세 조회
	@RequestMapping(value="/hotel/getHotel.do", method = RequestMethod.GET)
	public String getHotel(HotelVO vo, Model model){
		System.out.println("숙박권 상세 조회 처리");

		HotelVO hotel = hotelService.getHotel(vo);

		model.addAttribute("hotel",hotel);

		return "hotel/getHotel";
	}
	
	
}
