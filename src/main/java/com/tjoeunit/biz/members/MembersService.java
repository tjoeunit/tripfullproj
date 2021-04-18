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
	
	//고객 목록 조회
	//List<MembersVO> getMembersList(MembersVO vo);
	
	//고객 상세 조회
	//MembersVO getMembers(MembersVO vo);
	
	//고객 정보 수정
	//void updateMembers(MembersVO vo);
	
	//고객 삭제
	//void deleteMembers(MembersVO vo);
	
	
}
