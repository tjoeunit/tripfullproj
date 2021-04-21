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
@RequestMapping("/lantrip")
public class LanTripController {
	
	@Autowired
	private LanTripService lanTripService;
	
// 글 등록
	@RequestMapping( value = "/insertLanTrip.do", method = RequestMethod.POST)
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
				
				case 2 : vo.setLantrip_img2(lanTripUploadName);
				break;
				
				case 3 : vo.setLantrip_img3(lanTripUploadName);
				break;
				
				case 4 : vo.setLantrip_img4(lanTripUploadName);
				break;
				
				default : vo.setLantrip_img5(lanTripUploadName);
				break;
				}
				
			}else {
				switch(i) {
				case 0 : vo.setLantrip_thumb(null);
				
				case 1 : vo.setLantrip_img1(null);
				break;
				
				case 2 : vo.setLantrip_img2(null);
				break;
				
				case 3 : vo.setLantrip_img3(null);
				break;
				
				case 4 : vo.setLantrip_img4(null);
				break;
				
				default : vo.setLantrip_img5(null);
				break;
				}
			}
		}
		
		// DB연동처리
		lanTripService.insertLanTrip(vo);
		
		// 화면전환
		return "redirect:getLanTripList.do";
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
	@RequestMapping(value="/getLanTripList.do", method = RequestMethod.GET)
	public String getLanTripList(LanTripVO vo, Model model) {
		System.out.println("랜선여행 목록 뷰");
		
		List<LanTripVO> lanTripList = lanTripService.getLanTripList(vo);
		
		model.addAttribute("lanTripList", lanTripList);
		
		return "lantrip/getLanTripList";
	}
	

// 글 상세 조회
	 @RequestMapping(value="/getLanTrip.do", method = RequestMethod.GET)
	 public String getLanTrip(LanTripVO vo, Model model) {
		 System.out.println("랜선여행 상세 조회 처리");
		 
		 LanTripVO lanTrip = lanTripService.getLanTrip(vo);

		 model.addAttribute("lantrip", lanTrip);
		 
	 return "lantrip/getLanTrip";
	 }
	
}
