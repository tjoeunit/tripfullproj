package com.tjoeunit.view.story;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.tjoeunit.biz.story.StoryService;
import com.tjoeunit.biz.story.StoryVO;

@Controller
@RequestMapping("/story")
public class StoryController {
	@Autowired
	private StoryService storyService;

// 글 등록 페이지 불러오기
	@RequestMapping(value="/insertStoryPage.do", method=RequestMethod.GET)
	public String insertStoryPage() throws IOException {
		System.out.println("스토리 등록 페이지 호출");
		return null;
	}

// CKEditor 이미지 업로드
	@RequestMapping(value="imageUpload.do", method=RequestMethod.POST)
	@ResponseBody
	public String fileupload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile) throws Exception {
		
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = request.getServletContext().getRealPath("/img");
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						
						printWriter = response.getWriter();
						response.setContentType("text/html");
						String fileUrl = request.getContextPath() + "/img/" + fileName;
						
						// json 사용
						// Return Type
						// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						
						printWriter.println(json);
						
					}catch(IOException e) {
						e.printStackTrace();
					}finally {
						if(out != null) {
							out.close();
						}
						if(printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
		
		return null;
	}
	
// 글 등록
	@RequestMapping(value="/insertStory.do", method=RequestMethod.POST)
	public String insertStory(StoryVO vo, HttpServletResponse insert) throws Exception {
		System.out.println("스토리 등록 처리");
		
		/*
		 * String fileSaveFolder =
		 * session.getServletContext().getRealPath("/storyUpload/");
		 * 
		 * MultipartFile uploadFile = vo.getStoryUploadFile(); if(!uploadFile.isEmpty())
		 * { String fileName = uploadFile.getOriginalFilename();
		 * uploadFile.transferTo(new File(fileSaveFolder+fileName));
		 * 
		 * }
		 */
		
		// JavaBean의 필드 이름과, JSP 내의 파라미터 이름이 동일하다면 Annotation으로 등록할 시에 따로 추출할 필요없이 Spring이 알아서 추출해서 값을 담아준다.
		// 즉 전의 프로젝트와 달리 따로 코드를 적을 필요가 없어진다.
		
		insert.setContentType("text/html; charset=UTF-8");
		PrintWriter story_out_write = insert.getWriter();
		story_out_write.println("<script>alert('글이 등록되었습니다.');</script>");
		story_out_write.flush();
		
		storyService.insertStory(vo);
		
		return "redirect:getStoryList.do";
	}
	
// 글 수정
	@RequestMapping("/updateStory.do")
											//사용자로부터 전달 받은 TITLE과 CONTENT 값 업데이트
	public String updateStory(@ModelAttribute("story") StoryVO vo) {		//storyVO에 값을 담아 "story "에 담아줌
		System.out.println("스토리 수정 처리" +vo);
		// 1. 사용자 입력 정보 추출(Spring이 대신 해줌.생략 가능)
		
		// 2. DB 연동 처리
		storyService.updateStory(vo);
		// 3. 화면 전환
		return "redirect:getStoryList.do";
	}
	
// 글 삭제
	@RequestMapping("/deleteStory.do")
	public String deleteStory(StoryVO vo) {
		System.out.println("스토리 삭제 기능 처리");
				
		storyService.deleteStory(vo);
		
		return "redirect:getStoryList.do";
	}
/*	
// RequestMapping이 실행되기 직전에 이 메소드가 먼저 호출 되어진다.(model에 값이 들어감)
	@ModelAttribute("/conditionMap.do")		//"conditionMap"에 return 값을 저장
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	
	*/
	
// 글 목록 보기
	@RequestMapping(value="/getStoryList.do",  method = RequestMethod.GET)
	public String getStoryList(StoryVO vo, Model model) {	//ModelAndView의 Model 딴에 있는 변수를 매개변수로

		List<StoryVO> storyList = storyService.getStoryList(vo);
		
		model.addAttribute("storyList", storyList);		//key Value
		
		System.out.println("스토리 목록 보기");
		return "story/getStoryList";

	}

// 글 상세 조회
	@RequestMapping(value="/getStory.do",  method = RequestMethod.GET)
	public String getStory(StoryVO vo, Model model) {
		System.out.println("스토리 상세 조회 처리");
		
		StoryVO story = storyService.getStory(vo);
		
		model.addAttribute("story", story);
		
		
		return "story/getStory";
	}
}
