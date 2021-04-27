package com.tjoeunit.view.story;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tjoeunit.biz.story.StoryReplyService;
import com.tjoeunit.biz.story.StoryReplyVO;

@RestController
@RequestMapping("/story")
public class StoryReplyController{
 
    @Autowired       //서비스를 호출하기위해서 의존성을 주입
    StoryReplyService replyService;
    
    //댓글리스트를 호출할때 맵핑되는 메소드
   /* @RequestMapping(value="/storyReplylist.do", method = RequestMethod.GET)
    public ModelAndView storyReplylist(int story_no, ModelAndView mav) {
        List<StoryReplyVO> reply=replyService.storyReplyList(story_no); //댓글 목록
        System.out.println("들어왔다");
        mav.setViewName("story/getStoryReply"); //뷰의 이름
        System.out.println("222222222");
        mav.addObject("reply", reply); //뷰에 전달할 데이터 저장
        System.out.println("저장했다.");
        return mav; //뷰로 이동
    }*/
    
    @RequestMapping(value="/storyReplylist.do", method = RequestMethod.GET)
    public String storyReplylist(StoryReplyVO rvo, Model model) {
        List<StoryReplyVO> reply=replyService.storyReplyList(rvo); //댓글 목록
        System.out.println("들어왔다");
        model.addAttribute("reply", reply);
        System.out.println("222222222");
        return "story/getStoryReply";
    }
    
    //댓글 목록을 ArrayList로 리턴
    @RequestMapping(value="/getStoryReply.do", method = RequestMethod.GET)
    public List<StoryReplyVO> storyReplylist_json(StoryReplyVO rvo){
    	System.out.println("4444444444");
        return replyService.storyReplyList(rvo);
    }
    
    // 댓글 삽입
    @RequestMapping(value="/storyReplyinsert.do", method = RequestMethod.POST) //세부적인 url pattern
    public void storyReplyinsert(StoryReplyVO rvo) {

        //댓글이 테이블에 저장됨
        replyService.createStoryReply(rvo);
    }
}
