package com.tjoeunit.view.hotel;
import java.io.File;
import java.io.IOException;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.hotel.HotelService;
import com.tjoeunit.biz.hotel.HotelVO;

@Controller
@RequestMapping("/hotel")

public class HotelController {
	@Autowired 
	private HotelService hotelService;
	
	// 글 등록 페이지
	@RequestMapping(value="/insertHotel.do", method = RequestMethod.GET)
	public String insertHotelPage() {
		return "hotel/insertHotel";
	}
		//WEB-INF 폴더에 있는 jsp는 직접적으로 view를 볼 수 없다. 
		//또한 직접적으로 볼 수 없기 때문에 <a> 앵커 태그로 이동이 불가하며 Controller를 통해서만 이동을 해야 한다.
		
	
	// 글 등록 처리
	@RequestMapping(value="/insertHotel.do", method = RequestMethod.POST) 
	public String insertHotel(HotelVO vo, HttpSession session, MultipartFile[] HotelImgUpload, Model model) throws IOException{
		System.out.println("숙소 등록 처리");

		// 파일 업로드 처리
		String hotelImg = session.getServletContext().getRealPath("/HotelUpload/");
		System.out.println("==>"+HotelImgUpload.length);
		
		for(int i = 0; i < HotelImgUpload.length; i++) {
			System.out.println("==>"+HotelImgUpload[i].isEmpty());
			
			if(!HotelImgUpload[i].isEmpty()) {
				String HotelImgUploadName = HotelImgUpload[i].getOriginalFilename();
				HotelImgUpload[i].transferTo(new File(hotelImg+HotelImgUploadName));
				
				switch(i) {
				case 0 : vo.setHotel_thumb(HotelImgUploadName);
				break;
				
				case 1 : vo.setHotel_img1(HotelImgUploadName);
				break;
				
				case 2 : vo.setHotel_img2(HotelImgUploadName);
				break;
				
				default : vo.setHotel_img3(HotelImgUploadName);
				break;	
								
			}
				
			}else {
				switch(i) {
						case 0 : vo.setHotel_thumb(null);
						
						case 1 : vo.setHotel_img1(null);
						break;
						
						case 2 : vo.setHotel_img2(null);
						break;
						
						default : vo.setHotel_img3(null);
						break;			
						}
					}
				}
		// DB연동처리
				String youUrl = vo.getHotel_video();
				String subUrl = youUrl.substring(17);
				vo.setHotel_video(subUrl);
				
				System.out.println(vo);
				
				int cnt = hotelService.insertHotel(vo);
				
				String msg="숙소 등록 실패", url="/hotel/insertHotel.do";

				if(cnt>0) {
					msg="숙소 등록 성공";
					url="/hotel/getHotelList.do";
				}

				model.addAttribute("msg", msg);
				model.addAttribute("url", url);

				return "common/message";		
				
			}

	
		
	// 글 수정
	@RequestMapping("/updateHotel.do") 
	public String updateHotel(@ModelAttribute("hotel") HotelVO vo){
		// 매개변수에 사용되면, 매개변수이름을 변경하고 싶을때  vo -> board
		// command 객체가 이름을 변경하면서 그전에 같은 이름이 있는지 찾는데
		// 세션 어트리뷰트 어노테이션에 담겨있으니 동일한 이름의 값을 vo에 먼저 할당한다. 
		// 이전에 값에 타이틀과 내용만 수정되고 저장된다. 
		System.out.println("글 수정 처리" + vo);	
		hotelService.updateHotel(vo);
		return "redirect: getHotelList.do";
	}
		
	// 글 삭제
	@RequestMapping("/deleteHotel.do") 
	public String deleteBoard(HotelVO vo){
		System.out.println("글 삭제 처리");
		hotelService.deleteHotel(vo);
		return "redirect: getHotelList.do";
	}	
	
	// 글 목록 보기
	@RequestMapping(value="/getHotelList.do") 
	public String getHotelList(HotelVO vo, Model model){
		System.out.println("숙소 목록 검색 처리");		
	
		List<HotelVO> hotelList = hotelService.getHotelList(vo);
		
		model.addAttribute("hotelList", hotelList);
		// "boardList" 저장할 이름 , boardList : "boardList"에 저장 될 값
		return "hotel/getHotelList";
	}	// 모델에는 2개의 값이 담긴다. 모델엔 뷰니까 모델값과 뷰값
	 
	// 글 상세 조회
	@RequestMapping(value="/getHotel.do", method = RequestMethod.GET) 
	public String getBoard(HotelVO vo, Model model){
		System.out.println("숙소 상세 조회 처리");
		
		HotelVO hotel = hotelService.getHotel(vo);				
		
		model.addAttribute("hotel",hotel);
		
		return "hotel/getHotel";
	}	
	//
}