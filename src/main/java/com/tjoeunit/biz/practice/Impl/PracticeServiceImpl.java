package com.tjoeunit.biz.practice.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.practice.PracticeService;
import com.tjoeunit.biz.practice.PracticeVO;
import com.tjoeunit.biz.story.StoryVO;

@Service
public class PracticeServiceImpl implements PracticeService{
	
	@Autowired
	private PracticeDAO practiceDAO;
	
	@Override
	public int insertPractice(PracticeVO vo) {
		return practiceDAO.insertPractice(vo);
		
	}

	@Override
	public List<PracticeVO> getPracticeList(PracticeVO vo) {
		List<PracticeVO> list = practiceDAO.getPracticeList(vo);
		return list;
	}

	@Override
	public PracticeVO getPractice(PracticeVO vo) {
		PracticeVO practice = practiceDAO.getPractice(vo);
		return practice;
	}

}
