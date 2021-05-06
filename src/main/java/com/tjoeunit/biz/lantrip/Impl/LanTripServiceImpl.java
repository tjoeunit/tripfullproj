package com.tjoeunit.biz.lantrip.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.lantrip.LanTripService;
import com.tjoeunit.biz.lantrip.LanTripVO;

@Service
public class LanTripServiceImpl implements LanTripService {
	
	@Autowired
	private LanTripDAO lanTripDAO;

	@Override
	public int insertLanTrip(LanTripVO vo) {
		return lanTripDAO.insertLanTrip(vo);
	}

	@Override
	public List<LanTripVO> getLanTripList(LanTripVO vo) {
		List<LanTripVO> list = lanTripDAO.getLanTripList(vo);
		return list;
	}

	
	@Override
	public LanTripVO getLanTrip(LanTripVO vo) {
		LanTripVO lanTrip = lanTripDAO.getLanTrip(vo);
		return lanTrip;
	}

	@Override
	public void updateLanTrip(LanTripVO vo) {
		lanTripDAO.updateLanTrip(vo);
	}

	@Override
	public void deleteLanTrip(LanTripVO vo) {
		lanTripDAO.deleteLanTrip(vo);
	}

//페이징처리를 위해 생성
	@Override
	public int countLanTrip() {		
		return lanTripDAO.countLanTrip();
	}
		
//페이징처리를 위해 생성
	@Override
	public List<LanTripVO> selectLanTrip(PagingVO vo) {
		return lanTripDAO.selectLanTrip(vo);
	}
	
}
