package com.tjoeunit.biz.story;

import java.util.List;

 
public interface StoryReplyService {
	
//댓글 리스트
	public List<StoryReplyVO> getReplyList(int story_no); 
	
//댓글 작성
    public int createReply(StoryReplyVO rvo);    
    
//댓글 삭제
    public void deleteReply(StoryReplyVO rvo);    
}
