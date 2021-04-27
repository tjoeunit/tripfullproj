package com.tjoeunit.view.activity;

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

import com.tjoeunit.biz.activity.ActivityService;
import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.activity.ActivityVO;

@Controller
public class ActivityController {
	
	@Autowired
	private ActivityService activityService;
	
	// 액티비티 등록 페이지
	@RequestMapping(value="/activity/insertActivity.do", method = RequestMethod.GET)
	public String insertActivityPage() {
		return "activity/insertActivity";
	}	
	
	// 액티비티 등록 처리
	@RequestMapping(value = "/activity/insertActivity.do", method = RequestMethod.POST)
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
					/* CKEDITOR 사용으로 img 사용하지 않음
					case 1 : vo.setActivity_img1(activityUploadName);
					break;
					*/
				}		
				
			}else {
				
				switch(i) {
					case 0 : vo.setActivity_thumb(null);
					/* CKEDITOR 사용으로 img 사용하지 않음
					case 1 : vo.setActivity_img1(null);
					break;
					*/
				}
			}
		}
				
		System.out.println(vo);
		
		int cnt = activityService.insertActivity(vo);
		
		String msg="액티비티 등록 실패", url="/activity/insertActivity.do";

		if(cnt>0) {
			msg="액티비티 등록 성공";
			url="/activity/getActivityList.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";		
		
	}	
		
	/* 액티비티 목록 보기 : 페이징 처리 전 목록 컨트롤러
	@RequestMapping(value="/getActivityList.do", method = RequestMethod.GET)
	public String getActivityList(ActivityVO vo, Model model) {
		System.out.println("액티비티 목록 페이지");
		List<ActivityVO> activityList = activityService.getActivityList(vo);		
		model.addAttribute("activityList", activityList);		
		return "activity/getActivityList";
	}
	*/
	
	// 액티비티 목록 보기 : 페이징 처리 후 목록 컨트롤러
	@RequestMapping(value="/activity/getActivityList.do", method = RequestMethod.GET)
	public String activityListPaging(PagingVO vo, Model model,
			@RequestParam(value="nowPage", required=false) String nowPage,
			@RequestParam(value="cntPerPage", required=false) String cntPerPage) {
		
		int total = activityService.countActivity();
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
		model.addAttribute("activityList", activityService.selectActivity(vo));
		return "activity/getActivityList";
	}	
	
	// 액티비티 상세 조회
	@RequestMapping(value="/activity/getActivity.do", method = RequestMethod.GET)
	public String getActivity(ActivityVO vo, Model model) {
		//vo에 activity_no 값이 저장되어 있는지 확인
		System.out.println("액티비티 상세 페이지 activity_no = " + vo.getActivity_no());
				
		//activity_no 를 이용하여 전체 정보를 activity에 저장
		ActivityVO activity = activityService.getActivity(vo);
		
		System.out.println("액티비티 정보 " + activity);
		
		//activity에 저장된 값을 모델에 키 밸류로 저장
		model.addAttribute("activity", activity);
		
		//보여줄 페이지 리턴
		return "activity/getActivity";
	}
	
	// 액티비티 수정 페이지
	@RequestMapping(value="/activity/updateActivity.do", method=RequestMethod.GET)
	public String updateActivityPage(ActivityVO vo, Model model) {
		//vo에 activity_no 값이 저장되어 있는지 확인
		System.out.println("액티비티 수정 페이지 activity_no = " + vo.getActivity_no());
		
		//activity_no 를 이용하여 전체 정보를 activity에 저장
		ActivityVO activity = activityService.getActivity(vo);
		
		System.out.println("액티비티 정보 " + activity);
		
		//activity에 저장된 값을 모델에 키 밸류로 저장
		model.addAttribute("activity", activity);
		
		return "activity/updateActivity";
	}
	
	// 액티비티 수정 처리
	@RequestMapping(value = "/activity/updateActivity.do", method = RequestMethod.POST)
	public String updateActivity(ActivityVO vo, HttpSession session, MultipartFile[] activityImgUpload, HttpServletRequest request, Model model) throws Exception {
		System.out.println("수정 처리 전 액티비티 vo = " + vo);
				
		// 1. activityImg 에 경로 지정 
		String activityImg = session.getServletContext().getRealPath("/activityUpload/");
		
		// 2. 업로드 할 이미지 개수 확인
		System.out.println("==>"+activityImgUpload.length);
		
		// 3. 업로드 할 사진이 존재하지 않을 때 (기존 썸네일 선택 시 input 태그의 type 설정을 text로 지정하고 페이지를 불러들일 때 부터 DB 저장된 값을 value 에 넣어둠)  
		if(activityImgUpload.length < 1) {
			
			// DB 에서 읽어 온 값을 그대로 vo 에 저장시킴
			String activity_thumb = request.getParameter("activityImgUpload");
			System.out.println("기존 썸네일 사용 시 파일명 : " + activity_thumb);
			vo.setActivity_thumb(activity_thumb);
			
		// 4. 업로드 할 사진이 존재할 때
		}else {
			for(int i=0; i<activityImgUpload.length; i++) {
				String activityUploadName = activityImgUpload[i].getOriginalFilename();
				activityImgUpload[i].transferTo(new File(activityImg+activityUploadName));
				System.out.println("변경 썸네일 사용 시 파일명 : " + activityUploadName);
				vo.setActivity_thumb(activityUploadName);
			}
		}
				
		System.out.println("수정 처리 될 액티비티 vo = " + vo);
		
		int cnt = activityService.updateActivity(vo);
		
		String msg="액티비티 수정 실패", url="/activity/updateActivity.do?activity_no="+vo.getActivity_no();		
		
		if(cnt>0) {
			msg="액티비티 수정 성공";
			url="/activity/getActivity.do?activity_no="+vo.getActivity_no();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}
	
	// 액티비티 삭제
	@RequestMapping("/activity/deleteActivity.do")
	public String deleteActivity(ActivityVO vo, Model model) {
		
		System.out.println("액티비티 삭제 처리 activity_no = " + vo.getActivity_no());
		
		int cnt = activityService.deleteActivity(vo);
		
		String msg="액티비티 삭제 실패", url="/activity/getActivity.do?activity_no="+vo.getActivity_no();
		
		if(cnt>0) {
			msg="액티비티 삭제 성공";
			url="/activity/getActivityList.do";
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
	
	// 관리자 액티비티 목록 페이지로 이동
	@RequestMapping(value="/adminActivity/adminActivity.do", method=RequestMethod.GET)
	public String adminActivityPage(ActivityVO vo, Model model) {
		System.out.println("액티비티 관리자 목록으로 이동");
			
		List<ActivityVO> activityList = activityService.getActivityList(vo);
				
		model.addAttribute("activityList", activityList);
				
		return "adminActivity/adminActivity";
	}
	
	// 관리자 액티비티 등록 페이지로 이동
	@RequestMapping(value="/adminActivity/insertActivity.do", method=RequestMethod.GET)
	public String adminInsertActivityPage() {
		return "adminActivity/insertActivity";
	}
	
	// 관리자 액티비티 등록 처리
	@RequestMapping(value="/adminActivity/insertActivity.do", method=RequestMethod.POST)
	public String adminInsertActivity(ActivityVO vo, HttpSession session, MultipartFile[] activityImgUpload, Model model) throws Exception {
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
				}
			}else {
				switch(i) {
					case 0 : vo.setActivity_thumb(null);
					break;					
				}
			}
		}				
				
		// DB연동처리
		System.out.println(vo);
		int cnt = activityService.insertActivity(vo);
		
		String msg="액티비티 등록 실패", url="/adminActivity/insertActivity.do";

		if(cnt>0) {
			msg="액티비티 등록 성공";
			url="/adminActivity/adminActivity.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		// 화면전환
		return "common/message";		
	}
	
	// 관리자 액티비티 상세보기
	@RequestMapping(value="/adminActivity/adminActivityDetail.do", method = RequestMethod.GET)
	 public String adminActivityDetail(ActivityVO vo, Model model) {
		 System.out.println("액티비티 상세 페이지");
		 
		 ActivityVO activity = activityService.getActivity(vo);
		 
		 model.addAttribute("activity", activity);
		 
		 return "adminActivity/adminActivityDetail";
	 }
	
	// 관리자 액티비티 삭제 처리
	@RequestMapping("/adminActivity/adminActivityDelete.do")
	public String adminActivityDelete(ActivityVO vo, Model model) {
		
		System.out.println("액티비티 삭제 처리 activity_no = " + vo.getActivity_no());
		
		int cnt = activityService.deleteActivity(vo);
		
		String msg="액티비티 삭제 실패", url="/adminActivity/adminActivityDetail.do?activity_no="+vo.getActivity_no();
		
		if(cnt>0) {
			msg="액티비티 삭제 성공";
			url="/adminActivity/adminActivity.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	// 관리자 액티비티 수정 페이지로 이동
	@RequestMapping(value="/adminActivity/adminActivityUpdate.do", method=RequestMethod.GET)
	public String adminActivityUpdatePage(ActivityVO vo, Model model) {
		//vo에 activity_no 값이 저장되어 있는지 확인
		System.out.println("액티비티 수정 페이지 activity_no = " + vo.getActivity_no());
		
		//activity_no 를 이용하여 전체 정보를 activity에 저장
		ActivityVO activity = activityService.getActivity(vo);
		
		System.out.println("액티비티 정보 " + activity);
		
		//activity에 저장된 값을 모델에 키 밸류로 저장
		model.addAttribute("activity", activity);
		
		return "adminActivity/adminActivityUpdate";
	}
	
	// 관리자 액티비티 수정 처리
	@RequestMapping(value = "/adminActivity/adminActivityUpdate.do", method = RequestMethod.POST)
	public String adminActivityUpdate(ActivityVO vo, HttpSession session, MultipartFile[] activityImgUpload, HttpServletRequest request, Model model) throws Exception {
		System.out.println("수정 처리 전 액티비티 vo = " + vo);
				
		// 1. activityImg 에 경로 지정 
		String activityImg = session.getServletContext().getRealPath("/activityUpload/");
		
		// 2. 업로드 할 이미지 개수 확인
		System.out.println("==>"+activityImgUpload.length);
		
		// 3. 업로드 할 사진이 존재하지 않을 때 (기존 썸네일 선택 시 input 태그의 type 설정을 text로 지정하고 페이지를 불러들일 때 부터 DB 저장된 값을 value 에 넣어둠)  
		if(activityImgUpload.length < 1) {
			
			// DB 에서 읽어 온 값을 그대로 vo 에 저장시킴
			String activity_thumb = request.getParameter("activityImgUpload");
			System.out.println("기존 썸네일 사용 시 파일명 : " + activity_thumb);
			vo.setActivity_thumb(activity_thumb);
			
		// 4. 업로드 할 사진이 존재할 때
		}else {
			for(int i=0; i<activityImgUpload.length; i++) {
				String activityUploadName = activityImgUpload[i].getOriginalFilename();
				activityImgUpload[i].transferTo(new File(activityImg+activityUploadName));
				System.out.println("변경 썸네일 사용 시 파일명 : " + activityUploadName);
				vo.setActivity_thumb(activityUploadName);
			}
		}
				
		System.out.println("수정 처리 될 액티비티 vo = " + vo);
		
		int cnt = activityService.updateActivity(vo);
		
		String msg="액티비티 수정 실패", url="/adminActivity/adminActivityUpdate.do?activity_no="+vo.getActivity_no();		
		
		if(cnt>0) {
			msg="액티비티 수정 성공";
			url="/adminActivity/adminActivityDetail.do?activity_no="+vo.getActivity_no();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}	
	
}