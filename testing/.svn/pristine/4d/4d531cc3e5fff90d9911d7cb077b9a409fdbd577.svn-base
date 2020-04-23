package com.zero.market.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.zero.market.vo.MarketSearchVO;
import com.zero.market.vo.MarketVO;


@Mapper
public interface IMarketDao {

	
	
	public List<MarketVO> getMarketList(MarketSearchVO searchVO) throws SQLException;
	
	public List<MarketVO> getMarketList() throws SQLException;	
	
	public MarketVO getMarket(String sCode) throws  SQLException;
	
	public List<MarketVO> getMarketReviewList(String sCode) throws  SQLException;
	
	public void recommend(String sCode) throws Exception;  //추천하기 메소드
	
	public void insertLike(MarketVO marketLike) throws Exception;  //추천하기 등록 메소드
	
	public int checkLike(MarketVO marketCheckLike) throws Exception;  	
	
	public int insertMarket(MarketVO market) throws  SQLException;
	
	/*
	 */
	
	public int updateMarket (MarketVO market) throws  SQLException;
	
	/*

	 */
	
	public int deleteMarket (MarketVO market) throws  SQLException;
}
