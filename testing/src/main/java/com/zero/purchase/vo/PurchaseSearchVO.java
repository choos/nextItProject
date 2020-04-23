package com.zero.purchase.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;



public class PurchaseSearchVO implements Serializable {
private static final long serialVersionUID = 1L;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	private String startYY;
	private String startMM;
	private String startDD;
	private String endYY;
	private String endMM;
	private String endDD;
	private String userId;
	private String searchBarPrdNm;
	private String searchPCode;

	
	public String getSearchPCode() {
		return searchPCode;
	}
	public void setSearchPCode(String searchPCode) {
		this.searchPCode = searchPCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSearchBarPrdNm() {
		return searchBarPrdNm;
	}
	public void setSearchBarPrdNm(String searchBarPrdNm) {
		this.searchBarPrdNm = searchBarPrdNm;
	}
	public String getStartYY() {
		return startYY;
	}
	public void setStartYY(String startYY) {
		this.startYY = startYY;
	}
	public String getStartMM() {
		return startMM;
	}
	public void setStartMM(String startMM) {
		this.startMM = startMM;
	}
	public String getStartDD() {
		return startDD;
	}
	public void setStartDD(String startDD) {
		this.startDD = startDD;
	}
	public String getEndYY() {
		return endYY;
	}
	public void setEndYY(String endYY) {
		this.endYY = endYY;
	}
	public String getEndMM() {
		return endMM;
	}
	public void setEndMM(String endMM) {
		this.endMM = endMM;
	}
	public String getEndDD() {
		return endDD;
	}
	public void setEndDD(String endDD) {
		this.endDD = endDD;
	}

	
	

	
}
