package com.tjoeunit.biz.story.Impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tjoeunit.biz.story.StoryReplyService;
import com.tjoeunit.biz.story.StoryReplyVO;


@Service
public class StoryReplyServiceImpl implements StoryReplyService{
	//dao 호출을 위한 주입
	@Autowired
    private StoryReplyDAO replyDao; 

	//댓글 목록
	@Override
	public List<StoryReplyVO> storyReplyList(int story_no){
		List<StoryReplyVO> replyList = replyDao.storyReplyList(story_no);
		return replyList;
	}
 
	//댓글 쓰기
	@Override
	public int createStoryReply(StoryReplyVO rvo) {
		return replyDao.createStoryReply(rvo);
	}

	/*
	//댓글 수정
	@Override
	public int updateStoryReply(StoryReplyVO rvo) {
		return replyDao.updateStoryReply(rvo);
	}
	*/
	
	//댓글 삭제
	@Override
	public void deleteStoryReply(int reply_no) {
		replyDao.deleteStoryReply(reply_no);
	}
 
	//선택된 댓글 조회
	@Override
	public StoryReplyVO selectStoryReply(StoryReplyVO rvo) {
		return replyDao.selectStoryReply(rvo);
	}
 
}
