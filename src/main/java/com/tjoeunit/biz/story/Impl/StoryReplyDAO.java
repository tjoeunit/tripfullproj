package com.tjoeunit.biz.story.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.story.StoryReplyVO;

@Repository
public class StoryReplyDAO {
    
	@Autowired
	private SqlSessionTemplate mybatis;
	 
    //댓글 목록
    public List<StoryReplyVO> storyReplyList(int story_no) {
        return mybatis.selectList("storyReplyDAOTemplate.storyReplyList", story_no);
    }
    
    
    //댓글 작성
    public void createStoryReply(StoryReplyVO rvo) {
    	mybatis.insert("storyReplyDAOTemplate.createStoryReply", rvo); 
    }
	    
}
 
