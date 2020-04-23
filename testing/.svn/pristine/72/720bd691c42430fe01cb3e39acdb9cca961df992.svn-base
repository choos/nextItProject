package com.zero.careFridge.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zero.careFridge.wep.CataFridgeSearchVO;
import com.zero.careFridge.wep.FoodListVO;
import com.zero.ufboard.vo.UFBoardVO;

@Mapper
public interface ICareFridgeDao {
	
	public String getFoodlist() throws SQLException;
	
	public int getCount(CataFridgeSearchVO searchVO) throws SQLException;
	
	public List<FoodListVO> getFood(String food) throws SQLException;
	
	public List<UFBoardVO> getRecipeList(CataFridgeSearchVO searchVO) throws SQLException;
}
