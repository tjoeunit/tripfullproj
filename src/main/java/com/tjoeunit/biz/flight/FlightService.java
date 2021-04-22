package com.tjoeunit.biz.flight;

import java.util.List;

import com.tjoeunit.biz.common.PagingVO;

public interface FlightService {
	// CRUD 기능의 메서드 구현
	
	// 항공권 등록
	int insertFlight(FlightVO vo);
	
	// 항공권 목록
	List<FlightVO> getFlightList(FlightVO vo);
	
	// 항공권 상세 조회
	FlightVO getFlight(FlightVO vo);
	
	// 항공권 수정
	void updateFlight(FlightVO vo);
	
	// 항공권 삭제
	void deleteFlight(FlightVO vo);
		
	//페이징처리를 위해 생성 : 게시물 총 개수
	int countFlight();
	
	//페이징처리를 위해 생성 : 항공권 조회
	List<FlightVO> selectFlight(PagingVO vo);
	
}
