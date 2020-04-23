package com.zero.careFridge.service;

import java.util.List;

import com.zero.careFridge.wep.CataFridgeSearchVO;
import com.zero.careFridge.wep.FoodListVO;
import com.zero.common.exception.BizException;
import com.zero.ufboard.vo.UFBoardVO;

public interface ICareFridgeService {
	
	public String getFoodList() throws BizException;
	
	
	public List<FoodListVO> getFood(String food) throws BizException;
	
	public List<UFBoardVO> getRecipeList(CataFridgeSearchVO searchVO) throws BizException;
}
