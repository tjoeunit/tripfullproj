package com.tjoeunit.biz.admin.Impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeunit.biz.admin.AdminVO;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
		
	public AdminVO adminLoginCheck(AdminVO vo) {
		return mybatis.selectOne("membersDAOTemplate.adminLogin", vo);
	}
}
