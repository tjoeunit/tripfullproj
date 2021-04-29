package com.tjoeunit.biz.activity.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.activity.ActivityVO;
import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.activity.ActivityVO;

@Repository
public class ActivityDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertActivity(ActivityVO vo){
		return mybatis.insert("activityDAOTemplate.insertActivity", vo);
	  }
	
    public int updateActivity(ActivityVO vo){
    	return mybatis.update("activityDAOTemplate.updateActivity", vo);
	}
	  
	public int deleteActivity(ActivityVO vo){
		return mybatis.delete("activityDAOTemplate.deleteActivity", vo);
	}  
	  
	public ActivityVO getActivity(ActivityVO vo) { 
		return mybatis.selectOne("activityDAOTemplate.getActivity", vo);
	}

	public List<ActivityVO> getActivityList(ActivityVO vo) {
		  // 검색 기능 전 
		  return mybatis.selectList("activityDAOTemplate.getActivityList", vo);
		 
    } 
	
	
	//페이징처리를 위해 생성
	public int countActivity() {
		return mybatis.selectOne("activityDAOTemplate.countActivity");
	}
	
	//페이징처리를 위해 생성
	public List<ActivityVO> selectActivity(PagingVO vo) {
		return mybatis.selectList("activityDAOTemplate.selectActivity", vo);
	}	
}
