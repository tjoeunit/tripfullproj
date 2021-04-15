package com.tjoeunit.biz.hotel.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.hotel.HotelVO;

@Repository
public class HotelDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertHotel(HotelVO vo){
		mybatis.insert("hotelDAOTemplate.insertHotel", vo);
	  }
	
    public void updateHotel(HotelVO vo){
    	mybatis.update("hotelDAOTemplate.updateHotel", vo);
	}
	  
	public void deleteHotel(HotelVO vo){
		  mybatis.delete("hotelDAOTemplate.deleteHotel", vo);
	}  
	  
	public HotelVO getHotel(HotelVO vo) {
	  return mybatis.selectOne("hotelDAOTemplate.getHotel", vo);
	}//  값을 반환하는 셀렉문 , 하나만 반환하면 selectOne
	  
	public List<HotelVO> getHotelList(HotelVO vo) {
		  // 검색 기능 전 
		  return mybatis.selectList("hotelDAOTemplate.getHotelList", vo);
	
    } 
}
