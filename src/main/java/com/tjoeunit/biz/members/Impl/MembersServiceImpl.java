package com.tjoeunit.biz.members.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.members.MembersService;
import com.tjoeunit.biz.members.MembersVO;

@Service
public class MembersServiceImpl implements MembersService{

	@Autowired
	private MembersDAO membersDAO;

	@Override
	public int insertMembers(MembersVO vo) {
		
		return membersDAO.insertMembers(vo);
	}

	
	
	
}
