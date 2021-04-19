package com.tjoeunit.biz.story.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.story.StoryService;
import com.tjoeunit.biz.story.StoryVO;


@Service
public class StoryServiceImpl implements StoryService {

	@Autowired
	private StoryDAO storyDAO;
	
	@Override
	public void insertStory(StoryVO vo) {
		storyDAO.insertStory(vo);
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
	public void updateStory(StoryVO vo) {
		storyDAO.updateStory(vo);
	}

	@Override
	public void deleteStory(StoryVO vo) {
		storyDAO.deleteStory(vo);
	}


}
