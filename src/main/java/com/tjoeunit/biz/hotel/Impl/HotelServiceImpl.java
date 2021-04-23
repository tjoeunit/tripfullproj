package com.tjoeunit.biz.hotel.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.hotel.HotelService;
import com.tjoeunit.biz.hotel.HotelVO;

@Service
public class HotelServiceImpl implements HotelService {

	@Autowired
	private HotelDAO hotelDAO;

	@Override
	public int insertHotel(HotelVO vo) {
		return hotelDAO.insertHotel(vo);
	}

	@Override
	public List<HotelVO> getHotelList(HotelVO vo) {
		List<HotelVO> list = hotelDAO.getHotelList(vo);
		return list;
	}

	@Override
	public HotelVO getHotel(HotelVO vo) {
		HotelVO hotel = hotelDAO.getHotel(vo);
		return hotel;
	}

	@Override
	public void updateHotel(HotelVO vo) {
		hotelDAO.updateHotel(vo);
	}

	@Override
	public void deleteHotel(HotelVO vo) {
		hotelDAO.deleteHotel(vo);
	}
	
	//페이징처리를 위해 생성	
	@Override
	public int countHotel() {
		return hotelDAO.countHotel();		
	}
	
	//페이징처리를 위해 생성
	@Override
	public List<HotelVO> selectHotel(PagingVO vo) {
		return hotelDAO.selectHotel(vo);
	}
}
