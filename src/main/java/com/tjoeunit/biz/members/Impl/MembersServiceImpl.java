package com.tjoeunit.biz.members.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tjoeunit.biz.common.PagingVO;
import com.tjoeunit.biz.flight.FlightVO;
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

	@Override
	public int checkIdDup(String members_id) {
		return membersDAO.checkIdDup(members_id);
	}
	
	@Override
	public int deleteMembers(int members_no) {
		return membersDAO.deleteMembers(members_no);
	}
	
	@Override
	public MembersVO getMembers(MembersVO vo) {
		MembersVO members = membersDAO.getMembers(vo);
		return members;
	}
	
	@Override
	public int loginMembers(String members_id, String members_pw) {
		//기본값 설정
		int result = 0;

		//아이디 존재유무 확인
		int idCheck = membersDAO.checkIdDup(members_id);
		System.out.println("idCheck = "+idCheck);

		//아이디 있음
		if(idCheck > 0) {

			//아이디와 비밀번호 일치여부
			String pwCheck = membersDAO.checkMembersPw(members_id);
			System.out.println("pwCheck = "+pwCheck);

			//비밀번호 일치
			if(members_pw.equals(pwCheck)) {
				result = 1;

			//비밀번호 불일치
			}else if(members_pw.equals(pwCheck)) {
				result = 0;
			}

		//아이디 없음
		}else {
			result = 0;
		}

		System.out.println("result = "+result);
		return result;

	}

	@Override
	public MembersVO selectByMembersId(String members_id) {
		return membersDAO.selectByMembersId(members_id);
	}

	@Override
	public MembersVO selectByMembersNo(int members_no) {
		return membersDAO.selectByMembersNo(members_no);
		
	}

	@Override
	public String checkPwById(String members_id) {
		return membersDAO.checkPwById(members_id);
	}

	@Override
	public int updatePw(MembersVO vo) {
		return membersDAO.updatePw(vo);
	}

	@Override
	public int updateMembers(MembersVO vo) {
		return membersDAO.updateMembers(vo);
	}

	@Override
	public int countMembers() {
		return membersDAO.countMembers();
	}

	@Override
	public List<MembersVO> selectMembers(PagingVO vo) {
		return membersDAO.selectMembers(vo);
	}

	@Override
	public int adminMembersDelete(MembersVO vo) {
		return membersDAO.adminMembersDelete(vo);
	}	
}
