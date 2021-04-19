package com.tjoeunit.biz.admin.Impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.admin.AdminService;
import com.tjoeunit.biz.admin.AdminVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public boolean adminLoginCheck(AdminVO vo, HttpSession session) throws Exception {
		
		boolean result = adminDAO.adminLogin(vo);
		
		if(result) {//로그인 성공
			session.setAttribute("admin_id", vo.getMembers_id());
            session.setAttribute("admin_pw", vo.getMembers_pw());
		}
		
		return result;
	}
	
}
