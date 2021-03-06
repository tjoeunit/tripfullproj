package com.tjoeunit.biz.flight.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.flight.FlightVO;

@Repository
public class FlightDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertFlight(FlightVO vo){
		return mybatis.insert("flightDAOTemplate.insertFlight", vo);
	}
	
    public int updateFlight(FlightVO vo){
    	return mybatis.update("flightDAOTemplate.updateFlight", vo);
	}
	  
	public int deleteFlight(FlightVO vo){
		return mybatis.delete("flightDAOTemplate.deleteFlight", vo);
	}  
	  
	public FlightVO getFlight(FlightVO vo) { 
		return mybatis.selectOne("flightDAOTemplate.getFlight", vo);
	}

	public List<FlightVO> getFlightList(FlightVO vo) {
		// 검색 기능 전 
		return mybatis.selectList("flightDAOTemplate.getFlightList", vo);		 
    }	

	//페이징처리를 위해 생성
	public int countFlight() {
		return mybatis.selectOne("flightDAOTemplate.countFlight");
	}
	
	//페이징처리를 위해 생성
	public List<FlightVO> selectFlight(PagingVO vo) {
		return mybatis.selectList("flightDAOTemplate.selectFlight", vo);
	}
	
	
}
