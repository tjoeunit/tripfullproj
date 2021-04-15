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
	private HotelDAO hotelDAO;

	@Override
	public void insertHotel(HotelVO vo) {
		hotelDAO.insertHotel(vo);
		
	}

	@Override
	public List<HotelVO> getHotelList(HotelVO vo) {
		List<HotelVO> list = hotelDAO.getHotelList(vo);
		return list;
	}

	@Override
	public HotelVO getHotel(HotelVO vo) {
		HotelVO board = hotelDAO.getHotel(vo);
		return board;
	}

	@Override
	public void updateHotel(HotelVO vo) {
		hotelDAO.updateHotel(vo);
		
	}

	@Override
	public void deleteHotel(HotelVO vo) {
		hotelDAO.deleteHotel(vo);
		
	}	



}
