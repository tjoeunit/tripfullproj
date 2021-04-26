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
    StoryReplyDAO replyDao; 
	
	//댓글 목록
	@Override
	public List<StoryReplyVO> storyReplyList(int story_no) {
		return replyDao.storyReplyList(story_no);
	}

	//댓글 쓰기
	@Override
	public void createStoryReply(StoryReplyVO rvo) {
		replyDao.createStoryReply(rvo);
	}

}
