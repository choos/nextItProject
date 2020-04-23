package com.zero.FAQ.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.FAQ.dao.IFAQDao;
import com.zero.FAQ.vo.FAQVO;
import com.zero.common.exception.BizException;
import com.zero.common.exception.BizRegistFailException;

@Service
public class FAQServiceImpl implements IFAQService {

	@Autowired
	IFAQDao faqdao;
	
	//faq 리스트
	@Override
	public List<FAQVO> getFAQList() throws BizException {
		try {
			return faqdao.getFAQList();
		} catch (SQLException e) {
			throw new BizException("",e);
		}	
	}
	//faq뷰
	@Override
	public List<FAQVO> getFAQCategory(String faCategory) throws BizException {
		try {
			return faqdao.getFAQCategory(faCategory);
		} catch (SQLException e) {
			throw new BizException("",e);
		}	
	}
	
	@Override
	public FAQVO getFAQ(int faqVO) throws BizException {
		try {
			return faqdao.getFAQ(faqVO);
		} catch (SQLException e) {
			throw new BizException("", e);
		}
	}
	
	//faq작성
	@Override
	public void insertFAQRegist(FAQVO faqVO) throws BizException {
		try {
			int res = faqdao.insertFAQRegist(faqVO);
			if(res <1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			throw new BizException("", e);
		}
	}
	
	//faq수정
	@Override
	public void updateFAQ(FAQVO faqVO) throws BizException {
		try {
			int res = faqdao.updateFAQ(faqVO);
			if (res<1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			throw new BizException("", e);
		}
	}
	
	//faq삭제
	@Override
	public void deleteFAQ(int faqVO) throws BizException {
		try {
			int res = faqdao.deleteFAQ(faqVO);
			if (res<1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			throw new BizException("", e);
		}
	}
	



}
