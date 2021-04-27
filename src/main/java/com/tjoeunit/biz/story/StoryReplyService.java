package com.tjoeunit.biz.story;

import java.util.List;

 
public interface StoryReplyService {
	
//댓글 리스트
	public List<StoryReplyVO> storyReplyList(StoryReplyVO rvo); 
	
//댓글 작성
    public void createStoryReply(StoryReplyVO rvo);    
    
}
