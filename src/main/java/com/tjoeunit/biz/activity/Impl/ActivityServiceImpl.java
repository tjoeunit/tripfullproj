package com.tjoeunit.biz.activity.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.activity.ActivityService;
import com.tjoeunit.biz.activity.ActivityVO;
import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.activity.ActivityVO;

@Service
public class ActivityServiceImpl implements ActivityService {
	
	@Autowired
	private ActivityDAO activityDAO;

	@Override
	public int insertActivity(ActivityVO vo) {
		return activityDAO.insertActivity(vo);
	}

	@Override
	public List<ActivityVO> getActivityList(ActivityVO vo) {
		List<ActivityVO> list = activityDAO.getActivityList(vo);
		return list;
	}

	
	@Override
	public ActivityVO getActivity(ActivityVO vo) {
		ActivityVO activity = activityDAO.getActivity(vo);
		return activity;
	}

	@Override
	public void updateActivity(ActivityVO vo) {
		activityDAO.updateActivity(vo);
	}

	@Override
	public void deleteActivity(ActivityVO vo) {
		activityDAO.deleteActivity(vo);
		
	}
	
	//페이징처리를 위해 생성
		@Override
		public int countActivity() {		
			return activityDAO.countActivity();
		}
		
		//페이징처리를 위해 생성
		@Override
		public List<ActivityVO> selectActivity(PagingVO vo) {
			return activityDAO.selectActivity(vo);
		}

}
