package com.zero.mfboard.service;

import java.sql.SQLException;
import java.util.List;

import com.zero.mfboard.vo.MFBoardVO;
import com.zero.mfboard.vo.MFSearchVO;

public interface IMFBoardService {

	public List<MFBoardVO> getMFBoardList(MFSearchVO searchVO) throws SQLException;

	public MFBoardVO getMFBoard(String mfCode) throws SQLException;

	public void recommend(String mfCode) throws Exception; // 異붿쿇�븯湲� 硫붿냼�뱶

	public void insertLike(MFBoardVO marketLike) throws Exception; // 異붿쿇�븯湲� 硫붿냼�뱶

	public int checkLike(MFBoardVO marketCheckLike) throws Exception;

	public int insertMarket(MFBoardVO mfboard) throws SQLException;

	public int updateMarket(MFBoardVO mfboard) throws SQLException;

	public int deleteMarket(MFBoardVO mfboard) throws SQLException;

}
