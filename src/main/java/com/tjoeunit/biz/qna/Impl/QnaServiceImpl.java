package com.tjoeunit.biz.qna.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.qna.QnaService;
import com.tjoeunit.biz.qna.QnaVO;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public int insertQna(QnaVO vo) {
		return qnaDAO.insertQna(vo);
	}

	@Override
	public List<QnaVO> getQnaList(QnaVO vo) {
		List<QnaVO> list = qnaDAO.getQnaList(vo);
		return list;
	}

	@Override
	public QnaVO getQna(QnaVO vo) {
		QnaVO qna = qnaDAO.getQna(vo);
		return qna;
	}

	@Override
	public int updateQna(QnaVO vo) {
		return qnaDAO.updateQna(vo);
	}

	@Override
	public void deleteQna(QnaVO vo) {
		qnaDAO.deleteQna(vo);
		
	}

	@Override
	public int countQna() {
		return qnaDAO.countQna();
	}

	@Override
	public List<QnaVO> selectQna(PagingVO vo) {
		return qnaDAO.selectQna(vo);
	}
	
}
