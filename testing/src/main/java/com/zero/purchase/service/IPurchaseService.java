package com.zero.purchase.service;

import java.util.List;

import com.zero.purchase.vo.PurchaseSearchVO;
import com.zero.purchase.vo.PurchaseVO;

public interface IPurchaseService {
	/**
	 * 援щℓ紐⑸줉 由ъ뒪�듃
	 * @param searchVO
	 * @return
	 * @throws BizException
	 */
	List<PurchaseVO> getPurchaseList(PurchaseSearchVO searchVO);
	
	
	public int getPurchaseQty(PurchaseSearchVO searchVO);
	
	
	/**
	 * 硫ㅻ쾭�벑濡�
	 * @param member
	 * @throws BizException
	 */
	public void registPurchase(PurchaseVO member);
	
	/**
	 * 由щ럭�벐�윭媛�湲� 踰꾪듉 �솢�꽦�솕/鍮꾪솢�꽦  
	 * @param searchVO
	 * @return int
	 */
	public boolean getListReviewYN(PurchaseVO vo);
	
	/**
	 * 硫ㅻ쾭�닔�젙
	 * 鍮꾨�踰덊샇 蹂�寃퐔
	 * �쉶�썝�뾾�쑝硫� BizNotFoundException
	 * @param member
	 * @throws BizException
	 */
	public void updatePurchase(PurchaseVO member);
	
	/**
	 * 硫ㅻ쾭�궘�젣
	 * @param member
	 * @throws BizException
	 */
	public void removePurchase(PurchaseVO member);

	
	
	public void purchaseInvenList(PurchaseVO purchaseVO);


	
	




	
}
