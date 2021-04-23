package com.tjoeunit.view.lantrip;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.lantrip.LanTripService;
import com.tjoeunit.biz.lantrip.LanTripVO;

@Controller
public class LanTripController {
	
	@Autowired
	private LanTripService lanTripService;
		
	// 관리자메인에서 랜선여행 관리자 페이지로 이동
	@RequestMapping(value="/admin/adminLanTrip.do", method=RequestMethod.GET)
	public String adminLanTrip(LanTripVO vo, Model model) {
		System.out.println("랜선여행 페이지 이동 ");
			
		List<LanTripVO> lanTripList = lanTripService.getLanTripList(vo);
				
		model.addAttribute("lanTripList", lanTripList);
				
		return "admin/adminLanTrip";
	}
			
	// 랜선여행 관리자 등록 페이지 이동
	@RequestMapping(value="/adminLanTrip/insertLanTrip.do", method=RequestMethod.GET)
	public String insertLanTrip(LanTripVO vo, Model model) {
		System.out.println("랜선여행 등록하기 ");
		return "adminLanTrip/insertLanTrip";
	}
			
	// 랜선여행 관리자 상세보기
	
	
	
	// 랜선여행 새글 등록
	@RequestMapping( value = "/lantrip/insertLanTrip.do", method = RequestMethod.POST)
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
							
					case 1 : vo.setLantrip_img1(lanTripUploadName);
					break;
				}
			}else {
				switch(i) {
					case 0 : vo.setLantrip_thumb(null);
					break;
						
					case 1 : vo.setLantrip_img1(null);
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
		lanTripService.insertLanTrip(vo);
				
		List<LanTripVO> lanTripList = lanTripService.getLanTripList(vo);
		model.addAttribute("lanTripList", lanTripList);
					
		// 화면전환
		return "admin/adminLanTrip";
	}

// 글 수정
	@RequestMapping("/updateLanTrip.do")
	public String updateLanTrip(@ModelAttribute("lanTrip") LanTripVO vo) {
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
	@RequestMapping(value="/lantrip/getLanTripList.do", method = RequestMethod.GET)
	public String getLanTripList(LanTripVO vo, Model model) {
		System.out.println("랜선여행 목록 뷰");
		
		List<LanTripVO> lanTripList = lanTripService.getLanTripList(vo);
		model.addAttribute("lanTripList", lanTripList);
		
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
