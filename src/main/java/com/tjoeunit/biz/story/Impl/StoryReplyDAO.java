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
    public List<StoryReplyVO> storyReplyList(int story_no){
        return mybatis.selectList("storyReplyDAOTemplate.storyReplyList", story_no);
    }

    //댓글 작성
    public int createStoryReply(StoryReplyVO rvo) {
    	return mybatis.insert("storyReplyDAOTemplate.createStoryReply", rvo); 
    }

    /* 
    //댓글 수정
    public int updateStoryReply(StoryReplyVO rvo) {
    	return mybatis.update("storyReplyDAOTemplate.createStoryReply", rvo); 
    }
    */

    //댓글 삭제
    public void deleteStoryReply(StoryReplyVO rvo) {
    	mybatis.delete("storyReplyDAOTemplate.createStoryReply", rvo); 
    }

    //선택된 댓글 조회
    public StoryReplyVO selectStoryReply(StoryReplyVO rvo) {
    	return mybatis.selectOne("storyReplyDAOTemplate.createStoryReply", rvo); 
    }
}

