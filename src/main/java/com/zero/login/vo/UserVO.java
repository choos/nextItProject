package com.zero.login.vo;

public class UserVO {
	private String userId;
	private String userPass;
	private String userName;
	
	public UserVO() {
		
	}
	public UserVO(String userId, String userPass, String userName) {
		super();
		this.userId = userId;
		this.userPass = userPass;
		this.userName = userName;
	}
	public String getUserId() {
		System.out.println("setUserId Call " +userId + " return");
		return userId;
	}
	public void setUserId(String userId) {
		System.out.println("setUserId Call " +userId);
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + "]";
	}
	
	
	
	
	
}
