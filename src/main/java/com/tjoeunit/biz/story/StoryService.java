package com.tjoeunit.biz.story;

import java.util.List;

import com.tjoeunit.biz.common.PagingVO;

public interface StoryService {
	
	//글 등록
	int insertStory(StoryVO vo);
	
	//조회수 처리
	void viewCountStory(StoryVO vo);
	
	//글 목록 조회
	List<StoryVO> getStoryList(StoryVO vo);
	
	//글 상세 조회
	StoryVO getStory(StoryVO vo);
	
	//글 수정
	int updateStory(StoryVO vo);
	
	//글 삭제
	void deleteStory(StoryVO vo);
	
	// 페이징처리를 위해 생성 : 게시물 총 개수
	int countStory();
		
	//페이징처리를 위해 생성 : 항공권 조회
	List<StoryVO> selectStory(PagingVO vo);
}
