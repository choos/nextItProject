package com.zero.mfboard.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.zero.mfboard.vo.MFBoardVO;
import com.zero.mfboard.vo.MFSearchVO;

@Mapper
public interface IMFBoardDao {

	
	public List<MFBoardVO> getMFBoardList(MFSearchVO searchVO) throws SQLException;
	
	
	public MFBoardVO getMFBoard(String mfCode) throws  SQLException;
	
	
	public void recommend(String mfCode) throws Exception;  //추천하기 메소드
	
	
	public void insertLike(MFBoardVO marketLike) throws Exception;  //추천하기 메소드
	
	
	public int checkLike(MFBoardVO marketCheckLike) throws Exception;  	
	
	
	public int insertMarket(MFBoardVO mfboard) throws  SQLException;

	
	public int updateMarket (MFBoardVO mfboard) throws  SQLException;	
	
	
	public int deleteMarket (MFBoardVO mfboard) throws  SQLException;
	
	
}
