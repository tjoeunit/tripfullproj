package com.tjoeunit.biz.qna;

import java.util.List;

public interface QnaReplyService {

	// 댓글 목록
	public List<QnaReplyVO> qnaReplyList(int qna_no);
	
	// 댓글 작성
	public void insertQnaReply(QnaReplyVO rvo);
}
