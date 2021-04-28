package com.tjoeunit.biz.lantrip;

import java.util.List;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.flight.FlightVO;

public interface LanTripService {
	// CRUD 기능의 메서드 구현
	
	// 랜선여행 등록
	int insertLanTrip(LanTripVO vo);
	
	// 랜선여행 목록
	List<LanTripVO> getLanTripList(LanTripVO vo);
	
	// 랜선여행 상세 조회
	LanTripVO getLanTrip(LanTripVO vo);
	
	// 랜선여행 수정
	void updateLanTrip(LanTripVO vo);
	
	// 랜선여행 삭제
	void deleteLanTrip(LanTripVO vo);
	
	//페이징처리를 위해 생성 : 게시물 총 개수
		int countLanTrip();
		
	//페이징처리를 위해 생성 : 랜선투어 조회
		List<LanTripVO> selectLanTrip(PagingVO vo);
}





