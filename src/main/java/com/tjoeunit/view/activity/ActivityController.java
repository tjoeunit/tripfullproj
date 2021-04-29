package com.tjoeunit.view.activity;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeunit.biz.activity.ActivityService;
import com.tjoeunit.biz.activity.ActivityVO;
import com.tjoeunit.biz.common.PagingVO;

@Controller
public class ActivityController {
	
	@Autowired
	private ActivityService activityService;
	
	// 액티비티 결제 정보 받아서 결제 페이지로 보내기
	@RequestMapping(value="/activity/activityPayment.do", method=RequestMethod.POST)
	public String flightPaymentPage(HttpServletRequest request, Model model) {
		
		String members_no = (String)request.getParameter("members_no");
		String activity_no = request.getParameter("activity_no");
		String payment_price = request.getParameter("payment_price");
		String payment_quantity = request.getParameter("payment_quantity");
		String payment_bookdate = request.getParameter("payment_bookdate");
		String activity_title = request.getParameter("activity_title");
		String product_category = request.getParameter("product_category");
		
		System.out.println("members_no="+members_no);
		System.out.println("activity_no="+activity_no);
		System.out.println("payment_price="+payment_price);
		System.out.println("payment_quantity="+payment_quantity);
		System.out.println("payment_bookdate="+payment_bookdate);
		System.out.println("activity_title="+activity_title);
		System.out.println("product_category="+product_category);
		
		model.addAttribute("members_no", members_no);
		model.addAttribute("activity_no", activity_no);
		model.addAttribute("payment_price", payment_price);
		model.addAttribute("payment_quantity", payment_quantity);
		model.addAttribute("payment_bookdate", payment_bookdate);
		model.addAttribute("activity_title", activity_title);
		model.addAttribute("product_category", product_category);
		
		return "payment/payment";
	}
	
	
	
	// 글 등록 페이지
	@RequestMapping(value="/adminActivity/insertActivity.do", method = RequestMethod.GET)
	public String insertActivityPage() {
		return "adminActivity/insertActivity";
	}

	
	// 글 등록
	@RequestMapping( value = "/adminActivity/insertActivity.do", method = RequestMethod.POST)
	public String insertActivity(ActivityVO vo, HttpSession session, MultipartFile[] activityImgUpload, Model model) throws Exception {
		System.out.println("액티비티 등록 처리");
		
		// 파일 업로드 처리
		String activityImg = session.getServletContext().getRealPath("/activityUpload/");
		System.out.println("==>"+activityImgUpload.length);
		
		for(int i = 0; i < activityImgUpload.length; i++) {
			System.out.println("==>"+activityImgUpload[i].isEmpty());
			
			if(!activityImgUpload[i].isEmpty()) {
				String activityUploadName = activityImgUpload[i].getOriginalFilename();
				activityImgUpload[i].transferTo(new File(activityImg+activityUploadName));
				switch(i) {
				case 0 : vo.setActivity_thumb(activityUploadName);
				break;
				
			/*
			 * case 1 : vo.setActivity_img1(activityUploadName); break;
			 * 
			 * case 2 : vo.setActivity_img2(activityUploadName); break;
			 * 
			 * case 3 : vo.setActivity_img3(activityUploadName); break;
			 * 
			 * case 4 : vo.setActivity_img4(activityUploadName); break;
			 * 
			 * default : vo.setActivity_img5(activityUploadName); break;
			 */
				}
				
			}else {
				switch(i) {
				case 0 : vo.setActivity_thumb(null);
				
					/*
					 * case 1 : vo.setActivity_img1(null); break;
					 * 
					 * case 2 : vo.setActivity_img2(null); break;
					 * 
					 * case 3 : vo.setActivity_img3(null); break;
					 * 
					 * case 4 : vo.setActivity_img4(null); break;
					 * 
					 * default : vo.setActivity_img5(null); break;
					 */
				}
			}
		}
		
		// DB연동처리
		activityService.insertActivity(vo);
		
		// 화면전환
		return "redirect:getActivityList.do";
	}

	// 글 수정
	@RequestMapping("/activity/updateActivity.do")
	public String updateActivity(@ModelAttribute("activity") ActivityVO vo) {
		System.out.println("글 수정 처리" + vo);
		
		activityService.updateActivity(vo);
		return "redirect:getActivityList.do";
	}
	
	// 글 삭제
	@RequestMapping("/activity/deleteActivity.do")
	public String deleteActivity(ActivityVO vo) {
		System.out.println("글 삭제 처리");
		
		activityService.deleteActivity(vo);
		return "redirect:getActivityList.do";
	}

	
	/* 글 목록 보기 : 페이징 처리 전 목록 컨트롤러
	@RequestMapping(value="/getActivityList.do", method = RequestMethod.GET)
	public String getActivityList(ActivityVO vo, Model model) {
		System.out.println("액티비티 목록 뷰");
		
		List<ActivityVO> activityList = activityService.getActivityList(vo);
		
		model.addAttribute("activityList", activityList);
		
		return "activity/getActivityList";
	}
	*/

	// 글 목록 보기 : 페이징 처리 후 목록 컨트롤러
	@RequestMapping(value="/activity/getActivityList.do", method = RequestMethod.GET)
	public String activityListPaging(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		
		int total = activityService.countActivity();
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
		model.addAttribute("activityList", activityService.selectActivity(vo));
		return "activity/getActivityList";
	}		

	// 글 상세 조회
	 @RequestMapping(value="/activity/getActivity.do", method = RequestMethod.GET)
	 public String getActivity(ActivityVO vo, Model model) {
		 System.out.println("액티비티 상세 조회 처리");
		 
		 ActivityVO activity = activityService.getActivity(vo);

		 model.addAttribute("activity", activity);
		 
		 return "activity/getActivity";
	 }
	
}
