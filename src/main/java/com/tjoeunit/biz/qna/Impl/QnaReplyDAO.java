package com.tjoeunit.biz.qna.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.qna.QnaReplyVO;
import com.tjoeunit.biz.story.StoryReplyVO;

@Repository
public class QnaReplyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//댓글 목록
    public List<QnaReplyVO> qnaReplyList(int qna_no) {
        return mybatis.selectList("qnaReplyDAOTemplate.qnaReplyList", qna_no);
    }
    
    //댓글 작성
    public void createQnaReply(QnaReplyVO rvo) {
    	mybatis.insert("qnaReplyDAOTemplate.createQnaReply", rvo); 
    }
}
