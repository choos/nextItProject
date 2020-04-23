package com.zero.careFridge.service;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zero.careFridge.dao.ICareFridgeDao;
import com.zero.careFridge.wep.CataFridgeSearchVO;
import com.zero.careFridge.wep.FoodListVO;
import com.zero.common.exception.BizException;
import com.zero.ufboard.vo.UFBoardVO;

@Service
public class CareFridgeServiceImp implements ICareFridgeService{

	@Autowired
	private ICareFridgeDao careDao;
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public String getFoodList() throws BizException {
		try {
			return careDao.getFoodlist();
		} catch (SQLException e) {
			throw new BizException("",e);
		}
	}

	//매개타입은 푸드 타입 받기
	@Override
	public List<FoodListVO> getFood(String food) throws BizException {
		try {
			logger.debug("food={}", food);
			return careDao.getFood(food);
		} catch (SQLException e) {
			throw new BizException("",e);
		}	
	}

	@Override
	public List<UFBoardVO> getRecipeList(CataFridgeSearchVO searchVO) throws BizException {
		try {
//			pageVO 값 셋팅하기
			int rowCount = careDao.getCount(searchVO);
			searchVO.setTotalRowCount(rowCount);
			searchVO.setting();
			return careDao.getRecipeList(searchVO);
		} catch (SQLException e) {
			throw new BizException("",e);
		}	
	}

}
