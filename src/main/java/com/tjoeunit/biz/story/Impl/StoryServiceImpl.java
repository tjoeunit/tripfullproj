package com.tjoeunit.biz.story.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.story.StoryService;
import com.tjoeunit.biz.story.StoryVO;


@Service
public class StoryServiceImpl implements StoryService {

	@Autowired
	private StoryDAO storyDAO;
	
	@Override
	public int insertStory(StoryVO vo) {
		return storyDAO.insertStory(vo);
	}

	@Override
	public void viewCountStory(StoryVO vo) {
		storyDAO.viewCountStory(vo);
	}

	@Override
	public List<StoryVO> getStoryList(StoryVO vo) {
		List<StoryVO> list = storyDAO.getStoryList(vo);
		return list;
	}

	@Override
	public StoryVO getStory(StoryVO vo) {
		StoryVO story = storyDAO.getStory(vo);
		return story;
	}

	@Override
	public int updateStory(StoryVO vo) {
		return storyDAO.updateStory(vo);
	}

	@Override
	public void deleteStory(StoryVO vo) {
		storyDAO.deleteStory(vo);
	}
	
	//페이징처리를 위해 생성
	@Override
	public int countStory() {		
		return storyDAO.countStory();
	}
	
	//페이징처리를 위해 생성
	@Override
	public List<StoryVO> selectStory(PagingVO vo) {
		return storyDAO.selectStory(vo);
	}

}
