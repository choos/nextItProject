package com.zero.careFridge.wep;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class FoodListVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
//	냉장고를 부탁해 재료VO
	private  String foodNo;          /*재료번호*/
	private  String foodCategory;    /*재료분류*/
	private  String foodCategoryNm;  /*재료분류이름*/
	private  String foodName;        /*재료이름*/
	private  String userCategory;    /*권한자이름*/
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
	public String getFoodNo() {
		return foodNo;
	}
	public String getFoodCategory() {
		return foodCategory;
	}
	public String getFoodCategoryNm() {
		return foodCategoryNm;
	}
	public String getFoodName() {
		return foodName;
	}
	public String getUserCategory() {
		return userCategory;
	}
	public void setFoodNo(String foodNo) {
		this.foodNo = foodNo;
	}
	public void setFoodCategory(String foodCategory) {
		this.foodCategory = foodCategory;
	}
	public void setFoodCategoryNm(String foodCategoryNm) {
		this.foodCategoryNm = foodCategoryNm;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public void setUserCategory(String userCategory) {
		this.userCategory = userCategory;
	}
	
}
