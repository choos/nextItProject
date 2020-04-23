package com.zero.market.service;


import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.common.exception.BizException;
import com.zero.market.dao.IMarketDao;
import com.zero.market.vo.MarketSearchVO;
import com.zero.market.vo.MarketVO;




@Service
public class MarketServiceImpl implements IMarketService {

	@Autowired
	private IMarketDao marketDao;
	
	@Override
	public List<MarketVO> getMarketList(MarketSearchVO searchVO) throws BizException {
		// TODO Auto-generated method stub
		try {
			System.out.println(searchVO);
			return marketDao.getMarketList(searchVO);
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}
	@Override
	public List<MarketVO> getMarketList() throws BizException {
		// TODO Auto-generated method stub
		try {
			return marketDao.getMarketList();
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}

	@Override
	public MarketVO getMarket(String sCode) throws BizException {
		// TODO Auto-generated method stub
		try {
			return marketDao.getMarket(sCode);
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}
	
	@Override
	public List<MarketVO> getMarketReviewList(String sCode) throws BizException {
		// TODO Auto-generated method stub
		try {
			return marketDao.getMarketReviewList(sCode);
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}
	

	@Override
	public void registMember(MarketVO member) throws BizException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyMember(MarketVO member) throws BizException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeMember(MarketVO member) throws BizException {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void recommend(String sCode) throws Exception {
		
		marketDao.recommend(sCode);
	}
	
	@Override
	public void insertLike(MarketVO marketLike) throws Exception {
		marketDao.insertLike(marketLike);
	}
	
	@Override
	public int checkLike(MarketVO marketCheckLike) throws Exception {
		return marketDao.checkLike(marketCheckLike);
	}


	
	
}
