package com.tjoeunit.biz.activity;

import java.util.List;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.activity.ActivityVO;

public interface ActivityService {
	// CRUD 기능의 메서드 구현
	

	// 액티비티 등록
	int insertActivity(ActivityVO vo);
	
	// 액티비티 목록
	List<ActivityVO> getActivityList(ActivityVO vo);
	
	// 액티비티 상세 조회
	ActivityVO getActivity(ActivityVO vo);
	
	// 액티비티 수정
	int updateActivity(ActivityVO vo);
	
	// 액티비티 삭제


	int deleteActivity(ActivityVO vo);
	
	//페이징처리를 위해 생성 : 게시물 총 개수
	int countActivity();
	
	//페이징처리를 위해 생성 : 항공권 조회
	List<ActivityVO> selectActivity(PagingVO vo);
}





