package com.zero.reply.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.zero.common.vo.PagingVO;

public class ReplySearchVO extends PagingVO {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String srSCode;        /* 由щ럭�궓湲곕뒗�긽�뭹肄붾뱶 */

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public String getSrSCode() {
		return srSCode;
	}

	public void setSrSCode(String srSCode) {
		this.srSCode = srSCode;
	}

	
	
	
}
