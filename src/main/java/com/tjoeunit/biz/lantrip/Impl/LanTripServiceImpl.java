package com.tjoeunit.biz.lantrip.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.lantrip.LanTripService;
import com.tjoeunit.biz.lantrip.LanTripVO;

@Service
public class LanTripServiceImpl implements LanTripService {
	
	@Autowired
	private LanTripDAO lanTripDAO;

	@Override
	public void insertLanTrip(LanTripVO vo) {
		lanTripDAO.insertLanTrip(vo);
	}

	@Override
	public List<LanTripVO> getLanTripList(LanTripVO vo) {
		List<LanTripVO> list = lanTripDAO.getLanTripList(vo);
		return list;
	}

	@Override
	public LanTripVO getLanTrip(LanTripVO vo) {
		LanTripVO board = lanTripDAO.getLanTrip(vo);
		return board;
	}

	@Override
	public void updateLanTrip(LanTripVO vo) {
		lanTripDAO.updateLanTrip(vo);
	}

	@Override
	public void deleteLanTrip(LanTripVO vo) {
		lanTripDAO.deleteLanTrip(vo);
		
	}

}
