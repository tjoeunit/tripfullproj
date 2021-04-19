package com.tjoeunit.biz.admin;


public interface AdminService {
	
	//관리자 로그인 체크_vo에 저장되어있는 정보를 받아 로그인을 체크하는 메소드
	public String adminLoginCheck(AdminVO vo);  
	
}
