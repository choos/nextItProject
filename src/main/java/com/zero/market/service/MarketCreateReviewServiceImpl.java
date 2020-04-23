package com.zero.market.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.common.exception.BizException;
import com.zero.market.dao.IMarketCreateReviewDao;
import com.zero.market.vo.MarketCreateReviewVO;
@Service
public class MarketCreateReviewServiceImpl implements IMarketCreateReviewService {

	@Autowired
	private IMarketCreateReviewDao marketcreatereviewDao;
	
	
	@Override
	public List<MarketCreateReviewVO> getMarketCreateReviewList() throws BizException {
		try {
			return marketcreatereviewDao.getMarketCreateReviewList();
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}

}
