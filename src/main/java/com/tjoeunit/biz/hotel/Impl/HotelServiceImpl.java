package com.tjoeunit.biz.hotel.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.hotel.HotelService;
import com.tjoeunit.biz.hotel.HotelVO;

@Service
// 빈생성 요청 어노테이션 
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelDAOMyBatisSecond hotelDAO;

	@Override
	public int insertHotel(HotelVO vo) {
		hotelDAO.insertBoard(vo);
		return 0;
	}

	@Override
	public List<HotelVO> getHotelList(HotelVO vo) {
		List<HotelVO> list = hotelDAO.getBoardList(vo);
		return null;
	}

	@Override
	public HotelVO getHotel(HotelVO vo) {
		HotelVO board = hotelDAO.getBoard(vo);
		return null;
	}

	@Override
	public void updateHotel(HotelVO vo) {
		hotelDAO.updateBoard(vo);
		
	}

	@Override
	public void deleteHotel(HotelVO vo) {
		hotelDAO.deleteBoard(vo);
		
	}	



}
