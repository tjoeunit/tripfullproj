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

	public int checkIdDup(String members_id) {
		return mybatis.selectOne("membersDAOTemplate.checkIdDup", members_id);
	}

	public String checkMembersPw(String members_id) {
		return mybatis.selectOne("membersDAOTemplate.checkMembersPw", members_id);
	}

	public MembersVO selectByMembersId(String members_id) {
		return mybatis.selectOne("membersDAOTemplate.selectByMembersId" ,members_id);
	}

}
