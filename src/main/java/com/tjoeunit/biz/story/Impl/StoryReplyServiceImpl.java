package com.tjoeunit.biz.story.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.story.StoryReplyService;
import com.tjoeunit.biz.story.StoryReplyVO;

@Service
public class StoryReplyServiceImpl implements StoryReplyService{
	@Autowired
	private StoryReplyDAO replyDAO;
	
	//댓글 목록
	@Override
	public List<StoryReplyVO> getReplyList(int story_no) {
		return replyDAO.getReplyList(story_no);
	}

	// 댓글 작성
	@Override
	public int createReply(StoryReplyVO rvo) {
		return replyDAO.createReply(rvo);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(StoryReplyVO rvo) {
		replyDAO.deleteReply(rvo);
	}
	
 /*
	//선택된 댓글 조회
	@Override
	public StoryReplyVO selectStoryReply(StoryReplyVO rvo) {
		return replyDao.selectStoryReply(rvo);
	}*/
}
