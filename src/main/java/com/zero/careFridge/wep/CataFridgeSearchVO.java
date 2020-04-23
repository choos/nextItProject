package com.zero.careFridge.wep;


import org.apache.commons.lang3.builder.ToStringBuilder;

import com.zero.common.vo.PagingVO;
//냉장고를 부탁해 레시피 검색한 후 페이징VO
public class CataFridgeSearchVO extends PagingVO{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String foodNameList;
	private String[] foodNames;

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	public String getFoodNameList() {
		return foodNameList;
	}

	public void setFoodNameList(String foodNameList) {
		this.foodNameList = foodNameList;
	}

	public String[] getFoodNames() {
		return foodNames;
	}

	public void setFoodNames(String[] foodNames) {
		this.foodNames = foodNames;
	}

	
	
	
}
