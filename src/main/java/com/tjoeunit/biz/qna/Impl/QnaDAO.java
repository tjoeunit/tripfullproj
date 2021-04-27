package com.tjoeunit.biz.qna.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.qna.QnaVO;
import com.tjoeunit.biz.story.StoryVO;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertQna(QnaVO vo) {
		return mybatis.insert("qnaDAOTemplate.insertQna", vo);
	}
	
	public int updateQna(QnaVO vo) {
		return mybatis.update("qnaDAOTemplate.updateQna", vo);
	}
	
	public void deleteQna(QnaVO vo) {
		mybatis.delete("qnaDAOTemplate.deleteQna", vo);
	}
	
	public QnaVO getQna(QnaVO vo) {
		return mybatis.selectOne("qnaDAOTemplate.getQna", vo);
	}
	
	public List<QnaVO> getQnaList(QnaVO vo) {
		// 검색 기능 전											
		return mybatis.selectList("qnaDAOTemplate.getQnaList", vo);
	}
	
	//페이징처리를 위해 생성
	public int countQna() {
		return mybatis.selectOne("qnaDAOTemplate.countQna");
	}
	
	//페이징처리를 위해 생성
	public List<QnaVO> selectQna(PagingVO vo) {
		return mybatis.selectList("qnaDAOTemplate.selectQna", vo);
	}	

}
