package com.zero.main.service;

import java.util.List;

import com.zero.common.exception.BizException;
import com.zero.main.wep.MainSearchVO;
import com.zero.market.vo.MarketVO;
import com.zero.mfboard.vo.MFBoardVO;
import com.zero.ufboard.vo.UFBoardVO;

public interface IMainService {
	
	public List<MFBoardVO> getMFBoard(String code) throws BizException;
	
	public List<UFBoardVO> getUFBoard(String code) throws BizException;
	
	public List<MarketVO> getSalesBoard(String code) throws BizException;

	public void removeMain() throws BizException;
	
	public List<UFBoardVO> getUFSearch(MainSearchVO searchVO)throws BizException;

	public List<MFBoardVO> getMFSearch(MainSearchVO searchVO)throws BizException;  
   
    public List<MarketVO> getSBSearch(MainSearchVO searchVO)throws  BizException;  
}                                                                  