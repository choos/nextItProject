package com.zero.main.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zero.main.wep.MainSearchVO;
import com.zero.market.vo.MarketVO;
import com.zero.mfboard.vo.MFBoardVO;
import com.zero.ufboard.vo.UFBoardVO;

@Mapper
public interface IMainDao {
	
	//검색, 페이징을 위한
	public int getMainCount(MainSearchVO searchVO)throws SQLException;
	
	//공식 탑5
	public List<MFBoardVO> getMFBoard(String code) throws SQLException;
	
	//유저 탑5
	public List<UFBoardVO> getUFBoard(String code) throws SQLException;
	
	//마켓 탑5
	public List<MarketVO> getSalesBoard(String code) throws SQLException;
	
	//관리자 페이지
	public void removeMain()throws SQLException;
	
	//메인 검색
	public List<UFBoardVO> getUFSearch(MainSearchVO searchVO)throws SQLException;

	public List<MFBoardVO> getMFSearch(MainSearchVO searchVO)throws SQLException;

	public List<MarketVO> getSBSearch(MainSearchVO searchVO)throws SQLException;
}
