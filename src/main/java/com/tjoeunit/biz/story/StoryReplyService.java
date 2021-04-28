package com.tjoeunit.biz.story;

import java.util.List;


public interface StoryReplyService {

//댓글 리스트
	public List<StoryReplyVO> storyReplyList(int story_no); 

//댓글 작성
    public int createStoryReply(StoryReplyVO rvo);    

/*    
//댓글 수정
    public int updateStoryReply(StoryReplyVO rvo);
    */
   
//댓글 삭제
    public void deleteStoryReply(int reply_no);
 

//선택된 댓글 조회
    public StoryReplyVO selectStoryReply(StoryReplyVO rvo);

}
