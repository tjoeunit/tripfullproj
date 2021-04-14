package com.tjoeunit.view.lantrip;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.lantrip.LanTripService;
import com.tjoeunit.biz.lantrip.LanTripVO;

@Controller
@SessionAttributes("lanTrip")
public class LanTripController {
	
	@Autowired
	private LanTripService lanTripService;
	
// 글 등록
	@RequestMapping( value = "/insertLanTrip.do", method = RequestMethod.POST)
	public String insertLanTrip(LanTripVO vo, HttpSession session) throws Exception {
		System.out.println("랜선여행 등록 처리");
		
		// 썸네일 파일 업로드 처리
		String lanTripThumbSave = session.getServletContext().getRealPath("/lanTripUpload/thumb");
		
		MultipartFile lanTripThumb = vo.getLantrip_thumb();
		if(!lanTripThumb.isEmpty()) {
			String lanTripThumbName = lanTripThumb.getOriginalFilename();
			lanTripThumb.transferTo(new File(lanTripThumbSave+lanTripThumbName));
		}
		
		// 상세설명 파일 업로드 처리
				String lanTripDetailSave = session.getServletContext().getRealPath("/lanTripUpload/detail");
				
				MultipartFile lanTripDetail = vo.getLantrip_thumb();
				if(!lanTripDetail.isEmpty()) {
					String lanTripDetailName = lanTripDetail.getOriginalFilename();
					lanTripDetail.transferTo(new File(lanTripDetailSave+lanTripDetailName));
				}
		
		// DB연동처리
		lanTripService.insertLanTrip(vo);
		
		// 화면전환
		return "redirect:getLanTripList.do";
	}

// 글 수정
	@RequestMapping("/updateLanTrip.do")
	public String updateBoard(@ModelAttribute("lanTrip") LanTripVO vo) {
		System.out.println("글 수정 처리" + vo);
		
		lanTripService.updateLanTrip(vo);
		return "redirect:getLanTripList.do";
	}
	
	// 글 삭제
	@RequestMapping("/deleteLanTrip.do")
	public String deleteLanTrip(LanTripVO vo) {
		System.out.println("글 삭제 처리");
		
		lanTripService.deleteLanTrip(vo);
		return "redirect:getLanTripList.do";
	}

	
// 글 목록 보기
	@RequestMapping("/getLanTripList.do")
	public String getLTList(LanTripVO vo, Model model) {
		System.out.println("글 목록 검색 처리1");
		List<LanTripVO> lanTripList = lanTripService.getLanTripList(vo);
		model.addAttribute("lanTripList", lanTripList);
		return "/lantrip/getLanTripList.jsp";
	}
	
	// 글 상세 조회
	@RequestMapping("/getLanTrip.do")
	public String getLanTrip(LanTripVO vo, Model model) {
		System.out.println("글 상세 조회 처리");
		
		LanTripVO lanTrip = lanTripService.getLanTrip(vo);
		
		System.out.println(vo);
		
		model.addAttribute("lanTrip", lanTrip);
		
		return "/lantrip/getLanTrip.jsp";				
	}	
	
}
