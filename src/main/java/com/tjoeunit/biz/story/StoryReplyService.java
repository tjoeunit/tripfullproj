package com.tjoeunit.biz.story;

import java.util.List;

 
public interface StoryReplyService {
	
//댓글 리스트
	public List<StoryReplyVO> getReplyList(int story_no); 
	
//댓글 작성
    public int createReply(StoryReplyVO rvo);    
    
//댓글 삭제
    public void deleteReply(StoryReplyVO rvo);  

    //댓글 번호를 통해 댓글 작성자의 아이디를 추출
    public String selectIdByReplyNo(int reply_no);
    /*
	  //선택된 댓글 조회 public StoryReplyVO selectStoryReply(StoryReplyVO rvo);
	 */
}
