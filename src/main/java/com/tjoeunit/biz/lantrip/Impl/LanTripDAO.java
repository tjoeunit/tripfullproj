package com.tjoeunit.biz.lantrip.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.lantrip.LanTripVO;


@Repository
public class LanTripDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertLanTrip(LanTripVO vo){
		return mybatis.insert("lanTripDAOTemplate.insertLanTrip", vo);
	  }
	
    public void updateLanTrip(LanTripVO vo){
    	mybatis.update("lanTripDAOTemplate.updateLanTrip", vo);
	}
	  
	public void deleteLanTrip(LanTripVO vo){
		  mybatis.delete("lanTripDAOTemplate.deleteLanTrip", vo);
	}  
	  
	public LanTripVO getLanTrip(LanTripVO vo) { 
		return mybatis.selectOne("lanTripDAOTemplate.getLanTrip", vo);
	}

	public List<LanTripVO> getLanTripList(LanTripVO vo) {
		  // 검색 기능 전 
		  return mybatis.selectList("lanTripDAOTemplate.getLanTripList", vo);
	} 
	//페이징처리를 위해 생성
	public int countLanTrip() {
		return mybatis.selectOne("lanTripDAOTemplate.countLanTrip");
	}
			
	//페이징처리를 위해 생성
	public List<LanTripVO> selectLanTrip(PagingVO vo) {
		return mybatis.selectList("lanTripDAOTemplate.selectLanTrip", vo);
	
    } 
}
