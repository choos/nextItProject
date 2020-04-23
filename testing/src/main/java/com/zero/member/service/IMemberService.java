package com.zero.member.service;

import java.util.List;

import com.zero.common.exception.BizException;
import com.zero.member.vo.MemberSearchVO;
import com.zero.member.vo.MemberVO;


public interface IMemberService {
	/**
	 * 멤버목록
	 * @param searchVO
	 * @return
	 * @throws BizException
	 */
	public List<MemberVO> getMemberList(MemberSearchVO searchVO) throws BizException;
	
	/**
	 * 멤버 단한명
	 * @param memId
	 * @return
	 * @throws BizException
	 */
	public MemberVO getMember(String memId) throws BizException;
	
	/**
	 * 멤버등록
	 * @param member
	 * @throws BizException
	 */
	public void registMember(MemberVO member) throws BizException;
	
	/**
	 * 멤버수정
	 * 비밀번호 변경x
	 * 회원없으면 BizNotFoundException
	 * @param member
	 * @throws BizException
	 */
	public void updateMember(MemberVO member) throws BizException;
	
	/**
	 * 멤버삭제
	 * @param member
	 * @throws BizException
	 */
	public void removeMember(MemberVO member) throws BizException;
	
}
