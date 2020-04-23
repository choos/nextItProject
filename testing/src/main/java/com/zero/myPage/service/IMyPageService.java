package com.zero.myPage.service;

import java.sql.SQLException;

import com.zero.myPage.vo.MyPageVO;


public interface IMyPageService {
	
	public MyPageVO getMemberInfo(String memId) throws SQLException;
	
	public void updateMemberInfo(MyPageVO mypage) throws SQLException;
	
	public int deleteMemberInfo(MyPageVO mypage) throws SQLException;

}
