package com.tjoeunit.biz.story.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.story.StoryVO;

@Repository
public class StoryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertStory(StoryVO vo) {
		return mybatis.insert("storyDAOTemplate.insertStory", vo);
	}
	
	public void viewCountStory(StoryVO vo) {
		// 조회수 처리											
		mybatis.update("storyDAOTemplate.viewCountStory", vo);
	}
	
	public int updateStory(StoryVO vo) {
		return mybatis.update("storyDAOTemplate.updateStory", vo);
	}
	
	public void deleteStory(StoryVO vo) {
		mybatis.delete("storyDAOTemplate.deleteStory", vo);
	}
	
	public StoryVO getStory(StoryVO vo) {
		return mybatis.selectOne("storyDAOTemplate.getStory", vo);
	}
	
	public List<StoryVO> getStoryList(StoryVO vo) {
		// 검색 기능 전											
		return mybatis.selectList("storyDAOTemplate.getStoryList", vo);
	}
	
	//페이징처리를 위해 생성
	public int countStory() {
		return mybatis.selectOne("storyDAOTemplate.countStory");
	}
	
	//페이징처리를 위해 생성
	public List<StoryVO> selectStory(PagingVO vo) {
		return mybatis.selectList("storyDAOTemplate.selectStory", vo);
	}	
}
