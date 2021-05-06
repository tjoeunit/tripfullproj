package com.tjoeunit.biz.qna;

import java.util.List;

import com.tjoeunit.biz.common.PagingVO;

public interface QnaService {
	
	//글 등록
	int insertQna(QnaVO vo);
	
	//글 목록 조회
	List<QnaVO> getQnaList(QnaVO vo);
	
	//글 상세 조회
	QnaVO getQna(QnaVO vo);
	
	//글 수정
	int updateQna(QnaVO vo);
	
	//글 삭제
	void deleteQna(QnaVO vo);
	
	// 페이징처리를 위해 생성 : 게시물 총 개수
	int countQna();
			
	//페이징처리를 위해 생성 : 항공권 조회
	List<QnaVO> selectQna(PagingVO vo);

}
