package com.tjoeunit.view.hotel;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.hotel.HotelService;
import com.tjoeunit.biz.hotel.HotelVO;

@Controller
@RequestMapping("/hotel")
//모델에 저장할때 세션영역에도 자료 저장해줘
public class HotelController {
	@Autowired 
	//주입하기
	private HotelService hotelService;
	
	// 글 등록
	@RequestMapping(value="/insertHotel.do") 
	public String insertBoard(HotelVO vo, HttpSession session) throws IOException{ // 브라우저 데이터를 담아주는 커멘드 객체 역할 
		System.out.println("숙소 등록 처리");

		// 파일 업로드 처리
		String fileSaveFolder = session.getServletContext().getRealPath("hotel/hotelUpload/"); 
		// 어플리케이션 객체 반환 
		//application getrealpath로 절대경로 가져올 수 있다. 
		//session  getservletcontext
		// 이 절대경로 위치는 서블릿의 절대위치로 반환하는데 우리는 프로젝트의 위치를 원한다. 
		// 서버 설정을 통해 프로젝트 위치로 변경 
		
		MultipartFile hotel_thumb = vo.getHotel_thumb();
		if(!hotel_thumb.isEmpty()) {
			String fileName = hotel_thumb.getOriginalFilename(); 
			hotel_thumb.transferTo(new File(fileSaveFolder+fileName));
		}// 해당위치의 파일이름을 저장해주는 메서드
		// uploadFile 는 자s바빈 필드
		
		hotelService.insertHotel(vo);
		// 이미 서비스임플리에 구현됨 가져오기 만 하면된다.
		
		return "redirect: getHotelList.do";
	}
	//글 등록 화면 보기 
	@RequestMapping(value="/viewInsertHotel.do") 
	public String viewInsertHotel(){
		System.out.println("숙소 등록 화면 보기 처리");
		return "hotel/insertHotel";
	}	
	//WEB-INF 폴더에 있는 jsp는 직접적으로 view를 볼 수 없다. 
	//또한 직접적으로 볼 수 없기 때문에 <a> 앵커 태그로 이동이 불가하며 Controller를 통해서만 이동을 해야 한다.
	
	//글 게시판 화면 보기
	@RequestMapping(value="/viewGetHotelList.do") 
	public String viewGetHotelList(){
		System.out.println("숙소 게시판 화면 보기 처리");
		return "hotel/getHotelList";
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
	
	@ModelAttribute("conditionMap")
	// jsp에서 활용됨 키 값이 "conditionMap"
	// for each 문에서 
	//@RequestMapping 호출 직전 동작됨 
	//model.addAttribute("boardList", boardList); 와 유사 
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "hotel_title");
		conditionMap.put("내용", "hotel_content");
		return conditionMap;
	}
	
	// 글 목록 검색
	@RequestMapping(value="/getHotelList.do") 
	public String getHotelList(HotelVO vo, Model model){
		System.out.println("숙소 목록 검색 처리");		
		// 검색 기능  Null check
		/*
		 * if(vo.getSearchCondition()==null) { vo.setSearchCondition("hotel_title"); }
		 * 
		 * if(vo.getSearchKeyword()== null){ vo.setSearchKeyword(""); }
		 */
		
		List<HotelVO> hotelList = hotelService.getHotelList(vo);
		
		model.addAttribute("hotelList", hotelList);
		// "boardList" 저장할 이름 , boardList : "boardList"에 저장 될 값
		return "hotel/getHotelList";
	}	// 모델에는 2개의 값이 담긴다. 모델엔 뷰니까 모델값과 뷰값
	 
	// 글 상세 조회
	@RequestMapping("/getHotel.do") 
	public String getBoard(HotelVO vo, Model model){
		System.out.println("글 상세 조회 처리");
		
		HotelVO hotel = hotelService.getHotel(vo);				
		
		model.addAttribute("hotel",hotel);
		
		return "getHotel.jsp";
	}	
	//
}