package com.zero.market.service;

import java.util.List;

import com.zero.common.exception.BizException;
import com.zero.market.vo.MarketSearchVO;
import com.zero.market.vo.MarketVO;

public interface IMarketService {

	
	public List<MarketVO> getMarketList(MarketSearchVO searchVO) throws BizException;
	
	public List<MarketVO> getMarketList() throws BizException;
	
	public void recommend(String sCode) throws Exception;  //추천하기 메소드
	
	public void insertLike(MarketVO marketLike) throws Exception;  //추천하기 메소드
	
	public int checkLike(MarketVO marketCheckLike) throws Exception;  	
	
	public MarketVO getMarket(String sCode) throws BizException ;
	
	public List<MarketVO> getMarketReviewList(String sCode) throws BizException ;
	
	/**
	  * 상품등록
	  *  중복이 발생하면  BizDuplicateException 발생
	 * @param market
	 * @throws BizException 
	 */
	public void registMember(MarketVO market) throws BizException;
	
	/**
	  * 판매상품정보 수정 <br>
	  * 비밀번호는 변경되지 않음 <br>
	  * 회원이 존재하지 않으면 BizNotFoundException 발생
	 * @param market
	 * @throws BizException 
	 *   
	 */
	public void modifyMember(MarketVO market) throws BizException;
	
	/**
	  * 판 <br>
	  * 회원테이블의 mem_del_yn을  "Y" 로 변경  
	  * 회원이 존재하지 않으면 BizNotFoundException 발생
	 * @param market
	 * @throws BizException
	 */
	public void removeMember(MarketVO market) throws BizException;
	
}

