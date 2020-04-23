package com.zero.member.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.common.exception.BizDuplicateException;
import com.zero.common.exception.BizException;
import com.zero.common.exception.BizNotFoundException;
import com.zero.common.exception.BizRegistFailException;
import com.zero.member.dao.IMemberDao;
import com.zero.member.vo.MemberSearchVO;
import com.zero.member.vo.MemberVO;


@Service
public class MemberServiceImpl implements IMemberService {

	@Autowired
	private IMemberDao memberDao;
	
	@Override
	public List<MemberVO> getMemberList(MemberSearchVO searchVO) throws BizException {
				
		try {
			int rowCount = memberDao.getMemberCount(searchVO);
			return memberDao.getMemberList(searchVO);
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}

	@Override
	public MemberVO getMember(String memId) throws BizException {
		try {
			MemberVO member = memberDao.getMember(memId);

			if(member == null)  {
				throw new BizNotFoundException("회원 [" + memId + "]을1 조회하지 못했니다");
			}
			return member;
		} catch (SQLException e) {
			System.out.println(e.toString());
			throw new BizException(e);
		}
	}

	@Override
	public void registMember(MemberVO member) throws BizException {
		try {
			int res =	memberDao.insertMember(member);
			if(res<1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			if(e.getErrorCode()==1) {		//중복 에러
				throw new BizDuplicateException("회원 아이디 중복", member.getMemId());
			}
			throw new BizException(e);
		}
	}

	@Override
	public void updateMember(MemberVO member) throws BizException {
		try {
			int res = memberDao.updateMember(member);
			if(res<1) {
				throw new BizRegistFailException("회원 [" + member.getMemId() + "]을2 조회하지 못했습니다.");
			}
		} catch (SQLException e) {
			throw new BizException();
		}
	}

	@Override
	public void removeMember(MemberVO member) throws BizException {
		try {
			int res = memberDao.deleteMember(member);
			if(res<1) {
				throw new BizRegistFailException("회원 [" + member.getMemId() + "]을3 조회하지 못했습니다.");
			}
		} catch (SQLException e) {
			throw new BizException();
		}
	}

}
