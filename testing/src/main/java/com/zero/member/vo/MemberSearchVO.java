package com.zero.member.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class MemberSearchVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	private String searchId;
	private String searchName ; // 분류

	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
	
	

}
