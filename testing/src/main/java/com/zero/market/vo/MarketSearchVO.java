package com.zero.market.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class MarketSearchVO {

	private String searchWord ; 		// 검색어
	private String searchCategory ; 		// 검색어
	
	
	
	

	@Override
	public String toString() {
		return ToStringBuilder. reflectionToString(this);
	}

	




	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchCategory() {
		return searchCategory;
	}

	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}
	
	
}
