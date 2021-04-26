package com.tjoeunit.biz.hotel;

import java.util.List;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.flight.FlightVO;

public interface HotelService {
	
	//숙박권 등록
	int insertHotel(HotelVO vo);
	
	//숙박 목록 조회
	List<HotelVO> getHotelList(HotelVO vo);
	
	//숙박 상세 조회
	HotelVO getHotel(HotelVO vo);
	
	//숙박권 수정 
	void updateHotel(HotelVO vo);
	
	//숙박권 삭제.
	void deleteHotel(HotelVO vo);
	
	//페이징처리를 위해 생성 : 게시물 총 개수
	int countHotel();
	
	//페이징처리를 위해 생성 : 항공권 조회
	List<HotelVO> selectHotel(PagingVO vo);
}
