package com.zero.main.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.common.exception.BizException;
import com.zero.main.dao.IMainDao;
import com.zero.main.wep.MainSearchVO;
import com.zero.market.vo.MarketVO;
import com.zero.mfboard.vo.MFBoardVO;
import com.zero.ufboard.vo.UFBoardVO;

@Service
public class MainServiceImpl implements IMainService{
	
	@Autowired
	private IMainDao mainDao;
	
	@Override
	public List<MFBoardVO> getMFBoard(String code) throws BizException {
		try {
			return mainDao.getMFBoard(code);
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}

	@Override
	public List<UFBoardVO> getUFBoard(String code) throws BizException {
		try {
			return mainDao.getUFBoard(code);
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}
	
	@Override
	public List<MarketVO> getSalesBoard(String code) throws BizException {
		try {
			return mainDao.getSalesBoard(code);
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}

	@Override
	public void removeMain() throws BizException {
		
	}

	@Override
	public List<UFBoardVO> getUFSearch(MainSearchVO searchVO) throws BizException {
		try {
			int rowCount = mainDao.getMainCount(searchVO);
			searchVO.setTotalRowCount(rowCount);
			searchVO.setting();
			return mainDao.getUFSearch(searchVO);
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}

	@Override
	public List<MFBoardVO> getMFSearch(MainSearchVO searchVO) throws BizException {
		try {
			int rowCount = mainDao.getMainCount(searchVO);
			searchVO.setTotalRowCount(rowCount);
			searchVO.setting();
			return mainDao.getMFSearch(searchVO);
		} catch (SQLException e) {
			throw new BizException("",e);
		}	}

	@Override
	public List<MarketVO> getSBSearch(MainSearchVO searchVO) throws BizException {
		try {
			int rowCount = mainDao.getMainCount(searchVO);
			searchVO.setTotalRowCount(rowCount);
			searchVO.setting();
			return mainDao.getSBSearch(searchVO);
		} catch (SQLException e) {
			throw new BizException("",e);
		}	}




}
