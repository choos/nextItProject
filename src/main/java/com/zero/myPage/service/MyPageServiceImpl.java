package com.zero.myPage.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.common.exception.BizException;
import com.zero.common.exception.BizRegistFailException;
import com.zero.myPage.dao.IMyPageDao;
import com.zero.myPage.vo.MyPageVO;

@Service
public class MyPageServiceImpl implements IMyPageService {
	
	@Autowired
	private IMyPageDao mypagedao;

	@Override
	public MyPageVO getMemberInfo(String memId) throws SQLException {
		try {
			return mypagedao.getMemberInfo(memId);
		} catch (Exception e) {
			throw new BizException("",e);		
		}
	}

	@Override
	public void updateMemberInfo(MyPageVO mypage) throws BizException {
		
		try {
			int res = mypagedao.updateMemberInfo(mypage);
			
			if(res<1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			throw new BizException();
		}
	}

	@Override
	public int deleteMemberInfo(MyPageVO mypage) throws SQLException {
		
		return mypagedao.deleteMemberInfo(mypage);
	}


}
