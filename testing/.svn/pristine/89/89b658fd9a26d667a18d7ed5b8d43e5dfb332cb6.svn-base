package com.zero.QNA.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.QNA.dao.IQNADao;
import com.zero.QNA.vo.QNAVO;
import com.zero.common.exception.BizDuplicateException;
import com.zero.common.exception.BizException;
import com.zero.common.exception.BizRegistFailException;

@Service
public class QNAServiceImpl implements IQNAService {

	@Autowired
	IQNADao qnadao;
	
	//QAN 리스트
	@Override
	public List<QNAVO> getQNAList() throws BizException {
		try {
			return qnadao.getQNAList();
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}
	//카테고리 조회
	@Override
	public List<QNAVO> getQNACategory(String qCategory) throws BizException {
		try {
			return qnadao.getQNACategory(qCategory);
		} catch (SQLException e) {
			throw new BizException("",e);
		}	
	}
	
	//뷰 조회
	@Override
	public QNAVO getQNA(int qNum) throws BizException {
		try {
			return qnadao.getQNA(qNum);
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}

	
	//QAN작성
	@Override
	public void insertQNARegist(QNAVO qanVO) throws BizException {
		try {
			int res = qnadao.insertQNARegist(qanVO);
			if(res <1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			if(e.getErrorCode()==1) {
				throw new BizDuplicateException(e);
			}
			throw new BizException("", e);
		}
	}
	
	//QAN수정
	@Override
	public void updateQNA(QNAVO qanVO) throws BizException {
		try {
			int res = qnadao.updateQNA(qanVO);
			if(res <1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			if(e.getErrorCode()==1) {//1이면 pk오류
				throw new BizDuplicateException(e);
			}
			throw new BizException("", e);
		}
	}
	
	//QAN삭제
	@Override
	public void deleteQNA(int qNum) throws BizException {
		try {
			int res = qnadao.deleteQNA(qNum);
			if(res <1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			if(e.getErrorCode()==1) {
				throw new BizDuplicateException(e);
			}
			throw new BizException("", e);
		}
	}

	//답글 레지스터
	@Override
	public void insertOTO(QNAVO otoVO) throws BizException {
		try {
			int res = qnadao.insertOTO(otoVO);
			if (res<1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			if(e.getErrorCode()==1) {
				throw new BizDuplicateException(e);
			}
			throw new BizException("", e);
		}
	}
	
	
	//답글 수정
	@Override
	public void updateOTO(QNAVO otoVO) throws BizException {
		try {
			int res = qnadao.updateOTO(otoVO);
			if (res<1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			if(e.getErrorCode()==1) {
				throw new BizDuplicateException(e);		
			}
			throw new BizException("", e);
		}
	}
	
	@Override
	public void AnsweNY(int qNum) throws BizException {
		try {
			int res = qnadao.AnsweNY(qNum);
			if (res<1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			if(e.getErrorCode()==1) {
				throw new BizDuplicateException(e);		
			}
			throw new BizException("", e);
		}
	}
//	@Override
//	public List<QNAVO> getOTOList() throws BizException {
//		try {
//			return qnadao.getOTOList();
//		} catch (SQLException e) {
//			throw new BizException("",e);
//		}
//	}
	
//	@Override
//	public QNAVO OTOAnswer(int qNum) throws BizException {
//		try {
//			return qnadao.OTOAnswer(qNum);
//		} catch (SQLException e) {
//			throw new BizException("",e);
//		}	
//	}
	

}
