package com.tjoeunit.biz.lantrip;

import java.util.List;

public interface LanTripService {
	// CRUD 기능의 메서드 구현
	
	// 랜선여행 등록
	void insertLanTrip(LanTripVO vo);
	
	// 랜선여행 목록
	List<LanTripVO> getLanTripList(LanTripVO vo);
	
	// 랜선여행 상세 조회
	LanTripVO getLanTrip(LanTripVO vo);
	
	// 랜선여행 수정
	void updateLanTrip(LanTripVO vo);
	
	// 랜선여행 삭제
	void deleteLanTrip(LanTripVO vo);
}





