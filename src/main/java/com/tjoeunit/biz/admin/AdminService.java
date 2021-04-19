package com.tjoeunit.biz.admin;

import java.util.List;

public interface AdminService {
	
	//관리자 로그인 체크
	boolean adminLoginCheck(AdminVO vo, HttpSession session) throws Exception;  

	//AdminVO adminLogin(AdminVO vo);

	
}
