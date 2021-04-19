package com.tjoeunit.biz.admin.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.admin.AdminService;
import com.tjoeunit.biz.admin.AdminVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override  //로그인 체크 관련 메소드 
	public String adminLoginCheck(AdminVO vo) {
		return adminDAO.adminLoginCheck(vo);
		//vo에서 정보를 받고 dao에 리턴한다.
	}
	
}
