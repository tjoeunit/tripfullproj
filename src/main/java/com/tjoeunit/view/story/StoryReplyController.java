package com.tjoeunit.view.story;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tjoeunit.biz.story.StoryReplyService;
import com.tjoeunit.biz.story.StoryReplyVO;

@Controller // spring 4.0부터 사용 가능
@RequestMapping("/story")
public class StoryReplyController{
 
    @Autowired       //서비스를 호출하기위해서 의존성을 주입
    StoryReplyService replyService;
    
    //댓글리스트를 호출할때 맵핑되는 메소드
    @RequestMapping("/storyReplylist.do")
    public ModelAndView storyReplylist(int story_no, ModelAndView mav) {
        List<StoryReplyVO> storyReply=replyService.storyReplyList(story_no); //댓글 목록
        mav.setViewName("/story/getStory"); //뷰의 이름
        mav.addObject("reply", storyReply); //뷰에 전달할 데이터 저장
        return mav; //뷰로 이동
    }
    
    //댓글 목록을 ArrayList로 리턴
    @RequestMapping("/storyReplylist_json.do")
    public List<StoryReplyVO> storyReplylist_json(int story_no){
        return replyService.storyReplyList(story_no);
    }
    
    @RequestMapping("/storyReplyinsert.do") //세부적인 url pattern
    @ResponseBody
    public String storyReplyinsert(StoryReplyVO rvo) {
        
        //댓글이 테이블에 저장됨
        replyService.createStoryReply(rvo);
        //jsp 페이지로 가거나 데이터를 리턴하지 않음
        return "story/getStory";
    }
}
