package com.tjoeunit.biz.practice;

import java.util.List;

public interface PracticeService {

	//글 등록
	int insertPractice(PracticeVO vo);	
	
	//글 목록 조회
	List<PracticeVO> getPracticeList(PracticeVO vo);
	
	//글 상세 조회
	PracticeVO getPractice(PracticeVO vo);
		
	
}
