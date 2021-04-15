package com.tjoeunit.biz.story.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.story.StoryVO;

@Repository
public class StoryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertStory(StoryVO vo) {
		return mybatis.insert("storyDAOTemplate.insertStory", vo);
	}
	
	public void updateStory(StoryVO vo) {
		mybatis.update("storyDAOTemplate.updateStory", vo);
	}
	
	public void deleteStory(StoryVO vo) {
		mybatis.delete("storyDAOTemplate.deleteStory", vo);
	}
	
	public StoryVO getStory(StoryVO vo) {
		return mybatis.selectOne("storyDAOTemplate.getStory", vo);
	}
	
	public List<StoryVO> getStoryList(StoryVO vo) {
		// 검색 기능 전											
		return mybatis.selectList("storyDAOTemplate.getStoryList", vo);			//구현해야 함!
		/*
		 * if(vo.getStorySearchCondition().equals("TITLE")){ return
		 * mybatis.selectList("storyDAOTemplate.getStoryList_T", vo); }else
		 * if(vo.getStorySearchCondition().equals("CONTENT")){ return
		 * mybatis.selectList("storyDAOTemplate.getStoryList_C", vo); }else { return
		 * mybatis.selectList("storyDAOTemplate.getStoryList_T", vo); }
		 */
	}
}
