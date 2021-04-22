package com.tjoeunit.view.flight;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.flight.FlightService;
import com.tjoeunit.biz.flight.FlightVO;

@Controller
@RequestMapping("/flight")
public class FlightController {
	
	@Autowired
	private FlightService flightService;
	
	// 글 등록 페이지
	@RequestMapping(value="/insertFlight.do", method = RequestMethod.GET)
	public String insertFlightPage() {
		return "flight/insertFlight";
	}	
	
	// 글 등록 처리
	@RequestMapping(value = "/insertFlight.do", method = RequestMethod.POST)
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
					
					case 1 : vo.setFlight_img1(flightUploadName);
					break;
				}
				
			}else {
				switch(i) {
				case 0 : vo.setFlight_thumb(null);
				
				case 1 : vo.setFlight_img1(null);
				break;
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

	// 글 수정
	@RequestMapping("/updateFlight.do")
	public String updateFlight(@ModelAttribute("Flight") FlightVO vo) {
		System.out.println("항공권 수정 처리" + vo);
		
		flightService.updateFlight(vo);
		return "redirect:getFlightList.do";
	}
	
	// 글 삭제
	@RequestMapping("/deleteFlight.do")
	public String deleteFlight(FlightVO vo) {
		System.out.println("항공권 삭제 처리");
		
		flightService.deleteFlight(vo);
		return "redirect:getFlightList.do";
	}

		
	// 글 목록 보기
	@RequestMapping(value="/getFlightList.do", method = RequestMethod.GET)
	public String getFlightList(FlightVO vo, Model model) {
		System.out.println("항공권 목록 페이지");
		
		List<FlightVO> flightList = flightService.getFlightList(vo);
		
		model.addAttribute("flightList", flightList);
		
		return "flight/getFlightList";
	}
	
	//페이징 ...................
	@GetMapping("flightList")
	public String flightListPaging(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		
		int total = flightService.countFlight();
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
		model.addAttribute("viewAll", flightService.selectFlight(vo));
		return "flight/getFlightList";
	}

	// 글 상세 조회
	@RequestMapping(value="/getFlight.do", method = RequestMethod.GET)
	public String getFlight(FlightVO vo, Model model) {
		System.out.println("항공권 상세 페이지");
	
		FlightVO flight = flightService.getFlight(vo);

		model.addAttribute("flight", flight);
		 
	return "flight/getFlight";
	}
		
}