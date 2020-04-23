package com.zero.main.wep;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.zero.common.vo.PagingVO;
//메인 검색 VO
public class MainSearchVO extends PagingVO {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String searchCategory;  //분류
	private String searchType; 		//검색구분
	private String searchWord; 		//검색어
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this , ToStringStyle.JSON_STYLE);
	}

	public String getSearchCategory() {
		return searchCategory;
	}

	public String getSearchType() {
		return searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
	
}
