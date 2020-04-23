package com.zero.market.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class MarketCreateReviewVO implements Serializable {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String srMemId; 				 /* 由щ럭�옉�꽦�븘�씠�뵒 */
	private String srContent;				 /* 由щ럭�궡�슜 */
	private int    srLove;						 /* 由щ럭 異붿쿇�닔 */
	private String srRegDate;				 /* 由щ럭 �벑濡앹씪 */
	private int    srPQuantity;			 /* 由щ럭 援щℓ�닔�웾 */
	private String srContentImg;		 /* 由щ럭 �씠誘몄� */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public String getSrMemId() {
		return srMemId;
	}

	public void setSrMemId(String srMemId) {
		this.srMemId = srMemId;
	}

	public String getSrContent() {
		return srContent;
	}

	public void setSrContent(String srContent) {
		this.srContent = srContent;
	}

	public int getSrLove() {
		return srLove;
	}

	public void setSrLove(int srLove) {
		this.srLove = srLove;
	}

	public String getSrRegDate() {
		return srRegDate;
	}

	public void setSrRegDate(String srRegDate) {
		this.srRegDate = srRegDate;
	}

	public int getSrPQuantity() {
		return srPQuantity;
	}

	public void setSrPQuantity(int srPQuantity) {
		this.srPQuantity = srPQuantity;
	}

	public String getSrContentImg() {
		return srContentImg;
	}

	public void setSrContentImg(String srContentImg) {
		this.srContentImg = srContentImg;
	}
	
}
