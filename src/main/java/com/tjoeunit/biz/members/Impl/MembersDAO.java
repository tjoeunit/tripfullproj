package com.tjoeunit.biz.members.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.members.MembersVO;

@Repository
public class MembersDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertMembers(MembersVO vo) {
		return mybatis.insert("membersDAOTemplate.insertMembers", vo);
	}
		
	public MembersVO getMembers(MembersVO vo) {
		return mybatis.selectOne("membersDAOTemplate.getMembers", vo);
	}
}
