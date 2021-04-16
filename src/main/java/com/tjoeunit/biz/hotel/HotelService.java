package com.tjoeunit.biz.hotel;

import java.util.List;

public interface HotelService {
	
	//글 등록
	void insertHotel(HotelVO vo);
	
	//글 목록 조회
	List<HotelVO> getHotelList(HotelVO vo);
	
	//글 상세 조회
	HotelVO getHotel(HotelVO vo);
	
	//글 수정 
	void updateHotel(HotelVO vo);
	
	//글 삭제0.
	void deleteHotel(HotelVO vo);
}
