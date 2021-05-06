package com.tjoeunit.biz.practice.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.practice.PracticeVO;

@Repository
public class PracticeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertPractice(PracticeVO vo) {
		return mybatis.insert("practiceDAOTemplate.insertPractice", vo);
	}
	
	public List<PracticeVO> getPracticeList(PracticeVO vo) {
		// 검색 기능 전											
		return mybatis.selectList("practiceDAOTemplate.getPracticeList", vo);
	}
	
	public PracticeVO getPractice(PracticeVO vo) {
		return mybatis.selectOne("practiceDAOTemplate.getPractice", vo);
	}
}
