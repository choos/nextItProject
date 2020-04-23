package com.zero.reply.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class ReplyVO   implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int srNum;                 /* 由щ럭踰덊샇 */
	private String srSCode;        /* 由щ럭�궓湲곕뒗�긽�뭹肄붾뱶 */
	private String srMemId;           /* �옉�꽦�옄ID */
	private String srContent;           /* 由щ럭 �궡�슜 */
	private int srLove;              /* 蹂꾩젏�닔 */
	private int srPQuantity;         /* 援щℓ�닔�웾 */
	private String srRegDate;				 /* 由щ럭 �벑濡앹씪 */
	private String srModDate;				 /* 由щ럭 �벑濡앹씪 */
	private String srContentImg;         /* 由щ럭 �씠誘몄� */
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public int getSrNum() {
		return srNum;
	}

	public void setSrNum(int srNum) {
		this.srNum = srNum;
	}

	public String getSrSCode() {
		return srSCode;
	}

	public void setSrSCode(String srSCode) {
		this.srSCode = srSCode;
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

	public int getSrPQuantity() {
		return srPQuantity;
	}

	public void setSrPQuantity(int srPQuantity) {
		this.srPQuantity = srPQuantity;
	}

	public String getSrContentImg() {
		return srContentImg;
	}
	

	public String getSrRegDate() {
		return srRegDate;
	}

	public void setSrRegDate(String srRegDate) {
		this.srRegDate = srRegDate;
	}

	public void setSrContentImg(String srContentImg) {
		this.srContentImg = srContentImg;
	}

	public String getSrModDate() {
		return srModDate;
	}

	public void setSrModDate(String srModDate) {
		this.srModDate = srModDate;
	}
	
	
	
	
	
	
	
}

