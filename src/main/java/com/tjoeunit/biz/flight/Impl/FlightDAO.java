package com.tjoeunit.biz.flight.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.flight.FlightVO;

@Repository
public class FlightDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertFlight(FlightVO vo){
		return mybatis.insert("flightDAOTemplate.insertFlight", vo);
	  }
	
    public void updateFlight(FlightVO vo){
    	mybatis.update("flightDAOTemplate.updateFlight", vo);
	}
	  
	public void deleteFlight(FlightVO vo){
		  mybatis.delete("flightDAOTemplate.deleteFlight", vo);
	}  
	  
	public FlightVO getFlight(FlightVO vo) { 
		return mybatis.selectOne("flightDAOTemplate.getFlight", vo);
	}

	public List<FlightVO> getFlightList(FlightVO vo) {
		  // 검색 기능 전 
		  return mybatis.selectList("flightDAOTemplate.getFlightList", vo);
		 
    } 
	
}
