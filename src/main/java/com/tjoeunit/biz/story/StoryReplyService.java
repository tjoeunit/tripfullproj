package com.tjoeunit.biz.story;

import java.util.List;

 
public interface StoryReplyService {
	
//댓글 리스트
	public List<StoryReplyVO> storyReplyList(int story_no); 
	
//댓글 작성
    public void createStoryReply(StoryReplyVO rvo);    
    
}
