package com.tjoeunit.biz.flight.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.flight.FlightService;
import com.tjoeunit.biz.flight.FlightVO;

@Service
public class FlightServiceImpl implements FlightService {
	
	@Autowired
	private FlightDAO flightDAO;
	
	@Override
	public int insertFlight(FlightVO vo) {
		return flightDAO.insertFlight(vo);
	}

	@Override
	public List<FlightVO> getFlightList(FlightVO vo) {
		List<FlightVO> list = flightDAO.getFlightList(vo);
		return list;
	}

	@Override
	public FlightVO getFlight(FlightVO vo) {
		FlightVO flight = flightDAO.getFlight(vo);
		return flight;
	}

	@Override
	public void updateFlight(FlightVO vo) {
		flightDAO.updateFlight(vo);
	}

	@Override
	public void deleteFlight(FlightVO vo) {
		flightDAO.deleteFlight(vo);
	}	
	
	///////////////////////////////////////////////////페이징
	@Override
	public int countFlight() {		
		return flightDAO.countFlight();
	}

	@Override
	public List<FlightVO> selectFlight(PagingVO vo) {
		return flightDAO.selectFlight(vo);
	}	
	///////////////////////////////////////////////////페이징
}
