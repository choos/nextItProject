package com.zero.myPage.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.zero.myPage.vo.MyPageVO;

@Mapper
public interface IMyPageDao {
	
	public MyPageVO getMemberInfo(String memId) throws SQLException;
	
	public int updateMemberInfo(MyPageVO mypage) throws SQLException;
	
	public int deleteMemberInfo(MyPageVO mypage) throws SQLException;

}
