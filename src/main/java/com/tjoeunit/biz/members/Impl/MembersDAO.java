package com.tjoeunit.biz.members.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.flight.FlightVO;
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
	
	public int deleteMembers(int members_no) {
		return mybatis.delete("membersDAOTemplate.deleteMembers", members_no);
	}
	
	public MembersVO getMembers(MembersVO vo) { 
		return mybatis.selectOne("membersDAOTemplate.getMembers", vo);
	}
	
	public String checkMembersPw(String members_id) {
		return mybatis.selectOne("membersDAOTemplate.checkMembersPw", members_id);
	}

	public MembersVO selectByMembersId(String members_id) {
		return mybatis.selectOne("membersDAOTemplate.selectByMembersId" ,members_id);
	}
	
	public MembersVO selectByMembersNo(int members_no) {
		return mybatis.selectOne("membersDAOTemplate.selectByMembersNo" ,members_no);
	}
	
	public String checkPwById(String members_id) {
		return mybatis.selectOne("membersDAOTemplate.checkPwById", members_id);
	}
	
	public int updatePw(MembersVO vo) {
		return mybatis.update("membersDAOTemplate.updatePw", vo);
	}

	public int updateMembers(MembersVO vo) {
		return mybatis.update("membersDAOTemplate.updateMembers", vo);
	}
	
	//페이징처리를 위해 생성
	public int countMembers() {
		return mybatis.selectOne("membersDAOTemplate.countMembers");
	}
		
	//페이징처리를 위해 생성
	public List<MembersVO> selectMembers(PagingVO vo) {
		return mybatis.selectList("membersDAOTemplate.selectMembers", vo);
	}
	
	public int adminMembersDelete(MembersVO vo) {
		return mybatis.delete("membersDAOTemplate.adminMembersDelete", vo);
	}
}
