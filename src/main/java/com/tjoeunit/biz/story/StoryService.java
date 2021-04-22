package com.tjoeunit.biz.story;

import java.util.List;

public interface StoryService {
	
	//글 등록
	int insertStory(StoryVO vo);
	
	void viewCountStory(StoryVO vo);
	
	//글 목록 조회
	List<StoryVO> getStoryList(StoryVO vo);
	
	//글 상세 조회
	StoryVO getStory(StoryVO vo);
	
	//글 수정
	void updateStory(StoryVO vo);
	
	//글 삭제
	void deleteStory(StoryVO vo);
}
