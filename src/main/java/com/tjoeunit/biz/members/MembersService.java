package com.tjoeunit.biz.members;

public interface MembersService {
	
	//아이디 중복확인 관련 상수
	public static final int EXIST_ID=1;  //해당 아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=0;  //아이디가 존재하지 않는 경우
	
	//고객 등록
	int insertMembers(MembersVO vo);
	
	//고객 아이디 중복 확인을 위한 메서드 
	int checkIdDup(String members_id);
	
	//고객 목록 조회
	//List<MembersVO> getMembersList(MembersVO vo);
	
	//고객 상세 조회
	//MembersVO getMembers(MembersVO vo);
	
	//고객 정보 수정
	//void updateMembers(MembersVO vo);
	
	//고객 삭제
	//void deleteMembers(MembersVO vo);
	
	
}
