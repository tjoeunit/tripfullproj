package com.tjoeunit.biz.members;

public interface MembersService {

	//고객 등록
	int insertMembers(MembersVO vo);

	//고객 아이디 중복 확인을 위한 메서드
	int checkIdDup(String members_id);

	//고객 로그인
	int loginMembers(String members_id, String members_pw);

	//고객 아이디로 고객 VO 조회
	MembersVO selectByMembersId(String members_id);
	
	//고객 아이디로 비밀번호 조회
	String checkPwById(String members_id);
	
	//고객 비밀번호 변경
	int updatePw(MembersVO vo);
	
	//고객 정보 수정
	int updateMembers(MembersVO vo);

	//고객 삭제
	int deleteMembers(int members_no);

	//고객 번호로 아이디 가져오기
	MembersVO selectByMembersNo(int members_no);
}
